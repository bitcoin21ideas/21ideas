---
title: "Часть 1: Анализ цепочки и приватность транзакций"
h1: "Часть 1: Анализ цепочки и приватность транзакций"
description: "В части 1 мы познакомимся с основами анализа цепочки, включая эвристики обнаружения выхода сдачи."
cover: /img/oxt/oxt-1-cover.png
url: privacy/oxt-1
date: 2021-08-04
bookFlatSection: false
bookToc: true
weight: 1
---

{{< hint info >}}
_Данный материал также доступен в видеоформате в [этом плейлисте](https://youtube.com/playlist?list=PLfCndTr__6Hdd1gNCYsON1NKln_eIRJqC)._
{{< /hint >}}

{{< details "Оглавление" "..." >}}

## Понимание приватности в сети Биткоин с помощью OXT

[Часть 1: Анализ цепочки и приватность транзакций](/privacy/oxt-1)

[Часть 2: Ключевые концепции анализа цепочки](/privacy/oxt-2)

[Часть 3: Защита от анализа цепочки](/privacy/oxt-3)

[Часть 4: Применение концепций анализа цепочки для улучшения приватности пользователей](/privacy/oxt-4)

{{< /details >}}

В первой части мы познакомимся с основами анализа цепочки, включая эвристики обнаружения выхода сдачи.

{{< hint btc>}}
Перевод [статьи](https://medium.com/oxt-research/understanding-bitcoin-privacy-with-oxt-part-1-4-8177a40a5923) от разработчиков Samourai Wallet

[Поддержать проект](/contribute/)
{{</hint >}}



## Введение

Осознание того, что Биткоин может использоваться для платежей, устойчивых к цензуре, началось в 2011 году с запуском Silk Road и спасением лишенного пожертвований Wikileaks.

Одновременно с этим получила распространение опасная и недостоверная информация о приватности транзакций в сети Биткоин: "анонимные" платежи.

{{< x user="wikileaks" id="80774521350668288" >}}

Такое представление не соответствовало действительности и во многом объяснялось непониманием базовой функциональности Биткоина. Кроме того, в 2011 году за блокчейном почти никто не следил. Но блокчейн - это навсегда.

Сегодня доступ правоохранительных органов к инструментам анализа цепочки помог осуществить множество громких [изъятий](https://www.coindesk.com/u-s-seized-more-than-1b-in-silk-road-linked-bitcoin-seeks-forfeiture-bloomberg). Фирмы, занимающиеся наблюдением за блокчейном, стремятся первыми опубликовать в блогах сообщения о последнем "преступлении" с использованием Биткоина для оплаты. В традиционных СМИ появляются заголовки о возможности отслеживания Биткоина.

{{% image "/img/oxt/oxt-2.png" %}}
_[Биткоин можно отследить](https://www.nytimes.com/2021/06/09/technology/bitcoin-untraceable-pipeline-ransomware.html)_
{{% /image %}}

### Отслеживаемость - это мейнстрим

Реальность приватности Биткоина и того, на что способны пользователи, использующие Биткоин для совершения платежей, находится где-то между полной анонимностью и полной отслеживаемостью.

Большинство методов отслеживания основываются на эвристиках и оценке движения биткоинов. Без фундаментальных улучшений приватности на уровне протокола эти методы должны быть преодолены на прикладном уровне.

В самом начале истории Биткоина для преодоления аналитической эвристики использовался метод случайных отпечатков кошельков. Такие инструменты, как кастодиальные миксеры, использовались для преодоления анализа финансовых движений с риском потери средств. Сегодня [CoinJoin](/privacy/coinjoin) и совместные транзакции позволяют обеспечить разумную конфиденциальность трат при повышенной безопасности по сравнению с предыдущими методами. Однако предстоит еще много работы по автоматизации повышения приватности на прикладном уровне.

Мы считаем, что среди основных задач - обучение, которое поможет пользователям получить базовый уровень финансовой приватности, обычно обеспечиваемый традиционными финансовыми сетями. Это и является нашей основной мотивацией для создания данной документации. В данном руководстве мы рассмотрим следующее:

1. Что на самом деле означает "отслеживаемый" Биткоин, включая примеры.
2. Защитные меры, которые могут предпринять пользователи, чтобы избежать отслеживания, и почему они работают.
3. Практические соображения для пользователей, отправляющих и получающих платежи.

## Постановка задачи — псевдонимный Биткоин

Транзакции в системе Биткоин являются псевдонимными, а не анонимными. Настоящее имя пользователя и его персональная идентификационная информация (PII) не являются частью протокола Биткоина. Это обеспечивает базовый уровень приватности, поскольку транзакционная активность должна быть отнесена к конкретному человеку.

Однако транзакции в сети Биткоин осуществляются на прозрачные суммы по прозрачным адресам. Адреса - это псевдонимы, отражающие деятельность реального пользователя, а точнее, деятельность его приватного ключа.

{{% image "/img/oxt/oxt-3.png" %}}
_[Пример](https://oxt.me/transaction/ceb2daa77a281083cd1b07977adb87753801047753781a9e93ac9252f1c51b8c) Биткоин-транзакции_
{{% /image %}}

Транзакции транслируются в сеть Биткоина и архивируются в блокчейне Биткоина. Этот реестр транзакций и все транзакции, включенные в него, может просмотреть любой человек, работающий с узлом Биткоина или имеющий доступ к веб-обозревателю блокчейна.

В силу прозрачности этой публичной информации, доступ к ней  не тривиален, что не характерно для традиционной финансовой системы.

Пользователи могут открыть [обозреватель блокчейна](https://mempool.space/ru/) в веб-браузере и просмотреть всю историю транзакций в сети Биткоин. Они могут легко проследить движение биткоинов по нескольким транзакциям.

В широком смысле эта практика стала синонимом терминов "отслеживаемость" и "анализ цепочки".

Наиболее распространенная форма анализа цепочки направлена на выявление выходов "сдачи" транзакций. В основе этого процесса лежит ряд эвристик, которые могут быть использованы для отслеживания действий пользователя на протяжении нескольких транзакций.

Если эта деятельность в блокчейне приводит к кластеру кошельков идентифицированного экономического субъекта, исследователи могут получить *PII* пользователя, связанную с наблюдаемой транзакционной деятельностью.

**Отсюда можно сделать вывод о двух критических проблемах, которые могут быть использованы для атаки на приватность пользователя:**

1. Выходы "сдачи" могут быть использованы для отслеживания активности пользователя в блокчейне.
2. Пересечение этой деятельности с сущностями, получающими *PII*, связывает наблюдаемую активность в блокчейне с возможной реальной личностью.

Хотя пункт 2 является важнейшей частью того, что превращает анализ цепочки в реальное правоприменение, данная документация будет посвящена именно смягчению последствий отслеживания в блокчейне.

## Эвристики

Эвристики - это эмпирические правила, используемые для принятия решений в условиях неопределенности. Часто они основаны на практических упрощениях. Эвристики, являясь предположениями, основанными на не полных данных, не могут быть на 100% точными.

Большая часть традиционного анализа цепочки основана на эвристиках. Основные эвристики связаны с "обнаружением сдачи" в простых тратах и с группировкой отдельных адресов по эвристике владения совместными входами.

По отдельности эти эвристики могут вводить в заблуждение и быть неточными. Однако их сочетание с паттернами транзакций или внешними данными, такими как маркировка кластеров кошельков, повышает эффективность попыток отслеживания, и недостатки этих эвристик все меньше влияют на финальные результаты.

## Неизрасходованные выходы транзакций (UTXO)

Биткоин-транзакции - это записи о движении биткоинов между адресами.

Неизрасходованные выходы транзакций (UTXO) - это "кусочки биткоина", которые используются для построения транзакций. Структуру транзакции можно разделить на входы и выходы.

Пользователь создает транзакцию, указывая платежный адрес (адреса) и сумму (суммы) платежа. Это будут _выходы_ созданной транзакции.

Как правило, программное обеспечение кошелька создает транзакцию, алгоритмически включая UTXO из предыдущих транзакций в качестве _входов_ для новой.

{{% image "/img/oxt/oxt-4.png" %}}
_Неизрасходованные выходы транзакций (UTXO)_
{{% /image %}}

Существует разница между адресом и UTXO. UTXO - это "кусочки биткоина", выплачиваемые по адресу. Проще всего понять, что один адрес может получать несколько UTXO, и этот процесс, наносящий ущерб приватности, называется "повторным использованием адреса".

## Примеры транзакций

Существует несколько общих категорий Биткоин-транзакций. Эти категории определяются на основе характеристик входов и выходов транзакций, а также нашего опыта и наблюдаемой маркировки кластеров. Примеры основных типов транзакций приведены ниже.

### Простая трата

Транзакции простой траты являются одними из наиболее распространенных типов транзакций и составляют примерно 50% транзакций в сети Биткоин в последних блоках (источник: [transactionfee.info](https://transactionfee.info/charts/transactions-1in-2out/)).

Этот тип транзакций демонстрирует типичное поведение пользователя, когда он производит платеж и получает выход сдачи.

_**Признаки:**_
- Количество входов: 1 (или более)
- Количество выходов: 2
- Общая интерпретация: 1 платежный выход, 1 выход сдачи

{{% image "/img/oxt/oxt-5.png" %}}
_[Пример](https://oxt.me/transaction/36e0f7c61e40a232829087ed3152519765b7fcf7be7d8574387cd1e694aa71b3) транзакции простой траты_
{{% /image %}}

### Свип

"Свип" (Sweep) тратит один UTXO целиком на новый адрес.

_**Признаки:**_
- Количество входов: 1
- Количество выходов: 1
- Общая интерпретация: Возможная передача самому себе

{{% image "/img/oxt/oxt-6.png" %}}
_[Пример](https://oxt.me/transaction/ae4e6fe34a8c4e98339ca84c902946e68a8bb8a6cdcf63f19d6f201a7a403f0e) "свип"-транзакции_
{{% /image %}}

### Консолидация

Консолидационные транзакции объединяют несколько UTXO в один. Они редко являются "истинными платежами", поскольку обычный платеж имеет выход сдачи.

_**Признаки:**_
- Количество входов: >1
- Количество выходов: 1
- Общая интерпретация: Возможная передача самому себе

{{% image "/img/oxt/oxt-7.png" %}}
_[Пример](https://oxt.me/transaction/8855ca21337c5b82a1970aea0f4c21c7284016c33caa1d26a6441c74f6a0ba57) консолидационной транзакции_
{{% /image %}}

### Пакетная трата

Пакетные траты чаще всего осуществляются биржами и включают 1 или более входов и множество выходов. Цель таких транзакций - сэкономить на комиссии майнерам за счет проведения как можно большего количества платежей в рамках одной транзакции.

_**Признаки:**_
- Количество входов: ≥1
- Количество выходов: много
- Общая интерпретация: Крупная экономическая деятельность, вероятно, биржа

{{% image "/img/oxt/oxt-8.png" %}}
_[Пример](https://oxt.me/transaction/3524f3e2bdd7c1a5e4bc116d3a55d650b67e37504258c731b9c7b63dc4425a45) пакетной траты_
{{% /image %}}

### Совместные транзакции (CoinJoin)

Совместные транзакции предполагают работу нескольких пользователей для выполнения одной транзакции, что повышает конфиденциальность участников. Такие транзакции легко идентифицируются по одинаковым суммам на выходе.

_**Признаки:**_
- Количество входов: много
- Количество выходов: много
- Характеристика выходов: Количество идентичных выходов является косвенным показателем количества участников.

{{% image "/img/oxt/oxt-9.png" %}}
_[Пример](https://oxt.me/transaction/00601af905bede31086d9b1b79ee8399bd60c97e9c5bba197bdebeee028b9bea) CoinJoin-транзакции_
{{% /image %}}

## Обнаружение сдачи — интерпретации простой траты

В этом разделе мы рассмотрим интерпретации транзакций простой траты (1 вход, 2 выхода). Мы сосредоточимся на наиболее распространенной интерпретации таких транзакций, когда один выход интерпретируется как платеж, а оставшийся выход - как возврат средств на исходный кошелек. Полный список интерпретаций в рамках данной модели представлен в [части 3](/privacy/oxt-3). Цель данного раздела - ознакомить читателя с эвристикой, используемой для оценки простых трат и обнаружения выхода сдачи.

При изолированном наблюдении за отдельной транзакцией нам представляется ограниченный объем входящих в нее данных. Мы называем эту информацию внутренними данными транзакции.

Внутренние данные транзакции ограничиваются следующим:

- суммы (входы, выходы, комиссия майнерам)
- тип скрипта входного адреса
- тип скрипта выходного адреса
- номер версии транзакции
- время блокировки транзакции
- возможность замены транзакции с помощью увеличения комиссии (replace-by-fee)

### Определение выхода сдачи

Из-за комиссии майнерам обычный биткоин-платеж всегда требует расходования большей суммы на выходе, чем предполагаемая сумма платежа.

Когда расходуется один UTXO на большую сумму, чем предполагаемая сумма платежа, пользователь получает UTXO сдачи на оставшуюся сумму обратно на адрес, сгенерированный из приватного ключа его кошелька.

Большая часть традиционного анализа цепочки основана на обнаружении этого выхода сдачи. Если выход сдачи успешно обнаружен, то можно отследить действия одного пользователя на протяжении ряда транзакций.

В этом разделе мы будем выявлять выходы сдачи на основе внутренних данных транзакций. Эвристики представлены в порядке убывания эффективности. Будут приведены примеры и показаны аннотированные скриншоты, чтобы помочь пользователям визуализировать эти концепции.

### Повторное использование адреса

Адреса создаются с помощью одного приватного ключа. Многократное использование одного и того же адреса является признаком активности одного и того же приватного ключа.

В простом случае, если один выход осуществляется на новый адрес, а второй выход - на тот же адрес, что и входной адрес, мы знаем, что повторно используемый адрес - это выход сдачи.

Сегодня большинство Биткоин-кошельков автоматически генерируют новый адрес для получения выходов сдачи. Однако кошелек может быть настроен на получение сдачи по тому же адресу, что и вход транзакции. Такое поведение обычно характерно для кошельков централизованных сервисов или старых версий кошелька Bitcoin Core.

{{% image "/img/oxt/oxt-10.png" %}}
_[Пример](https://oxt.me/transaction/4c18b982836006cbe54661942f632f10b9cc0072e97a32feeea77abd8c7c8c3c) транзакции с повторным использованием адреса_
{{% /image %}}

### Эвристика круглого значения суммы платежа

Когда пользователь инициирует платеж, он вводит в программное обеспечение своего кошелька назначение платежа (адрес), сумму платежа и комиссию за транзакцию в сети. Программное обеспечение кошелька выбирает входные UTXO и формирует выход сдачи (если таковая имеется).

Сумма сдачи при простой трате рассчитывается следующим образом:


`сумма входа ➖ сумма платежа ➖ размер транзакции (vbyte) ✖️ комиссия сети (сат/vbyte)`

Пользователю сложно специально сгенерировать выход сдачи с "круглым значением". При простой трате выход с круглым значением суммы, как правило, является платежом, что в свою очередь делает оставшийся выход выходом сдачи.

{{% image "/img/oxt/oxt-11.png" %}}
_[Пример](https://oxt.me/transaction/112c987fcb27c54452b8bbaff35a89c2aff3def5a132844fd58865c224d5169d) транзакции с круглым значением суммы платежа_
{{% /image %}}

### Эвристика различных типов скриптов

Существует [несколько типов скриптов Биткоин-адресов](/sravnenie-tipov-bitcoin-adresov/). Читателям наиболее знакомы следующие типы скриптов:

- Pay to pubkey hash (P2PKH): Адреса, начинающиеся с 1
- Pay to script hash (P2SH): Адреса, начинающиеся с 3
- Native Segwit (версия 0) (bech32): Адреса, начинающиеся с bc1q

Для заданного типа скрипта на входе, если один выход имеет тот же тип, что и вход, а другой - новый тип скрипта адреса, то вероятным платежом является выход на новый тип скрипта. Таким образом, выход на тот же тип скрипта является вероятным выходом сдачи.

Другими словами, выход на другой тип скрипта вероятно является платежом. Эту эвристику можно также комбинировать с эвристикой платежа с круглым значением суммы.

{{% image "/img/oxt/oxt-12.png" %}}
_[Пример](https://oxt.me/transaction/046c82240b8b29612c5b385b9bca6557f72f2bbeed0a043b3799f94a6c979f3d) транзакции с платежным выходом на другой тип скрипта Биткоин-адреса_
{{% /image %}}

### Эвристика наибольшей суммы выхода

Другая простая эвристика предполагает, что наибольшая сумма выхода является вероятным выходом сдачи. Это одна из самых слабых эвристик, особенно если брать ее в отдельности, но, как мы обсудим во [второй части](/privacy/oxt-2), эта эвристика может быть полезна при анализе графа транзакций.

{{% image "/img/oxt/oxt-13.png" %}}
_Эвристика наибольшей суммы выхода ([TxID](https://oxt.me/transaction/5005628082b902961c25fb6c9503e2ad11e84a75e07e8f24f5b425451f017af6))_
{{% /image %}}

## Обзор и анонс

В этом разделе мы представили множество основных понятий, связанных с приватностью транзакций в Биткоине. Благодаря псевдонимной природе Биткоина достигается базовый уровень приватности, который не связан напрямую с персональной идентифицируемой информацией. 


Однако открытость протокола Биткоина позволяет отслеживать движение монет. В широком смысле эта концепция получила название "анализ цепочки". Основное внимание при анализе цепочки уделяется обнаружению выходов сдачи с помощью ряда эвристик. В случае успеха эти эвристики позволяют отслеживать действия отдельного пользователя на протяжении нескольких транзакций.

**В [части 2](/privacy/oxt-2) будут представлены основные понятия анализа цепочки, такие как:**

1. Внешние данные о транзакциях, которые могут быть использованы для ослабления приватности транзакций.
2. Анализ графа транзакций - основного инструмента для отслеживания движений биткоинов в течение нескольких транзакций.
3. Эвристика владения совместными входами, также известная как "кластеризация кошельков", и ее значение для сети Биткоин.
4. В этом разделе также приводится описание и примеры использования инструмента [OXT](https://oxt.me/) для анализа графа транзакций и схемы кластеризации кошельков.

**В [части 3](/privacy/oxt-3) рассматриваются основные концепции повышения приватности в сети Биткоин, включая:**

1. Случайный отпечаток кошелька для защиты от обнаружения сдачи.
2. Движения UTXO и фундаментальная связь между входами и выходами.
3. Как CoinJoin с равными выходами решает проблему детерминированности движений UTXO.
4. Энтропия транзакций.
5. Как PayJoin преодолевает эвристику владения совместными входами.

**В [части 4](/privacy/oxt-4) рассматриваются:**

1. Анализ, требующий "отправной точки".
2. Последствия отправки и получения платежей для приватности.
3. Как существующие методы обеспечения приватности могут смягчить многие из проблем, обсуждаемых в данном руководстве.

{{< details "Оглавление" "..." >}}

## Понимание приватности в сети Биткоин с помощью OXT

[Часть 1: Анализ цепочки и приватность транзакций](/privacy/oxt-1)

[Часть 2: Ключевые концепции анализа цепочки](/privacy/oxt-2)

[Часть 3: Защита от анализа цепочки](/privacy/oxt-3)

[Часть 4: Применение концепций анализа цепочки для улучшения приватности пользователей](/privacy/oxt-4)

{{< /details >}}