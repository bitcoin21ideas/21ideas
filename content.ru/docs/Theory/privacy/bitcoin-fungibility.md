---
title: "Взаимозаменяемость Биткоина"
h1: "Взаимозаменяемость Биткоина: текущее положение вещей"
cover: /img/bitcoin-fungibility/01-ru.png
description: "Презентация о текущем состоянии экосистемы Биткоина в вопросах взаимозаменяемости и приватности"
url: bitcoin-fungibility
date: 2021-06-26
bookFlatSection: false
bookToc: false
weight: 9
---

{{% hint btc %}}
Эта презентация была представлена [TDevD](https://twitter.com/SamouraiDev), одним из разработчиков Samourai Wallet, в подкасте [Dirtcoin Diaries](https://twitter.com/i/broadcasts/1kvKpoogOMPxE).
{{% /hint %}}

Итак, в целом это просто мои взгляды на текущее положение дел в вопросе взаимозаменяемости Биткоина. Я постараюсь избежать лишнего потока сознания и сразу перейти к делу.

{{% image "/img/bitcoin-fungibility/02-ru.png" /%}}

Для начала я поиграю в адвоката дьявола. Возможно, все наши проблемы с взаимозаменяемостью – это наша вина, возможно, мы упустили момент и позволили государству определить Биткоин как "деньги". Следуя примеру Сатоши, который определил Биткоин в [Белой книге](/whitepaper), как цифровую наличность, мы взяли его нарратив и помчались его продвигать. Мы могли бы с самого начала бороться за то, чтобы Биткоин был классифицирован как простой текст. Например, кошельки – это не что иное, как связки публичных/приватных ключей. И хотя все это для некоторых является сугубо техническим и не способствует массовому принятию, определение Биткоина как текста было бы одним из способов сдержать нападки регуляторов, пока эта штука не воспринималась бы как деньги.

{{% image "/img/bitcoin-fungibility/03-ru.png" /%}}

С конца 2014-го — начала 2015 года регуляторный контроль усилился. Многие биржи ввели KYC/AML. Рекомендации FATF, которые, хотя и являются только рекомендациями, а не правилами или законами, тем не менее принимаются и внедряются некоторыми участниками рынка. И что хуже всего, мы видим упреждающее выполнение требований. Два примера организаций, которые фактически без всякого запроса со стороны государства, начали делать это раньше времени — La Maison du Bitcoin в Париже и Bull Bitcoin в Канаде. Глава Bull Bitcoin хвастался тем, что взял на себя инициативу и договорился с государством, чтобы не допустить ухудшения ситуации.

{{% image "/img/bitcoin-fungibility/04-ru.png" /%}}

Еще одной проблемой в Биткоин-пространстве, особенно после появления GBTC, стала финансиализация, то есть приход Уолл-стрит и определение в соответствии с их собственными терминами, что такое Биткоин. Разговоры о ETF — неутихающая тема. В настоящее время ETF функционируют на Бермудских островах и в Канаде. В Соединенных Штатах они пока не запущены, но об этом постоянно говорят, кажется, с 2014 года. И я не представляю, зачем нам нужен Биткоин-ETF со всеми вытекающими из этого последствиями в виде захвата регулятором и финансовыми структурами Уолл-стрит. Это не должно расцениваться как что-то благоприятное. И конечно, у нас есть фьючерсы, которые были запущены некоторое время назад, и, определенно, оказывают влияние на цену.

{{% image "/img/bitcoin-fungibility/05-ru.png" /%}}

Само Биткоин-пространство подвержено своего рода стокгольмскому синдрому. NgU практически полностью завладел сознанием. NgU (от англ. "number goes up", то есть постоянный рост цены) — это не что иное, как порабощение фиатом. Это означает, что в Биткоин-пространстве всегда думают о долларах США, и ни о чем другом. Мы видим все эти нелепые представления о "технологии NgU", как будто она каким-то образом встроена в программное обеспечение Биткоина. Как будто эта штука предназначена для вечного ценового роста, как будто мы открыли вечный двигатель. Это невозможно. Ничто не может расти вечно. Это просто смешно. Новые пользователи – я бы не стал называть процентное соотношение, но их очень, очень много – приходят через сервисы с [KYC](/privacy/no-kyc/), позволяющие им покупать Биткоин, используя стратегию [DCA](/strategiya-dca). Они приходят через CashApp, RobinHood, Revolut и то, что я ниже назову "де-факто L2". LnStrike — еще один пример. И вся эта волна внедрения KYC-DCA была подстёгнута почти всеми влиятельными спикерами, поскольку эти сервисы спонсировали их подкасты.

{{% image "/img/bitcoin-fungibility/06-ru.png" /%}}

Пока основное внимание уделялось NgU и цене, развитие протоколов в области приватности затормозилось. Конечно, этому уделяется много внимания, но в основном мы всегда опаздываем на два или три года. И это всегда так, Taproot должен был стать толчком к развитию протоколов приватности, теперь это уже не Taproot, а что-то другое. Также существует проблема токсичного элитизма и [неприятия чужих разработок](https://ru.wikipedia.org/wiki/%D0%A1%D0%B8%D0%BD%D0%B4%D1%80%D0%BE%D0%BC_%D0%BD%D0%B5%D0%BF%D1%80%D0%B8%D1%8F%D1%82%D0%B8%D1%8F_%D1%87%D1%83%D0%B6%D0%BE%D0%B9_%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B8). Это в некоторой степени коснулось и нас в Samourai Wallet, например [BIP47 / PayNym](/bip47-ili-gadkij-utenok). По сути, предложение не было одобрено сильными мира сего и на него просто наплевали. Bitcoin Core тянет время. Я не думаю, что кто-то из них еще вспоминает про [Dandelion](https://github.com/bitcoin/bips/blob/master/bip-0156.mediawiki). А ведь оно должно было войти в релиз. [Объединение подписей ончейн](https://bitcoinops.org/en/topics/cross-input-signature-aggregation/) — то же самое. Весь репозиторий предложений по улучшению Биткоина ([BIP](https://github.com/bitcoin/bips)) — сплошной бардак. Что-то случилось в последнее время, и всё вышло из-под контроля [Люка](https://twitter.com/lukedashjr). Кто-то пришёл на должность секретаря или что-то в этом роде, потому что изменения не принимаются, заметки не обновляются, а Люк лишь делает исключения для некоторых вещей. В итоге, мы видим научные и академические дискуссии о "закостенении" протокола, что является ничем иным, как выстрелом в ногу. Это означает, что в большинстве случаев улучшения не будут вноситься, оправдываясь тем, что нельзя вносить изменения в программное обеспечение, которое обслуживает сумму в X миллиардов долларов. И, конечно же, апеллирование к авторитетам, таким как [Максвелл](https://nt4tn.net). Каждый раз будет приведён аргумент в пользу того, чтобы не делать что-то, потому что GMax сделал твит или [nullc](https://www.reddit.com/user/nullc/) написал пост на Reddit.

{{% image "/img/bitcoin-fungibility/07-ru.png" /%}}

{{% image "/img/bitcoin-fungibility/08-ru.png" /%}}

Что же происходит сейчас? На фронте взаимозаменяемости мы видим подход "хороший полицейский — плохой полицейский" со стороны различных игроков. Если говорить о "хорошем полицейском", то, по сути, это просто тихое возведение "сада с высоким забором". Адреса вывода средств отслеживаются. [Анализ цепочки](/privacy/oxt) применяется при депозите и снятии средств. И мы видим быстрое появление де-факто L2 — второго уровня Биткоина. Но речь не о Lightning и Liquid. Это то, что контролируется частными структурами, такими как PayPal, CashApp, Revolut, RobinHood и другими. И они выводят большую часть активности за пределы блокчейна. Поэтому вы не можете увидеть их влияние в мемпуле. Они в значительной степени контролируют то, что пользователи могут делать с тем, что они называют биткоином. По сути, это система, где люди полагают, что у них есть биткоины, но на самом деле у них нет ничего, кроме циферок на счету. И, конечно, эти организации не будут обращать внимания на взаимозаменяемость того, что они контролируют.

{{% image "/img/bitcoin-fungibility/09-ru.png" /%}}

Со стороны "плохого полицейского" находятся чёрные списки, например OFAC — чёрные списки американского правительства. В последнее время мы слышим [новояз](https://ru.wikipedia.org/wiki/%D0%9D%D0%BE%D0%B2%D0%BE%D1%8F%D0%B7), например, "кошельки без хостинга". Кошелёк без хостинга — это кошелёк, который не находится на бирже и самостоятельно управляется пользователем, то есть Samourai или кошелёк Bitcoin Core, который вы используете на своем компьютере или любом другом устройстве. Теперь, когда кошельки без хостинга были определены и обозначены, вы можете быть уверены, что рано или поздно появится какое-то регулирование таких кошельков и адресов, которые они контролируют. [Крадущаяся тварь](/privacy-no-kyc). Недавно мы наблюдали пару эпизодов с майнерами, соблюдающими "требования", а также инвестиционными фондами, которые заявили, что будут торговать или инвестировать только в компании, использующие Биткоин, созданный с помощью зелёной энергии, и тому подобные вещи. И, конечно же, маркировка CoinJoin-транзакций, которая осуществляется в течение последних двух лет.

{{% image "/img/bitcoin-fungibility/10-ru.png" /%}}

Непосредственное влияние снижения взаимозаменяемости на базовом уровне заключается, например, в том, что в таких местах, как форум Dread, на котором есть доска объявлений, где совершаются сделки с использованием биткоина, пользователи теперь ищут другие способы. Если вы зайдёте туда и почитаете публикации, то увидите, что биткоин там очень сильно не любят. "Библия даркнета", которая в первых изданиях была посвящена тому, как использовать биткоин на даркнет-рынках, теперь фактически советует людям обходить биткоин стороной. Рынки даркнета ищут другие места, лучшим примером является площадка Wall Street Market. И мы видим рост таких компаний, как Chainalysis, которая, как я полагаю, позавчера привлекла 100 миллионов долларов и теперь оценивается в $4,2 миллиарда. И это в основном потому, что нарушение взаимозаменяемости Биткоина теперь является большим бизнесом.

{{% image "/img/bitcoin-fungibility/11-ru.png" /%}}

И мы подходим к тому, как нам существовать в этой нише. Как нам обойти эти вещи? Какие инструменты мы можем использовать?

{{% image "/img/bitcoin-fungibility/12-ru.png" /%}}

Сеть Lightning не является решением для обеспечения приватности, хотя о ней так говорили, в том числе и совсем недавно. Она готова к работе с банками. Мы видели примеры, когда, по-моему, BottlePay просит людей предоставить публичную информацию о своих узлах, чтобы они могли работать в их системе. Мы видим, что Lightning имеет сильную тенденцию прибегать к кастодиальному UI и UX. Теперь подводные камни Lightning, связанные с приватностью, стали более понятны. Недавно вышла [статья](/privatnost-v-lajtning), в которой об этом подробно рассказывается.

{{% image "/img/bitcoin-fungibility/13-ru.png" /%}}

Изначально Liquid представлялся как инструмент для биржевого клиринга, но на деле мы видим, что он выступает в роли кастодиального троянского коня. Он поглощает и нейтрализует функции приватности. В нем есть урезанная версия приватных транзакций. И я уверен, что [CISA](https://bitcoinops.org/en/topics/cross-input-signature-aggregation/) будет реализована в Liquid, а вовсе не в основной цепочке. Посмотрим, но я буду очень удивлен, если мы когда-нибудь увидим объединение подписей ончейн.

{{% image "/img/bitcoin-fungibility/14-ru.png" /%}}

Итак, я перехожу к нашим функциям в кошельке Samourai, я уверен, что многие из вас с ними знакомы. Ricochet была нашей первой премиум-функцией. На самом деле она была основана на выступлении Адама Бэка и Блю Мэтта о взаимозаменяемости. Вы можете найти это видео на [YouTube](https://www.youtube.com/watch?v=AvS3tp0qqgA).

{{% image "/img/bitcoin-fungibility/15-ru.png" /%}}

[BIP47 / PayNym](/bip47-ili-gadkij-utenok). Это очень популярная функция среди наших пользователей. Это отличная опция приватности, поскольку она лишает анализ цепочки отправной точки для отслеживания ваших платежей. К сожалению, другие кошельки не приняли эту функцию по ряду причин. Такие вещи, как неприятие чужих разработок и т. п., конечно, играют свою роль. Кроме того, BIP47 был написан Юстусом Ранвье, который в то время определённо враждовал с Bitcoin Core, так что в этом отношении BIP47 не заслужил одобрения.  Если вернуться к апрелю 2015 года, когда BIP47 был впервые опубликован, сам термин "стелс-адреса" очень сильно ассоциировался с Dark Wallet. После публикации тест-векторов мы контактировали с разработчиками нескольких других кошельков. Они активно работали над воспроизведением тест-векторов и внедрением BIP47, но руководство или акционеры практически приказали им прекратить работу над этим из-за сильной ассоциации с Dark Wallet.

{{% image "/img/bitcoin-fungibility/16-ru.png" /%}}

Итак, мы подошли к теме [CoinJoin](/privacy/coinjoin). __Неправильный подход к CoinJoin__. Ну, конечно, у нас есть пример [ZeroLink](https://github.com/nopara73/ZeroLink), из-за которого разработчики кошелька Wasabi утверждают, что реализовали ZeroLink. Они лишь описали ZeroLink, но так и не реализовали его. И после того, как всё начало рассыпаться в Wasabi, возникло то, что было названо войной за CoinJoin. На самом деле, война в значительной степени началась из-за того, что многие объединились вокруг Wasabi и отказались признать недостатки в их реализации. По сути, они получали поблажки во всём, что делали неправильно. Мы видели примеры FUD со стороны влиятельных лиц. И, кстати, цитата о том, что CoinJoin "[скорее всего, незаконен](https://twitter.com/danheld/status/1334152359346368513)", исходит от известного влиятельного лица. CoinSwap, на мой взгляд, является частью атаки на CoinJoin. [Крис Белчер](https://twitter.com/chris_belcher_) и его сторонники назвали CoinSwap следующим поколением в области приватности Биткоина, которое значительно превзойдет всё, что связано с CoinJoin — JoinMarket, Wasabi или Whirlpool. Но я вижу, что в последнее время Белчер отказался от этих заявлений и даже процитировал в недавней статье, что если вы хотите, чтобы история ваших UTXO была разорвана, [вам следует использовать CoinJoin](https://archive.is/eM97I), а не CoinSwap. В любом случае, текущая разработка CoinSwap, насколько я понял, несколько замедлилась, а название было изменено на [Teleporting](https://github.com/bitcoin-teleport/teleport-transactions). Я ожидаю, что CoinSwap будет очень незначительным нишевым сервисом, который будет использоваться людьми, способными работать с подобным программным обеспечением, то есть не многими. Ну и P2EP (Pay-To-Endpoint). Pay-To-Endpoint — интересный случай. Опять же, в начале этой войны за CoinJoin он выглядел довольно сильно разрекламированным в качестве альтернативы CoinJoin. Несколько сторон призывали нас внедрить эту технологию, иначе нас никогда не будут воспринимать всерьёз. И мы увидели, что технология мертворожденная. Она присутствует на многих серверах, благодаря BTCPay, но остается неактивированной. В том числе и у некоторых из её крупнейших сторонников, которые сами управляют магазинами и не утруждают себя активацией P2EP. Так что, по сути, это мертворожденный проект, на мой взгляд. Белчер недавно умолял людей помочь с принятием проекта, но я не думаю, что на этом фронте произошли какие-либо изменения.

{{% image "/img/bitcoin-fungibility/17-ru.png" /%}}

__Правильный подход к CoinJoin__ заключается в создании CoinJoin-транзакций с высокой [энтропией](/privacy/coinjoin/#%d0%b8%d1%81%d0%bf%d0%be%d0%bb%d1%8c%d0%b7%d0%be%d0%b2%d0%b0%d0%bd%d0%b8%d0%b5-%d0%ba%d0%b0%d0%bb%d1%8c%d0%ba%d1%83%d0%bb%d1%8f%d1%82%d0%be%d1%80%d0%b0-%d0%b1%d0%be%d0%bb%d1%8c%d1%86%d0%bc%d0%b0%d0%bd%d0%b0), которые на 100% гарантированно разрушают связи и ломают историю ваших UTXO. И на данный момент единственной реализацией CoinJoin, которая гарантированно обеспечивает нужную энтропию каждый раз, является Samourai Whirlpool. Мы были бы очень рады, если бы другие сделали то же самое, но этого не происходит, и не похоже, что это произойдет в ближайшее время. Мы очень внимательно следим за развитием событий в этой области. Cahoots-транзакции в кошельке Samourai — это тоже CoinJoin. У них есть разные варианты использования и компромиссы. Stonewall важен тем, что он гарантирует минимальное значение энтропии. Так, например, Stonewall с двумя входами и четырьмя выходами имеет гарантированное значение энтропии 1,58. У нас ведутся разработки по обновлению Stonewall, и оно будет готово в этом году. Все они связаны с гарантированной минимальной энтропией для пользователей. Другие реализации CoinJoin не могут гарантировать или не гарантируют минимальное количество энтропии, либо потому, что вы можете прямо измерить энтропию и увидеть, что её там нет, либо они просто засовывают в транзакцию всё, что могут, то есть большое количество входов и выходов, и тем самым делают технически невозможным даже вычислить энтропию, даже если таковая там и есть.

{{% image "/img/bitcoin-fungibility/18-ru.png" /%}}

Кстати, это единственная иллюстрация в моей презентации.

{{% image "/img/bitcoin-fungibility/19-ru.png" /%}}

И немного о ближайшем будущем. Несколько групп активно работают над созданием [атомарных свопов Монеро / Биткоин](https://github.com/comit-network/xmr-btc-swap). Мы работаем над интеграцией этой функции в кошелёк Samourai со стороны Биткоина. Мы поддерживаем связь с другими участниками, которые работают над интеграцией этого протокола в свои Монеро-кошельки. На данный момент есть две группы, активно работающие над самим протоколом, и мы находимся в тесном контакте с одной из них, и разработка продолжается. Я думаю, что обе стороны заинтересованы в том, чтобы продвигаться вперёд. Я думаю, что Биткоин и Монеро — естественные союзники, но максималисты с обеих сторон не обязательно являются таковыми. Это может несколько усложнить ситуацию, но таковы правила. Лично я считаю, что работа над атомарными свопами — очень хороший способ для Биткоина вернуться к своей сути. И мы с нетерпением ждём возможности выпустить что-нибудь как можно скорее.

### Поддержите переводчика

Поддержать переводчика можно, отправив немного сат в сети Лайтнинг:

{{% image "/img/btclinux-ln-qr.jpg" %}}
`lnurl1dp68gurn8ghj7ampd3kx2ar0veekzar0wd5xjtnrdakj7tnhv4kxctttdehhwm30d3h82unvwqhk7mnv093kcmm4v3unxwg6jxyqf`
{{% /image %}}