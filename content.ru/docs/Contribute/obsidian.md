---
title: Публикация статей через Obsidian
tags:
  - github
  - obsidian
  - публикация
  - вклад
  - новичкам
description: Наиболее простой и наглядный способ публикации статей на ресурсе 21 идея с помощью программы Obsidian с открытым исходным кодом.
url: obsidian
date: 2023-09-07
bookFlatSection: false
bookToc: true
weight: 3
---

![cover](/img/19.png)

# Публикация статей через Obsidian

<a href="https://zapmeacoffee.com/npub1tcalvjvswjh5rwhr3gywmfjzghthexjpddzvlxre9wxfqz4euqys0309hn" 
   target="_blank" class="zap-button">
  <img src="https://i.nostr.build/inJGazdEkA8vOje2.png" alt="Zap Me a Coffee" class="zap-img">
</a>

<style>
  .zap-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
    border-radius: 5px;
    transition: transform 0.2s ease, filter 0.2s ease;
  }

  .zap-button:hover {
    transform: scale(1.05);
    filter: drop-shadow(0 0 10px rgba(255, 223, 0, 0.8));
  }

  .zap-img {
    width: 150px;  /* Adjust width for a horizontal look */
    height: auto;  /* Maintain aspect ratio */
  }
</style>

Наиболее простой и наглядный способ публикации статей на ресурсе 21 идея с помощью программы Obsidian с открытым исходным кодом

{{< hint btc >}}
Гид подготовил [almoo](https://snort.social/p/npub1zvvv8fm7w2ngwdyszg3y6zgp6vwqlht8zrr8wcmjaxjecrvpjfwsd0zs7w). [Поддержать проект](/contribute/).
{{< /hint >}}

В этом материале разберем простой способ публикации статей на сайт 21ideas с использованием программы Obsidian. Для данного способа потребуется: 

- [Obsidian](https://obsidian.md)
- [Hugo](/github/#установка-на-windows)
- [Плагин "Obsidian Git"](https://github.com/denolehov/obsidian-git)
- [Плагин "Hugo preview obsidian"](https://github.com/fzdwx/hugo-preview-obsidian)

Чтобы не перегружать статью информацией, которая уже публиковалась в смежных гидах, я буду просто ссылаться на неё. Например, в этом гиде мы не будем рассматривать процесс установки Hugo, так как об этом уже было написано [здесь](/github/#установка-на-windows). 

## Первичная настройка GitHub репозитория

### Удаленная копия

Если по какой-то причине у вас ещё нет аккаунта на GitHub, [создайте](https://github.com/join) его. Затем перейдите на страницу [репозитория 21ideas.org](https://github.com/21ideas-org/21ideas.org) и сделайте форк репозитория к себе в учетную запись.

{{< hint info >}}
Чтобы сделать это, нажмите на кнопку "**Fork**" (в правой верхней части). На следующем этапе так же нажмите "**Create Fork**". После этого у вас на аккаунте должна появиться копия репозитория.
{{< /hint >}}

Отлично! Теперь у вас есть собственная копия 21ideas.org, в которую вы можете вносить любые изменения и видоизменять сайт как вам угодно. Но кроме того, из данной копии можно предложить изменения в основной репозиторий. Теперь нужно создать локальную копию репозитория у нас на компьютере.

### Локальная копия

{{< hint info >}}
Проверяем установлен ли на компьютере git. Для этого в терминале пишем `git version` если в ответ получаем версию ПО, устанавливать ничего не нужно. Если видим ошибку, переходим по [этой](https://git-scm.com/download/) ссылке и скачиваем git для своей операционной системы. После установки возможно потребуется перезагрузка всей системы.
{{< /hint >}}

Для начала, на сайте GitHub заходим в `profile` –> `Your Repositories` и ищем только что созданный форк 21ideas.org. Переходим в него. Ищем кнопку `Code` –> `HTTPS` и копируем URL-адрес репозитория. Он должен выглядеть так: 

```
https://github.com/username/21ideas.org.git
```

Снова открываем терминал и пишем:

```
cd path
```

где `path` — желаемый путь на компьютере для загружаемой копии. Затем...

```
git clone https://github.com/username/21ideas.org.git
```

Не забудьте сменить `username` на ваше имя пользователя GitHub.

Жмём Enter и ждем загрузку репозитория. Можете перейти в указанную вами папку и найти там копию 21ideas.org. Если она на месте, то все сделано верно.

## Подготовка Obsidian к работе

После загрузки локальной копии репозитория 21ideas.org идем на сайт [Obsidian.md](https://obsidian.md) и качаем его. Установив и запустив программу, выбираем "**Открыть папку как хранилище**", указываем путь к нашему локальному репозиторию 21ideas.org, который мы загрузили на компьютер в прошлом шаге. Далее должно открыться следующее окно:

![ObsidianVault](/img/20.png#center)
|:--:|
_Локальный репозиторий в окне Obsidian_

С данного момента Obsidian будет автоматически открывать данное хранилище при запуске. Уже сейчас можно приступать к внесению правок, **но подождите**! Для удобства, всё же желательно изменить некоторые настройки и установить плагины, которые были указаны в начале гида.

### Настройки

Вообще, Obsidian — очень гибкая программа. Доступно огромное количество стандартных настроек, плагинов и тем оформления. Вы можете играться со всем этим как хотите, но в данном гиде мы разберем только некоторые важные настройки и установим необходимые нам плагины. Всё остальное опционально.

Вот некоторые из настроек, которые я посчитал важным изменить при первом запуске. Идем в основной раздел настроек, от туда: 

- Редактор:
	- Режим редактора по умолчанию: **Исходный код**
	- Свойства документа: **Источник**
	- Закрывать скобки: ✅ **Включить**
	- Закрывать теги Markdown: ✅ **Включить**
	- Конвертировать HTML: ✅ **Включить**
- Файлы и ссылки:
	- Подтверждать удаление файла: ✅ **Включить**
	- Удаленные файлы: **В системную корзину**
	- Использовать [[Wiki-ссылки]]: ⛔️ **Выключить**
	- Обнаружение файлов всех расширений: ✅ **Включить**
- Оформление:
	- Встроенный заголовок: ⛔️ **Выключить**

### Плагины

Разобрались с настройками, теперь необходимо установить 2 плагина. Это делается максимально просто — через встроенное меню. Заходим в:

- Настройки
	- Сторонние Плагины

Отключаем безопасный режим и нажимаем **Обзор**. Вводим в поиск...

- [Obsidian Git](https://github.com/denolehov/obsidian-git)
- [Hugo preview obsidian](https://github.com/fzdwx/hugo-preview-obsidian)

...и устанавливаем данные плагины.

![ObsidianPlugins](/img/21.png#center)

Теперь они должны отображаться внизу списка основных настроек Obsidian. Так как мы используем готовый репозиторий, загруженный через GitHub Desktop, то все необходимые файлы (например .git и .gitignore) уже есть в папке 21ideas.org, поэтому нам даже не нужно настраивать плагин Obsidian Git.

## Запуск превью сайта в Obsidian

Если вы помните, среди необходимых программ так же значился Hugo. Это генератор статичных сайтов, на базе которого и работает текущая версия 21ideas.org. Визуализация Markdown файлов и их скорость загрузки у вас в браузере — заслуга Hugo.

{{< hint info >}}
⚡️ В данном гиде мы не рассматриваем процесс установки Hugo на вашу систему. Подразумевается, что он уже должен быть установлен. Если нет, то вам сюда: 
- [Windows](/github/#установка-на-windows)
- [MacOS](/github/#установка-на-macos)
{{< /hint >}}

### Терминал

Итак, первым делом нам необходимо запустить терминал и вписать туда...

```
cd path/21ideas.org
```

...где `path` — путь к папке с репозиторием. Это можно сделать быстрее, если сначала написать `cd ` (не забудьте про пробел) и просто перетащить папку репозитория в окно терминала.

После ввода команды рядом с именем компьютера в терминале появится папка 21ideas.org. Это значит, что следующие команды будут исполняться в этой директории. Теперь нам необходимо запустить локальный сервер Hugo. Пишем:

```
hugo server -D
```

Если вы сделали всё правильно, то терминал отобразит примерно следующую информацию со статистикой по сайту и подтверждением запуска локального сервера:

```
Start building sites … 
hugo v0.113.0+extended darwin/amd64 BuildDate=unknown

                   | RU   
-------------------+------
  Pages            | 206  
  Paginator pages  |   8  
  Non-page files   | 135  
  Static files     |  78  
  Processed images |   0  
  Aliases          |  50  
  Sitemaps         |   1  
  Cleaned          |   0  

Built in 758 ms
Watching for changes
```

### Возвращаемся в Obsidian

После того, как сервер запущен, возвращаемся в Obsidian и устремляем наш взгляд в правый нижний угол окна программы, где отображается информация об обратных ссылках, количестве слов, и символов. В этой же строке, вы можете увидеть... *нечто что-то*... Вместо того, чтобы пытаться объяснить на словах, лучше один раз показать: 

![](/img/22.png#center)

Иконка между `main` и `Обратных ссылок: 0` нам и нужна. Нажимаем её. Если вы на протяжении всего гида делали всё правильно, то у вас запустится новая область в правой части окна Obsidian. Теперь ваш редактор научился в прямом эфире отображать ваши правки так, как они будут выглядеть в итоговом варианте на сайте [21ideas](https://21ideas.org). Например, вот как выглядело моё окно Obsidian при написании данного гида: 

![ObsidianWorkspace](/img/23.png#center)

Как видите, в окне отображается структура сайта (слева), режим редактора Markdown (середина) и превью готового сайта (справа). Вы можете перемещать и масштабировать эту область как вам угодно. Можете даже сжать до мобильной версии и посмотреть, как ваша статья будет отображаться на смартфоне. Вы так же можете сворачивать левую и правую области, чтобы фокусироваться на тексте.

{{< hint info >}}
Пока у вас запущен сервер Hugo, вы так же можете открыть локальную копию сайта в браузере. Достаточно прописать в адресную строку...

```
http://localhost:1313/
```
{{< /hint >}}

Если сервер больше не нужен, то зайдите в терминал и нажмите **Ctrl+C** вне зависимости от операционной системы.

## Публикация материалов

{{< hint btc >}}
⚡️ Перед публикацией статьи **ОБЯЗАТЕЛЬНО** прочитайте следующие материалы:
- [Стандарт оформления статей на 21 идее](/syntax/)
- [Как добавить статью?](/github/)
{{< /hint >}}

Вы написали статью для публикации на [21ideas](https://21ideas.org). Что дальше?

### Токен доступа

Для того, чтобы в будущем быстро публиковать изменения в удаленный репозиторий прямо из Obsidian, необходимо сгенерировать токен доступа. Для этого нужно перейти в настройки нашего аккаунта GitHub:

- Settings
	- Developer Settings
		- Personal Access Tokens
			- Tokens (classic)
				- Generate new token (classic)

На странице "New personal access token (classic)" в поле `Note` вписываем описание, чтобы не забыть для чего был создан этот токен. Например: *"Obsidian Git Access"*. В поле "Expiration" выставляем "No expiration", чтобы не пришлось повторно создавать новый токен каждый месяц. Ставим галочки напротив `repo` и `workflow`;

![token_access](/img/24.png)
|:--:|
_Как должны быть выставлены параметры токена_

Внизу страницы нажимаем `Generate token` получаем его. Важно сразу сохранить его, потому что если вы закроете страницу, то больше не сможете его увидеть, придется генерировать заново! Либо пока не закрывайте эту страницу.

Открываем терминал (убедитесь, что работа терминала осуществляется с папкой локального репозитория) и вписываем туда команду:

```
git push
```

После этого, если вы ещё не выполняли подобной процедуры ранее, программа попросит вас авторизоваться в своем аккаунте GitHub.

- Первым делом вписываем наш логин.
- Далее попросит ввести пароль, но вместо пароля вставляем наш токен доступа.
- Готово! С этого момента это можно будет делать прямо из Obsidian.

### Obsidian Git

Чтобы отправить новую статью, правки или любые другие изменения в удаленный репозиторий необходимо внутри Obsidian нажать комбинацию клавиш `Ctrl+P` либо `Cmd+P`, если вы на MacOS. Перед вами появится "палитра команд" с поиском. Достаточно ввести "Obsidian Git" и программа выдаст все команды, связанные с данным плагином. Благо нас интересует всего одна: `Obsidian Git: Create backup` или её разновидность `Obsidian Git: Create backup with specific message`. Во втором случае появляется возможность добавить уточняющее сообщение — что именно было добавлено/изменено. Рекомендуется использовать именно второй вариант, но это не обязательно.

![git_backup](/img/25.png#center)

Если всё сделано правильно, то в правом верхнем углу после исполнения команды `Obsidian Git: Create backup` должны появиться сообщения примерно следующего содержания:

![push](/img/26.png#center)
|:--:|
_Можно смело идти на github.com и проверять наличие изменений в удаленном репозитории_

Лучше всего сразу внести все изменения, после чего выполнить команду бэкапа. Несмотря на это, не бойтесь пробовать. В любом случае все изменения сначала летят в ваш форк репозитория, который можно в любой момент откатить назад.

Опционально: для удобства так же включим `Obsidian Git: Open source control view` через всё ту же палитру команд (`Ctrl+P`/`Cmd+P`). В правой области Obsidian должна появиться такая панель:

![source_panel](/img/27.png#center)

Из этой панели можно инициировать бэкап, менять его описание, видеть список файлов с правками, откатывать их и т.д. В целом, лучше держать эту панель открытой при работе с репозиторием если боитесь что-то нечаянно удалить или наоборот добавить не туда.

### Pull request

Итак, поздравляю! Мы написали статью и загрузили её в удаленный репозиторий. Но на данный момент все внесенные изменения присутствуют только в нашей копии, но не в рабочей версии сайта 21ideas.org.

Для того, чтобы правки и новые материалы были добавлены на сайт 21ideas, необходимо сделать pull request, то есть предложить их модераторам на рассмотрение. Для этого заходим на страницу нашего репозитория на GitHub и проверяем нашу версию репозитория на актуальность. Для этого необходимо обратить внимание на строку, расположенную сразу над основной папкой с файлами репозитория:

![sync](/img/9.png#center)
|:--:|
_На момент написания моя копия была актуальна, поэтому в качестве примера возьмем скриншоты из гида: [Как добавить статью?](/github)_

На скриншоте выше видно, что наш репозиторий имеет 1 коммит, которого нет в основном репозитории 21ideas и также отстает от основного репозитория на 1 коммит. То есть, пока мы готовили новый материал для добавления, кто-то уже внес изменения в основной репозиторий. Это означает, что прежде чем делать пулл-реквест, нужно обновить свой форк, чтобы он соответствовал основному репозиторию. Для этого нажимаем `Sync fork` и в выпадающем меню жмем `Update branch`:

![update](/img/10.png#center)

Далее открываем вкладку `Pull requests` и жмем `New pull request` (может понадобиться подтвердить свои намерения несколько раз, здесь все интуитивно).

![request](/img/12.png#center)

![newrequest](/img/13.png#center)

Во всплывающем окне указываем заголовок пулл-реквеста и описание проделанной работы. Это важный пункт, без которого модераторам будет сложнее понять что конкретно необходимо проверить. Это также необходимо для дальнейшего аудита кода проекта.

![pull_overview](/img/14.png)

Протоклкнув пулл-реквест, вы можете оповестить модераторов о том, что их ожидает очередная статья. Этот шаг не является обязательным - мы регулярно проверяем репозиторий на предмет новых реквестов. В этом процессе нет ничего сложного, главное – следовать пошаговой инструкции.

Если вы сделали всё правильно, то после первичной настройки Obsidian по данному гиду, в дальнейшем вам останется только обновлять свою версию копии репозитория и отправлять пул-реквесты с новыми статьями и правками. Надеемся как можно скорее увидеть ваш пул-реквест!

{{< hint btc >}}
Остались вопросы? Хотите стать частью команды контрибьюторов проекта? Мы будем рады видеть вас в нашем [Телеграм-чате](https://t.me/+9TduwjvHoollODY0) активных участников биткоин-сообщества!
{{< /hint >}}
