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
  3. Вывести количество записей по году выпуска.
  4. Показать пользователей, у которых больше 20 желаемых пластинок.
  5. Вывести 5 самых широко представленных жанров.
  6. Показать всех пользователей, которые заказывали пластинки исполнителя "Unknown Artist"
  7. Показать всех пользователей, которые и продавали, и покупали пластинки.
+ Описание файлов
  + `README.md` - описание проекта
  + `requirements.md` - требования к оформлению проекта
  + `erd.png` - ER-диаграмма проекта
  + `create.sql` - скрипт создания схемы БД
  + `insert.sql` - скрипт заполнения БД
  + `select.sql` - скрипт с запросами, соответствующие спецификации проекта
