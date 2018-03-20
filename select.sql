
    Вывести все заказы пользователей, у которых рейтинг больше 3.
    SELECT offer_id FROM Offer OUTER JOIN "user" ON Offer.user_id = "user".id WHERE user.rating > 3;
    
    Сортировка пользователей по рейтингу.
    SELECT username, rating FROM user ORDER BY rating;
    
    Вывести количество записей по году выпуска.
    SELECT year, COUNT(id) FROM record GROUP BY year;
    
    Показать пользователей, у которых больше 20 желаемых пластинок.
    SELECT username FROM "user" INNER JOIN record_wanted ON "user".id=record_wanted.user_id GROUP BY user.id HAVING COUNT(record_id) > 20;
    
    Вывести 5 самых широко представленных жанров.
    SELECT genre.name FROM genre INNER JOIN record_genre ON id = genre_id GROUP BY genre_id ORDER BY COUNT(record_id) LIMIT 5;
    
    Показать всех пользователей, которые заказывали пластинки исполнителя "Unknown Artist"
    SELECT username FROM "user" WHERE "user".id IN
        (SELECT client FROM record INNER JOIN "order" ON record.id = vynil_id WHERE artist = "Unknown Artist");
        
    Показать всех пользователей, которые и продавали, и покупали пластинки.
    SELECT salesman FROM "order" AS salesmen;
    SELECT username FROM "user" WHERE "user".id IN (SELECT client FROM "order" WHERE client IN salesmen);
