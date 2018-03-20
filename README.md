# vinyl_shop

- База данных интернет-площадки для продажи виниловых пластинок
- Выполнила Липина Анна, группа 09-551
+ Описание предметной области
  + Объекты предметной области:
    1. Профиль пользователя - включает в себя информацию о покупателе или продавце, использующем сайт.
    2. Запись на виниловой пластинке - характеризуется названием, исполнителем и годом выпуска.
    3. Предложение - содержит информацию о цене и сохранности экземпляра записи, а также о пользователе, которму принадледит экземпляр.
    4. Заказ - содержит информацию об экземпляре пластинки, продавце и покупателе.
+ Спецификация проекта
  1. Вывести все заказы пользователей, у которых рейтинг больше 3.
  2. Сортировка пользователей по рейтингу.
  3. Показать все пластинки, выпущенные после 1980 года, цена которых превышает 200 рублей.
  4. Вывести самую часто встречающуюся в желаемом пластинку.
  5. Вывести все жанры, в которых есть записи 1990 года.
  6. Показать все предложения пользователя, не превышающие по цене 300 рублей.
  7. Показать все заказы пластинок исполнителя "Unknown Artist".
+ Описание файлов
  + `README.md` - описание проекта
  + `requirements.md` - требования к оформлению проекта
  + `erd.png` - ER-диаграмма проекта
  + `create.sql` - скрипт создания схемы БД
  + `insert.sql` - скрипт заполнения БД
  + `select.sql` - скрипт с запросами, соответствующие спецификации проекта
