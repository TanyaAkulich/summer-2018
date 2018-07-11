# Rubizza Survival Camp: Summer 2018

![](https://s3.eu-central-1.amazonaws.com/rubizza/rubizza-logo.png)


# [Как сдавать задания](#how-to-submit)

Алгоритм примерно следующий:

* Для сдачи всех заданий каждому нужно будет [форкнуть](http://lmgtfy.com/?q=%D1%84%D0%BE%D1%80%D0%BA%D0%BD%D1%83%D1%82%D1%8C) этот репозиторий.
* Каждый курсант ( он же участник курсов ) должен в этом репозитории создать папку со своим личным номером ( например __2522__ ).
* Каждое задание должно выполняться в отдельной [ветке](http://lmgtfy.com/?q=github+fork) и для него необходимо создать отдельную папку, которая будет отражать номер задания. ( например для задания 0 - __2522/0/__ )
* После завершения задания - нужно выслать [pull request](http://lmgtfy.com/?q=pull+request) ( он же далее PR ) в master-ветку этого репозитория. Формат названия PR должен быть __персональный номер__ - __номер задания__ ( например 2522 - 0 ). Обратите внимание что при отправки нужно заполнить все поля в шаблоне.
* PR после отправки всегда будет проверять шальная собака на соответствие человеческим стилям. Если стиль кода ей не понравится - она будет ругаться.
* Только если собака довольна - на вашу задачу будет назначен ментор, который уже будет просматривать код и принимать задание.
* После того как ментор решил что задание выполнено полностью и ему все нравится - он зальет ваше задание в основной репозиторий. Именно этот момент и будет считаться временем сдачи задания.


# Задание 0

В рамках первого задания всем нужно было настроить окружение ( *nix, rvm/rbenv, ruby ) и поднять на своей локальной машине redmine. Так как к моменту написания этого задания большая часть бойцов уже с ним справилась, то более подробно описывать его не имеет смысла. Напомню только что самые дерзкие ( мы всех взяли на карандаш ) обещали также обернуть redmine в docker, за что получат дополнительную звездочку.

P.S. Мы проверили, звездочки на складе закончились, будем выдавать банки тушенки.


### Как доказать что я справился

Для того, чтобы сдать данное задание необходимо:

* По алгоритму [выше](#how-to-submit) нужно пройти все шаги и сделать настройку.
* В нужной папке и ветке нужно создать файлик `1.rb` с кодом в нем `puts 'Chunky bacon'` ( лайк и подписка если понял о чем я )
* Этот файлик нужно прикрепить и отправить по той же инструкции выше.
* В видео, которое необходимо припкрепить к PR ( он же pull request ) нужно отразить что у тебя есть на машине ruby, rvm/rbenv, и работает локально redmine.
* Если делал задачу со звездочкой - то в папку помимо 1.rb нужно положить все, что касается настройки докеров. И также это отразить на видео.

### Дедлайн

2018-07-07 18:00:00 UTC+3

# Задание 1

После первого задания вы получили работающую систему, и настало время ей воспользоваться! Чтобы показать все прелести языка Ruby вам придется пройти через сложный путь к просветлению. На выходе вы получите незабываемые впечатление и навыки написания кода согласно тому, как все привыкли его видеть! Запомните, что каждое следующее задание должно строго следовать букве закона и быть на стиле!

0. Форкаем [репозиторий](https://github.com/edgecase/ruby_koans).
1. Фиксим все коэны. (см. инструкцию к репу ruby_koans)
2. ...
4. Profit!

### Как доказать, что я справился

* Все решения ( вместе с кодом решения ) должны быть залиты в папку, которая отражает номер текущего задания.
* Видео, прикрепленное к PR, обязательно должно показывать, что все koans пройдены.

### Дедлайн
2018-07-11 18:00:00 UTC+3

# Задание 2

Ни для кого не будет сюрпризом тот факт, что за последние несколько лет рэп-баттлы прочно вошли в нашу культуру. И локомотивом этой субкультуры в наше время точно является питерская площадка VERSUS. Если вы хоть немного в теме - то это задание вам точно понравится. А если нет - то пора уже быть в теме.

### Общее описание

В рамках данного задания мы будем анализировать тексты различных участников рэп-баттлов ( преимущественно VERSUS ) на предмет различных интересных факторов. Само приложение для анализа должно представлять собой консольную утилиту, которая принимает в себя различные аргументы. В зависимости от них поведение приложения меняется и выдает нам различные интересные факторы. Данные для анализа необходимо скачать по [ссылке](https://drive.google.com/open?id=1qFdNe6ggZHW1hCa3klNgQIbHVMdWanJf).Для выполнения всех уровней можно использовать любые гемы или API.

### Уровень 1

На первом уровне сложности нам нужно проанализировать все тексты и выяснить самого нецензурного участника площадки. У каждого из нас свое понятие нецензурности, поэтому алгоритм определения данного фактора оставляем за каждым курсантом.

Параметр `--top-bad-words`, который передается в программу, показывает максимальное количество самых нецензурных участников, которое следует вывести на экран.

Дополнительно необходимо будет посчитать общее количество баттлов для каждого участника.

Серьезно отнеситесь к форматированию данных. На данном уровне задания оно должно полностью соответствовать примеру ниже.

Пример работы программы.

```
ruby versus.rb --top-bad-words=3

Гнойный    | 12 батлов | 127 нецензурных слов | 10.58 слова на баттл |
Oxxxymiron | 7 батлов  | 24 нецензурных слова | 3.42 слова на баттл  |
Галат      | 3 батла   | 2 нецензурных слов   | 0.66 слова на баттл  |
```

### Уровень 2

На втором уровне сложности мы будем искать для определнного участника его любимые слова в батлах.  Имя участника должно передавать как параметр `--name`. Чтобы ограничить вывод стоит использовать параметр `--top-words`. По дефолту необходимо выводить 30 слов.

Не забудьте исключить разные местоимения и прочие мелочи.

Пример работы программы.

```

ruby versus.rb --top-words=20 --name=Толик

Рэпер Толик не известен мне. Зато мне известны:
Гнойный
Oxxxymiron
Галат
...

ruby versus.rb --top-words=5 --name=Oxxymiron

Факты - 5 раз
Папочку - 2 раза
Микрофоны - 1 раз
Птички - 1 раз
Пожертвую - 1 раз
```

### Уровень 3

На третьем уровне сложности нам было бы интересно проанализировать все тексты и найти рифмы, которые разные участники тырили у других. Формат вывода данных на экран придумайте сами.

Пример работы программы.


```
ruby versus.rb --plagiat
```

### Как доказать, что я справился

* Все решения ( вместе с кодом решения ) должны быть залиты в папку, которая отражает номер текущего задания.
* Видео, прикрепленное к PR
* Уровни должны быть выполнены один за другим. Невозможно сдать уровень 2 не сдав уровень 1.

### Дедлайн
2018-07-16 09:00:00 UTC+3 ( Потому что все уходят раньше Толика, значит всем легко и все понятно )
