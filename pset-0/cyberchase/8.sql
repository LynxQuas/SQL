SELECT COUNT("episode_in_season") AS "number of episode release in 6 years" FROM "episodes"
    WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
