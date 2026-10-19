SELECT 
    "players"."first_name",
    "players"."last_name",
    ("salaries"."salary" / "performances"."H") AS "dollars per hit" 
FROM "players"
JOIN "performances" ON "performances"."player_id" = "players"."id"
    AND "performances"."year" = "salaries"."year"
    AND "performances"."year" = 2001
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    AND "salaries"."year" = 2001
WHERE "performances"."H" != 0
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;

