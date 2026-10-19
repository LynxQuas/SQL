SELECT
    "players"."first_name",
    "players"."last_name"
FROM "players"
WHERE "players"."id" IN (
    SELECT "performances"."player_id" FROM "performances"
    JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "performances"."year" = 2001 AND "performances"."H" != 0
    ORDER BY ("salaries"."salary" / "performances"."H")
    LIMIT 10
)
AND "players"."id" IN (
    SELECT "performances"."player_id" FROM "performances"
    JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "performances"."year" = 2001 AND "performances"."RBI" != 0
    ORDER BY ("salaries"."salary" / "performances"."RBI")
    LIMIT 10
)
ORDER BY "players"."id";

