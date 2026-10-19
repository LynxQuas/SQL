SELECT "city", COUNT("name") AS "Number of public schools" FROM "schools"
WHERE "type" LIKE '%public school%'
GROUP BY "city" 
ORDER BY COUNT("name") DESC, "city"
LIMIT 10;
