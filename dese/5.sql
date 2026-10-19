SELECT "city", COUNT("name") AS "number of public schools" FROM "schools"
WHERE "type" LIKE '%public school%'
GROUP BY "city"
HAVING COUNT("name") <= 3
ORDER BY COUNT("name") DESC, "city";


