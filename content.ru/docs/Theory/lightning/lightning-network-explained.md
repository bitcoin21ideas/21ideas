---
title: "Механизм работы Lightning Network"
h1: "Механизм работы Lightning Network"
cover: /img/mln-850.jpeg
description: "Пояснение механизма работы Lightning Network."
url: mekhanizm-raboty-lightning
aliases: ['/theory-ln-lightning']
date: 2018-01-30
bookFlatSection: false
bookToc: true
weight: 6
---

{{< hint btc >}}
_Пояснение механизма работы Lightning Network подготовлено_ [_Дмитрием Лаптевым_](https://medium.com/@x0100)_._  Данная статья также доступна на [английском](https://medium.com/@x0100/lightning-network-45b4b2119d97).

[Поддержать проект](/contribute).
{{< /hint >}}

В части 0 посмотрим, зачем это надо. В части 1 обсудим поверхностно общую идею платежных каналов, Lightning Network и проблемы. В части 2 введем необходимые строительные блоки. В части 3 наконец-то опишем более строго детали работы платежного канала. В части 4 по-быстрому построим Lightning из платежных каналов, расскажем про критику и комиссии. В части 5 немного подытожим.

# 0. Зачем?

Блокчейн биткоина — это своего рода децентрализованная база данных, в которой сохраняются все транзакции сети. При этом “все транзакции” — это довольно фундаментальная часть определения протокола. Чтобы система была по-настоящему децентрализованной и чтобы при этом не допустить ни одной ошибки, нужно, чтобы тысячи узлов сети перепроверяли и сохраняли все транзакции.

Это, разумеется, совсем не способствует масштабируемости: блокчейн занимает десятки гигабайт на диске, блоки переполнены, комиссии растут, люди ругаются и форкают биткоин. Поэтому в данный момент активно разрабатываются альтернативные решения. Одним из таких решений являются _Lightning Network (далее LN)_.

# 1. Идея

Идея решений второго уровня _(second layer solutions)_, к которым и относится LN, звучит довольно просто.

{{< hint btc >}}
_Вместо того, чтобы записывать и верифицировать все транзакции на блокчейне, давайте будем проводить большую часть платежей вне сети (off-chain), а на главный блокчейн будем время от времени по желанию синхронизировать балансы и разрешать на нем конфликты. А работать это будет как всегда с помощью криптомагии._
{{< /hint >}}

Звучит интригующе, но совсем непонятно как…

## 1.1. Платежный канал

Начнем с того, как можно упростить жизнь двум людям, Алисе и Бобу, которые часто расплачиваются между собой. Предлагается следующая схема.

1. Алиса и Боб отправляют депозиты на адрес, который управляется ими совместно с помощью двух приватных ключей.
2. Каждый из них создает специальную транзакцию — смарт-контракт (да, в биткоине есть смарт-контракты, об этом в следующей части). Эта транзакция корректна, но пока не записывается в блокчейн.
3. Изначально транзакции содержат информацию о том, что Алиса и Боб могут забрать свои депозиты обратно.
4. Когда Алиса расплачивается с Бобом, они по обоюдному согласию обновляют информацию в этих транзакциях. Алиса соглашается получить меньше изначального депозита, Боб — больше. По сути эти транзакции представляют собой долговые обязательства (IOU, I owe you). Но в отличии от большинства банковских долговых обязательств, LN платежи 100% обеспечены и могут быть реализованы в любой момент.
5. Так они могут обмениваться небольшими суммами (в пределах их депозитов) друг с другом, хоть до бесконечности.
6. В какой-то момент любая сторона может решить рассчитаться окончательно. Тогда Алиса (или Боб) просто записывают одну финальную транзакцию в главный блокчейн и получают суммы депозитов с учетом всех промежуточных платежей.

Пункты 1–3 в этой схеме называются открытием платежного канала _(payment channel, канал микроплатежей)_. Пункты 4 и 5 — использованием канала. Пункт 6—закрытием платежного канала.

{{< hint btc >}}
_В блокчейн записывается всего две транзакции: перечисление депозитов для открытия канала и финальная транзакция (закрытие канала). Все промежуточные платежи осуществляются без синхронизации с блокчейном, поэтому проходят они бесплатно и мгновенно._
{{< /hint >}}

## 1.2. Сеть платежных каналов

Сами по себе платежные каналы между двумя людьми — вещь не особо полезная. В конце концов, с большинством людей мы не проводим частых регулярных транзакций. Но…

{{< hint btc >}}
_Когда платежные каналы выстраиваются в сеть, появляется возможность проводить платежи между любыми участниками, между которыми есть путь в графе этой сети (даже если они не связаны напрямую). Это и есть основная идея Lightning Network._
{{< /hint >}}

{{% image "/img/mln-851.png" %}}
_Так выглядел граф платежных каналов на момент 22.01.2018 ([https://lnmainnet.gaben.win](https://lnmainnet.gaben.win/))._
{{% /image %}}

В принципе, аналогично протоколу TCP, простому человеку достаточно иметь всего один открытый канал, чтобы проводить транзакции с кем угодно.

Конечно, нужно еще искать оптимальные пути между двумя людьми, и еще нужно как-то мотивировать участников обрабатывать чужие платежи. Но начнем с основной проблемы: с проблемы доверия.

## 1.3. Проблема доверия

Как часто бывает в криптографии, систему платежных каналов легко себе представить, если все стороны доверяют друг другу. Нет необходимости городить огород с депозитами, ключами, специальными транзакциями. Можно просто записывать, кто кому сколько должен.

Дело за малым: понять, как можно реализовать канал платежей и сеть этих каналов _без доверия_. Основных проблем будет три.

1. Оба депозита от Алисы и Боба хранятся на общем кошельке. Если Боб откажется подписывать транзакции, то как Алисе вернуть свой депозит?
2. В процессе расчетов создается много версий долговых обязательств. Предположим, что в основном Алиса платит Бобу. Тогда в финальной версии транзакции Боб получает больше своего депозита, а Алиса — меньше. Но Алиса может схитрить и самовольно записать в блокчейн самую первую валидную версию транзакции, как будто Боб никогда и не получал денег. Что тогда делать Бобу?
3. Если Алиса и Боб передают деньги по сети каналов через Витю, то как они могут убедиться, что Витя действительное передаст деньги, а не заберет их себе?

Назовем эти проблемы соответственно: _“проблема общего депозита”_, _“проблема последней транзакции”_ и _“проблема посредника”_.

Все перечисленные выше проблемы решаются с помощью буквально парочки трюков. Но обо всем по порядку: для начала введем несколько необходимых строительных блоков…

# 2. Смарт-контракты

Биткоин поддерживает простейший [язык смарт-контрактов _Script_](https://en.bitcoin.it/wiki/Script). В каждой биткоин-транзакции есть специальное поле, которое содержит скрипт на этом языке. Этот скрипт проверяет, при выполнении каких условий выход транзакции может быть потрачен.

_“Потратить выход транзакции A”_ — это на самом деле более технически корректный способ сказать “потратить деньги с адреса/кошелька K, на который они были зачислены с помощью транзакции A”.

{{< hint btc >}}
_В отличии, например, от эфириума, возможности смарт-контрактов биткоина намного более ограничены. Связано это с тем, что Script не является полным по Тьюрингу. Например, в нем нельзя использовать циклы/рекурсию и нельзя создавать переменные (отсутствует память)._
{{< /hint >}}

Про устройство транзакций и использование скриптов можно почитать в следующей статье:

{{% image "/img/mln-855.png" %}}
_[Bitcoin: transactions, malleability, SegWit and scaling](https://medium.com/lightningto-me/bitcoin-transactions-malleability-segwit-and-scaling-258af8ed9cbf)_
{{% /image %}}

Рассмотрим несколько важных операций этого языка.

## 2.1. Авторизация

Пожалуй, самая стандартная часть любой транзакции — это проверка подписи. Пусть транзакция A зачисляет средства на некий адрес K. Чтобы дальше потратить деньги с K, нужно доказать наличие ключа. За это отвечает операция OP_CheckSig.

Но при желании, можно также проверить что-нибудь дополнительное. Например, можно проверить, что у человека есть секретное число, хеш от которого равен заданному значению. Для этого нужно две операции: OP_SHA256 (считает хэш) и OP_EqualVerify (проверяет равенство). Зачем это нужно станет понятно в части 4.

## 2.2. Кооперация

Другой пример простейших смарт-контрактов на биткоине основан на операции OP_CheckMultiSig. Она позволяет тратить средства только при подписании несколькими определенными ключами.

На этом принципе построены так называемые multiple signature кошельки. Примерно как ячейка в банке, которая закрывается на два замка (один ключ у работника банка, второй — у клиента).

## 2.3. Сроки

С относительно недавних пор биткоин также поддерживает операцию OP_CheckSequenceVerify, которая позволяет тратить средства только через какое-то фиксированное количество блоков.

Например, это позволяет дисциплинировать людей, которые не умеют откладывать деньги. Блокчейн работает лучше любой копилки: если пользователь решил заморозить сбережения на какой-то срок, то они будут гарантировано заморожены.

Но помимо этого сценария, OP_CheckSequenceVerify и другие компоненты активно используются в реализации платежного канала.

# 3. Реализация канала

Теперь, когда все строительные блоки на месте, можно описать некоторые детали работы платежного канала.

На самом деле разновидностей платежных каналов [довольно много](https://en.bitcoin.it/wiki/Payment_channels), и первую из них предложил еще Сатоши. Я буду примерно ориентироваться на спецификацию, которая называется _Poon-Dryja payment channels_ (по имени главных авторов [статьи про Lightning Network](https://lightning.network/lightning-network-paper.pdf)).

## 3.1. Открытие канала

1. Алиса и Боб создают транзакцию/транзакции, которые зачисляют средства на общий адрес-депозит _O_. Предположим, что _X_ биткоинов зачисляется с кошелька Алисы и _Y_ — с кошелька Боба. Средства с общего депозита можно потратить только при подписании одновременно ключами Алисы и Боба (OP_CheckMultiSig).
2. Первый трюк заключается в том, что они пока НЕ подписывают и НЕ транслируют созданную транзакцию в блокчейн (иначе Боб может обмануть Алису и заморозить её средства навечно).
3. Вместо этого Алиса и Боб создают две новые транзакции возвращения депозитов (соответственно _A1_ и _B1_). Входом этих транзакций являются средства с общего депозита (выход транзакции _O_). Выходов у транзакций два: X уйдет обратно на адрес Алисе, _Y_ — Бобу. На самом деле все немного сложнее, но об это чуть позже.
4. Дальше Боб подписывает транзакцию _A1_ и передает её Алисе. Алиса подписывает транзакцию _B1_ и передает её Бобу.
5. Теперь транзакцию зачисления депозитов можно смело транслировать в блокчейн, никто никого не обманет. Если Боб откажется кооперировать, Алиса всегда сможет подписать транзакцию _A1_, записать её в блокчейн и вернуть свой депозит.

{{% image "/img/mln-852.png" %}}
_Транзакции возврата депозитов._
{{% /image %}}

Теперь “проблема общего депозита” решена. Открытие канала можно провести без доверия второй стороне.

{{< hint btc >}}
_Интересный факт. Еще полгода назад (до внедрения SegWit) подписание выхода неподтвержденной транзакции (пункт 4) провернуть было намного сложнее из-за проблемы пластичности транзакций (transaction malleability)._
{{< /hint >}}

## 3.2. Использование канала

Платежи внутри канала на самом деле осуществляются переписыванием транзакций _A1_ и _B1_ на новые транзакции.

1. Алиса платит Бобу за кружку кофе, которая стоит _C_.
2. При этом Алиса соглашается, что при закрытии канала она заберет не изначальную сумму _X_, а _X’=(X-C)_.
3. Боб при этом получит _Y’=(Y+C)_.

Соответственно, новые транзакции A2 и B2 будут выглядеть точно также, как _A1_ и _B1_, но с новыми суммами. Любая из сторон может в любой момент закрыть канал, записав последнюю версию транзакции в блокчейн.

Как убедиться, что Алиса не запишет в блокчейн транзакцию A1 вместо транзакции A2? Для этого есть еще один трюк.

1. Каждый раз, когда Алиса и Боб создают новые транзакции, они выбирают _одноразовый приватный ключ_, который нужен, чтобы забрать депозит (OP_CheckSig).
2. При каждом очередном платеже _i_, Алиса показывает Бобу предыдущий приватный ключ _AK(i-1)_, и создает новый ключ AKi для новой транзакции. Боб не принимает оплату без предыдущего ключа.
3. Если Боб знает ключ, то он может потратить все деньги Алисы. Но только в случае, если Алиса решит записать неправильную транзакцию в блокчейн.
4. Таким образом, Алиса всегда заинтересована в том, чтобы записывать в блокчейн только самую последнюю транзакцию.

_Последняя маленькая модификация_. Для того, чтобы у Боба была возможность оспорить транзакцию Алисы и предоставить её ключ, Бобу нужно время. Поэтому Алиса будет получать свой депозит не сразу, а через какое-то количество блоков T (OP_CheckSequenceVerify). Например, через 48 блоков, то есть примерно 8 часов.

{{% image "/img/mln-853.png" %}}
_Финальный вид транзакций, используемых для платежного канала._
{{% /image %}}

Если Алиса подписывает одну из своих транзакций (они уже подписаны Бобом), и транслирует эту транзакцию в блокчейн, то возможны два сценария.

1. Алиса транслирует финальную транзакцию => Боб не знает последнего ключа Алисы _AKi_. Это корректное закрытие канала, все должны получить свои деньги. Алиса получит их через какое-то время.
2. Алиса пытается записать старую транзакцию вместо финальной => Алиса пытается обмануть Боба. В этом случае Боб знает ключ Алисы и он может воспользоваться им, чтобы получить все средства Алисы. Разумеется, Алиса не заинтересована в этом сценарии.

Итак, _“проблема последней транзакции”_ тоже решена и платежный канал между двумя людьми готов. Теперь также становятся очевидны некоторые плюсы и минусы.

{{< hint btc >}}
_Преимущества: 1. платежи внутри канала мгновенны и бесплатны, они не создают нагрузки на главный блокчейн. 2. стороны не обязаны доверять друг другу._
{{< /hint >}}

{{< hint btc >}}
_Недостатки: 1. депозиты заблокированы на все время существования канала. 2. обе стороны должны периодически появляться онлайн (как минимум раз в T)._
{{< /hint >}}

👌 На самом деле оба недостатка важны для платежных каналов между двумя людьми, но не очень важны в контексте Lightning Network. Первый недостаток перестает быть недостатком, если один платежный канал может быть использован для транзакций с разными людьми.

Второй недостаток отсутствует в LN, так как проверку корректности может совершать любой участник сети (если Вася вскроет мошенничество Алисы, то он разделит с Бобом конфискованные средства Алисы).

# 4. Lightning Network

## 4.1. Платежный канал через посредника

Предположим теперь, что Алиса и Боб не имеют открытого канала между собой, но они оба поддерживают открытый канал с Витей. Алиса может безопасно передать деньги Вите, Витя может безопасно передать деньги Бобу.

Но как убедиться, что Витя, получив деньги, действительно передаст их дальше Бобу?

На самом деле идея немного похожа на предыдущий трюк, только вместо одноразовых ключей используется некоторое секретное число.

1. Боб генерирует секретное число _S_, хэш от этого секретного ключа _HS_ и передает эту информацию Алисе. _HS_ при этом может использоваться как виртуальный чек.
2. Алиса создает транзакцию _AV_, которая передает деньги Вите, но только в случае, если Витя предоставит секретное число _S_. Для этого она использует скрипт, который проверяет равенство хэша предоставленного числа и значения _HS_ (тут как раз и используются операции OP_SHA256 и OP_EqualVerify).
3. Витя создает аналогичную транзакцию VB, которая передает деньги Бобу, но только в случае, если Боб предоставит секретное число.
4. Боб видит, что он может получить деньги от Вити, и показывает ему секретное число _S_.
5. Витя теперь может доказать, что он передал деньги Бобу, и соответственно он может обналичить транзакцию _AV_.

Тут есть несколько вариантов развития событий.

1. Во-первых, Вите не имеет смысла обманывать Алису. Он не может не передать деньги Бобу, потому что иначе Витя все равно не получит деньги от Алисы.
2. Но Боб может решит обмануть Витю и не передать ему секретное число. При этом он может закрыть канал с Витей и записать транзакцию VB в блокчейн. Но для вывода денег ему все равно придется показать свое секретное число, и тут-то Витя его и узнает.

Тут есть пара нетривиальных нюансов с тем, как выбрать время, в течении которого Алиса, Боб и Витя могут разрешить конфликты. Но эти более технические подробности выходят за рамки этой вводной статьи. Если интересно — гуглите _Hash Time-Locked Contracts (HTLCs)_.

## 4.2. Маршрутизация

На практике Алиса и Боб могут быть связаны между собой не через одного общего знакомого Витю, а через несколько неизвестных/анонимных посредников по всему миру. Проблема поиска пути в графе узлов сети называется _проблемой маршрутизации_.

{{% image "/img/mln-854.png" %}}
_Географическое распределение узлов тестовой сети (_[_https://explorer.acinq.co/#/_](https://explorer.acinq.co/#/)_)._
{{% /image %}}

Вопрос маршрутизации на самом деле является областью активных исследований на данный момент. Оптимальный путь в графе зависит от многих динамических факторов: наличия узлов, топологии сети, пропускной способности каналов, комиссии промежуточных узлов.

Не вдаваясь в подробности, поиск пути и передача платежей в LN реализуется на основе [_Onion routing_](https://ru.wikipedia.org/wiki/%D0%9B%D1%83%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F_%D0%BC%D0%B0%D1%80%D1%88%D1%80%D1%83%D1%82%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) — технологии анонимного распространения информации по peer-to-peer сетям. Именно так, например, работает [Tor](https://www.torproject.org/).

Все децентрализовано, весь трафик зашифрован. Никто не знает, от кого пришли деньги и кому они пойдут дальше. Отсюда еще одно преимущество.

{{< hint btc >}}
_Преимущества: Lightning Network намного более анонимна, чем сам биткоин. Во-первых, промежуточные транзакции не записываются в публичный блокчейн, их видит всего несколько участников. Во-вторых, даже среди этих участников, только первый и последний человек точно знают, от кого и кому переводятся средства._
{{< /hint >}}

## 4.3. Экономика комиссий

Остается два очевидных вопроса.

**Вопрос номер 1:** зачем посредникам обрабатывать чужие платежи?

Во-первых, потому что им самим так проще пользоваться LN. Во-вторых, потому что они получают с этого очень маленькую, но все-таки комиссию.

На данный момент сеть поддерживают в основном энтузиасты и комиссия практически нулевая: 1 сатоши, или ~0.01 _цента_ за каждого посредника.

{{< hint btc >}}
_Пропускная способность каналов — намного менее ценный ресурс, чем размер блока. Каналы открывать просто и недорого. Поэтому комиссии в LN на порядки ниже комиссий в основном блокчейне._
{{< /hint >}}

**Вопрос номер 2:** а как же комиссия за открытие/закрытие канала?

Действительно, эта комиссия может иногда составлять десятки долларов. Таким образом, платежи будут тем выгоднее, чем реже придется открывать/закрывать каналы.

Это мотивирует людей открывать каналы с бóльшими депозитами, и использовать каналы в двух направлениях: не только для исходящих платежей, но и для получения средств.

_Пример:_ я открываю канал, зачисляю туда 1000 долларов, и использую канал только для исходящих платежей. Оборот в канале составит 1000 долларов, примерно 20 долларов уйдет на открытие и закрытие канала. То есть суммарно комиссии составят 2%. Немного лучше, чем виза и мастеркард, но явно больше, чем хотелось бы.

Ситуация кардинально меняется, когда я начинаю использовать Lightning на всю катушку: вкладывать большие суммы и получать деньги через каналы, а не только тратить их. Тогда, в зависимости от пропорции полученных/потраченных денег, _канал может быть открыт вечно и комиссии в пределе будут стремиться к нулю._

## 4.4. Критика

В интернете можно найти большое количество критики решений второго уровня в целом и Lightning Network в частности. Какие-то пункты действительно заслуживают внимания, многие оказываются устаревшими. Приведем несколько примеров.

> _1. Использование LN приведет к централизации: пользователям будет выгодно подключаться к крупным хабам и эти хабы будут контролировать весь трафик._

Такой риск есть и стоит уделять этому внимание, но риск не очень велик. Во-первых, экономически выгодно и очень просто будет создать новый узел в обход больших хабов. Во-вторых, алгоритмы маршрутизации предусматривают балансировку трафика. В-третьих, пока что такой картины [не наблюдается](https://lnmainnet.gaben.win/). В будущем, я надеюсь, топология сети будет оптимально выстраиваться алгоритмически.

> _2. Недостаточная пропускная способность каналов приведет к тому, что LN будет забита, комиссии будут расти, и вскоре ситуация будет такой же, как и в основном блокчейне._

Опять же, как только такое начнет происходить, у людей появится большая экономическая мотивация запускать свои узлы. В отличии от размера блока, количество узлов практически неограниченно.]

> _3. Эффективная маршрутизация на большом количестве peer-to-peer узлов невозможна. Особенно с учетом сложности открытия новых каналов._

До этих проблем еще очень и очень и очень далеко, а исследования в этом направлении активно ведутся уже сейчас. Что-нибудь придумают.

> _4. Каналы нужно постоянно открывать и закрывать, комиссии, потраченные на это, будут огромны и LN окажется невыгодной._

На самом деле это проблема из прошлого, про которую почему-то до сих пор говорят. Ранние версии платежных каналов действительно были однонаправленными, а сам канал мог существовать только ограниченное время. Сейчас эти проблемы решены.

> _5. Для использования LN необходимо быть онлайн._

Опять же, в отличии от ранних реализаций LN, пользователю нет необходимости все время быть онлайн: другие узлы сети проверяют, что два владельца канала не пытаются обмануть друг друга. Действительно необходимо быть онлайн только для отправки и получения платежей, что безусловно является ограничением, но уже намного менее важным.

> _6. LN не совместимо с холодными хранилищами (cold storage)._

Очень правильно замечание. Депозиты платежных каналов храняться в кошельке подключенном к интернету _(hot wallet)_. Для защиты от хакеров необходимо будет очень серьезно подходить к безопасности.

> _7. LN платежи — это не безопасно._

LN платежи действительно чуть более опасны, чем платежи на основном блокчейне. Но только в одном случае: [при успешной 51% атаке на блокчейн биткоина](https://blog.bitmex.com/the-lightning-network/). Риск этого ничтожно мал.

# 5. LN сегодня

Самое важное, что вам нужно знать: Lightning уже реально работает.

[Более тысячи узлов](https://explorer.acinq.co/#/) в тестовой сети биткоина и [более двухсот узлов](https://lnmainnet.gaben.win/) (число растет каждый день) в основной сети (mainnet) уже обрабатывают платежи и тестируют различный софт.

{{< tweet user="starkness" id="953434418948927488" >}}

_Соонователь Lightning Labs пока не рекомендует поднимать узлы на мейннете._

Что касается софта, то есть три основных реализации: [lnd](https://github.com/lightningnetwork/lnd) от Lightning Labs, [c-lightning](https://github.com/ElementsProject/lightning) от Blockstream, [eclair](https://github.com/ACINQ/eclair) от ACINQ. Эти команды уже не один год работали совместно, чтобы разработать общий стандарт взаимодействия узлов: [_Lightning Network Specifications (BOLTs)_](https://github.com/lightningnetwork/lightning-rfc). И вот буквально в конце 2017-ого года они провели полномасштабное успешное тестирование протокола платежей, все три реализации оказались совместимы.

Расплатиться реальными биткоинами используя LN можно пока буквально в трех-четырех онлайн-магазинах. Но это на целых три-четыре магазина больше, чем всего месяц назад, так что это уже большой успех 😊

Конечно, момент повсеместного перехода с on-chain биткоин платежей на off-chain платежи еще далеко. Огромную работу еще должны провести разработчики кошельков, платежных шлюзов, бирж, онлайн-магазинов. И, конечно, сами пользователи.

Самое интересное в этой истории, что более быстрые, анонимные и дешевые платежи — это только начало! На подходе еще больше анонимности, атомарные свопы, распределенные биржи и многое-многое другое. Будущее выглядит захватывающе! ⚡

Больше подробностей про LN по ссылкам: [1](https://lightning.network/lightning-network-paper.pdf), [2](https://github.com/bitcoin/bips/blob/master/bip-0112.mediawiki), [3](https://github.com/lightningnetwork/lightning-rfc), [4](https://github.com/ElementsProject/lightning/blob/master/doc/deployable-lightning.pdf), [5](https://blog.bitmex.com/the-lightning-network/).

---

Комментируйте, критикуйте, задавайте вопросы, подписывайтесь! Авторский мини-канал про крипту в телеграме: [https://t.me/cryptohodl](https://t.me/cryptohodl). Больше об авторе: [http://laptev.ch](http://laptev.ch/). По вопросам использования материала пишите на d@laptev.ch