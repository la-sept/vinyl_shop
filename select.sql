
    Вывести все заказы пользователей, у которых рейтинг больше 3.
    SELECT offer_id FROM Offer OUTER JOIN "user" ON Offer.user_id = "user".id WHERE user.rating > 3;
    
    Сортировка пользователей по рейтингу.
    SELECT username, rating FROM user ORDER BY rating;
    
    Вывести количество записей по году выпуска.
    SELECT year, COUNT(id) FROM record GROUP BY year;
    
    Вывести пользователей, у которых больше 20 желаемых пластинок.
    SELECT username FROM "user" INNER JOIN record_wanted ON "user".id=record_wanted.user_id GROUP BY user.id HAVING COUNT(record_id) > 20;
