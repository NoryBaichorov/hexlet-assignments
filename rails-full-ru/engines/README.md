# Engines

## Ссылки

* [Getting Started with Engines](https://guides.rubyonrails.org/engines.html)

## Задачи

В этом задании уже реализован простой енжин, Который показывает статистику — размер кодовой базы.

```bash

bin/rails stats

+----------------------+--------+--------+---------+---------+-----+-------+
| Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
+----------------------+--------+--------+---------+---------+-----+-------+
| Controllers          |     13 |      7 |       3 |       1 |   0 |     5 |
| Helpers              |      4 |      2 |       0 |       0 |   0 |     0 |
| Jobs                 |      9 |      2 |       1 |       0 |   0 |     0 |
| Models               |      5 |      3 |       1 |       0 |   0 |     0 |
| Mailers              |      6 |      4 |       1 |       0 |   0 |     0 |
| Channels             |     12 |      8 |       2 |       0 |   0 |     0 |
| JavaScript           |     24 |     11 |       0 |       0 |   0 |     0 |
| Libraries            |      0 |      0 |       0 |       0 |   0 |     0 |
| Controller tests     |     10 |      7 |       1 |       1 |   1 |     5 |
| Helper tests         |      0 |      0 |       0 |       0 |   0 |     0 |
| Mailer tests         |      0 |      0 |       0 |       0 |   0 |     0 |
| Channel tests        |     15 |      5 |       1 |       0 |   0 |     0 |
| Integration tests    |      0 |      0 |       0 |       0 |   0 |     0 |
| System tests         |      0 |      0 |       0 |       0 |   0 |     0 |
+----------------------+--------+--------+---------+---------+-----+-------+
| Total                |     98 |     49 |      10 |       2 |   0 |    22 |
+----------------------+--------+--------+---------+---------+-----+-------+
  Code LOC: 37     Test LOC: 12     Code to Test Ratio: 1:0.3
```

### Gemfile

Подключите энжин `rails_stats`, который находится в директории *engines/rails_stats*.

### config/routes.rb

Подключите обработчики маршрутов энжина по пути */stats*.

Выполните установку зависимостей, проверьте, что статистика отображается по пути и изменяется, если вносятся изменения в приложение.

## Дополнительное задание

Сгенерируйте энжин Blog, сгенерируйте в нем CRUD и подключите его по маршруту */blog*.


