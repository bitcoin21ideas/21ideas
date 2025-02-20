---
author: "Atlas21"
date: 2025-02-11
list_description: "Обзор устройств для домашнего майнинга: спецификации, энергопотребление, цена и практическая ценность."
menu:
 main:
   parent: blog
next: /blog/
prev: /posts/blocksize
title: "Домашний майнинг: биткоин-лотерея"
h1: "Домашний майнинг: биткоин-лотерея"
cover: /img/blog/home-mining/solo-cover.jpg
description: "Обзор устройств для домашнего майнинга: спецификации, энергопотребление, цена и практическая ценность."
bookToc: true
weight: 10
---

_Обзор устройств для домашнего майнинга: спецификации, энергопотребление, цена и практическая ценность._

{{< hint btc >}}
Перевод [статьи](https://atlas21.com/home-mining-the-bitcoin-lottery/), опубликованной на страницах издания Atlas21, подготовлен [Тони⚡️](https://njump.me/npub10awzknjg5r5lajnr53438ndcyjylgqsrnrtq5grs495v42qc6awsj45ys7).

[Поддержать проект](/contribute/)
{{< /hint >}}

В последние годы домашний биткоин-майнинг вызывает всё больший интерес среди энтузиастов. С его помощью пользователи могут участвовать в глобальной гонке за добавление нового блока в блокчейн Биткоина прямо из дома, используя специальное оборудование. В этом обзоре мы сравним основные устройства (также называемые ”Bitcoin Lottery Miners”), доступные на рынке, и рассмотрим их характеристики, преимущества, ограничения и роль в экосистеме Биткоина.

## Хобби или нечто большее?

Домашний майнинг изначально воспринимался как хобби или образовательный проект, который давал пользователям возможность ближе познакомиться с процессом биткоин-майнинга. Хотя подобные устройства не могут конкурировать с мощными промышленными фермами, доминирующими в сети, их ценность заключается в другом: активное участие, пусть даже в небольших масштабах, и шанс испытать удачу в соло-майнинге.

Соло-майнинг предполагает, что отдельный майнер пытается найти блок самостоятельно и получить всю награду целиком, а не работать в пуле и делить вознаграждение с другими участниками. Однако шансы на успех в соло-майнинге крайне малы, поэтому его часто сравнивают с лотереей. Альтернативой является майнинг в пуле, когда мощности объединяются, что увеличивает вероятность нахождения блока, но вознаграждение делится между всеми участниками пропорционально их вкладу.

{{< image "/img/blog/home-mining/bitaxe-farm.jpg" />}}

Многие домашние устройства используют открытый исходный код, что делает их отличным выбором для изучения и модификации. Их модульная архитектура позволяет легко адаптировать оборудование и расширять его функциональность.

## Соло-майнинг в пуле или с собственным узлом? В чём разница?

В соло-майнинге через пул майнер участвует в организованной структуре, где система распределяет попытки нахождения блока между участниками, повышая эффективность. Этот подход требует меньше технических знаний, но ограничивает контроль пользователя, так как операции координируются пулом.

Преимущество такого метода заключается в том, что майнер использует стандартный протокол без необходимости скачивать всю историю транзакций ([timechain](https://21ideas.org/glossary/#таймчейн-timechain)), как это делают держатели полных узлов. Специальные пулы для соло-майнинга распределяют задачи между участниками, чтобы те не дублировали вычисления друг друга.

В сравнении с методом, описанным выше, соло-майнинг с использованием собственного узла – более независимый подход к биткоин-майнингу. В этом случае майнер полностью управляет процессом:

- Содержит свою копию блокчейна;

- Самостоятельно выбирает транзакции для включения в блок;

- Влияет на децентрализацию сети.

Хотя оба варианта дают возможность получить полное вознаграждение за блок (за вычетом комиссии пула в первом случае), они различаются по уровню контроля, техническим требованиям и ценности вклада в экосистему Биткоина. Соло-майнинг через пул проще и доступнее для новичков, тогда как майнинг с собственным узлом требует углубленных знаний, но предоставляет более полноценный и автономный опыт.

## NerdMiner: знакомимся с майнингом

{{< image "/img/blog/home-mining/nerd.jpg" />}}

Проект NerdMiner появился благодаря _Han Solo Miner_, [прототипу](https://github.com/valerio-vaccaro/HAN), созданному разработчиком Valerio Vaccaro в образовательных целях. Устройство было разработано для того, чтобы связать абстрактную концепцию майнинга с физическим объектом. Вдохновившись этим прототипом, разработчик [BitMaker](https://x.com/BitMaker_) создал NerdMiner – более удобную и интуитивно понятную версию с улучшенным интерфейсом.

[NerdMiner](https://github.com/BitMaker-hub/NerdMiner_v2) – одно из самых доступных решений для ознакомления с домашним майнингом. Изначально созданный как образовательный проект, он проложил путь к более широкому распространению майнинга среди энтузиастов. Устройство спроектировано таким образом, чтобы максимально упростить знакомство с техническими аспектами биткоин-майнинга.

### Основные характеристики:

- __Технические параметры:__ NerdMiner достигает хэшрейта 50-80 килохэшей в секунду. Этого недостаточно для нахождения блоков, но устройство идеально подходит для обучения и экспериментов. На дисплее отображаются время, цена биткоина, высота блока, хэшрейт и комиссии за транзакции. Устройство имеет два кнопочных элемента управления и порт USB-C для питания. Это единственное устройство с открытым исходным кодом, позволяющее модифицировать реализацию SHA256, оптимизировать её или тестировать альтернативные алгоритмы.

- __Энергопотребление:__ NerdMiner потребляет всего 1 ватт, что весьма оправданно для информативного биткоин-дисплея и интерактивного инструмента для обучения.

- __Цена:__ Стоимость варьируется от 20 до 50 евро, что делает устройство идеальным вариантом для новичков, не готовых раскошеливаться.

- __Гибкость:__ Благодаря открытому коду, можно изменять и модифицировать как программное, так и аппаратное обеспечение. Устройство поддерживает соло-майнинг в пуле и подключение к пулам через протокол [Stratum V2](https://atlas21.com/stratum-v2-is-born-the-first-open-source-version-is-online/).

## Bitaxe: больше мощности и возможностей для кастомизации

{{< image "/img/blog/home-mining/bitaxe.jpg" />}}


[Bitaxe](https://bitaxe.org/) – это более продвинутая альтернатива NerdMiner, обеспечивающая лучшую производительность, сохраняя исходный код открытым. Устройство разработал [Scott9000](https://x.com/skot9000). Оно оснащено ASIC-чипом, изначально предназначенным для Antminer, встроенным в кастомную плату и охлаждаемым небольшим вентилятором. Проект следует open-source-философии, как в программном, так и в аппаратном обеспечении, за исключением ASIC-чипа, который остаётся проприетарной технологией.

### Основные характеристики:

- __Технические параметры:__

 - Bitaxe Supra с чипом BM1368 (используется в Antminer S21) достигает 700 гигахэшей в секунду.

 - Bitaxe Gamma с чипом BM1370 (из Antminer S21 Pro) достигает 1,2 терахэша в секунду.

- __Энергопотребление:__ Устройства Bitaxe потребляют в среднем 12-24 ватта, оставаясь энергоэффективными для домашнего майнинга.

- __Цена:__ Стоимость варьируется от 100 до 200 евро в зависимости от конфигурации, что делает устройство промежуточным вариантом между NerdMiner и полноценными ASIC-майнерами.

- __Гибкость:__ Bitaxe создан для сборки и адаптации под индивидуальные нужды. Поддерживает майнинг в пуле и соло-майнинг (тоже через пул), предлагая бóльшую вариативность, чем NerdMiner. Подключение устройства к пулам Braiins или Ocean позволяет получать выплаты напрямую на [лайтнинг-адрес](/lajtning-adresa/).

## Braiins Mini Miner (BMM 101): запуск в 1 клик

{{< image "/img/blog/home-mining/braiins.png" />}}

[Braiins Mini Miner](https://braiins.com/hardware/mini-miner-bmm-101) – это компактное и удобное устройство, поддерживающее протокол Stratum V2, который повышает безопасность и оптимизирует взаимодействие с пулами. Устройство оснащено 3,5-дюймовым IPS-дисплеем, на плате расположены 4 ASIC-чипа, 4 ГБ встроенной памяти, 2 ГБ ОЗУ, а также модуль Wi-Fi и слот для microSD.

### Основные характеристики:

- __Хэшрейт:__ Достигает 1 терахэша в секунду.

- __Энергопотребление:__ Около 40 ватт, но может достигать 80 ватт при разгоне (overclock). Стоимость потребляемого электричества составляет примерно $5 в месяц при цене $0,17 за кВт⋅ч.

- __Цена:__ BMM стоит $299, что делает его относительно дорогим домашним майнером.

- __Преимущества:__ Простота использования и низкий уровень шума делают BMM 101 отличным вариантом для тех, кто ищет готовое к работе решение.

Подключение устройства к пулу Braiins позволяет получать выплаты в сети Лайтнинг через стандартный инвойс или на лайтнинг-адрес. Braiins Mini Miner – первое оборудование с интегрированной поддержкой Stratum V2.

## FutureBit Apollo II (Full Node): майнер и полный узел в одном

{{< image "/img/blog/home-mining/apollo.png" />}}

[FutureBit Apollo II](https://www.futurebit.io/home) – самое продвинутое устройство в нашем списке, поскольку оно объединяет майнинг-устройство и полный биткоин-узел в одном корпусе. Оно оснащено 2 ТБ NVMe-диском, 4 ГБ ОЗУ, двумя USB 3.0 портами, Ethernet, а также аудио- и HDMI-выходами.

### Основные характеристики:

- __Технические параметры:__ Использует 5-нм ASIC-чипы, позволяющие достигать до 10 терахэшей в секунду. Может работать как полноценный биткоин-узел, храня полную копию блокчейна.

- __Энергопотребление:__ Зависит от режима работы – от 175 до 375 ватт, что делает его дорогим в эксплуатации по сравнению с другими устройствами.

- __Цена:__ Высокая стоимость ($1099) оправдана интеграцией полного узла и майнинг-чипов.

- __Преимущества:__ Идеальный выбор для тех, кто хочет полный контроль над инфраструктурой (и расстаться со своими сатошиками).

FutureBit Apollo II поддерживает соло-майнинг и майнинг в пуле. В соло-режиме пользователь сам выбирает транзакции, которые попадут в блок. Если выбран соло-майнинг, необходимо дождаться полной синхронизации узла с сетью Биткоина, прежде чем начать добычу блоков.

## Можно ли зарабатывать на домашнем майнинге?

__Нет.__ Домашний майнинг в целом не является прибыльным, а скорее служит способом изучения технологии и возможностью принять участие в развитии сети.

Домашний майнер может выбрать один из двух вариантов:

- Майнинг в пуле – гарантирует небольшой, но стабильный доход, порядка нескольких сатоши в день.

- Соло-майнинг – вероятность получения награды крайне мала, но, тем не менее, соло-майнинг привлекает энтузиастов в поисках удачи.

Стоит учитывать, что хэшрейт всей сети со временем продолжит расти, тогда как производительность устройств останется прежней.

### Каковы шансы найти блок?

• __NerdMiner:__ шанс найти блок 1 раз в 190 миллиардов лет.

• __Bitaxe:__ от раза в 40 000 лет до раза в 12 000 лет в зависимости от модели.

• __FutureBit Apollo II:__ шанс 1 раз в 1 500 лет.

Однако маловероятное иногда случается: 25 июля 2024 года один из пользователей нашёл [блок](https://t.me/bitcoin21ideas/3303), используя Bitaxe Ultra.

Для большинства пользователей домашний майнинг – это скорее технологическое хобби, чем способ заработать. Он похож на покупку лотерейного билета: маловероятно, что он принесёт прибыль, но это увлекательный способ изучить Биткоин.
