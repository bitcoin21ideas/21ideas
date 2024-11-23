---
title: "Проверка подлинности программ с помощью PGP"
h1: "Проверка подлинности программного обеспечения с помощью PGP"
description: "В данной статье будет рассмотрена проверка цифровой подписи файлов с помощью GPG."
cover: /img/pgp/cover.jpeg
url: pgp-verify
date: 2024-10-17
bookFlatSection: false
bookToc: true
weight: 1
---

Немного терминологии:

- **PGP** (Pretty Good Privacy) — программа, позволяющая выполнять операции шифрования и цифровой подписи сообщений и файлов, которая была разработана Филиппом Циммерманом в 1991 году. В 1997 году был разработан открытый стандарт OpenPGP.
- **GPG** (GnuPG, GNU Privacy Guard) — программа для шифрования информации и создания электронных цифровых подписей. Разработана как альтернатива PGP и выпущена под свободной лицензией GNU GPL. GnuPG полностью совместима со стандартом OpenPGP.

В данной статье будет рассмотрена проверка цифровой подписи файлов с помощью GPG.

Используя GPG, любой может создать приватный и публичный ключ. Разработчик может подписать программу своим приватным ключом. Он так же публикует свой открытый ключ на серверах ключей PGP, а в ключе указывается его адрес электронной почты.

Представим ситуацию: сайт, с которого вы загружаете программное обеспечение, например Биткоин-кошелек, взломан. Злоумышленник может опубликовать вредоносную версию вместо оригинальной, он даже может подписать ее своим ключом, мимикрирующим под настоящий ключ разработчика. Единственное, что не сможет подменить злоумышленник — отпечаток оригинального публичного ключа, потому что подписать файл с тем же отпечатком может только владелец приватного ключа, то есть сам разработчик. Таким образом, при проверке цифровой подписи необходимо убедиться в том, что отпечаток ключа присутствует на серверах PGP, упоминается в различных источниках в разное время, например, в репозитории на GitHub, официальном сайте программы, в документации, личном сайте разработчика, различных форумах (Bitcointalk, Reddit), в блогах, Twitter и т.д. Подпись также может быть сделана несколькими разработчиками. Идеально, конечно, получить отпечаток ключа непосредственно от разработчика, но в реальности это редко реализуемо.

Подписи могут распространяться тремя способами:

- Подписывается непосредственно сам файл программы (исполняемый файл, архив или архив с исходным кодом), а подпись прилагается отдельным файлом с расширением .asc или .sig. Например, *electrum-4.5.5-x86_64.AppImage.asc*. Для проверки необходимы два файла: подписанный файл программы и файл подписи.
- Создается отдельный текстовый файл с хэш-суммами архивов программы. Таким образом, вы можете скачать архив, вычислить его хэш-сумму — обычно используются алгоритмы SHA256, SHA512, реже MD5 — и сравнить с хэш-суммой, предоставленной разработчиком. В данном случае подписывается не файл программы, а текстовый файл, содержащий хэш-суммы, а подпись этого файла предоставляется отдельным файлом с расширением .asc или .sig. Например, *SHA256SUMS.asc*. Для проверки необходимы три файла: файл программы, подписанный файл с контрольными суммами и файл подписи.
- Все точно так же, как и в предыдущем варианте, но подпись хранится непосредственно в текстовом файле с хэш-суммами. Для проверки необходимы два файла: файл программы и файл с контрольными суммами и подписью.

## Установка GpgFrontend

Эта программа представляет собой надстройку над GPG в виде графического интерфейса. Она рекомендована как [OpenPGP](https://www.openpgp.org/software/misc/gpgfrontend/), так и [GPG](https://www.gnupg.org/software/frontends.html).

{{< hint info >}}
🔗 __Ресурсы:__
- Официальный сайт: https://gpgfrontend.bktus.com/
- Документация: https://gpgfrontend.bktus.com/overview/glance/
- Последний релиз на GitHub: https://github.com/saturneric/GpgFrontend/releases/latest
{{< /hint >}}

Скачайте программу для вашей операционной системы со страницы релиза на GitHub. Кроме файла программы, скачайте соответствующую подпись с расширением *.sig*. Поместите оба файла в отдельную папку. Например:

 - GpgFrontend-2.1.5-qt6-windows-x86_64-setup.exe
 - GpgFrontend-2.1.5-qt6-windows-x86_64-setup.exe.sig

### Linux

Перед запуском программы в Linux, проверьте, установлен ли в вашей системе GPG, выполнив в терминале команду:

```bash
gpg --version
```

Если программа установлена, то вы увидите подробности об установленной версии. В противном случае, установите ее, используя следующую команду:

```bash
sudo apt install gnupg
```

или

```bash
sudo yum install gnupg
```

или

```bash
sudo dnf install gnupg
```

в зависимости от используемого дистрибутива.

### MacOS

Сначала установите [Homebrew](https://brew.sh/). Затем используйте следующую команду в терминале для установки GPG:

```bash
brew install gnupg
```

Теперь можно установить GpgFrontend из скачанного DMG-образа.

## Проверка подписи

### Установочный файл GpgFrontend

Первое, что мы сделаем, это проверим подпись самой программы GpgFrontend. В данном случае цифровой подписью заверен непосредственно исполняемый файл/архив программы, а подпись находится в отдельном файле с расширением `.sig`.

Запустите GpgFrontend, нажмите кнопку `File Browser` и выберите папку, в которую вы поместили установочный файл программы и подпись. В окне с файлами выберите файл с расширением `*.sig` (отсоединенная подпись OpenPGP)* и нажмите кнопку `Verify`.

{{% image "/img/pgp/04.jpg" /%}}

Из вывода мы узнаем, что подпись не может быть проверена из-за отсутствующего публичного ключа (A signature could NOT be verified due to a Missing Key) и отпечаток ключа разработчика (Fingerprint): `12F7E8858CF15BEC9975FF3C5CA3DA246843FD03`.

Копируем отпечаток и нажимаем кнопку `Import key`, выбираем `Keyserver`. Вставляем отпечаток и нажимаем `Search`. Дважды щелкаем на найденный ключ и он будет автоматически добавлен в систему.

{{% image "/img/pgp/05.jpg" /%}}

Попробуем найти отпечаток ключа в Google. Разработчик опубликовал его как минимум в двух местах: на странице с релизом на [GitHub](https://github.com/saturneric/GpgFrontend/releases/tag/v2.1.5) и на странице приложения на [SourceForge](https://sourceforge.net/projects/gpgfrontend/files/v2.1.5/).

Нажмите правой кнопкой мыши на ключ и выберите опцию `Set Owner Trust Level`. Для успешной проверки подписи необходимо выставить значение `Ultimate`, то есть абсолютное доверие к ключу. Снова нажмите кнопку `Verify`.

{{% image "/img/pgp/06.jpg" /%}}

Таким образом мы убедились в том, что файл программы подписан действительным ключом разработчика и в том, что файл дошел до нас в неизменном виде.

### Bitcoin Core

Скачаем Bitcoin Core по ссылке https://bitcoincore.org/en/download/. Кроме файла для вашей операционной системы необходимо скачать файлы по ссылкам `SHA256 binary hashes` и `SHA256 hash signatures`. Выделите отдельную папку под эти файлы.

{{% image "/img/pgp/01.png" /%}}

Итак, у нас есть три файла:
- bitcoin-28.0-x86_64-linux-gnu.tar.gz (в моем примере версия для Linux)
- SHA256SUMS
- SHA256SUMS.asc

Здесь цифровой подписью заверен файл `SHA256SUMS`, а подпись находится в файле `SHA256SUMS.asc`. Нажмите кнопку `File Browser` и выберите папку, в которую вы поместили скачанные файлы. В окне с файлами, выберите файл `SHA256SUMS.asc` *(отсоединенная подпись OpenPGP)* и нажмите кнопку `Verify`.

{{% image "/img/pgp/07.jpg" /%}}

Обратите внимание на хороший уровень децентрализации при подписи релизов Bitcoin Core. Релиз 0.28 подписан тринадцатью разработчиками. На практике это облегчает процедуру проверки подлинности файла по двум причинам:
- Если один из разработчиков подписал релиз новым ключом, отпечаток которого пока не распространен в интернете, вы все еще сможете убедиться в подлинности файла, благодаря подписям других разработчиков.
- Даже если приватный ключ разработчика попал в руки злоумышленника, он не сможет каким-либо образом подделать остальные отпечатки ключей.

Импортируем каждый ключ, как и в предыдущем разделе, с помощью  кнопки `Import key` и опции `Keyserver`.

Для отпечатка `ED9BDF7AD6A55E232E84524257FF9BDBCC301009` необходимо изменить сервер на `keys.openpgp.org`, поскольку `keyserver.ubuntu.com` не предоставляет информацию о ключе:

{{% image "/img/pgp/08.jpg" /%}}

После добавления всех ключей снова нажмите кнопку `Verify`.

В выводе выберем одну из подписей, например:

```
### Signature [12]:
- Status: A Signature Not Fully Valid.
- Tips: Adjust Trust Level to make it Fully Vaild
- Signed By: Wladimir J. van der Laan <laanwj@protonmail.com>
- Key ID: 74810B012346C9A6 (Subkey)
```

Справа найдите ключ Владимира ван дер Лаана с email-адресом laanwj@protonmail.com. Кликните правой кнопкой мыши, чтобы увидеть подробности.

{{% image "/img/pgp/09.jpg" /%}}

Здесь вы можете скопировать сокращенный отпечаток ключа (Key ID) "**74810B012346C9A6**" и полный (Fingerprint) "71A3B16735405025D447E8F2**74810B012346C9A6**".

Попробуем найти в Google упоминания отпечатка ключа Владимира ван дер Лаана, которым сделана подпись. Искать можно по полному и сокращенному отпечатку, а также полному отпечатку, разделенному пробелами следующим образом: `71A3 B167 3540 5025 D447  E8F2 7481 0B01 2346 C9A6`. Вы без труда найдете множество упоминаний данного ключа на bitcoin.org, форумах Bitcointalk, Stack Exchange, на Github, в различных руководствах по запуску полного Биткоин-узла и т.д. Таким образом, данному ключу можно доверять. Установим уровень доверия к ключу. Нажмите правой кнопкой мыши на ключ и выберите опцию `Set Owner Trust Level`, установите значение `Ultimate`. Снова нажмите кнопку `Verify`.

Статус двенадцатой подписи изменится с "A Signature Not Fully Valid" на "A Good Signature Fully Valid" (действительная подпись полностью подтверждена).

{{% image "/img/pgp/10.jpg" /%}}

Повторите ту же процедуру еще для нескольких отпечатков ключей других разработчиков.

После проверки отпечатков ключей, посмотрим содержимое файла `SHA256SUMS`. Щелкните на него правой кнопкой мыши и выберите опцию `Open with Default System Application`.

```
919a346c3fab1408734d0849069a2cecdac441f3f7f6a611ef442c4caa534f31  bitcoin-28.0-aarch64-linux-gnu-debug.tar.gz  
7fa582d99a25c354d23e371a5848bd9e6a79702870f9cbbf1292b86e647d0f4e  bitcoin-28.0-aarch64-linux-gnu.tar.gz  
a7a7be3eb075ea6757455e4bc721a29c243884acddcdb503d6363458dbd3f2c3  bitcoin-28.0-arm-linux-gnueabihf-debug.tar.gz  
e004b7910bedd6dd18b6c52b4eef398d55971da666487a82cd48708d2879727e  bitcoin-28.0-arm-linux-gnueabihf.tar.gz  
cb5935484998a74eda6b8caa699be844567b2942de9e723a875debbbc01a53c1  bitcoin-28.0-arm64-apple-darwin.zip  
7d6d488f82c29284ce59f71b4d19d0850fb7c88f6ea8a0298ad44ab578c2d866  bitcoin-28.0-arm64-apple-darwin-unsigned.tar.gz  
6f9e9751574689e02cd99f68285100f13f1e68c11cc226ab01c9f7885946f8b4  bitcoin-28.0-arm64-apple-darwin-unsigned.zip  
c8108f30dfcc7ddffab33f5647d745414ef9d3298bfe67d243fe9b9cb4df4c12  bitcoin-28.0-arm64-apple-darwin.tar.gz  
198516b630219b4a4032690e864e3e21dc2385d0e5905f98f02c1b1acf2525cd  bitcoin-28.0-codesignatures-28.0.tar.gz  
700ae2d1e204602eb07f2779a6e6669893bc96c0dca290593f80ff8e102ff37f  bitcoin-28.0.tar.gz  
76f2ebf0fdc7bf852d2cd991302a19b178d12521796715d63ed8bb7a5b479062  bitcoin-28.0-powerpc64-linux-gnu-debug.tar.gz  
756df50d8f0c2a3d4111389a7be5f4849e0f5014dd5bfcbc37a8c3aaaa54907b  bitcoin-28.0-powerpc64-linux-gnu.tar.gz  
a868a41534b4db317cca8d070beddcfdf0e8435cf368bd2438027294e8e993d5  bitcoin-28.0-riscv64-linux-gnu-debug.tar.gz  
6ee1a520b638132a16725020146abea045db418ce91c02493f02f541cd53062a  bitcoin-28.0-riscv64-linux-gnu.tar.gz  
04c39cec7ed4c56da11811b382db85e6c211d0e12eb6e5bdf2701eba9de292e7  bitcoin-28.0-x86_64-apple-darwin.zip  
cfa72f45b9b6f08a80f5dfe4fba4e392b66e9a9972f7fbe66c4139fd0e0b83eb  bitcoin-28.0-x86_64-apple-darwin-unsigned.tar.gz  
0b0f583bc50fbd186bad00fc3b9c55036f566e4552e4cad5bb6292f8ebdabda4  bitcoin-28.0-x86_64-apple-darwin-unsigned.zip  
77e931bbaaf47771a10c376230bf53223f5380864bad3568efc7f4d02e40a0f7  bitcoin-28.0-x86_64-apple-darwin.tar.gz  
f19502b406ce1fc20f60b21705f0418f345fdf6a0118196af23563697a0505f4  bitcoin-28.0-x86_64-linux-gnu-debug.tar.gz  
7fe294b02b25b51acb8e8e0a0eb5af6bbafa7cd0c5b0e5fcbb61263104a82fbc  bitcoin-28.0-x86_64-linux-gnu.tar.gz  
b59ddff8564413d433ce8bdac37ad65332e5e6b143573da08ff427be839d3b41  bitcoin-28.0-win64-setup.exe  
8990def2e611323d4c7a8cf17187a138dca64f98fc0ecebda0a3e999dbdd083d  bitcoin-28.0-win64-debug.zip  
d8170c342ac049fab953f87841cbbba6c0e3f277703ddc29c678b6ab93dae966  bitcoin-28.0-win64-setup-unsigned.exe  
8ec39e7bf66ea419ea79e5f1b7bee1b03a28b51ddd1daa6e167bff6abac0a5d2  bitcoin-28.0-win64-unsigned.tar.gz  
85282f4ec1bcb0cfe8db0f195e8e0f6fb77cfbe89242a81fff2bc2e9292f7acf  bitcoin-28.0-win64.zip
```

Найдите хэш-сумму для файла, который вы скачали, в моем случае это *bitcoin-28.0-x86_64-linux-gnu.tar.gz*:

```
7fe294b02b25b51acb8e8e0a0eb5af6bbafa7cd0c5b0e5fcbb61263104a82fbc  bitcoin-28.0-x86_64-linux-gnu.tar.gz
```

В окне GpgFrontend нажмите правой кнопкой на исполняемый файл/архив Bitcoin Core и выберите `Calculate Hash`. Теперь вы можете сравнить значение вычисленной хэш-суммы SHA256 со значением из файла `SHA256SUMS`. Таким образом мы убеждаемся в том, что файл дошел до нас без изменений:

{{% image "/img/pgp/11.jpg" /%}}

## Работа с GPG в консоли

### Установка GPG

Описание установки GPG в [Linux](/pgp-verify/#linux) и [MacOS](/pgp-verify/#macos) находится выше в данной статье. Если вы уже использовали GpgFrontend, то ничего устанавливать не нужно.

Для Windows установите [Gpg4win](https://www.gpg4win.org/).

В Android установите эмулятор терминала [Termux](https://f-droid.org/en/packages/com.termux/). Затем установите GPG в среде Termux:

```bash
apt update
apt install gnupg
```


### Проверка кошелька Electrum

Скачайте кошелек Electrum по ссылке https://electrum.org/#download, кроме файла для вашей операционной системы, скачайте соответствующий файл подписи по ссылке `Signatures`.

{{% image "/img/pgp/03.png" /%}}

Поместите эти файлы в отдельную директорию. Теперь необходимо открыть терминал (командную строку) в этой папке:
- В Windows нажмите Shift и кликните правой кнопкой мыши в пустом месте папки с нашими файлами, из контекстного меню выберите `Открыть окно команд`. Второй вариант: находясь в нужной папке в Проводнике, нажмите `Ctrl+L` и введите `cmd`.
- В Linux вызов терминала также находится в контекстном меню при клике правой кнопкой мыши.
- В MacOS перетащите нужную папку из Finder в окно терминала.

В отличие от Bitcoin Core, нам доступны всего два файла:
- electrum-4.5.5-x86_64.AppImage (в моем случае версия для Linux)
- electrum-4.5.5-x86_64.AppImage.asc

Здесь цифровой подписью заверен исполняемый файл программы.

Синтаксис GPG одинаков в любой операционной системе. Для проверки подписи вводим команду,

```
gpg --verify <файл подписи> <проверяемый файл>
```

то есть:

```bash
gpg --verify electrum-4.5.5-x86_64.AppImage.asc electrum-4.5.5-x86_64.AppImage
```

Можно ввести команду проще:

```bash
gpg --verify electrum-4.5.5-x86_64.AppImage.asc
```

В этом случае GPG предположит, что подписанные данные находятся в файле *electrum-4.5.5-x86_64.AppImage* (по совпадающему имени файла).

Вот так выглядит вывод изначально:

```
gpg: предполагается, что подписанные данные находятся в 'electrum-4.5.5-x86_64.AppImage'  

gpg: Подпись сделана Thu 30 May 2024 12:49:15 PM MSK  
gpg:                ключом RSA с идентификатором 637DB1E23370F84AFF88CCE03152347D07DA627C  
gpg: Не могу проверить подпись: Нет открытого ключа  

gpg: Подпись сделана Thu 30 May 2024 12:24:36 PM MSK  
gpg:                ключом RSA с идентификатором 0EEDCFD5CAFB459067349B23CA9EEEC43DF911DC  
gpg: Не могу проверить подпись: Нет открытого ключа  

gpg: Подпись сделана Thu 30 May 2024 08:35:55 AM MSK  
gpg:                ключом RSA с идентификатором 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6  
gpg: Не могу проверить подпись: Нет открытого ключа
```

GPG не может проверить подпись без публичных ключей, дабавим их, загрузив с сервера ключей PGP (по умолчанию это *keys.openpgp.org*), каждый ключ указывается через пробел:

```bash
gpg --recv-keys 637DB1E23370F84AFF88CCE03152347D07DA627C 0EEDCFD5CAFB459067349B23CA9EEEC43DF911DC 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
```

```
gpg: key 2BD5824B7F9470E6: new key but contains no user ID - skipped  

gpg: ключ CA9EEEC43DF911DC: импортирован открытый ключ "SomberNight/ghost43 (Electrum RELEASE signing key) <somber.night@protonmail.com>"  

gpg: ключ 2EBB056FD847F8A7: импортирован открытый ключ "Stephan Oeste (it) <it@oeste.de>"  

gpg: Всего обработано: 3  
gpg:           без идентификатора пользователя: 1  
gpg:               импортировано: 2
```

Пропущенный ключ (skipped) импортируем, используя другой сервер ключей, например *keyserver.ubuntu.com*, при помощи опции *\-\-keyserver*:

{{% hint info %}}
Примеры серверов ключей PGP:

- keys.openpgp.org
- keyserver.ubuntu.com
- pgp.surf.nl
- openpgp.circl.lu

{{% /hint %}}

```bash
gpg --keyserver keyserver.ubuntu.com --recv-keys 2BD5824B7F9470E6
```

```
gpg: ключ 2BD5824B7F9470E6: 1 повторная подпись удалена  
gpg: ключ 2BD5824B7F9470E6: импортирован открытый ключ "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>"  
gpg: Всего обработано: 1  
gpg:               импортировано: 1
```

Обратите внимание, что в этой команде мы используем сокращенный отпечаток ключа, взяв его из предыдущего вывода. Отпечаток 6694D8DE7BE8EE5631BED950**2BD5824B7F9470E6** соответствует **2BD5824B7F9470E6**.

Снова проверяем подписи:

```bash
gpg --verify electrum-4.5.5-x86_64.AppImage.asc
```

```
gpg: предполагается, что подписанные данные находятся в 'electrum-4.5.5-x86_64.AppImage'  

gpg: Подпись сделана Thu 30 May 2024 12:49:15 PM MSK  
gpg:                ключом RSA с идентификатором 637DB1E23370F84AFF88CCE03152347D07DA627C  
gpg: Действительная подпись пользователя "Stephan Oeste (it) <it@oeste.de>" [неизвестно]  
gpg:                 или "Emzy E. (emzy) <emzy@emzy.de>" [неизвестно]  
gpg:                 или "Stephan Oeste (Master-key) <stephan@oeste.de>" [неизвестно]  
gpg: Внимание: Данный ключ не заверен доверенной подписью!  
gpg:          Нет указаний на то, что подпись принадлежит владельцу.  
Отпечаток первичного ключа: 9EDA FF80 E080 6596 04F4  A76B 2EBB 056F D847 F8A7  
    Отпечаток подключа: 637D B1E2 3370 F84A FF88  CCE0 3152 347D 07DA 627C  

gpg: Подпись сделана Thu 30 May 2024 12:24:36 PM MSK  
gpg:                ключом RSA с идентификатором 0EEDCFD5CAFB459067349B23CA9EEEC43DF911DC  
gpg: Действительная подпись пользователя "SomberNight/ghost43 (Electrum RELEASE signing key) <somber.night@protonmail.com>" [неизвестно]  
gpg: Внимание: Данный ключ не заверен доверенной подписью!  
gpg:          Нет указаний на то, что подпись принадлежит владельцу.  
Отпечаток первичного ключа: 0EED CFD5 CAFB 4590 6734  9B23 CA9E EEC4 3DF9 11DC  

gpg: Подпись сделана Thu 30 May 2024 08:35:55 AM MSK  
gpg:                ключом RSA с идентификатором 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6  
gpg: Действительная подпись пользователя "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" [неизвестно]  
gpg:                 или "Thomas Voegtlin <thomasv1@gmx.de>" [неизвестно]  
gpg:                 или "ThomasV <thomasv1@gmx.de>" [неизвестно]  
gpg: Внимание: Данный ключ не заверен доверенной подписью!  
gpg:          Нет указаний на то, что подпись принадлежит владельцу.  
Отпечаток первичного ключа: 6694 D8DE 7BE8 EE56 31BE  D950 2BD5 824B 7F94 70E6
```

Проверьте, что все три подписи являются действительными ("Действительная подпись пользователя"). Осталось с помощью поисковой системы, как и в случае с Bitcoin Core, найти упоминания отпечатков на просторах интернета, и добавить ключи в доверенные с помощью:

```bash
gpg --edit-key <отпечаток> trust
```

Например:

```bash
gpg --edit-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6 trust
```

```
pub  rsa4096/2BD5824B7F9470E6  
    создан: 2011-06-15  годен до: никогда       назначение: SC     
    доверие: неизвестно достоверность: неизвестно  
sub  rsa4096/1A25C4602021CD84  
    создан: 2011-06-15  годен до: никогда       назначение: E      
[ неизвестно ] (1). Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>  
[ неизвестно ] (2)  Thomas Voegtlin <thomasv1@gmx.de>  
[ неизвестно ] (3)  ThomasV <thomasv1@gmx.de>  
  
Укажите, насколько Вы доверяете данному пользователю в вопросах проверки  
достоверности ключей других пользователей (проверяет паспорт,  
сверяет отпечатки ключей из разных источников и т.п.)  
  
 1 = Не знаю или не буду отвечать  
 2 = НЕ доверяю  
 3 = Доверяю ограниченно  
 4 = Полностью доверяю  
 5 = Абсолютно доверяю  
 m = вернуться в главное меню  
  
Ваше решение?
```

Остается выбрать уровень доверия и выйти из консоли GPG, введя "quit". Теперь при проверке подписи вы увидите, что уровень доверия к ключу изменился с "неизвестно" на "абсолютное" (я выбрал пятый пункт):

```
gpg: Подпись сделана Thu 30 May 2024 08:35:55 AM MSK  
gpg:                ключом RSA с идентификатором 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6  
gpg: Действительная подпись пользователя "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" [абсолютное]  
gpg:                 или "Thomas Voegtlin <thomasv1@gmx.de>" [абсолютное]  
gpg:                 или "ThomasV <thomasv1@gmx.de>" [абсолютное]
```

Процедура ничем не отличается от проверки Bitcoin Core, кроме того, что подписан непосредственно файл программы, а не отдельный текстовый файл с хэш-суммами.

Если вам нужно вычислить хэш-сумму файла, можно воспользоваться следующей командой: 

```
shasum -a 256 <файл>
```

Например:

```bash
shasum -a 256 bitcoin-28.0-x86_64-linux-gnu.tar.gz
```

В приведенной команде опция *-a 256* соответствует алгоритму SHA256. Если вам нужен алгоритм SHA512, используйте опцию `-a 512`. Альтернативные команды выглядят так: `sha256sum`, `sha512sum`. Для хэш-суммы MD5 используется команда `md5sum`.

### Кошелек Phoenix на Android

Если вы используете [deGoogled](/grapheneos)-смартфон или же сознательно отказались от использования Play Market, то вам доступны далеко не все приложения в альтернативных магазинах приложений, таких как F-Droid. В случае с [Phoenix](/phoenix), разработчики публикуют APK-файлы в своем [Github-репозитории](https://github.com/ACINQ/phoenix/releases/latest). Скачайте APK-файл и подписанный файл с контрольными суммами `SHA256SUMS.asc` по указанной ссылке. Как и в случае с Electrum, у нас будет два файла, но подписан из них не исполняемый файл программы, а текстовый файл с хэш-суммами и он же содержит подпись. Посмотрим его содержимое:

```
-----BEGIN PGP SIGNED MESSAGE-----  
Hash: SHA512  
  
e9f161fb82bb803ae3fd202aaee73d4c9562dbac9bbdd66412c787985ba4b6a7  phoenix-93-2.4.0-mainnet.apk  
-----BEGIN PGP SIGNATURE-----  
  
iQEzBAEBCgAdFiEEwlooioQur3qltTA/enP+d94sQCcFAmcHeDwACgkQenP+d94s  
QCeCPAf9FzuTVCw4/mOMr5zr5mrOXwm0tRMEGVzSva+THbwYJ/ZWsdFJDlMzcmnE  
u2pKjHo5C3V6DVLxw6glIVh+D7o8zphDEBmJEj02aOzs4rWdJ5axiZjL4/B7kT/Z  
0idQoru112DXshUmbkrfCJHlToBgmlzgIUMadRXCrZO8kULjsqHgwkcwo+5ffscT  
8xdHlZOkdXSo2IwvUBLDk6d8kn2SrFqsK3UTxFK0Rz3uY9aBDH13eC4u+DcWD0Tr  
Q9oSKsaD0FYbNoQGMOsmfTVpDZXrMSkurMewiqPwuYXv/xQ1dIVImm6+vQxXrLNM  
i7pUxiOD2tO0cTS7EJWf+2nKcep70Q==  
=2EiT  
-----END PGP SIGNATURE-----
```

Создайте отдельную директорию в памяти смартфона, например `Download/phoenix` и поместите оба файла в нее. Запустите Termux и перейдите в эту папку:

```bash
cd /storage/emulated/0/Download/phoenix
```

Теперь вы можете выполнять точно те же процедуры, как и на ПК:

```bash
gpg --verify SHA256SUMS.asc
```

Файл подписан всего одним ключом с отпечатком `C25A 288A 842E AF7A A5B5  303F 7A73 FE77 DE2C 4027`. Упоминания этого ключа можно обнаружить в нескольких репозиториях ASINQ на GitHub.

Как и на ПК, вы можете вычислить хэш-сумму APK-файла:

```bash
sha256sum phoenix-93-2.4.0-mainnet.apk
```

```
e9f161fb82bb803ae3fd202aaee73d4c9562dbac9bbdd66412c787985ba4b6a7  phoenix-93-2.4.0-mainnet.apk
```

и сравнить со значением из файла `SHA256SUMS.asc`.

## Поддержите автора

Поддержать автора можно, отправив немного сат в сети Лайтнинг:

{{% image "/img/btclinux-ln-qr.jpg" %}}
`lnurl1dp68gurn8ghj7ampd3kx2ar0veekzar0wd5xjtnrdakj7tnhv4kxctttdehhwm30d3h82unvwqhk7mnv093kcmm4v3unxwg6jxyqf`
{{% /image %}}