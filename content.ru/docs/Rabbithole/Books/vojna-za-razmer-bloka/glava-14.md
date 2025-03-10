---
title: "Глава 14: ASICBoost"
h1: "Глава 14: ASICBoost"
cover: /img/vrb-446.jpeg
description: "В среду, 5 апреля 2017 года, случилась очередная сенсация, на сей раз из лагеря малых блоков. Это было электронное письмо Грегори Максвелла, адресованное списку рассылки биткоин-разработчиков."
url: vojna-za-razmer-bloka/glava-14
aliases: ['/book-the-blocksize-war-chapter-14']
date: 2021-03-11
bookFlatSection: false
weight: 14
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

{{< youtube F9D2x1aqP8I >}}
_Помимо YouTube с аудиокнигой можно ознакомиться на популярных подкаст-площадках: [https://www.21ideas.org/audio-audiobooks/](https://www.21ideas.org/audio-audiobooks/)_
{{< /youtube >}}

В среду, 5 апреля 2017 года, случилась очередная сенсация, на сей раз из лагеря малых блоков. Это было электронное письмо Грегори Максвелла, адресованное списку рассылки биткоин-разработчиков. Мы не будем вдаваться здесь в подробности, так как это узкий технический вопрос. Основная идея обвинения Грегори заключалась в том, что Bitmain и Джихан солгали о причинах, по которым они выступали против SegWit. У Bitmain якобы была секретная фишка: компания разработала скрытую оптимизацию майнинга, экономящую усилия при доказательстве работы – но она не не работала бы, если бы блоки содержали транзакции SegWit. Причина их выступления против SegWit, таким образом, была финансовой, ради сохранения прибыльности Bitmain, а заявленные причины, вроде сложности технологии или попытки сохранения рычагов для вымогания хардфорка, не играли такой роли. Если бы обвинение было правдой, это бы означало нечестность Bitmain до такой степени, что фактически они оказывались злоумышленниками против протокола Биткоина.

Ниже приводится письмо Грегори:

> Месяц назад я рассказывал об атаке на систему proof-of-work Биткоина, которую реализует ASICBOOST, и о различных шагах, которые можно было бы использовать для его блокировки в сети, если это станет проблемой.  
> Хотя большинство обсуждений ASICBOOST было сосредоточено на открытом методе его реализации, существует также скрытый метод его использования.  
> Когда я объяснил один из подходов к подавлению скрытого ASICBOOST, я понял, что мои слова в значительной степени также описывают структуру правок кода SegWit.  
> Авторы предложения SegWit приложили особые усилия, чтобы не быть несовместимыми с какой-либо системой майнинга, и, в частности, в какой-то момент изменили дизайн, чтобы приспособиться к работе с чипами для майнинга, в которые вшиты адреса для выплат.  
> Если бы об использовании этой атаки было известно, были бы предприняты усилия, чтобы избежать несовместимости – для разных случаев применялись бы разные алгоритмы. Но лучшие методы осуществления скрытой атаки в значительной степени несовместимы практически с любым методом расширения возможностей Биткоина по обработке транзакций – с единственным заметным исключением в виде блоков расширения (тут тоже есть свои проблемы).  
> Эта несовместимость могла бы пролить свет на мотивы части наиболее необъяснимых действий некоторых сторон в экосистеме майнинга, поэтому я начал искать подтверждающие доказательства.  
> Реверс-инжиниринг конкретного чипа для майнинга убедительно продемонстрировал, что ASICBOOST в нем реализован аппаратно.  
> Исходя из этого, я предлагаю для обсуждения следующее BIP. Это предложение не предотвращает атаку в целом, а только подавляет ее скрытые формы, несовместимые с улучшениями протокола Биткоина.  
> Я надеюсь, что даже те из нас, кто решительно предпочел бы, чтобы ASICBOOST был полностью заблокирован, смогут объединиться, чтобы поддержать защитную меру, в рамках которой подавляется скрытое использование ASICBOOST, потенциально блокирующее улучшения протокола.

ASICBoost – это способ уменьшить объем работы, которую должен выполнять майнер при попытке хэширования в рамках PoW. SHA256, алгоритм хэширования, используемый для PoW Биткоина, перед вычислениями разбивает заголовок блока на 64-байтные блоки. Размер заголовка блока у Биткоина составляет 80 байт, поэтому он разделен на два фрагмента – фрагмент 1 и фрагмент 2. ASICBoost сохраняет значение одного из фрагментов одинаковым в течение нескольких попыток хэширования. Следовательно, майнер должен выполнять для этого фрагмента только часть работы, делая несколько попыток хэширования, что приводит к значительному повышению эффективности примерно на 20 процентов. Статью с описанием этой системы впервые опубликовал в марте 2016 года Тимо Ханке.

Этого можно было добиться двумя способами: открыто, поработав с битами, обозначающими версию, в заголовке блока Биткоина в первом фрагменте, чтобы создать энтропию, тогда как второй фрагмент остается статичным, позволяя сделать несколько попыток хэширования; или тайно. Скрытый ASICBoost намного сложнее и включает в себя возню с биткоин-транзакциями, чтобы найти коллизию в последних четырех байтах корня Меркла для транзакций. Корень Меркла попадает в оба фрагмента заголовка, причем последние четыре байта находятся во фрагменте 2. Таким образом, скрытый метод ускорения также сохраняет фрагмент 2 статическим, позволяя сделать несколько попыток хэширования. Эта скрытая манипуляция может происходить путем изменения порядка транзакций в блоке. Обновление SegWit требует, чтобы майнеры зафиксировали структуру транзакции в другом месте блока, что делает подобный тип манипуляции практически невозможным. Таким образом, SegWit непреднамеренно предотвращает скрытый ASICBoost.

По-прежнему существовала значительная неопределенность в отношении утверждения Грегори о том, что “обратный инжиниринг конкретного чипа для майнинга убедительно продемонстрировал аппаратную реализацию ASICBoost”. В то время как большинство сторонников малых блоков, похоже, верили в это утверждение, мне не было ясно, достаточно ли было доказательств в его поддержку. Возможно, мелкоблочники были настолько убеждены, что SegWit – хорошая идея, и у Bitmain не было веских причин противостоять ему, что они ошибочно пришли к выводу, будто намерения Bitmain непременно должны быть гнусными. Такое утверждение очень хорошо вписывается в нарратив, объясняя поведение Bitmain, и по этой причине большинство в лагере малых блоков поверило в эту версию. Конечно, альтернативное объяснение поведения Джихана – что он просто был упертым крупноблочником, который делал все для победы своей стороны – также кажется вполне возможным. Это также вполне корректно объясняет его противодействие SegWit.

Через два дня после того, как было выдвинуто обвинение, Bitmain выпустила длинное и бессвязное опровержение:

> Bitmain опробовала ASICBOOST в тестовой сети, но никогда не использовала ASICBOOST в основной сети, как это подразумевается в предложении Грегори Максвелла. Мы просим убедительных доказательств у любого, кто утверждает, что это ложь, потому что такие безосновательные утверждения токсичны для биткоин-пространства.  
> Bitmain имеет патент на ASICBOOST в Китае. Мы можем законно использовать его на наших собственных майнинг-фермах в Китае, чтобы получать от него прибыль и продавать публике контракты на облачный майнинг.  
> Оборудование для биткоин-майнинга быстро обесценивается. Bitmain постоянно представляет в открытую продажу новые, более эффективные модели майнеров. > Таким образом, утверждение о том, что развертывание ASICBOOST, которое может привести к 20-процентной разнице в энергоэффективности, это своего рода вредительство в рамках бизнес-модели Bitmain, является ложным.  
> SegWit не запущен, потому что условия, изложенные в Гонконгском соглашении, не были выполнены.  
> Недавнее предложение Грегори Максвелла предлагает поменять коллизию 2^32 на коллизию 2^64, чтобы усложнить ASICBOOST. Результатом этого будут убытки для владельцев патентов и вред для протокола Биткоина. Владельцы патентов ничего не получат, а протокол Биткоин станет более сложным.  
> Биткоин-сообщество постигло серьезное несчастье, когда Максвелл возглавил (sic) переворот против Гэвина Андресена и лишил его доступа к фиксации коммитов на гитхабе. Теперь мы, как сообщество, должны выяснить, как найти новую группу разработчиков Core, которая не будет заниматься атаками на одного из крупнейших инвесторов Биткоина (Вер), одну из крупнейших бирж (Coinbase) и крупнейшего поставщика майнинг-оборудования (Bitmain).

Прежде всего следует отметить, что, несмотря на опровержение, Bitmain признала использование ASICBoost в тестовой сети, и, предположительно, скрытого алгоритма тоже. Следовательно, вполне вероятно, что они реализовали это аппаратно. До этого опровержения я не был уверен в точности обвинений. На мой взгляд, это довольно иронично, что характер отрицания значительно увеличивал вероятность правдивости обвинения. Bitmain даже продолжала утверждать, что они владеют патентом на ASICBoost в Китае и могут законно использовать его, если захотят, прежде чем защищать эту технологию как легитимную оптимизацию майнинга. Гораздо более эффективной политикой коммуникации было бы простое и четкое отрицание, а не защита ASICBoost в гипотетическом сценарии, в котором его использовала Bitmain. Таким образом, отрицание ослабило позиции Bitmain, и сторонники малых блоков назвали его доказательством гнусного поведения. Даже если Bitmain в то время не использовал скрытый ASICBoost, они потенциально намеревались это сделать, и поэтому дух обвинения Грегори выглядел в некоторой степени точным: аргументы Bitmain против SegWit были фальшью. Похоже, в реальности все дело было в деньгах.

Однако возможно и более простое объяснение. Bitmain просто плохо общалась на английском, и поэтому отрицание было таким слабым. Также в рамках этой войны уже сложилась определенная культура сражений – аргументировать каждый пункт. Может быть, позиция Bitmain состояла в том, что они не делали скрытого ASICBoost, но даже если бы и делали, то что с того? Не исключено, что Bitmain хотела подчеркнуть именно это, даже если компания действительно не внедряла ASICBoost. Опубликованное опровержение также подтвердило позицию Bitmain в войне блоков, согласно которой они не намерены запускать SegWit, поскольку условия Гонконгского соглашения не были выполнены. Конечно, с точки зрения сторонников малых блоков, соглашение никогда и не предполагалось как услуга за услугу.

Примечательно, что Гэвин даже продолжил защищать Bitmain, основываясь на предположении, что компания использовала скрытый ASICBoost, и утверждая, что это была легитимная оптимизация майнинга с использованием программного обеспечения Биткоина.

> _Для Ethereum изменять свои правила, чтобы отменить кражу – не ОК, а для Биткоина изменять правила, чтобы предотвратить оптимизацию – это ОК?_

Однако Гэвин, похоже, упустил суть. Проблема заключалась не в том, что скрытый ASICBoost был нелегитимным, а в том, что противодействие Bitmain технологии SegWit было основано на сокрытии своих мотивов, и в том, что в войне блоков один из основных игроков был мотивирован нечестными намерениями. Если бы Bitmain открыто выступила против SegWit по этой причине, все было бы иначе.

Примерно во время скандала с ASICBoost несколько крупноблочников предлагало в качестве альтернативы SegWit другой софтфорк, позволяющий увеличить лимит размера блока – блоки расширения. Это предложение было сделано Эндрю Ли в блоге Purse.io, компании, связанной с лагерем крупных блоков. Этот план даже похвалил Роджер Вер, и Bitmain, похоже, тоже поддержала эту идею. Блоки расширения были первоначально предложены соавтором SegWit Джонсоном Лау в 2013 году, однако от этой идеи по большей части отказались, поскольку отправка монет из блока расширения в основную цепь проходила не особо гладко. В противовес этому, в SegWit все протекало без эксцессов.

Что здесь особенно примечательно, так это то, что крупноблочники, похоже, согласились с предложением, которое имело многие предполагаемые недостатки SegWit – было крайне сложным в реализации, а не простым увеличением лимита размера блока. Однако им показалось важным то, что эта идея не была разработана Bitcoin Core. На этом этапе наиболее важной проблемой для крупноблочников было развитие собственных идей и освобождение от Bitcoin Core, а не само увеличение лимита размера блока.

Блоки расширения были способом получить увеличение лимита размера блока при помощи софтфорка, но сохранить возможность проводить скрытый ASICBoost. Таким образом, для лагеря малых блоков это предложение было еще одним доказательством вины Bitmain. Мелкоблочники также обвинили Bitmain в финансировании недавней кампании по продвижению предложения о блоках расширения, что снова свидетельствовало о вине Bitmain в отношении ASICBoost. Точно так же, как крупноблочники не хотели принимать что-либо, реализованное в Bitcoin Core, их оппоненты, по-видимому, имели аналогичное предубеждение, и тот факт, что предложение о блоках расширения продвигалось и финансировалось Bitmain, гарантировало, что они выступили против него.

Патент ASICBoost считался значительной угрозой для Биткоина. Оказалось, что одна майнинг-компания может может приобрести патент, заявить об исключительных правах на использование технологии и затем доминировать в области майнинга благодаря преимуществам, которые может предоставить технология. Говорят, что для облегчения этой проблемы несколько биткоинеров приобрели патент по довольно высокой цене, а затем, в марте 2018 года, поместили патент в защитный патентный пул, так что он больше никогда не мог использоваться, кроме как для защиты от других патентов. Примерно с апреля 2018 года блоки в блокчейне Биткоина начали указывать на использование открытого ASICBoost. Открытый ASICBoost намного проще и эффективнее скрытого формата, а также позволяет избежать проблемы несовместимости с SegWit. В ноябре 2018 года Bitmain внедрила открытый ASICBoost в свою прошивку, и на сегодняшний день более 70 процентов блоков Биткоина добываются с использованием открытого ASICBoost. Что касается патента, так и осталось неясным, кто именно приобрел патент, а цепочку прав собственности от изобретателя до того, кто предположительно поместил патент в защитный патентный пул, оказалось невозможно отследить. Поэтому то, что на самом деле произошло, остается немного туманным.

Даже сегодня я действительно не уверен, использовала Bitmain скрытый ASICBoost в основной сети или нет. Мнения экспертов по этому поводу неоднозначны. Думаю, шансы где-то 50:50.

Обвинение ASICBoost, похоже, оказало очень небольшое влияние на сообщество сторонников крупных блоков. В общем-то, они даже не поняли обвинения и отклонили его как еще одну пропагандистскую ложь от Bitcoin Core. Обвинение также мало повлияло на то, чтобы убедить больше людей присоединиться к лагерю малых блоков, в основном из-за сложности аргументов обвинения. Тем не менее, это, безусловно, оказало очень значительное влияние на укрепление взглядов многих мелкоблочников, которые теперь считали разрешение ситуации гораздо более неотложной задачей. Здесь разногласия по поводу ASICBoost сыграли значительную и монументальную роль в конфликте. Теперь было похоже, что сторонники малых блоков полны решимости принять меры.

---

[Оригинал](https://blog.bitmex.com/the-blocksize-war-chapter-14-asicboost/)

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
