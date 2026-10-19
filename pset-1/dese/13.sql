SELECT
    "schools"."name" AS "school",
    "districts"."name" AS "district"
FROM "schools"
JOIN "districts"
    ON "schools"."district_id" = "districts"."id";

