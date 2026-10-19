SELECT MAX("height") AS "tallest player","first_name", "last_name", "birth_country" FROM "players"
    WHERE "birth_country" != 'USA'
    ORDER BY "height", "first_name", "last_name";

