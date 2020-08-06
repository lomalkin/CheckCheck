# CheckCheck - bash scripts for expence tracking

In Russian Federation every bill from shop has special QR code, that contains some data about expense operation. So we can use it to realize our tiny personal expense checker directly on `bash`.

Bash cкрипты для контроля расходов посредством сканирования QR-кодов на чеках из магазинов в России. А почему бы и нет. 

Проект был написан за 1.5 вечера, чтобы освежить свои знания языка bash. Целью также ставилось минимальное количество зависимостей от внешних библиотек и программ.

# Installation

* Debian/Ubuntu - `./install_requirements.sh` from inside repo.
* Any other OS - please install these packages:
    - `zbar-tools` - for QR-code scanning.
    - `sox` - to play sound after scan.

Maybe you also want to change your video device inside `config.sh`.

# Usage

* `./scan.sh` - для сканирования чеков в потоковом режиме через веб-камеру. Данные будут собираться в папку `db`.
* `./report.sh` - построить отчет по годам и месяцам по всем собранным данным.

# Future plans

* Добавить парсер, позволяющий забирать данные из какого-нибудь ОФД?
* Рисовать отчет в виде графика?
* ...

# Related links

* https://habr.com/en/post/358966/
* https://qna.habr.com/q/442458


