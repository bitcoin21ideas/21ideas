---
title: "Временны́е метки в Биткоине"
h1: "Временны́е метки в Биткоине"
cover: /img/timestamps/timestamps-cover.png
description: "Зачем нужны временны́е метки в Биткоине? Как временны́е метки некоторых дочерних блоков меньше меток, им предшествующих. Разбираемся в этой статье."
url: timestamps
date: 2024-11-27
bookFlatSection: false
bookToc: true
weight: 71
---

Некоторые пытливые умы замечают и интересуются относительно редким, но случающимся явлением в блокчейне Биткоина: временны́е метки некоторых дочерних блоков меньше меток, им предшествующих. Звучит сложно? Вот пример: временная метка блока 843881 указывает 17 мая 2024 года, 19:01:39, в то время как метка предшестувющего блока 8433880 говорит, что он был добавлен в блокчейн в тот же день, но минутой позже – в 19:02:09. Ещё более ярким примером этого явления является цепочка блоков с 145045 по 145049.

{{< hint btc >}}
Материал подготовлен [Тони⚡️](https://njump.me/npub10awzknjg5r5lajnr53438ndcyjylgqsrnrtq5grs495v42qc6awsj45ys7). Особая благодарность [Alex](https://linktr.ee/bitraction) за редактуру и помощь в структурировании статьи.
{{< /hint >}}

{{% image src="/img/timestamps/timestamp.png" %}}
_Блок 843880 был добавлен в блокчейн раньше блока 843881, хотя его временнáя метка указывает, будто он был намайнен позже._
{{% /image %}}


Как же блок, добавленный раньше, может значиться в цепочке позже? Давайте разбираться.

## Зачем нужны временны́е метки?

Несмотря на логичное на первый взгляд предположение многих новичков, цель временны́х меток не заключается в упорядочивании блоков в цепочке. Временны́е метки блоков помогают системе противостоять потенциальным враждебным манипуляциям с блокчейном. 

Более того, временны́е метки блоков обеспечивают бесперебойность добавления новых блоков и, соответственно, корректность появления новых биткоинов на свет. Уровень сложности Proof-of-Work[^1] автоматически регулируется на основе времени, затраченного на создание предыдущих блоков, чтобы новые блоки генерировались примерно каждые 10 минут. 

{{< hint info >}}
Майнеры помещают текущее время в заголовок блока при создании кандидата блока. Заголовок содержит Unix-время (число секунд с 1 января 1970), которое компьютерные программы обычно используют для хранения конкретных временны́х точек.

Например, временная метка `генезис` блока – 1231006505, что соответствует третьему января 2009 года, 18:15:05 UTC.
{{< /hint >}}

{{% image src="/img/timestamps/2016bloks-time.png" %}}
_Если блоки майнятся быстрее запланированного графика, сложность увеличивается, если медленнее целевого значения, – уменьшается._
{{% /image %}}

Временны́е метки в заголовках блоков используются, чтобы определить, с какой скоростью блоки добываются в текущем периоде длиной в 2016 блоков. В зависимости от результатов целевой показатель корректируется таким образом, чтобы новые блоки появлялись примерно каждые 10 минут.

{{< hint info >}}
Подробнее с этой темой можно ознакомиться в статье “[О корректировке сложности майнинга](/difficulty/)”.  
{{< /hint >}}

## Откуда Биткоин знает который сейчас час?

Каждый узел ведёт собственный учёт времени, делая таким образом вклад в определение времени сети. Время сети основано на медианном[^3] времени между всеми подключёнными узлами. Узлы обмениваются информацией о текущем времени в так называемом сообщении версии[^4] во время первого соединения друг с другом. 

{{< image src="/img/timestamps/median.png" />}}

Проще говоря, когда вы запускаете полный узел Биткоина, вы связываетесь с несколькими узлами, спрашиваете у них “который час?”, высчитываете из полученных ответов медианное значение погрешности (смещение), прибавляете его к своему локальному времени и используете результат в качестве времени сети Биткоин.

{{< hint info >}}
Важно уточнить, что предел разницы между сетевым и локальным временем установлен на отметке в 70 минут.[^5] Если сетевое время сильно отличается от локального, узел указывает локальное время.
{{< /hint >}}

## Насколько точны Биткоин-часы?

Будучи децентрализованной системой, Биткоин вынужден предоставлять некоторое пространство для манёвра: системное время узлов может отличаться по целому ряду причин – от багов до влияния повышенных температур и воздействия электромагнитного излучения. Для определения времени большинство современных устройств полагается на протокол [NTP](https://ru.wikipedia.org/wiki/NTP), но и здесь могут возникнуть проблемы настройки или другие сложности, которые могут повлиять на конечный результат.

{{< image src="/img/001.jpeg" />}}

{{< hint info >}}
Рекомендуем к прочтению работу GiGi “[Биткоин – это время](/21-sposob/glava-2-bitcoin-eto-vremya/)”.
{{< /hint >}}

## Решение Сатоши

В связи с вышесказанным Сатоши пришёл к незамысловатому решению, призванному решить потенциальные проблемы, которые могли бы возникнуть в случае слишком жёсткого подхода к определению времени узлов сети.

Чтобы узлы считали время в заголовке блока действительным, оно должно соответствовать двум условиям:

1. Не более чем на 2 часа опережать скорректированное сетевое время вашего узла.
2. Превышать медианную временную метку последних 11 блоков.

{{< image src="/img/timestamps/timeframes.png" />}}

Для менее технически подкованных читателей поясню:

__Первый пункт__ означает, что если ваш узел получает блок с временнóй меткой в заголовке, которая опережает скорректированное сетевое время более чем на два часа (то есть медианное системное время узлов, к которым вы подключены), этот блок будет отвергнут как недействительный. 

_Проще говоря_, если на ваших часах сейчас 7 утра, а в блоке указано время 9:01 или позже, такой блок считается недействительным и не будет принят или передан дальше по сети.

> По сути, правило "не больше чем на два часа вперёд" является тем, что делает временны́е метки в блоках фактическими (приблизительными) временны́ми метками. Это то, что привносит реальное время в цепь.
> 
> – Питер Вюлле в [ответе на bitcoin.stackexchange](https://bitcoin.stackexchange.com/questions/121248/why-isnt-the-upper-bound-2h-on-the-block-timestamp-set-as-a-consensus-rule/121249#121249).

__Второй пункт__ гарантирует, что блоки не могут иметь временную метку значительно раньше текущего времени, что предотвращает манипуляции со стороны майнеров. Если временная метка блока не превышает медианную временную метку последних 11 блоков, блок будет отклонён. 

_Иными словами_, время в блоке должно быть позже медианного времени последних 11 принятых блоков, чтобы считаться действительным.

{{< hint info >}}
Нет математического обоснования для диапазона, который находится между медианным временем предыдущих 11 блоков и допущенными двумя часами в будущем. Это "достаточно хорошие" значения, которые выбрал Сатоши, когда он программировал первую версию Биткоина, и мы по-прежнему используем их сегодня.
{{< /hint >}}

## Биткоин – распределённые часы

Таким образом мы вынужденны прибегать к замысловатому решению привязки блокчейна Биткоина к тому, что мы называем реальным временем. Это приводит к возникновению артефактов в виде несовпадения временны́х меток порядку блоков в блокчейне, но обеспечивает бесперебойное и безопасное функционирование Биткоина. 

<div class="tenor-gif-embed" data-postid="14603491" data-share-method="host" data-aspect-ratio="2.48062" data-width="100%"><a href="https://tenor.com/view/whoa-deja-vu-matrix-glitch-black-cat-glitch-in-the-matrix-keeanu-reeves-gif-14603491">Whoa Deja Vu Matrix Glitch GIF</a>from <a href="https://tenor.com/search/whoa+deja+vu+matrix-gifs">Whoa Deja Vu Matrix GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>

Медианное сетевое время майнера в Техасе может на несколько минут опережать сетевое время майнера в провинции Сычуань, и если техасский майнер найдёт блок поверх блока китайского майнера спустя минуту-другую, мы увидим ситуацию с временны́ми метками, похожую на описанную в начале статьи. Это не ломает ничего, кроме, возможно, мозга новичка, не знакомого с особенностями работы децентрализованных систем. 

Система работает как задумано, а этот необычный пример течения времени в децентрализованных системах отправляется в копилку знаний библиотеки 21 идея.

### Дискуссии и полезные материалы:

- [Временны́е метки на Bitcoin Wiki](https://en.bitcoin.it/wiki/Block_timestamp).

- [Раздел “Время” на сайте Learn me a bitcoin](https://learnmeabitcoin.com/technical/block/time/).

- [Почему временны́е метки в блокчейне не всегда увеличиваются?](https://bitcoin.stackexchange.com/questions/915/why-dont-the-timestamps-in-the-block-chain-always-increase) 

- [Как точно вычисляется временнáя метка для правила принятия “не позже двух часов”?](https://bitcoin.stackexchange.com/questions/121247/how-exactly-is-the-timestamp-calculated-for-the-2h-acceptance-rule-and-do-i-hav?noredirect=1&lq=1).

- [Вызовет ли серия реорганизаций сбой в Биткоине из-за ограничения на 2-часовую разницу во времени блока?](https://bitcoin.stackexchange.com/questions/119677/would-a-series-of-reorgs-cause-bitcoin-to-break-because-of-the-2-hour-block-time/119680#119680). 

- [Двухчасовое ограничение – это правило консенсуса?](https://bitcoin.stackexchange.com/questions/121248/why-isnt-the-upper-bound-2h-on-the-block-timestamp-set-as-a-consensus-rule/121249#121249).

[^1]: [Proof of Work: доказательство проделанной работы](https://21ideas.org/proof-of-work/)

[^2]: Медиана — это значение, которое делит упорядоченный ряд данных пополам, оставляя одинаковое количество элементов слева и справа, тогда как среднее (арифметическое) — это сумма всех значений, делённая на их количество. Медиана лучше отражает центральную тенденцию, если данные имеют выбросы или сильно несимметричны.

[^3]: https://en.bitcoin.it/wiki/Protocol_documentation#version 

[^4]: https://github.com/bitcoin/bitcoin/blob/v26.0/src/timedata.h#L16 