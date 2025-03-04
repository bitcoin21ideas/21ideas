---
title: "Глава 5: SegWit"
h1: "Глава 5: SegWit"
cover: /img/vrb-437.jpeg
description: "SegWit - это способ увеличения размера биткоин-блока с сохранением обратной совместимости (то есть это был софтфорк, а не хардфорк)"
url: vojna-za-razmer-bloka/glava-5
aliases: ['/book-the-blocksize-war-chapter-5']
date: 2021-03-11
bookFlatSection: false
weight: 5
---

{{< details "Оглавление" "..." >}}

[Главная страница](/vojna-za-razmer-bloka)

[Глава 1: Первый удар](/vojna-za-razmer-bloka/glava-1)

[Глава 2: Начало](/vojna-za-razmer-bloka/glava-2)

[Глава 3: Масштабирование I Монреаль](/vojna-za-razmer-bloka/glava-3)

[Глава 4: Масштабирование II Гонконг](/vojna-za-razmer-bloka/glava-4)

[Глава 5: SegWit](/vojna-za-razmer-bloka/glava-5)

[Глава 6: Сеть Lightning](/vojna-za-razmer-bloka/glava-6)

[Глава 7: Bitcoin Classic](/vojna-za-razmer-bloka/glava-7)

[Глава 8: Круглый стол в Гонконге](/vojna-za-razmer-bloka/glava-8)

[Глава 9: Фейковый Сатоши](/vojna-za-razmer-bloka/glava-9)

[Глава 10: DAO](/vojna-za-razmer-bloka/glava-10)

[Глава 11: Масштабирование III Милан](/vojna-za-razmer-bloka/glava-11)

[Глава 12: Bitcoin Unlimited](/vojna-za-razmer-bloka/glava-12)

[Глава 13: Биржи](/vojna-za-razmer-bloka/glava-13)

[Глава 14: ASICBoost](/vojna-za-razmer-bloka/glava-14)

[Глава 15: Логово драконов](/vojna-za-razmer-bloka/glava-15)

[Глава 16: Litecoin](/vojna-za-razmer-bloka/glava-16)

[Глава 17: UASF – Активируемый пользователями софтфорк](/vojna-za-razmer-bloka/glava-17)

[Глава 18: Нью-Йоркское соглашение](/vojna-za-razmer-bloka/glava-18)

[Глава 19: Bitcoin Cash](/vojna-za-razmer-bloka/glava-19)

[Глава 20: SegWit2x](/vojna-za-razmer-bloka/glava-20)

[Глава 21: Победа](/vojna-za-razmer-bloka/glava-21)

{{< /details >}}

{{< youtube LBTYgMbsTME >}}
_Помимо YouTube с аудиокнигой можно ознакомиться на популярных подкаст-площадках: [https://www.21ideas.org/audio-audiobooks/](https://www.21ideas.org/audio-audiobooks/)_
{{< /youtube >}}

В первой сессии второго дня конференции по масштабированию Биткоина в Гонконге одним из основных выступлений был доклад биткоин-разработчика Питера Вюлле - о том, что называется "отделённое свидетельство" (Segregated Witness или SegWit). SegWit - это способ увеличения размера биткоин-блока с сохранением обратной совместимости (то есть это был софтфорк, а не хардфорк). Биткоин-транзакция состоит из различных компонентов, одним из которых является подпись, подтверждающая трату. Эта подпись обычно является самой большой частью транзакции в зависимости от объема данных. SegWit был новым форматом транзакции, в котором подпись не нужно привычным образом включать в блок, который по-прежнему имел ограничение в 1 Мб. Клиенты, которые обновились до SegWit, увидят новый блок, содержащий эти подписи; для этих новых клиентов старый лимит размера блока в 1 МБ убрали и заменили “лимитом веса” в 4 миллиона единиц. Лимит веса был определен как четырехкратный объем данных без подписи в байтах плюс объем отделенных данных подписи в байтах. Это означало, что данные, содержащие подписи, получили дисконт при расчетах цены транзакции, но общий лимит достигал теперь около 2 Мб, и это, похоже, было ровно то, чего пользователи и хотели: увеличение лимита размера блока примерно до 2 Мб.

Биткоин-разработчик из Флориды по имени Luke-Jr продемонстрировал способ, наделяющий обновление SegWit обратной совместимостью (софтфорк). Люк считался одним из самых упертых сторонников малых блоков, а для сообщества сторонников больших блоков он был столь же ненавистен, как и Грегори Максвелл. Люк совсем не боялся выделиться из толпы своими несогласованными мнениями. Этот убежденный католик и отец семерых детей в каком-то смысле был Кассандрой технического сообщества - исключительно резким. Однако Люк явно имел очень сильное техническое понимание Биткоина, и его очевидное нелинейное мышление, обеспечивающее ему иной угол зрения на вещи, видимо, и помогло ему придумать этот финт, который другие разработчики попросту не могли бы реализовать.

Тем, кто это понимал, SegWit казался блестящим беспроигрышным предложением. Сеть может получить блоки размером 2 МБ, при этом мы избегаем проблемы несовместимости обновления. В дополнение к этому старые и новые кошельки могут беспрепятственно взаимодействовать друг с другом, и обновление оказывается совершенно необязательным: пользователи могут либо перейти на SegWit, либо продолжать использовать сеть в прежнем режиме. С точки зрения старых кошельков у SegWit-транзакций нет подписи. Однако кошелек по-прежнему видит транзакцию и признает ее действительной после включения в блокчейн. SegWit также означает, что емкость блоков потенциально может увеличиваться быстрее, чем при простом хардфорке, увеличивающем предельный размер блока, потому что не требуется ждать, пока все обновятся, и новое место в блоках можно начать использовать достаточно быстро.

SegWit выглядел не только уверенным выигрышем для Биткоина, но и блестящим, намеренным или нет, тактическим ходом сторонников малых блоков в этой войне. Предложение было настолько хорошим, что против него не было веских аргументов. Гэвину пришлось поддержать предложение SegWit, и по большей части он это и сделал [^1]. Если полагать, что конференции по масштабированию были закулисным заговором с целью выиграть время на реализацию SegWit, то замысел отлично сработал! Следует отметить, что я не выдвигаю здесь этого обвинения. Кампанию сторонников крупных блоков по хардфорку следовало остановить, и жизненно важное время было выиграно. Я помню, как в те дни разговаривал с некоторыми из давних сторонников крупных блоков. Они сообщили мне, что, по их мнению, это гениальное предложение выбило у них почву из-под ног.

Конечно, все это было в теории. В гипотетическом мире, где все понимали SegWit и все действующие лица были рациональны, этот ход был блестящим. Пока участники вели спор о лимите размера блока, то SegWit упразднило лимит и заменило его, лишая спор смысла. Однако на деле все вышло не так просто. SegWit был исключительно сложным, и его почти никто не понимал. Это был первый серьезный пример того, как сторонники малых блоков переоценили интеллект своих оппонентов или, по крайней мере, переоценили способность своих оппонентов понимать аспекты информатики. Рассуждая задним числом, это предложение следовало бы просто назвать как-то вроде «увеличение блоков до 2 Мб». Вместо этого у него было очень загадочное и сбивающее с толку название, которое выглядело очень подозрительно для сторонников крупных блоков, которые хотели чего-то ясного и простого, доступного их пониманию. Сторонники крупных блоков отметили, что ход вроде как был инициирован их врагом, а им нужен был контроль над ситуацией. Они рассматривали SegWit как просто очередной способ затормозить внедрение крупных блоков. Поэтому, не особо разбираясь в SegWit, они выступили против него.

По мере того как SegWit начал набирать обороты в техническом сообществе, среди сторонников крупных блоков начали расти заблуждения и недопонимания. Эти недоразумения и слухи включали (ниже далеко не полный список) следующее:

- SegWit это “не настоящее” увеличение лимита размера блока, он только сжимает транзакции (действительно, не обновившиеся клиенты все еще видят SegWit-блоки, будто они размером в 1 Мб, но это также верно и для хардфорка, при котором старые узлы тоже видят обрезанные до 1 МБ блоки. С SegWit обновившиеся узлы видят блоки размером более 1 Мб, а это, предположительно, ровно то, что требуется сторонникам крупных блоков);
- Биткоин основан на цепи цифровых подписей, которые SegWit удаляет, тем самым разрывая цепь и создавая угрозу безопасности;
- Если майнер не обновляется для поддержки SegWit и создает блок, этот блок будет отклонен обновленными клиентами. Это увеличивает риск разделения цепи (но должно происходить только в том случае, если майнер использует специальное программное обеспечение, разработанное для разделения цепи);
- Если пользователь перейдет на SegWit, он не сможет отправлять средства пользователю, который не обновился;
- Обновление SegWit может быть отменено, и тогда монеты внутри выходов SegWit могут быть украдены кем угодно (однако отмена SegWit была бы уже хардфорком).

Многие обвинения были бессмысленными, и поэтому сформулировать опровержение было непросто. Похоже, причина большинства заблуждений лежит в том, что большинство пользователей изначально не понимало основ биткоин-транзакций. Например, часто упоминалась фраза «адрес в формате SegWit», но у SegWit не было нового или другого формата адреса. Если люди не понимают даже обычную механику биткоин-транзакций, объяснить механику SegWit оказывается и вовсе невозможно.

SegWit оказался настолько сложным, что даже Джефф Гарзик, похоже, его не понял. Он думал, что будет “два стакана” для рынка комиссий: один — связанный со старым лимитом в 1 Мб, а другой — с новым лимитом в 4 миллиона единиц веса (weight unit) [^2]. Фактически, два ограничения, размер блока и вес блока, были сконструированы таким образом, чтобы они согласовывались друг с другом и, следовательно, были эквивалентны, что обеспечивало возможность пользоваться единым стаканом. Мы не критикуем Джеффа; идея SegWit была чрезвычайно сложной для полной оценки и понимания, что оказалось ее фундаментальным недостатком. Это просто служит иллюстрацией того, что, хотя с технической точки зрения SegWit был хорошим шагом вперед, из-за его сложности доказать это биткоин-сообществу было попросту невозможно.

Помимо высокой степени сложности, против SegWit было выдвинуто и несколько обоснованных аргументов. Чтобы получить преимущества SegWit и увеличения места в блоках, кошельки пользователей требовалось обновить для поддержки нового формата транзакций. Это могло занять больше времени, чем простое увеличение лимита блока при помощи хардфорка, поскольку это не требовало изменения форматов транзакций. Однако следует отметить, что, по мере перехода на SegWit отдельных пользователей, это уже освобождает место в блоках для отстающих, которые обновляются медленнее.

Для многих сторонников малых блоков стимулирование пользователей к переходу на новый формат транзакций само по себе было одной из целей SegWit. Помимо увеличения лимита размера блока, новый формат транзакции SegWit также исправил ряд ошибок, а именно уязвимость транзакций к атакам третьими сторонами и нелинейное масштабирование операций вычисления хэша подписи. Я не буду вдаваться в подробности, но вкратце, уязвимость транзакций к атакам третьими сторонами — это проблема, которая имеет место, поскольку любой может изменить идентификатор биткоин-транзакции до того, как она будет подтверждена в цепочке блоков, оставляя при этом саму транзакцию валидной. В прошлом это вызывало проблемы для некоторых кошельков и продавцов, у которых в результате были проблемы с отслеживанием средств. По сути, это ошибка. Ее исправление было также в некоторой степени необходимо для запуска транзакционной сети второго уровня, называемой Lightning.

Нелинейное масштабирование вычислений хэша подписи означает, что по мере увеличения количества входов в транзакции количество операций хэширования, необходимых для проверки транзакции, увеличивается квадратично, а не линейно. Эта проблема масштабирования была препятствием для внедрения крупных блоков, поскольку злоумышленники могли создавать транзакции, которые требовали так много времени на проверку, что сеть могла застопориться. Эта проблема на самом деле была одной из основных причин, по которой сторонники малых блоков противодействовали увеличению лимита размера блока — злоумышленники могли использовать эту уязвимость. Атакующий может создать блок, содержащий множество таких крупных транзакций, для проверки которых обычному компьютеру может потребоваться много часов. Поэтому для многих сторонников малых блоков до устранения этой проблемы ни о каком увеличении лимита размера блока не могло быть и речи. Они высмеивали крупноблочников за самоуспокоенное игнорирование этой уязвимости, и за отсутствие параноидального мышления. И наоборот, сторонники крупных блоков, похоже, считали Биткоин почти нерушимым, или, как они часто выражались, антихрупким. Сторонники малых блоков объяснили надежность системы упорным трудом и осторожностью команды разработчиков, но сообщество не ценило это в должной мере. Для большинства крупноблочников ключевым приоритетом был именно лимит размера блока, а исправление подобных ошибок, по их мнению, было не настолько актуально.

Тем не менее, использование SegWit исправляет эти ошибки. С точки зрения сторонников малых блоков это было важно. С SegWit можно сохранять старый лимит в 1 Мб для старых, плохо масштабирующихся транзакций с ошибками, и в то же время иметь больше места для новых транзакций без ошибок. С инженерной точки зрения SegWit выглядел просто фантастикой. Проблема, опять же, заключалась в сложности; большинство биткоин-пользователей не подозревало об этих проблемах и не беспокоилось о них. Между тем Биткоин — это больше, чем просто инженерия и информатика. Это также социальная система, живая платежная, экономическая и финансовая система. При взгляде с этого ракурса смысл SegWit был куда менее очевидным.

Хотя идея SegWit была представлена на конференции в декабре 2015 года в Гонконге, ее еще нужно было реализовать, проанализировать, протестировать и обсудить. Только в ноябре 2016 года SegWit был наконец внедрен в Bitcoin Core — долгое ожидание продолжалось более десяти месяцев. Несмотря на то, что SegWit был внедрен в Bitcoin Core, это не означало, что люди могли сразу его использовать. SegWit означал изменение или, точнее, ужесточение правил протокола, софтфорк. На этот случай существовала методология активации. Выбранный механизм активации заключался в том, что майнеры должны были сигнализировать о поддержке. Если 95 процентов блоков сигнализировали о поддержке в течение интервала корректировки сложности, равного 2016 блокам, софтфорк активировался после еще одного двухнедельного льготного периода. Если бы по прошествии 12 месяцев активация не произошла, процесс обновления был бы прерван.

Для сторонников крупных блоков такая методология активации была неуместной. Они утверждали, что никогда ни в чем нельзя прийти к согласию на 95 процентов. Это позволит любой небольшой коалиции майнеров, владеющей всего пятью процентами хэшрейта, заблокировать запуск обновления. Некоторые сторонники крупных блоков сочли выбор 95-процентного порога активации как способ потянуть время, и предпочли 75-процентный порог в Bitcoin XT. Сторонники крупных блоков были склонны рассматривать флаги майнеров как голосование, как процесс принятия решений. В этом контексте 95 процентов не имели особого смысла. С другой стороны, сторонники малых блоков рассматривали флаги как сигнальный механизм или средство безопасности. По их мнению, пользователи сами определялись с правилами протокола, а сигналы майнеров были необходимы лишь для обеспечения безопасного перехода на новые правила. Это не считалось политическим процессом голосования.

К тому же значение в 95 процентов было выбрано неспроста. Все три последних софтфорка Биткоина были активированы с использованием того же 95-процентного порога: BIP 66 (ограничение подписей кодировкой DER) в июле 2015 года; BIP 65 (внедрение команды временной блокировки для трат) в декабре 2015; BIP 68, BIP 112 и BIP 113, три разных софтфорка, которые активировались одновременно в июле 2016 года. Авторы SegWit всего лишь решили продолжить использование этой (или незначительно модифицированной) методологии активации. Следует отметить, что предыдущие софтфорки внедрялись не идеально. Активация BIP 66 в июле 2015 года вызвала разделение блокчейна на участке в несколько блоков, так как майнеры, похоже, хоть и просигнализировали о том, что их программное обеспечение обновлено, так и не смогли обновиться до софтфорка. Обновление в июле 2016 года также заняло больше времени, чем ожидалось, и сообществу пришлось лоббировать майнинг-пулы, чтобы те сигнализировали о его поддержке. Майнинг-пулы, выступавшие в дискуссии на стороне крупных блоков, медленнее обновлялись до этого, не имевшего отношения к спору, софтфорка, возможно, из-за своего общего разочарования в Bitcoin Core.

Учитывая вышеупомянутую историю и новую напряженность в сообществе, к моменту выпуска SegWit, имела место значительная неопределенность касательно того, будут ли майнеры его активировать. Действительно, один из майнинговых пулов, ViaBTC, заявил, что не будет поддерживать обновление, еще до того, как содержащий его клиент был выпущен [^3]. Хотя SegWit и был настоящей инженерной магией, он не особо помог в ослаблении напряженности конфликта.

---

[Оригинал](https://blog.bitmex.com/the-blocksize-war-chapter-5-scaling-ii-segwit/)

{{< details "Оглавление" "..." >}}

[Главная страница](/vojna-za-razmer-bloka)

[Глава 1: Первый удар](/vojna-za-razmer-bloka/glava-1)

[Глава 2: Начало](/vojna-za-razmer-bloka/glava-2)

[Глава 3: Масштабирование I Монреаль](/vojna-za-razmer-bloka/glava-3)

[Глава 4: Масштабирование II Гонконг](/vojna-za-razmer-bloka/glava-4)

[Глава 5: SegWit](/vojna-za-razmer-bloka/glava-5)

[Глава 6: Сеть Lightning](/vojna-za-razmer-bloka/glava-6)

[Глава 7: Bitcoin Classic](/vojna-za-razmer-bloka/glava-7)

[Глава 8: Круглый стол в Гонконге](/vojna-za-razmer-bloka/glava-8)

[Глава 9: Фейковый Сатоши](/vojna-za-razmer-bloka/glava-9)

[Глава 10: DAO](/vojna-za-razmer-bloka/glava-10)

[Глава 11: Масштабирование III Милан](/vojna-za-razmer-bloka/glava-11)

[Глава 12: Bitcoin Unlimited](/vojna-za-razmer-bloka/glava-12)

[Глава 13: Биржи](/vojna-za-razmer-bloka/glava-13)

[Глава 14: ASICBoost](/vojna-za-razmer-bloka/glava-14)

[Глава 15: Логово драконов](/vojna-za-razmer-bloka/glava-15)

[Глава 16: Litecoin](/vojna-za-razmer-bloka/glava-16)

[Глава 17: UASF – Активируемый пользователями софтфорк](/vojna-za-razmer-bloka/glava-17)

[Глава 18: Нью-Йоркское соглашение](/vojna-za-razmer-bloka/glava-18)

[Глава 19: Bitcoin Cash](/vojna-za-razmer-bloka/glava-19)

[Глава 20: SegWit2x](/vojna-za-razmer-bloka/glava-20)

[Глава 21: Победа](/vojna-za-razmer-bloka/glava-21)

{{< /details >}}

[^1]: [https://twitter.com/gavinandresen/status/800405563909750784](https://twitter.com/gavinandresen/status/800405563909750784)

[^2]: [https://www.slideshare.net/jgarzik/bitcoin-status-report-on-chain-scaling-aug-2016](https://www.slideshare.net/jgarzik/bitcoin-status-report-onchain-scaling-aug-2016)

[^3]:  [https://bitcoinmagazine.com/articles/segregated-witness-officially-introduced-with-release-of-bitcoin-core-1477611260](https://bitcoinmagazine.com/articles/segregated-witness-officially-introduced-with-release-of-bitcoin-core-1477611260)
