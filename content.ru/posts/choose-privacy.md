---
author: "Shinobi"
date: 2024-09-04
list_description: "Технологических возможностей самих по себе недостаточно для создания приватности Биткоина. Если пользователи и общество не будут активно защищать и требовать приватности, она погибнет."
menu:
 main:
   parent: blog
next: /blog/
prev: /posts/empty-blocks
title: "Выбирай приватность"
h1: "Выбирай приватность"
cover: /img/blog/choose-privacy.webp
description: "Технологических возможностей самих по себе недостаточно для создания приватности Биткоина. Если пользователи и общество не будут активно защищать и требовать приватности, она погибнет."
bookToc: true
weight: 10
---

Технологических возможностей самих по себе недостаточно для создания приватности Биткоина. Если пользователи и общество не будут активно защищать и требовать приватности, она погибнет.

{{< hint btc >}}
Перевод [статьи](https://bitcoinmagazine.com/print/choose-privacy) [Shinobi](https://twitter.com/Brian_trollz), подготовлен [e4pool](https://x.com/e4pool_com). Редактура [Тони⚡️](https://njump.me/npub10awzknjg5r5lajnr53438ndcyjylgqsrnrtq5grs495v42qc6awsj45ys7).

[Поддержать проект](/contribute/)
{{< /hint >}}

Приватность является фундаментальным вопросом при использовании публичной блокчейн-системы, такой как Биткоин. За прошедшие годы было сделано множество проектов и предложений по созданию инструментов для сохранения приватности поверх Биткоина, либо по фундаментальному добавлению приватности на уровне протокола. Сам Сатоши перед своим уходом вкратце обсудил идею доказательства с нулевым разглашением (zero-knowledge proof) как механизма, позволяющего повысить уровень приватности. 

Вот то, что было сказано о приватности в "[Белой книге](/whitepaper)":

> __10. Конфиденциальность__
>
>Традиционная банковская модель поддерживает необходимый уровень конфиденциальности, предоставляя доступ к информации лишь сторонам-участницам и доверенному третьему лицу. Необходимость открытой публикации транзакций исключает такой подход, однако приватность по-прежнему можно сохранить, если публичные ключи будут анонимными. Открытой будет информация о том, что кто-то отправил кому-то некоторую сумму, но без привязки к конкретным личностям. Столько же данных раскрывается и на фондовых биржах, которые публикуют время и объем частных сделок, не указывая, между кем именно они были совершены.
 
{{% image "/img/blog/choose-privacy-wp.png" /%}}

> Дополнительной защитой будет являться генерация новой пары "открытый/закрытый ключ" для каждой транзакции: это предотвратит связывание различных платежей с их общим отправителем или адресатом. Некоторого публичного связывания всё же не избежать: транзакции с несколькими входами доказывают, что эти суммы принадлежат одному лицу. Риск состоит в том, что раскрытие личности владельца ключа может привести к раскрытию и всех принадлежащих ему транзакций.

На этом всё. Это единственное обстоятельство, которому Сатоши уделил внимание при выпуске Биткоина, касающееся приватности транзакций пользователей. Не используйте повторно адреса и тщательно продумывайте, когда вы тратите монету вместе с другой монетой, потому что это создаст прозрачные связи между ними в блокчейне. Пятнадцать лет спустя мы накопили достаточно обширный багаж знаний и опыта, чтобы понять, что этот раздел "Белой книги" крайне неполный.

Это было не более чем абстрактным описанием модели, которое указывало на то, что в течение ближайшего десятилетия использование Биткоина будет развиваться либо приватным, либо не приватным образом. Его совет не тратить монеты вместе не более практичен, чем совет впредь никогда не тратить больше одной денежной купюры при покупке чего-либо. Было неизбежно, что в процессе использования Биткоина в качестве валюты людям регулярно придется совмещать несколько монет для траты, неразрывно связывая свои средства воедино в ходе последовательных транзакций.

Такие базовые эвристики, как совместная трата монет, лежат в основе анализа блокчейна и раскрытия истории транзакций пользователей. Если несколько монет тратятся вместе в одной транзакции, можно предположить, что все они принадлежат одному человеку. Если адрес используется для получения нескольких монет от разных людей, все они принадлежат одному и тому же человеку. Когда большие группы монет расходуются вместе и соединяются, со временем, это образует кластер. Все [эти и другие](/privacy/oxt-2/) базовые эвристики объясняют, почему блокчейн Биткоина не является приватным. Вы можете наблюдать за транзакциями в блокчейне и применять к ним эти эвристики. 

Прежде чем я продолжу, скажу, что было очень важно объяснить это в самом начале, чтобы люди могли правильно рассуждать на эту тему, но пока не было прописано никаких разумных или полезных моделей того, как поддерживать вашу приватность как пользователя. Это один из фундаментальных недостатков Биткоина. Сам протокол не предоставляет никаких инструментов или архитектуры для защиты приватности своих пользователей; ваша приватность полностью зависит от вас самих.

## Выбираем приватности

За прошедшие годы было разработано множество протоколов для решения этой проблемы:

* [Coinjoin](/privacy/coinjoin/): Протоколы, в которых пользователи совместно тратят свои монеты, что позволяет им отправлять одинаковое количество монет на свои адреса в одной транзакции, запутывая наблюдателей в том, чьи монеты куда попали.
* Coinswap: Протоколы, в рамках которых пользователи могут приватно совершить обмен двумя транзакциями, в которых они обмениваются своими монетами друг с другом. Пока обе стороны сотрудничают друг с другом, в блокчейне не видно связи между двумя транзакциями.
* [eCash Чаума](/gf/genesis-1/): Протоколы, позволяющие централизованному эмитенту (минтеру) выпускать криптографически ослеплённые токены, структурированные таким образом, что невозможно определить изначальную принадлежность токенов, когда пользователь погашает их. Это подход централизованных, но очень приватных транзакции.
* Конфиденциальные транзакции: Один из важнейших компонентов Monero, который изначально был придуман разработчиком, работавшим над Биткоином. Он скрывает суммы, криптографически ослепляя их, и предоставляет доказательство того, что выходы транзакции равны или меньше входов, не раскрывая их. В то время, когда это было предложено, данный метод был крайне неэффективен и усугубил бы проблемы масштабирования Биткоина. Кроме того, это позволяет атакующему квантовым методом незаметно увеличить объем биткоинов или раскрыть историю транзакций каждого, если он сможет нарушить криптографические принципы, от которых зависит Биткоин, в соответствии с тем, какие типы криптографических обязательств он использует.
* Zerocoin: схема, созданная для того, чтобы позволить вносить монеты в единый "пул условного депонирования", а затем выводить их без привязки к ончейн-истории, предварительно проверив с помощью доказательства с нулевым разглашением. Схема так и не была реализована, поскольку в то время её использование требовало больших вычислительных затрат.

Первые два из этих предложений - это предложения прикладного уровня; они представляют собой вещи, которые могут быть созданы поверх Биткоина прямо сейчас. Никаких изменений не требуется, и каждый может создавать программное обеспечение и инструменты, позволяющие пользователям использовать любой из протоколов. Вторые два предложения - это фундаментальные обновления Биткоина на уровне протокола. Они не могут быть сделаны сейчас и требуют согласия большинства пользователей модернизировать Биткоин таким образом, чтобы это сопровождалось незначительными компромиссами. По моему мнению, эти обновления, скорее всего, никогда не произойдут.

Остается только то, что мы можем создать уже сейчас. Многие инструменты уже созданы, и многие еще будут созданы, но наш путь к успеху вымощен инструментами приватности, которые нам предстоит выбрать и впоследствии использовать. Если инструментами приватности не будут использоваться, они будут бесполезны. Никто не может достичь приватности в одиночку в такой публичной системе, как Биткоин. Для достижения приватности в блокчейне вам нужны другие пользователи, вам нужна толпа, в которой можно затеряться. Это в значительной степени индивидуальный выбор, но в то же время выбор каждого оказывает значительное влияние на всех, кто использует Биткоин.

Это одно из самых важных решений из тех, что необходимо сделать в отношении Биткоина.

Если люди не будут ценить свою приватность настолько, чтобы действовать для её сохранения, то приватность в Биткоине умрет. Она станет запретной, сначала будет подвергаться сомнению, а со временем начнет активно наказываться и преследоваться. Правительства будут клеймить её позором, регулировать и низводить до уровня непонятного меньшинства на задворках общества. В этот момент приватность Биткоина потерпит крах.

Даже Эрик Хьюз, автор "[Манифеста шифропанка](/manifest-shifropanka/)" и автор знаменитой фразы "шифропанки пишут код", позже понял, что одного кода недостаточно: 

> Пожалуй, самый важный урок, который я извлек из деятельности шифропанков, заключается в том, что одним кодом дело не ограничится. Нужен не только код сам по себе, не только широко распространённый код, и даже не широко используемый код. Для долгосрочного успеха _необходима_ определенная мера принятия в обществе деятельности, осуществляемой в приватном порядке. Не удобнее, не проще, но необходимо.
>
>\- Эрик Хьюз, [список рассылки шифропанков, 14 марта 1996](https://mailing-list-archive.cryptoanarchy.wiki/archive/1996/03/32671d07044f258afed8fcde6bdaf2fcd432c67f745d6a6a4ba425751b5998af/).

Люди должны сами выбрать, как ценить приватность. Она должна быть для них ценной, настолько ценной, что дабы её добиться, они будут действовать даже перед лицом принуждения и запугивания. Она должна быть широко принята в обществе, так же как свобода слова или право на ношение оружия в США. Это должно быть нечто настолько широко поддерживаемое, что даже перед лицом яростной оппозиции со стороны некоторых слоёв общества правительства не будут пытаться открыто подавить приватность перед лицом масштабов её поддержки.

Люди должны отказываться подчиняться подобным попыткам в таком большом количестве, чтобы их реальное принуждение было социально и практически невыполнимым. Это решение и последующие за ним действия - в значительной степени политическое решение. Политическое действие.

Люди должны действовать, иначе эта битва уже проиграна.

## Создание приватности

Предлагаю пока исходить из того, что люди будут действовать, причём в достаточном для успеха объёме. Так что же именно им делать? Без фундаментальных изменений в протоколе людям приходится выбирать специальные инструменты, чтобы сохранить свою приватность. Какие инструменты? Как они работают?

Выше мы рассмотрели несколько инструментов, но не стали углубляться в целостную картину того, как они работают. Важно понимать, как различные инструменты могут взаимодействовать друг с другом. Если рассматривать их в вакууме, то легко прийти к выводу, что любой отдельный инструмент обеспечения приватности Биткоина никогда не будет достаточно хорош на технологическом уровне, но когда вы начинаете рассматривать их в совокупности, то становится очевидным, что можно достичь очень высокой степени приватности, если пользователи будут использовать все эти инструменты вместе.

Почти всё в Биткоине является комплексным, ни один из инструментов, которые есть у людей под рукой, не существует в вакууме. Различные вещи могут использоваться совместно, будь то объединение в один инструмент или использование нескольких инструментов в тандеме. Давайте рассмотрим текущее состояние дел с верхних слоёв до базового.

### eCash Чаума

{{% hint btc %}}
Подробное описание принципов eCash вы можете найти в [этой статье](/gf/genesis-1).
{{% /hint %}}

Выпуск монет eCash - идея, возникшая ещё до появления Биткоина. Дэвид Чаум придумал эту концепцию в 1982 году. eCash использует слепые подписи для создания приватного платёжного механизма. В этой схеме центральный сервер выступает в роли эмитента (минтера) токенов, создавая новые токены, обеспеченные депозитами, и погашая токены для обработки транзакций. Приватный характер обрабатываемых транзакций обеспечивается слепыми подписями.

Каждый токен - это, по сути, просто случайное значение, подписанное сервером. В обычном случае при такой схеме сервер сможет отслеживать погашение каждого подписанного им токена, соотнося погашенный токен с выпущенным и просматривая историю транзакций каждой цепочки токенов. Благодаря ослеплению значения каждого токена перед передачей на подпись серверу, сервер не знает, какое именно значение он подписал. Получив подпись сервера, пользователи могут снять ослепление, в результате чего получат совершенно валидную подпись сервера на открытом тексте значения токена, сгенерированного пользователем.

Сервер будет видеть токен в виде текста только тогда, когда его погасят, а поскольку токен был ослеплен при подписании, он не будет знать, когда и для кого он был подписан. Это позволяет проводить централизованные, но невероятно приватные транзакции. Сервер не будет знать, кто кому платит, когда погашает токены.

Доверив оператору хранение средств, пользователи могут получить практически идеальный уровень приватности. Кроме того, у протокола нет требований к обеспечению ликвидности и других недостатков, которыми страдают протоколы вроде [Lightning](/lightning). Любой пользователь, готовый доверять серверу, может принимать деньги в приватном порядке, просто получив токен от другого пользователя и погасив его, обратившись к серверу.

Возможности eCash выходят далеко за рамки приватных масштабируемых платежей - токены eCash можно программировать. Когда кто-то использует eCash Чаума, он доверяет оператору честно обрабатывать платежи и не красть деньги пользователей. Сервер может не только обрабатывать платежи, он также может обеспечивать выполнение смарт-контрактов.

Подобно тому, как скрипты в Биткоине позволяют программировать условия, согласно которым биткоин может быть потрачен, серверы eCash могли бы использовать скрипты или другие языки программирования, чтобы позволить пользователям задавать требования к тратам токенов eCash. Вместо того чтобы просто генерировать случайное значение, чтобы сервер подписал его, пользователи могли бы генерировать скрипт-программу, чтобы её подписать. После того как сервер подпишет программу, когда кто-то придёт погашать этот токен, он увидит запрограммированный скрипт. Сервер просто откажется санкционировать погашение, если скрипт не выполнен.

В настоящее время существует несколько различных моделей доверия, и, несомненно, их станет ещё больше, когда люди задумаются о том, как их построить. Самая простая и понятная - это единый оператор. Это то же самое, что и любая кастодиальная система, например биржа Coinbase. Следующий вариант - федеративный оператор, распределяющий доверие между несколькими сторонами. Это ставит eCash в один ряд со многими другими системами, созданными в этом пространстве, которые считаются децентрализованными. Предлагаются даже модели, которые переворачивают все соотношения рисков, когда минтер выпускает токены, обеспеченные собственными деньгами, выдает их в долг пользователям и периодически требует возврата долга.

Таким образом, даже сейчас мы можем добиться высокой степени приватности... но ценой потери суверенитета и контроля над собственными средствами. Это далеко, далеко не идеал, но это путь, который открыт для нас сейчас. Нам просто нужно, чтобы было достаточно людей, которые будут управлять этим, и чтобы люди, обращающиеся к услугам разных минтеров, могли взаимодействовать с ними.

Перейдем к сети Лайтнинг. Она обеспечивает беспрепятственное пополнение и снятие средств пользователями, взаимодействующими с провайдером ликвидности, а также предлагает механизм быстрых расчетов, позволяющий получающему монеты пользователю перевести их другому провайдеру, которого предпочитает использовать или которому больше доверяет.

### Lightning Network

Lightning - это сеть двунаправленных платёжных каналов, позволяющая пользователям направлять платежи вне блокчейна. Пользователи сотрудничают друг с другом, чтобы заблокировать средства в двухстороннем [мультисиг](/multisig)-адресе, используя предварительно подписанные транзакции, чтобы гарантировать, что каждая сторона сможет получить свои средства обратно без посторонней помощи, если это потребуется. После создания баланс средств может быть обновлён вне блокчейна путем подписания нового набора транзакций и обмена "штрафными ключами", которые позволят обманутому пользователю конфисковать все средства мошенника в канале, если последний попытается использовать старые транзакции ончейн.

Сеть Лайтнинг, хотя и далека от совершенства, является значительным улучшением с точки зрения приватности по сравнению с использованием Биткоина ончейн только за счёт того, что не записывает каждую проведённую транзакцию в блокчейн. Вместо того, чтобы при каждой транзакции пользователя постоянно записывать историю того, откуда взялись монеты и куда они ушли, единственная видимая история в блокчейне - это создание платёжного канала. Ничто о произошедших внутри канала платежах не видно широкой публике, только партнёру, с которым был открыт канал.

{{< hint btc >}}
Подробнее о проблемах и возможных опасностях в контексте приватности сети Лайтнинг читайте в [этом материале](/privatnost-v-lajtning).
{{< /hint >}}

Что касается следов вне цепи, то здесь всё немного сложнее. Например, в настоящее время получатели раскрывают данные своего Лайтнинг-узла всем, кто им платит. Это можно решить с помощью [BOLT 12](https://bolt12.org) - предложения, включающего схему под названием "ослеплённые маршруты", которая скрывает Лайтнинг-узел получателя от отправителя, заставляя его вычислять последние несколько хопов (переходов) в маршруте платежа. При этом в настоящее время отправители имеют отличную приватность, так как получатель ничего не знает ни об их Лайтнинг-узле, ни о его балансах средствах.

Однако у Лайтнинг есть некоторые недостатки, с которыми придётся столкнуться конечным пользователям. В частности, для получения денег требуется ликвидность, выделенная партнером по каналу. Более того, невозможно получить больше денег, чем партнеры по каналу могут направить получателю. Сеть прекрасно функционирует как сеть маршрутизации платежей, при условии, что пользователи решили проблемы с ликвидностью.

Большинство пользователей решают эти проблемы с помощью провайдеров Лайтнинг-услуг (LSP). Эти провайдеры выполняют функцию обеспечения ликвидности для получения денег пользователями, но это решение сопряжено с недостатками приватности. LSP - это крупная организация, обслуживающая множество пользователей, и в процессе работы она узнает о платёжной активности большого количества пользователей. В некоторых случаях, особенно если LSP используют Trampoline Routing (схема, при которой LSP рассчитывает маршрут платежа для вас), они даже узнают назначение всех платежей своих пользователей.

Некоторые из этих проблем можно решить, добавив принципы выпуска монет eCash Чаума поверх Лайтнинг. Благодаря тому, что многие пользователи используют один Лайтнинг-узел, управляемый минтером, ликвидность, выделенная для получения минтером средств, может быть более эффективно распределена между всеми пользователями. Приватный характер eCash также помогает оградить пользователей от некоторых недостатков Лайтнинг, связанных с конфиденциальностью. Даже если минтер, оператор Лайтнинг-узла, знает, куда идут платежи, которые он отправляет по сети, он не знает, кто из пользователей их совершил.

В целом использование Лайтнинг непосредственно пользователем не так приватно, как eCash Чаума, и сопряжено с дополнительными проблемами, связанными с необходимостью получения ликвидности и взаимодействия с LSP, но оно не требует отказа от контроля над вашими средствами. Она не может масштабироваться так же хорошо, как eCash, и более сложна в использовании, но у нее гораздо более совершенная модель доверия.

Однако, пожалуй, важнейшей для приватности функцией Лайтнинг является полное отсутствие возможности отслеживать перемещение монеты вблокчейне. Но хоть сеть и может скрыть и завуалировать отдельные платежи, проводимые вне цепи,  всё равно можно отследить, как монеты попадают в канал, и куда они уходят, когда этот канал закрывается.

### Coinjoin

Coinjoin - это протокол, позволяющий нескольким пользователям объединиться для создания транзакции, структурированной таким образом, чтобы отслеживание их монет было затруднено или невозможно. Такие эвристики, как совместная трата монет и кластеризация, являются основой для отслеживания средств людей. Нарушить их - значит защитить свою приватность. Coinjoin достигает этого путем правильного структурирования сумм, поступающих в транзакцию и выходящих из нее.

Предположим, есть пять человек, которые хотят скрыть историю своих транзакций. Объединив свои монеты в одну транзакцию и создав выходы одного и того же номинала, они создадут ложное срабатывание эвристики совместной траты, потратив свои монеты вместе, и создадут ложный кластер. Поскольку монеты имеют одинаковый номинал, никто не может быть уверен, чьи монеты будут потрачены в будущем.

Теперь снова рассмотрим пользователя Lightning. Даже реализовав максимальные преимущества приватности с помощью Lightning, он все равно должен учитывать последствия взаимодействия с блокчейном для приватности. Представьте, что пользователь вывел монеты с KYC-биржи и открыл канал Lightning. Он может совершать тысячи транзакций туда и обратно через Lightning, но когда он закрывает канал с меньшим количеством средств, чем вложил, биржа может увидеть, что он, по крайней мере, потратил эту сумму где-то в своей деятельности вне блокчейна.

Когда он тратит эти монеты вместе с другими монетами, чья принадлежность ему также известна, или открывает новый канал Lightning, связанный с его узлом, биржа может быть еще более уверена, что монеты все ещё находятся под его контролем. Эти связи необходимо разрушить и замаскировать. Именно такую роль может сыграть Coinjoin.

Coinjoin был наиболее широко распространённым протоколом для обеспечения приватности на базовом уровне, два крупнейших примера - Wasabi от ZKSnacks и Whirlpool от Samourai. Samourai был недавно закрыт после [ареста его основателей](https://t.me/bitcoin21ideas/3144), а Wasabi вскоре после этого добровольно [прекратил работу](https://t.me/bitcoin21ideas/3170) своего координатора. Обе эти системы полностью зависели от централизованного сервера-координатора, который помогал пользователям создавать Coinjoin-транзакции.

Joinmarket - еще один вариант, который работает в настоящее время, используя децентрализованную модель, где "тейкеры" (пользователи) выбирают из предложений "мейкеров" (поставщиков ликвидности) для координации Coinjoin. Однако Joinmarket не так хорошо развит и поддерживается, поскольку за ним не стоит компания. Это проект с открытым исходным кодом.

Это далеко не единственные варианты. Люди могут вновь запустить сервер Wasabi или Whirlpool, если захотят, могут даже быть разрабоны новые модели для бессерверной координации. Сама Coinjoin-транзакция и то, как она координируется, - это совершенно разные вещи, несмотря на то, что они связаны. Существует множество различных способов достижения цели координации для создания Coinjoin. И что важно, пробовать новые способы можно без ограничений.

### Холистический стек

Теперь, когда мы рассмотрели все эти части, подумайте, как все они взаимосвязаны. Как они объединяются, чтобы создать целостную систему на каждом уровне для обеспечения максимальной приватности. Пользователи, совершающие сделки с минтерами eCash, имеют огромную степень приватности даже от операторов минтов (монетных дворов), операторы минтов, используя Лайтнинг, могут сами добиться значительной приватности для себя и своих пользователей, взаимодействующих с другими минтерами, а при реорганизации ликвидности на базовом уровне с помощью Coinjoin можно сохранить в тайне даже ту деятельность, которая осуществляется в публичном блокчейне.

Даже без радикальных изменений в самом Биткоине есть путь от того места, где мы сейчас находимся, к приватному и устойчивому к цензуре Биткоину. Он не идеален, требует либо затрат и предодления дополнительных сложностей, либо компромисса в достижении желаемой цели - отсутствия доверия, но путь есть.

В дальнейшем приватность можно сделать ещё лучше с каждым усовершенствованием протокола Биткоин. Схемы, улучшающие масштабируемость, могли бы решить некоторые проблемы с системами вроде Лайтнинг. Это позволит большему числу пользователей взаимодействовать с Биткоином в приватном порядке самостоятельно, а не делегировать контроль над своими средствами минтеру Чаума.

Некоторые из этих улучшений масштабирования могут даже снизить потребность в схемах обеспечения приватности ончейн, таких как Coinjoin. Если бы большее количество людей совместно хранило одну монету, не доверяя друг другу, это привело бы к естественной двусмысленности в вопросе о том, кто что делает при трате этой монеты.

## Будущее с приватностью или без неё

Некоторым может показаться, что приватность не стоит того, чтобы о ней заботиться, или что она не так уж важна. "Зачем вам что-то скрывать?" Я думаю, что такие люди просто не осознают последствий отсутствия приватности. Оглянитесь на сегодняшний мир, посмотрите, как быстро люди подвергают кого-то дискриминации и публичному осуждению за безобидные вещи. За неправильное мнение, неправильные слова, голосование не за того политика.

Отсутствие приватности в личной жизни всё чаще приводит к катастрофическим и травмирующим последствиям для людей. Жизненно важно, чтобы люди могли контролировать, какая информация о себе становится или не становится достоянием общественности. Речь идет не о преступниках, желающих скрыть гнусные или ужасные вещи, а о том, чтобы обычные люди могли защитить себя от прихотей толпы.

Если пойти ещё дальше, то люди, живущие в условиях тоталитарных или деспотичных правительств по всему миру, могут потерять гораздо больше, чем работу или положение в обществе, если они не смогут сохранить приватность. Они могут в буквальном смысле потерять свою жизнь.

Приватность может стать разделителем между физической безопасностью и опасностью даже для людей, живущих в безопасной и свободной юрисдикции. Представьте себе, если в ходе сделки с кем-то вы откроете, что владеете значительной суммой биткоинов, вы в самом реальном смысле подвергли себя физической опасности. Существует множество задокументированных случаев похищения, физического нападения и даже пыток со стороны преступников, пытавшихся украсть биткоины у людей, чьт сбережения стали публично известны.

Даже домашнее насилие является примером ситуации, в которой приватность имеет первостепенное значение. Одна из главных причин, по которой люди не уходят от жестоких отношений, - это финансовые проблемы. Как может человек, оказавшийся в такой ситуации, попытаться добиться финансовой независимости и уйти, не имея приватности? Без возможности копить и зарабатывать деньги так, чтобы партнер об этом не узнал?

Приватность очень важна.

Возвращаясь к Биткоину, отметим, что одно из главных свойств, за которое его ценят, - это устойчивость к цензуре. Возможность совершать сделки как угодно и когда угодно, без разрешения, без того, чтобы кто-то другой мог вас остановить. В транзакциях участвуют две стороны: отправитель и получатель. Покупатель и продавец.

Если правительства, регуляторы и общественность - все могут отслеживать ваши платежи и монеты в открытом доступе, как вы можете противостоять цензуре? Как система может существовать, если любое правительство или толпа могут принуждать и угрожать людям, чтобы те не совершали с вами сделок? Как Биткоин может быть устойчив к цензуре, если за всем, что вы делаете, можно следить, а когда вы становитесь персоной нон грата, вес правительства и социального давления может помешать другим взаимодействовать с вами? Лишить человека возможности выбирать, совершать с вами сделки или нет, и навязать ему свое решение? Когда торговцу приходится беспокоиться о том, что если он получит "не те монеты", правительство выследит его и конфискует его средства? Не может.

Если монеты можно отличить друг от друга каким-либо значимым образом и отследить их перемещение, Биткоин начинает разрушаться и даже не функционирует должным образом как деньги. Деньги должны быть взаимозаменяемыми, то есть две монеты должны быть неотличимы друг от друга с точки зрения торговца. Чтобы быть взаимозаменяемыми, они должны быть приватными.

Приватность, взаимозаменяемость и устойчивость к цензуре - всё это грани одного целого. Они могут существовать только вместе.

Люди должны сделать выбор в пользу приватности, иначе Биткоин потеряет свою устойчивость к цензуре. Большинство людей не выберут приватность по чисто идеологическим или политическим соображениям, им нужно будет показать, что она действительно полезна. Они должны видеть и использовать что-то, что позволяет им жертвовать на важные для них цели, не подвергаясь за это позору или нападкам. Они должны увидеть, что люди в тоталитарном государстве действительно могут использовать его для достижения чего-то значимого. Они должны увидеть, как жуткая и пугающая вездесущая реклама в интернете исчезает или перестаёт быть точной, когда они совершают покупки приватно, вне поля зрения рыболовной сети "больших данных".

Это самая важная битва, с которой Биткоин когда-либо столкнётся, и мы находимся в точке перегиба в этой борьбе прямо сейчас. Исход этой борьбы определит Биткоин на всю его дальнейшую жизнь. Будет ли он инструментом суверенитета и свободы или инструментом слежки и угнетения? Это зависит от нас.

Я не хочу жить в мире, где у меня не будет приватности мыслей, взаимодействия, транзакций. Где каждое моё действие, каждая мысль, которую я произношу или даже думаю, находится под пристальным вниманием правительства и толпы общественности. Где малейшая оплошность ведёт мою жизнь к краху, где нет места инакомыслию, диалогу или дебатам.

Я выбираю приватность. Я выбираю устойчивость к цензуре. Я выбираю свободу.