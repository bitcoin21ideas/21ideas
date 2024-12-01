---
title: "Глоссарий"
type: docs
h1: "Глоссарий"
url: glossary
bookToC: true
bookHidden: true
weight: 9
---

## A

### Адрес

Адрес — это уникальная строка символов, которая используется для получения криптовалютных транзакций. Адреса создаются с использованием публичного ключа и криптографического хэширования, что делает их безопасными и анонимными. В сети Биткоина адреса обычно начинаются с 1, 3, или bc1.

Пример адреса: `bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kygt080`

{{< hint info>}}
Подробнее о биткоин-адресах читайте в [этой статье](/sravnenie-tipov-bitcoin-adresov/).
{{< /hint >}}

### AML

Поянсение 

{{< hint info>}}
Подробнее о вреде AML читайте [здесь](/posts/aml-is-a-scam/).
{{< /hint >}}

### Аппаратный кошелек

Аппаратный кошелек — это физическое устройство, предназначенное для безопасного хранения приватных ключей оффлайн.

Особенности:

- Защищает от вирусов, хакеров и любого другого вмешательства через интернет.
- Требует подтверждения транзакций на устройстве.

> __Пример:__ популярные модели — [Coldcard](/coldcard), Trezor.

### ASIC

Application-Specific Integrated Circuit (ASIC) — это специализированные интегральные схемы, созданные для выполнения узкоспециализированных задач. В контексте Биткоина ASIC используются для майнинга, так как они могут эффективно выполнять хэширование алгоритма SHA-256. Их производительность значительно превышает производительность обычных процессоров (CPU) и видеокарт (GPU).

Пример популярных ASIC-майнеров: Antminer S19, Whatsminer M30S.

{{< hint info>}}
Подробнее о майнинге читайте [здесь](/izobretaem-bitkoin/glava-4/).
{{< /hint >}}

## Б

### Блок

Блок – это группа транзакций, сгруппированная майнерами. Средняя частота появления блоков в сети Биткоин составляет 10 минут. Майнеры обрабатывают биткоин-транзакции не по одной, а группами, которые и представляют собой блоки. В первую очередь добавляются транзакции с более высокой комиссией.

### BIP (Bitcoin Improvement Proposal)

Предложение по улучшению Биткоина (BIP) - это проектный документ для внедрения новых функций или информации в протокол. Это стандартный способ передачи идей, так как Биткоин лишён формальной структуры.

Первый BIP (BIP 0001) [был представлен](https://en.bitcoin.it/wiki/BIP_0001) Амиром Тааки 19 сентября 2011 и описал, что такое BIP.

### Биржа

Сервис, который позволяет пользователям покупать, продавать и обменивать криптовалюты. Как правило, биржи запрашивают подтверждение личности пользователей, при предоставлении тем услуг. Этот факт является красным флагом, так как противоречит основам, заложенным в Биткоин, таким как пиринговость, открытость и псевдонимность.

{{< hint info >}}
Подробнее о вреде бирж читайте в [нашей статье](/privacy/no-kyc).
{{< /hint >}}

### Биткоин

Биткоин (Bitcoin) — это первая в мире децентрализованная криптовалюта, созданная в 2008 году неизвестным разработчиком или группой разработчиков под псевдонимом Сатоши Накамото. Система Биткоина основана на технологии блокчейн, которая обеспечивает прозрачность, неизменность данных и отсутствие посредников.

_Основные характеристики:_

- Лимит эмиссии: 21 млн BTC.
- Алгоритм консенсуса: Proof-of-Work (PoW).
- Применение: цифровые платежи, защита активов от инфляции, пиринговые транзакции.

{{< hint info>}}
Подробнее читайте в [оригинальной работе Сатоши Накамото](/whitepaper).
{{< /hint >}}

### Блокчейн

Блокчейн — это распределённый реестр данных, который состоит из блоков, связанных в линейную последовательность. Каждый блок содержит:

- Информацию о транзакциях.
- Хэш предыдущего блока.
- Метаинформацию (время, сложность майнинга и т.д.).

_Преимущества блокчейна:_

- Неизменяемость данных: изменения в одном блоке требуют пересчёта всей цепочки.
- Прозрачность: данные доступны для всех участников сети.
- Надёжность: данные распределены между тысячами узлов.

Пример блокчейна: сеть `Биткоин` или `Ethereum💩`.

### Бумажный кошелёк

Бумажный кошелёк - это название, которое было дано устаревшему и небезопасному методу хранения биткоинов, популярному в период с 2011 по 2016 год. Идея заключается в распечатке одного приватного ключа и биткоин-адреса, обычно генерируемых одним из популярных веб-сайтов.

у этого метода [множество недостатков](https://en.bitcoin.it/wiki/Paper_wallet#Paper_wallet_flaws) и им не стоит пользоваться.

## В

### Вознаграждение за блок

Вознаграждение за блок — это механизм, с помощью которого новые биткоины поступают в обращение. Когда майнер создаёт новый блок, он получает награду, состоящую из:

- Эмиссионной части — фиксированного количества новых биткоинов.
- Комиссии за транзакции — оплат от пользователей за включение их транзакций в блок.

С каждым халвингом, имеющим место каждые 210 000 блоков (каждые ~4 года), эмиссионная часть уменьшается вдвое, что ограничивает общее количество биткоинов 21 миллионом монет.

{{< hint info>}}
Подробнее о халвинге читайте в [этой статье](/halving/).
{{< /hint >}}

### Временнáя метка

Временнáя метка (Timestamp) — это цифровая отметка, указывающая на время создания или добавления транзакции или блока. В блокчейне Биткоина временны́е метки используются для обеспечения безопасности реестра и гарантии своевременного выпуска монет через механизм корректировки сложности.

{{< hint info>}}
Подробнее о временны́х метках читайте в [этой статье](/timestamps/).
{{< /hint >}}

## Г

### Генезис-блок

Генезис-блок — это первый блок в цепочке блокчейна, который выступает в качестве основы всей системы. Генезис-блок Биткоина был создан 3 января 2009 года.

{{< hint info>}}
Интересный факт: в хэше Генезис-блока зашифрована строка:
"The Times 03/Jan/2009 Chancellor on brink of second bailout for banks", которая переводится как "Газета _The Times_ от 3 января 2009 года. Министр финансов на грани второго спасения банков".
Эта фраза указывает на экономический кризис, который стал одной из причин создания Биткоина.
{{< /hint >}}

### Горячий кошелек

Любой биткойн-кошелек, запущенный на подключенном к интернету устройстве, считается "горячим" (в противоположность отключенному от интернета или "холодному" кошельку). "Горячие" кошельки должны быть защищены пользователями, так как средства на этих кошельках подвержены угрозам безопасности со стороны мошенников, например, фишинговым атакам.

## Д

### Двойная трата / двойное расходование (Double Spend)

Двойная трата — это попытка потратить одну и ту же криптовалюту дважды. Например, пользователь может попытаться отправить одни и те же биткоины двум получателям одновременно. Уникальность Биткоина в том, что он первым решил проблему двойного расходования в цифровом пространстве.

_Как предотвращается двойная трата в Биткоине:_

- Транзакции записываются в блокчейн, который защищён от изменений.
- Консенсусный механизм Proof-of-Work затрудняет переписывание цепочки блоков.

### Десктопный кошелёк

Десктопный кошелёк — это программа для компьютера, предоставляющая полный контроль над приватными ключами и средствами. Рекомендуется использовать в связке с аппаратными кошельками.

> __Пример:__ [Electrum](/electrum), Sparrow.


### Дефляция

Дефляция — это увеличение покупательной способности денег со временем, часто вызванное ограничением эмиссии или снижением денежной массы.

Особенности в Биткоине:

Фиксированное предложение (21 миллион монет).
Потерянные приватные ключи уменьшают общее количество доступных монет.
Пример: со временем биткоин может стоить дороже, так как его предложение ограничено.
Подробнее о дефляции.

### Децентрализация

Децентрализация — это процесс распределения власти, управления и контроля между множеством участников сети. В Биткоине децентрализация достигается за счёт:

Распределения копий блокчейна между тысячами узлов.
Отсутствия центрального управляющего органа.
Преимущества:

Устойчивость к цензуре.
Надёжность системы.
Прозрачность.
Недостатки:

Более медленные транзакции по сравнению с централизованными системами.
Высокое энергопотребление в сетях PoW.
Узнать больше.

## Е

### ECDSA 

ECDSA (Elliptic Curve Digital Signature Algorithm) — это криптографический алгоритм, используемый в Биткоине для создания цифровых подписей транзакций.

Особенности:

- Основан на эллиптических кривых.
- Позволяет владельцу приватного ключа подписывать транзакции, которые можно проверить с помощью публичного ключа.

ECDSA обеспечивает подлинность и неизменность транзакций.

{{< hint info >}}
Подробнее о ECDSA читайте в [этой статье](https://habr.com/ru/articles/675918/) на Хабре.
{{< /hint >}}

## И

### Инфляция

Инфляция — процесс обесценивания денег из-за увеличения их количества в обращении. В Биткоине инфляция регулируется заранее определённым графиком эмиссии.

Особенности:

Награда за блок уменьшается каждые ~4 года (халвинг), снижая темпы инфляции.
В отличие от фиатных валют, инфляция Биткоина предсказуема.
Пример: в первые годы существования инфляция составляла ~200%, а к 2024 году — менее 2%.
Подробнее об инфляции.

## К

### Ключ (приватный/публичный)

Ключи — это основные элементы криптографической системы Биткоина, обеспечивающие безопасность транзакций:

Приватный ключ — секретный код, который используется для подписания транзакций. Владение этим ключом подтверждает право собственности на биткоины.
Публичный ключ — открытый код, с помощью которого создаётся адрес для получения средств.
Основное правило: приватный ключ должен оставаться в секрете. Если он будет утерян, доступ к биткоинам невозможно восстановить.

> __Пример приватного ключа:__ `L5B6edcrZz7drchZWptMVXZnrb9yfyW4axse1yMBYd2wWVEA5HfB`. 

### Комиссия

Комиссия — плата, которую отправитель транзакции предлагает майнерам за включение её в блок. Выражается в сатоши за байт (sat/B).

Как это работает:

Более высокая комиссия ускоряет обработку транзакции.
Если комиссия слишком мала, транзакция может "застрять" в мемпуле. Не пользуйтесь кошельками, не позволяющими выбрать комиссию самостоятельно. 

> __Пример:__ Комиссия = 10 sat/B, размер транзакции = 250 байт. Общая комиссия: 2500 сатоши.

### Coinbase (Коинбэйс)

Уникальный тип биткоин-транзакции без отправителя, который создается майнерами после нахождения новых блоков. Этот тип транзакции в большинстве случаев является первой транзакцией внутри нового блока. Coinbase-транзакции награждают майнеров за их работу.

### Корректировка сложности

Описание

### Кошелёк 

Кошелек — это программное или аппаратное средство, позволяющее хранить, отправлять и получать биткоины.

Типы кошельков: аппаратные, мобильные, десктопные, веб-кошельки.

{{< hint info >}}
Подробнее о кошельках читайте в [этой статье](/kak-hranit-kljuchi/).
{{< /hint >}} 

### Криптовалюта

Цифровая валюта, использующая криптографию для обеспечения безопасности и верификации транзакций в своей сети. Биткоин – первая криптовалюта. 

### Криптография

Криптография — это наука о защите информации с помощью математических методов. В Биткоине используется:

- Асимметричная криптография: пары ключей (приватный/публичный) для подписи транзакций.
- Хэш-функции: для создания уникальных идентификаторов блоков.

> __Пример:__ алгоритм SHA-256, используемый в Биткоине, обеспечивает безопасность и неизменяемость данных.

## М

### Майнер

Специализированный участник сети Биткоин, представленный компьютером или группой компьютеров, которые: 

1) собирают отложенные транзакции в блоки для их обработки и 
2) проверяют блоки, созданные другими майнерами. 

Майнеры получают плату за свою работу, так как они собирают все комиссии за транзакции (прикреплённые к транзакциям в пределах блоков) и награждаются новыми биткоинами в рамках вознаграждения за блок.

{{< hint info >}}
Подробнее о майнинге читайте в [четвёртой главе](/izobretaem-bitkoin/glava-4/) книги Яна прицкера "Изобретаем Биткоин".
{{< /hint >}}

### Майнинг

Майнинг — это процесс создания новых блоков в блокчейне и добавления их в цепочку. Майнеры используют свои вычислительные мощности для решения сложных математических задач (Proof-of-Work).

Основные задачи майнинга:

- Подтверждение транзакций.
- Защита сети от атак.
- Эмиссия новых биткоинов.

Сложность майнинга автоматически корректируется, чтобы создание блоков занимало ~10 минут.

> __Пример оборудования:__ ASIC-майнеры, такие как Antminer S19.

Читать больше.

### Мемпул

Мемпул (Mempool) — это временное хранилище для неподтверждённых транзакций. После создания транзакция отправляется в мемпул, где она ожидает включения в блок.

Как работает мемпул:

Транзакции с более высокой комиссией обрабатываются быстрее.
Если мемпул переполнен, менее приоритетные транзакции отклоняются.
Мемпул — ключевой элемент, обеспечивающий гибкость в выборе транзакций для обработки майнерами.
Подробнее.

### Мобильный кошелек

Мобильный кошелек — это приложение для смартфонов, которое позволяет управлять вашими средствами.

Преимущества:

- Удобство и портативность.
- Поддержка QR-кодов для быстрой оплаты.

Недостатки:

- Менее безопасен по сравнению с аппаратными кошельками (хотя отлично работает с ними в связке).

> __Пример:__ приложения [BlueWallet](/blue), Nunchuck.

### Мультиподпись (Multisignature)

Мультиподпись (Multisig) — это метод создания адреса, который требует нескольких подписей для выполнения транзакции.

Пример:

Адрес 2-из-3: транзакция требует 2 подписей из 3 возможных.

Используется для совместного владения средствами, в корпоративных структурах, а также с целью повышения безопасности монет.

{{< hint info >}}
Подробнее о мультисиг читайте в [этой статье](/multisig).
{{< /hint >}}

## Н

### Нода (также биткоин-узел или просто узел)

Нода — это устройство или программа, которая поддерживает сеть Биткоина, проверяя и распространяя транзакции и блоки.

{{< hint info >}}
Подробнее о пользе запуска собственной ноды читайте в [этой статье](/practice/bitcoin-node/).
{{< /hint >}}

## П

### P2P (Peer-to-Peer)

P2P (пиринговая сеть) устроена таким образом, что все узлы равноправны и обмениваются данными напрямую.

> __Пример:__ помимо Биткоина, где узлы взаимодействуют друг с другом без центрального сервера такие сети как BitTorrent и Tor. 

### Подтверждение

Число подтверждений — это количество блоков, добавленных в цепочку после блока с вашей транзакцией.

> __Пример:__ 6 подтверждений считается безопасным уровнем для крупных транзакций.

### Программное обеспечение с открытым исходным кодом

Свободно распространяемое программное обеспечение, код которого доступен для редактирования, использования и обмена. Исходный код сети Биткоин является открытым.

### Proof-of-Work (PoW) – доказательство работы

Proof-of-Work — это алгоритм консенсуса, который используется для защиты сети Биткоина. Участники сети (майнеры) решают сложные вычислительные задачи, чтобы создать новый блок.

Преимущества PoW:

Высокая степень безопасности.
Защита от двойной траты.
Недостатки:

Большое энергопотребление.
Необходимость специализированного оборудования.
Подробнее о PoW.

### Приватный ключ

Приватный ключ — это секретный криптографический ключ, используемый для подписи транзакций и доступа к средствам в кошельке.

Особенности:

- Нельзя ни с кем делиться своим приватным ключом.
- Утрата ключа означает потерю доступа к средствам.

> __Пример:__ приватный ключ может выглядеть как строка из 64 символов, например `5KJvsngHeMpm884TWvZFz...`.

### Публичный ключ

Публичный ключ — это открытая часть пары ключей в криптографии. Он используется для создания адресов и проверки подписей транзакций. Публичный ключ генерируется из приватного ключа с помощью односторонних криптографических функций.

Пример: публичный ключ позволяет проверить, что транзакция была подписана владельцем приватного ключа, но не раскрывает сам приватный ключ.
Узнать больше.

## Р

### Реестр

Список идентификаторов, операции, временные отметки, остатки и других данные, относящихся к финансовому учету. Сеть Биткойн является уникальным реестром доходов и расходов, поскольку она распределена, децентрализована и общедоступна.

## С

### Сатоши (Satoshi)

Сатоши (Satoshi) — это самая маленькая неделимая единица биткоина, равная 0.00000001 BTC. Названа в честь Сатоши Накамото — создателя Биткоина.

Пример использования:

Если цена 1 BTC равна $50,000, то 1 сатоши = $0.0005.
Мелкие транзакции часто указываются в сатоши для удобства.
1 BTC = 100,000,000 сатоши.
Подробнее.

### Сатоши Накамото

Сатоши Накамото — псевдоним создателя Биткоина. В 2008 году он опубликовал белую книгу "Bitcoin: A Peer-to-Peer Electronic Cash System" и запустил сеть в 2009 году. Настоящая личность или группа людей под этим именем до сих пор неизвестна.

Факты о Сатоши:

Владеет приблизительно 1 миллионом BTC.
Последнее сообщение было отправлено в 2010 году.
Пропагандировал идею децентрализации и независимости финансовой системы.
Читать оригинальный документ.

### SegWit (Segregated Witness)

SegWit — это обновление протокола Биткоина, внедрённое в 2017 году, которое отделяет данные подписи (witness – свидетель) от основной транзакции.

Преимущества SegWit:

Увеличение пропускной способности сети.
Исправление ошибки «transaction malleability».
Снижение комиссий за транзакции.
Пример: SegWit позволил внедрить Lightning Network для микротранзакций.
Подробнее о SegWit.

### Сложность майнинга

Сложность майнинга — это параметр, регулирующий, насколько трудно майнерам находить новые блоки в блокчейне. В сети Биткоина сложность автоматически пересчитывается каждые 2016 блоков (~каждые 2 недели), чтобы поддерживать среднее время создания блока около 10 минут.

Особенности:

Увеличивается с ростом хешрейта сети.
Регулирует скорость эмиссии новых биткоинов.
Пример: если сложность растёт, майнеры тратят больше ресурсов на поиск решения.
Подробнее о сложности майнинга.

### Смарт-контракт

Смарт-контракт — это программируемое соглашение, исполняемое автоматически при выполнении определённых условий.

Особенности:

- Смарт-контракты работают на полных по Тьюрингу блокчейнах (например, Ethereum). 
- В Биткоине смарт-контракты ограничены, но доступны через Script и Taproot.

> __Пример:__ автоматическая разблокировка средств после выполнения условий сделки.

## Т

### Timechain – Таймчейн

Таймчейн — это оригинальный термин, использованный Сатоши Накамото в ранних обсуждениях Биткоина, обозначающий блокчейн. Таймчейн подчеркивает временной аспект блоков, связанных в хронологической последовательности.

Пример: каждый новый блок содержит хэш предыдущего и временную метку, создавая цепочку времени.

### Транзакция

Транзакция — это передача биткоинов между адресами в блокчейне. Транзакция включает:

Входы (inputs): источники средств.
Выходы (outputs): адреса, на которые отправляются средства.
Комиссию (fee): плату майнеру за включение транзакции в блок.
Каждая транзакция подписывается приватным ключом отправителя для проверки её подлинности.

Пример:

Отправка 0.5 BTC с комиссией 0.0001 BTC.
Подробнее о транзакциях.

### Тестовая сеть (Testnet)

Тестовая сеть (Testnet) — это альтернативная сеть Биткоина, используемая для экспериментов и тестирования новых функций. В ней биткоины (test BTC) не имеют реальной стоимости, что позволяет безопасно изучать механизмы работы системы.

Особенности:

Адреса Testnet отличаются от основных.
Не влияет на основную сеть (Mainnet).
Пример использования: разработка кошельков и смарт-контрактов.
Читать больше о Testnet.

## У

### Узел (также биткоин-нода или просто нода)

Узел, также нода, — это устройство или программа, которая поддерживает сеть Биткоина, проверяя и распространяя транзакции и блоки.

Подробнее о пользе запуска собственного узла читайте в [этой статье](/practice/bitcoin-node/). 

## Ф

### Фиат

### Форк (Fork)

Форк — это процедура изменения правил консенсуса сети, которое при определённых обстоятельствах может привести к разветвлению блокчейна на две или более цепи. Форки могут быть жёсткими (hard fork) и мягкими (soft fork).

- __Хард форк (жёсткий форк):__ приводит к созданию новой цепи, несовместимой с оригинальной (например, Bitcoin Cash).
- __Софт форк (мягкий форк):__ изменения совместимы с оригинальной цепью (например, [SegWit](/segwit) и [Taproot](/taproot)).

Форки позволяют вносить изменения в протокол или создавать новые криптовалюты.

{{< hint info >}}
Подробнее о форках читайте в [восьмой главе](/izobretaem-bitkoin/glava-8/#форки-меняющие-правила) книги Яна Прицкера "Изобретаем Биткоин". 
{{< /hint >}}

## Х

### Халвинг (Halving)

Халвинг — это событие в сети Биткоина, которое происходит каждые ~210 000 блоков (~4 года) и сокращает награду за добычу блока вдвое.

_Цели халвинга:_

- Замедление эмиссии биткоинов.
- Снижение инфляции.
- Обеспечение равномерного и предсказуемого выпуска новых монет.

> __Пример:__
> 
> - В 2009 году награда составляла 50 BTC.
> - В 2024 году — 3.125 BTC за блок.

{{< hint info >}}
Подробнее о халвинге читайте в [этой статье](/halving).
{{< /hint >}}

### Холодное хранение

Способ хранения или удержания цифрового актива автономно – без подключения к интернету.  Это означает, что ключи должны быть сгенерированы и храниться оффлайн. Самым популярным инструментом для холодного хранения являются [аппаратные кошельки](/hwws). Холодное хранилище является самым безопасным методом хранения криптовалюты, особенно в случае кошельков с балансом, который вы планируете оставить нетронутым на длительный период времени.

{{< hint info >}}
О лучших практиках хранения монет читайте в [этой статье](/kak-hranit-kljuchi/).
{{< /hint >}}

### Хэш (Hash)

Хэш — это результат работы хэш-функции, которая преобразует входные данные произвольной длины в строку фиксированной длины. В Биткоине используется алгоритм SHA-256 для защиты и проверки данных.

Пример:

Вход: "Биткоин".
Хэш: 6f9d8b0a89c116b30f7b93ce0c93a3d6c2f6f18a.

Преимущества хэшей:

Уникальность: каждый набор данных имеет свой хэш.
Невозможность восстановления исходных данных из хэша.
Подробнее о хэшировании.

### Хэш-дерево (Merkle Tree)

Хэш-дерево или дерево Меркла — структура данных, которая используется для организации транзакций в блоке.

Особенности:

Позволяет быстро проверить, включена ли транзакция в блок.
Основано на рекурсивном хэшировании.

### Хэширование

Хэширование – это процесс преобразования данных произвольного размера в фиксированную длину с помощью хэш-функции.

### Хэшрейт

Хэшрейт — это мера вычислительной мощности, используемой для майнинга. Он показывает, сколько хэшей (вычислений) может выполнить устройство или сеть за единицу времени.

Пример:

1 TH/s (терахэш в секунду) = 1 триллион хэшей в секунду.
Чем выше хэшрейт, тем более безопасна сеть, но и сложность майнинга увеличивается.
Читать больше.

## Ш

### Шифрование

Шифрование — процесс преобразования данных в зашифрованный формат, чтобы сделать их недоступными для посторонних. В Биткоине шифрование используется для защиты транзакций и кошельков.

Пример: при создании биткоин-кошелька приватный ключ может быть зашифрован паролем.
Популярные алгоритмы: AES, RSA.

### Schnorr Signatures – Подписи Шнорра 

Подписи Шнорра — это криптографическая схема подписи, являющаяся улучшением стандартного алгоритма ECDSA (используется в Биткоине).

Преимущества подписей Шнорра:

Меньший размер: сокращает использование памяти.
Агрегация подписей: объединяет подписи в одну, уменьшая вес транзакций.
Повышенная безопасность: более стойкая к атакам.
Подписи Шнорра стали возможны с обновлением Taproot в 2021 году.
Подробнее.

## Щ

### Щиткоин (Shitcoin)

Щиткоин — любая криптовалюта, кроме биткоина. Понимание того, что всё, кроме Биткоина, не имеет применения, а все возможные юзкейсы только выиграют, если будут основаны на Биткоине, а не на альтернативном блокчейне, не приходит сразу, но это лишь вопрос времени.

{{<  hint info >}}
Подробнее читайте в [этой статье](/ne-shitcoin).
{{< /hint >}} 

## Э

### Эмиссия

Эмиссия — это процесс выпуска новых биткоинов в обращение. В Биткоине эмиссия осуществляется через майнинг и строго ограничена 21 миллионом монет.

Особенности:

Награда за блок уменьшается вдвое каждые ~4 года (халвинг).
Последний биткоин будет добыт около 2140 года.
Пример: изначально награда за блок составляла 50 BTC, сейчас (2024 год) она равна 6.25 BTC.
Читать больше об эмиссии.

## Ю

### Юридический статус Биткоина

Юридический статус Биткоина — правовая регламентация его использования. В разных странах статус варьируется:

Легален (например, США, Япония, Германия).
Ограничен (например, Россия, Китай).
Запрещён (например, Алжир, Бангладеш).
Пример: в Сальвадоре Биткоин признан официальной валютой с 2021 года.
Подробнее о регулировании.

### UTXO (Unspent Transaction Output)

UTXO — это выход транзакции, который не был использован в качестве входа для другой транзакции.

Особенности:

UTXO определяет доступный баланс для отправки средств.
Каждая транзакция "тратит" UTXO и создаёт новые UTXO.

Пример:

Вход: 0.5 BTC (UTXO).
Выходы: 0.3 BTC (новый UTXO) + 0.2 BTC (сдача).

Подробнее о UTXO.