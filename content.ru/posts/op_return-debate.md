---
author: "Tony"
date: 2025-05-13
list_description: "Биткоин-сообщество сейчас активно обсуждает предложение изменить политику Bitcoin Core в отношении транзакций с OP_RETURN. Это не просто технический спор; он затрагивает фундаментальные философские вопросы о предназначении Биткоина, о том, как должна функционировать его сеть, и вечные дебаты о спаме в противовес легитимному встраиванию данных. Этот пост посвящён ключевым аспектам этого предложения и сопутствующей дискуссии."
menu:
 main:
   parent: blog
next: /blog/
prev: /posts/mining-volution
title: "Дебаты вокруг OP_RETURN"
h1: "Дебаты вокруг OP_RETURN – политика, прагматизм и будущее Биткоина"
cover: /img/blog/op_return-wars/never-gonna-give-you-up.webp
description: "Биткоин-сообщество сейчас активно обсуждает предложение изменить политику Bitcoin Core в отношении транзакций с OP_RETURN. Это не просто технический спор; он затрагивает фундаментальные философские вопросы о предназначении Биткоина, о том, как должна функционировать его сеть, и вечные дебаты о спаме в противовес легитимному встраиванию данных. Этот пост посвящён ключевым аспектам этого предложения и сопутствующей дискуссии."
bookToc: true
weight: 10
---

Биткоин-сообщество сейчас активно обсуждает предложение изменить политику Bitcoin Core в отношении транзакций с `OP_RETURN`. Это не просто технический спор; он затрагивает фундаментальные философские вопросы о предназначении Биткоина, о том, как должна функционировать его сеть, и вечные дебаты о спаме в противовес легитимному встраиванию данных.

{{< hint btc >}}
Блогпост подготовлен [Тони⚡️](https://snort.social/p/npub10awzknjg5r5lajnr53438ndcyjylgqsrnrtq5grs495v42qc6awsj45ys7).

[Поддержать проект](/contribute).
{{< /hint >}}

Этот пост посвящён ключевым аспектам этого предложения и сопутствующей дискуссии.

{{< hint info >}}
Прежде чем начать, необходимо разобраться с основными понятиями, релевантными в данном контексте.
{{< /hint >}}
### 1. Что такое OP_RETURN?

По своей сути, `OP_RETURN` — это скриптовый [операционный код](https://21ideas.org/glossary/#op_code-операционный-код) Биткоина, который позволяет пользователям встраивать небольшой объём произвольных данных в транзакцию. Пометка `OP_RETURN` в выходе транзакции указывает на то, что его доказуемо невозможно потратить (unspendable). Это критически важно, поскольку означает, что данные, связанные с этим выходом, не раздувают набор неизрасходованных выходов транзакций ([UTXO](https://21ideas.org/glossary/#utxo-unspent-transaction-output) set) — важнейшую базу данных, которую все полные узлы Биткоина должны поддерживать для отслеживания биткоинов, которые могут быть потрачены.

`OP_RETURN` был введён как способ явного разрешения хранения данных в блокчейне таким образом, чтобы это было менее вредно для сети, чем другие методы, которые могут пытаться маскировать данные под выходы, которые можно потратить в будущем. Данные в выходе `OP_RETURN` хранятся в блокчейне как часть транзакции, проверяются один раз, когда узел впервые видит транзакцию, но не требуют постоянного обслуживания в наборе UTXO.

Изначально `OP_RETURN` с его (текущим по умолчанию) лимитом в 80 байт задумывался и использовался для различных целей, таких как:

- **Доказательство существования/Временны́е метки (Timestamping):** Встраивание хеша документа или набора данных для подтверждения его существования в определенный момент времени. Например, университет мог бы хешировать список выданных дипломов.
- **Метаданные активов (Colored Coins):** Ранние протоколы для создания токенов на Биткоине (часто называемые "цветными монетами»") использовали `OP_RETURN` для встраивания метаданных, связывающих конкретный выход биткоин-транзакции с [оффчейн](https://21ideas.org/glossary/#оффчейн)-активом. Например, связывание UTXO с "10 акциями публично торгуемой компании".
- **Нотариальные услуги:** Короткие сообщения или удостоверения, вроде цифровой нотариальной печати.
- **Идентификаторы протоколов/Обязательства (Commitments):** Сигнализирование об использовании протокола более высокого уровня или фиксация обязательств по отношению к оффчейн-данным. Например, хеш, который фиксирует больший объем данных, хранящихся где-то еще, или идентификатор для конкретного прикладного протокола. Counterparty был одним из первых проектов, использовавших `OP_RETURN` таким образом. Совсем недавно проекты, такие как [Citrea](https://citrea.xyz), изучали его использование для доказательств, связанных с их решением [второго уровня](https://21ideas.org/glossary/#решения-второго-уровня).
- **Простые сообщения:** Хотя это и не было его основным предназначением, короткие произвольные сообщения также встраивались.

{{< hint info >}}
Сатоши лично участвовал в дискусии на bitcointalk и [высказывался](https://t.me/bitcoin_calendar/197) о том, почему Биткоин нативно не поддерживает передачу текстовых сообщений. 
{{< /hint >}}

Таким образом, сутью `OP_RETURN` была возможность добавлять небольшие, лаконичные данные, которые выигрывали от неизменяемости и глобальной доступности Биткоина, не требуя при этом возможности быть потраченными.

### 2. Изменение политики vs. Изменение консенсуса

**Это различие является критическим моментом в текущих дебатах.**

- **Правила консенсуса:** Это фундаментальные правила, по которым все узлы Биткоина должны приходить к согласию для проверки блоков и транзакций. Если узлы расходятся во мнениях относительно правил консенсуса, это может привести к [форку](https://21ideas.org/glossary/#форк-fork) сети (разделению блокчейна). Изменение правил консенсуса — очень серьезное мероприятие, требующее широкого согласия. Транзакции, нарушающие правила консенсуса, недействительны и отклоняются всей сетью.
- **Правила политики – стандартность (standardness):** Это дополнительные, более строгие правила, которые отдельные [узлы](https://21ideas.org/glossary/#нода-также-биткоин-узел-или-просто-узел) Bitcoin Core (и многие другие узлы) применяют к транзакциям, которые они готовы ретранслировать по сети или включать в добываемые ими блоки. Их часто называют "правилами стандартности". Транзакция может быть _валидной по консенсусу_ (т.е. она соответствует всем фундаментальным правилам Биткоина), но _нестандартной_ (т.е. она нарушает локальную политику узла). Распространение нестандартных транзакций по сети через обычную P2P-ретрансляцию может быть более затруднительным, но всё же эти транзакции могут быть включены (и включаются) в блоки, если майнер решит их принять (часто через прямую отправку или использование альтернативных реализаций Биткоин-узлов).

{{% image "/img/blog/op_return-wars/4mb-inscription.png" %}}
_Источник: [mempool.space/ru](https://mempool.space/ru/tx/ef03981e8926758aae3a08a5c1f5499962bbc427503185ad4a2255b7c9a41dcb)_
{{% /image %}}

Текущее предложение по `OP_RETURN` касается изменения **правил политики**, а не правил консенсуса. Это означает, что даже если политика изменится, базовая валидность по консенсусу транзакций с более крупными или несколькими `OP_RETURN` останется неизменной — они уже разрешены консенсусом. Дебаты ведутся о том, что узлы Bitcoin Core должны считать _стандартным_ для ретрансляции и майнинга.

### 3. Текущие правила OP_RETURN в Bitcoin Core и предлагаемые изменения

**Что означает "стандартность" применительно к OP_RETURN?** "Стандартность" для транзакций с `OP_RETURN` относится к набору правил политики, которые узлы Bitcoin Core используют по умолчанию, чтобы решить, будут ли они ретранслировать или майнить транзакции, содержащие выходы `OP_RETURN`. Если транзакция с выходом `OP_RETURN` соответствует этим критериям стандартности, она обычно принимается в мемпул узла и ретранслируется пирам.

**Текущие лимиты OP_RETURN (Правила стандартности):** Исторически политика Bitcoin Core по отношению к `OP_RETURN` была довольно строгой:

- Разрешался только **один** выход `OP_RETURN` на транзакцию.
- Было установлено ограничение полезной нагрузки данных в этом единственном выходе `OP_RETURN`, равное **80 байтам**.

[Предложение](https://gnusha.org/pi/bitcoindev/rhfyCHr4RfaEalbfGejVdolYCVWIyf84PT2062DQbs5-eU8BPYty5sGyvI3hKeRZQtVC7rn_ugjUWFnWCymz9e9Chbn7FjWJePllFhZRKYk=@protonmail.com) направлено на смягчение этих правил стандартности:

- Снятние ограничения размера данных для выходов `OP_RETURN` "в качестве первого минимального шага для прекращения поощрения вредного поведения"
- Потенциальное разрешение нескольких выходов `OP_RETURN` в одной транзакции указано как последующее возможное послабление в случае такой необходимости.

{{% image "/img/blog/op_return-wars/opreturn-proposal.png" %}}
_Ознакомиться с предложением и дискуссией вокруг него можно в [списке рассылки биткоин-разработчиков](https://groups.google.com/g/bitcoindev/c/d6ZO7gXGYbQ?pli=1)._
{{% /image %}}
 
Ключевым моментом является то, что транзакции, превышающие текущие стандартные лимиты, уже _валидны_ по правилам консенсуса. Майнеры могут включать их в блоки, и иногда так и делают.

{{< hint info >}}
Разобравшись с основными техническими деталями, мы можем переходить к разбору самого (мягко говоря) спора.
{{< /hint >}}

## Суть дебатов: Основные опасения и вопросы

{{< hint info >}}
Это довольно сложная тема, требующая понимания базовых технических особенностей функционирования протокола Биткоин. Поэтому под развёрнутыми ответам на вопросы я прикладываю упрощённые краткие ответы. Если подробности вас утомляют, вы можете сразу перепрыгивать к выделенному **жирным** шрифтом блоку "**Краткий, нетехнический ответ**".
{{< /hint >}}

Это предложение вызвало бурные дискуссии. Вот некоторые ключевые опасения, а также мысли сторонников снятия ограничений `OP_RETURN`:

### **Пользователям должны быть предоставлены чёткие опции настройки их мемпула. Зачем убирать возможность контроля (например, опции `-datacarrier` и `-datacarriersize`)?**

Хотя Bitcoin Core ценит возможность пользователей калибровать настройку своих узлов, эффективность установки отдельными узлами совершенно разных лимитов `OP_RETURN` сомннительна. Если значительная часть сети (особенно майнеры) принимает более крупные `OP_RETURN` (которые валидны по консенсусу и оплачивают комиссии), узел с более строгими локальными лимитами сталкивается с неудобствами: он может отклонить транзакцию из своего мемпула (предварительно загрузив её для проверки) лишь для того, чтобы быть вынужденным загрузить её снова, когда она будет включена в блок. Это приводит к излишнему расходу трафика и оттягивает момент достижения вершины цепочки (последнего намайненного блока), не предотвращая при этом запись данных в блокчейн. Существует аргументированное мнение, что эта конкретная опция конфигурации на сегодняшний день в значительной степени неэффективна для своей предполагаемой цели, и её удаление упрощает политику. 

**Краткий, нетехнический ответ:** Локальные лимиты OP_RETURN неэффективны и вредят оператору узла, если майнеры всё равно принимают данные; удаление опции упрощает политику.

### Не будут ли спамеры злоупотреблять большими OP_RETURN для раздувания блокчейна и замедления изначальной загрузки блоков (Initial Block Download/IBD)?

Данные `OP_RETURN` являются частью скрипта выхода транзакции, на который _не_ распространяется скидка для свидетельских данных (witness discount) SegWit. Это делает хранение данных в `OP_RETURN` дороже за байт для больших объёмов по сравнению со свидетельскими данными (как в Inscriptions). Если больший вес блока используется данными `OP_RETURN`, это означает меньше места для других данных. Проверка выходов `OP_RETURN` также является вычислительно недорогой, а сами выходы не попадают в набор UTXO, поэтому не ожидается, что они значительно замедлят IBD или создадут нагрузку на критически важную базу данных UTXO. Добавление большего количества данных в скрипты выходов (таких как `OP_RETURN`) может даже привести к уменьшению размера блоков в байтах, если это вытеснит свидетельские данные, из-за особенностей расчёта веса блока.

**Краткий, нетехнический ответ:** Маловероятно, что это значительно замедлит IBD или усугубит общее раздувание по сравнению с другими методами; OP_RETURN дороже для больших данных, чем Inscriptions, и не раздувает критически важный набор UTXO.

### Это не первый раз, когда предлагается смягчить лимиты OP_RETURN. Похожий PR обсуждался пару лет назад. Что изменилось сейчас?

Ландшафт Биткоина изменился. Ключевым фактором является то, что такие проекты как Citrea заявили, что будут использовать не подлежащие прунингу (обрезке) выходы платежей (которые раздувают набор UTXO) для своих нужд в данных, если лимиты размера `OP_RETURN` останутся для них слишком строгими. Этот потенциал роста раздувания UTXO из-за новых проектов, наряду с существующими тенденциями встраивания данных (такими как Ordinals и Runes), сделал аргумент в пользу "более чистого", стандартизированного метода встраивания данных, такого как `OP_RETURN`, более весомым. Текущее предложение рассматривается некоторыми как мера по снижению вреда в свете этих событий.

**Краткий, нетехнический ответ:** Основное изменение заключается в том, что новые проекты (например, Citrea), решившие хранить данные в блокчейне, могут использовать методы, раздувающие набор UTXO, если лимиты OP_RETURN не будут смягчены, что сделало аргумент "снижения вреда" через снятие ограничений OP_RETURN более актуальным.

### Не должны ли мы бороться со спамом, ужесточая политики, а не ослабляя их? 
 
Многие разработчики признают, что встраивание данных является следствием безразрешительной природы Биткоина. Борьба со спамом на уровне политики мемпула часто неэффективна, если транзакции валидны по консенсусу и оплачивают достаточные комиссии, поскольку майнеры заинтересованы в их включении. Эффективное ограничение спама, вероятно, потребует ограничительных изменений консенсуса (софтфорк), которые сложны и спорны – к тому моменту, как софтфорк будет проработан, утверждён и запущен, фанаты добавления произвольных данных в блокчейн Биткоина с высокой вероятностью найдут новые методы засорения блокчейна. Аргумент заключается в том, что лучше направлять данные в _наименее вредный_ известный механизм (`OP_RETURN`), чем допускать их появление в более проблемных формах.

**Краткий, нетехнический ответ:** Политика мемпула не очень эффективна против спама, который майнеры всё равно включат в блоки; это изменение направлено на снижение вреда путем направления данных в менее разрушительный формат (OP_RETURN).

### Как сейчас обходят политику стандартности для лимитов размера OP_RETURN?

  Если транзакция валидна по консенсусу, но нестандартна (например, `OP_RETURN`больше 80 байт), она может не ретранслироваться узлами, работающими с установленной по умолчанию политикой Bitcoin Core. Однако пользователи могут:
  
1. Отправить её напрямую майнинг-пулам, которые используют собственные политики мемпула и готовы включать такие транзакции "мимо кассы" (out-of-band).
2. Использовать альтернативные реализации Биткоин-узлов, такие как Libre Relay, которые могут иметь менее строгие политики мемпула и ретранслировать транзакции, считающиеся нестандартными в Bitcoin Core. Поскольку транзакции с несколькими или более крупными выходами `OP_RETURN` разрешены правилами консенсуса, блоки, включающие эти нестандартные транзакции, принимаются всеми узлами.

**Краткий, нетехнический ответ:** Пользователи могут обходить ограничительные политики, отправляя транзакции напрямую майнерам или используя узлы/сервисы с более разрешительными правилами ретрансляции; эти валидные транзакции всё равно будут приняты в блоках всеми узлами.

### Может ли это обновление негативно повлиять на децентрализацию Биткоина?

Наоборот, это может даже (незначительно) _улучшить_ децентрализацию. Если желательные (оплачивающие комиссию, валидные по консенсусу) транзакции не ретранслируются по умолчанию, это стимулирует их прямую отправку крупным майнинг-пулам, предоставляя тем преимущество. Придание таким транзакциям статуса "стандартных" делает их комиссии доступными любому майнеру, потенциально в некоторой мере снижая давление в сторону централизации.

**Краткий, нетехнический ответ:** Это может улучшить децентрализацию, сделав больше транзакций, оплачивающих комиссию, широко доступными для майнинга, а не концентрируя их через прямые отправки крупным пулам.

### Что делает UTXO "не подлежащим прунингу", и какие проекты создают такие UTXO, раздувающие их набор?

Набор UTXO (Unspent Transaction Output) представляет все текущие "кусочки" биткоинов, подлежащие трате в будущем. Каждый полный узел _должен_ хранить весь набор UTXO в памяти для проверки новых транзакций и предотвращения двойных трат. Если бы узлы отбрасывали UTXO, которые позже могут быть потрачены, сеть бы разделилась (форк). Таким образом, сам набор UTXO "не подлежит прунингу". "Обезьяны на блокчейне" – как я люблю называть произвольные данные, записываемые в блокчейн Биткоина – иногда включали в себя встраивание сообщений в хеши публичных ключей. Проекты, такие как Counterparty и Stamps, использовали методы вроде "голых" [мультисиг](https://21ideas.org/glossary/#мультиподпись-multisignature)-выходов 1-из-3, сохраняя данные в двух публичных ключах, оставляя при этом UTXO технически подлежащим трате (spendable) и, следовательно, делая их неотъемлемой частью набора UTXO. Одной из мотиваций для смягчения лимитов `OP_RETURN` является снижение вреда: разрешение, например, полезной нагрузки `OP_RETURN` в 100 байт или полное снятие ограничения рассматривается как предпочтительное по сравнению с тем, чтобы проекты создавали записи в наборе UTXO.

**Краткий, нетехнический ответ:** Набор UTXO (все биткоины, подлежащие трате) жизненно важен и не может быть "обрезан" узлами. Хранение данных в выходах, выглядящих как подлежащие трате (как это делают Stamps или планирует Citrea), раздувает этот критически важный набор; хранение данных в OP_RETURN этого избегает.

### Какова была основная причина этого PR? Что будет, если ничего не делать?

**Обоснование:** Если валидные по консенсусу транзакции с более крупными/множественными `OP_RETURN` майнятся, но не ретранслируются по умолчанию, узлы с более строгими политиками могут загружать их, отклонять, а затем загружать _снова_, когда они появляются в блоке. Это приводит к излишнему расходу трафика и может замедлить распространение блоков, что непропорционально выгодно более крупным майнерам. Бездействие увековечивает эти неэффективности и продолжает стимулировать хранение данных потенциально более вредными способами, раздувающими набор UTXO.

**Краткий, нетехнический ответ:** Изменение направлено на повышение эффективности сети (меньше потерь трафика, более быстрая ретрансляция блоков) и снижение стимулов для хранения данных способами, раздувающими набор UTXO.

### Если OP_RETURN всё ещё не может остановить весь мусор, почему так важно смягчить его лимиты? 
 
Суть в снижении вреда и выборе наименее разрушительного метода для хранения данных в блокчейне путем поощрения их размещения в `OP_RETURN` вместо методов, раздувающих UTXO. 

1. **Inscriptions:** Данные в свидетельской части (SegWit) входных данных. Дисконтированные (дешевле для больших объемов данных), но податливые (malleable) вплоть до момента подтверждения. Обрезанные (pruned) узлы при изначальной синхронизации с опцией `assumevalid` могут не загружать/не проверять их. 
2. **OP_RETURN:** Данные в выходных скриптах. Не дисконтированные (дороже для больших объемов данных свыше примерно 143 байт по сравнению с Inscriptions), не податливые, если входы используют `SIGHASH_ALL`. Не попадает в набор неизрасходованных выходов (UTXO set).
3. **Данные в платёжных выходах (например, Stamps):** Данные в поддельных публичных ключах/хешах. Не дисконтированные. Раздувает набор UTXO (наихудший исход для узлов). Ослабление стандартности `OP_RETURN` поощряет перемещение данных в формат, который не раздувает набор UTXO и не является податливым (при правильном использовании), даже если он немного дороже для некоторых случаев использования, чем Inscriptions.

**Краткий, нетехнический ответ:** Хотя мы не можем полностью запретить запись произвольных данных в блокчейн, ослабление ограничений OP_RETURN необходимо, потому что это поощряет пользователей использовать менее вредный способ записи этих данных вместо методов, которые сильно нагружают и раздувают основную часть блокчейна. Это помогает уменьшить ущерб для каждого, кто поддерживает сеть.

### Зачем спамеру использовать OP_RETURN, если дешевле использовать свидетельские данные (Segwit)?

Данные OP_RETURN подписываются подписями во входных данных и, следовательно, не могут быть изменены (malleated), в то время как по крайней мере подписи в свидетельских данных являются податливыми (malleable). Некоторые пользователи также воспринимают OP_RETURN как "праведный" способ встраивания данных. Выходы `OP_RETURN` также немного дешевле для небольших объемов данных (до 143 байт), но дороже для больших объемов данных.

**Краткий, нетехнический ответ:** Даже если хранить много данных через witness дешевле, кто-то может выбрать OP_RETURN, потому что данные там более надежно "запечатаны" и не могут быть изменены после подтверждения, а для необльших объёмов данных этот подход даже немного дешевле.

### Если смягчение лимита стандартности OP_RETURN направлено на то, чтобы позволить прунинг спама, каково мнение сторонников этого изменения касательно долгосрочной жизнеспособности запуска не урезанного Биткоин-узла ?

Это изменение _повышает_ жизнеспособность полных узлов, защищая набор UTXO. Блоки были почти полными примерно c начала 2023 года, что указывает на высокий спрос на пространство в блоках. Предлагаемое изменение не обязательно сделает блоки ещё более полными, позволив добавлять в них другие типы данных; вместо этого оно направлено на перенос части данных из менее желательных форм (таких как выходы, раздувающие UTXO, или даже свидетельские данные, на которые действует скидка) в `OP_RETURN`. Большее количество данных `OP_RETURN` по сравнению со свидетельскими данными может фактически упростить проверку блоков и потенциально уменьшить их общий размер в байтах из-за отсутствия скидки на свидетельские данные для `OP_RETURN`. Беспокойство вызывает не только размер блокчейна (который может корректироваться путем прунинга старых блоков), но и рост размера набора UTXO, который `OP_RETURN` помогает минимизировать.

**Краткий, нетехнический ответ:** Это изменение рассматривается как способствующее жизнеспособности полных узлов путем увода данных от методов, раздувающих UTXO. Это не должно повысить стоимость запуска узлов, и наоборот, может даже упростить проверку блоков.

### Это изменение политики, а не консенсуса. Значит, оно не вызовет хардфорк, верно?
   
Верно. **Это предложение НЕ является изменением консенсуса и НЕ вызовет хардфорк.** Оно изменяет базовые правила Bitcoin Core для ретрансляции и майнинга транзакций. Оно не меняет никаких правил консенсуса. Узлы, работающие с разными политиками, могут видеть разное содержимое мемпула, но всё равно будут сходиться на одном и том же валидном блокчейне.

**Краткий, нетехнический ответ:** Верно, это изменение политики, а не консенсуса и не может вызвать хардфорк или разделение цепи.

### Почему этому изменению не присвоен номер BIP?

Предложения по улучшению Биткоина ([BIP](https://21ideas.org/glossary/#bip-bitcoin-improvement-proposal)) обычно предназначены для изменений, которые влияют на правила консенсуса, значительные изменения протокола P2P-сети или вводят новые широко принятые стандарты (например, пути деривации кошельков). Изменения в _политике_ Bitcoin Core (например, критерии приёма "стандартных" транзакций в мемпул), как правило, управляются через процесс разработки Bitcoin Core (PR на GitHub, обсуждения в списках рассылки) без формального BIP.

**Краткий, нетехнический ответ:** BIP обычно предназначены для изменений консенсуса или крупных сетевых стандартов; изменения политики узла обычно не получают BIP.

## Выводы диванного максималиста

Дискуссия вокруг `OP_RETURN` подчёркивает фундаментальное противоречие: Биткоин как чисто финансовый расчётный уровень против Биткоина как устойчивого к цензуре, программируемого публичного реестра.

Я убеждён, что попытки фильтровать "нефинансовые" или "нежелательные" транзакции на уровне политики мемпула — это всё более сложное и в конечном счёте тщетное занятие. Вот основные аргументы в поддержку моего мнения, на которые я бы хотел обратить ваше внимание:

1. **Определение спама субъективно:** То, что один человек считает спамом, другой может рассматривать как легитимное использование безразрешительной системы.
2. **Экономические стимулы доминируют:** Если существует спрос на хранение данных в Биткоине, и пользователи готовы платить комиссии за транзакции, майнеры в конечном итоге найдут способы включать эти (валидные по консенсусу) транзакции. "Обезьяны на блокчейне" принесли майнерам около $280 миллионов комиссионных за пару лет – мощный стимул. Пытаться играть в "поймай крота" с правилами политики против такой экономической силы – заведомо проигрышная затея.
3. **Обходные пути:** Более строгие политики часто приводят к тому, что пользователи и майнеры создают прямые каналы для отправки транзакций "мимо кассы", потенциально централизуя влияние вокруг более крупных майнинговых операций и снижая прозрачность.
4. **Сложность против выгоды:** Чрезмерно сложные правила политики, пытающиеся дифференцировать "хорошие" и "плохие" транзакции, могут приводить к ошибкам, снижать эффективность и затруднять понимание системы.

Предлагаемое смягчение стандартности `OP_RETURN` выглядит как прагматичное признание этих реалий. Оно направлено на:

- **Снижение негативных внешних эффектов:** Поощрение хранения данных таким способом, который не раздувает набор UTXO (в отличие от данных в поддельных выходах, подлежащих дальнейшей трате).
- **Повышение эффективности сети:** Сокращение потерь трафика и задержек распространения блоков, вызванных отклонением узлами транзакций, которые всё равно будут добавлены в блок.
- **Выравнивание условий игры:** Сделать доход от комиссий за эти транзакции более широко доступным, а не концентрировать его в руках крупных пулов с приватными сетями ретрансляции.

В конечном счёте, самым эффективным "фильтром" в блокчейне Биткоина являются **финансовые стимулы**. Если какая-либо деятельность достаточно ценна для её сторонников, они заплатят необходимые комиссии. Если эта деятельность легкомысленна или вызвана погоней за лёгкой наживой, в конечном счёте она будет вытеснена активностью пользователей, действительно нуждающихся в Биткоине в долгосрочной перспективе. 

Попытки навязать определённое видение "легитимного использования" через политику мемпула для валидных по консенсусу транзакций могут создать больше проблем, чем решить. Блокчейн – это общественный ресурс; его использование будет диктоваться теми, кто готов платить за то, чтобы оставить в нём свой след. Текущее предложение корректировки политики `OP_RETURN` является шагом к более эффективному и **реалистичному** обращению с окружающей нас реальностью.

> Хотите высказать своё мнение? К сожалению, ностр-релей 21 идеи на данный момент проходит технические работы, поэтому я предлагаю вам оставить комментарий в нашем чате [₿-Talk](https://t.me/+Kg6_43gEnB1hYzU0) в Телеграм. Мы активно используем сеть Лайтнинг и финансовые стимулы, чтобы фильтровать спамеров, ежедневно пытающихся заполнить наш чат "сигналами" и "инвестиционными советами". Единоразовая стоимость входа – 1000 сатоши.

---

## Рекомендуемые дополнительные материалы

- PR Питера Тодда: https://github.com/bitcoin/bitcoin/pull/32359 
- Дискуссия в списке рассылки: https://groups.google.com/g/bitcoindev/c/d6ZO7gXGYbQ?pli=1 
- Блогпост "виновника" всего этого бедлама – Antonie Poinshot'а, который предложил убрать ограничение размера поля `OP_RETURN` – освещающий его видение происходящего: https://antoinep.com/posts/relay_policy_drama/
- AMA-сессия Murch – разработчика Bitcoin Core – которая легла в основу секции Q&A в этом посте: https://stacker.news/items/971277/r/Tony
