SELECT "name", "per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "districts"."type" LIKE '%public school%'
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;





