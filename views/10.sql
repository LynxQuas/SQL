SELECT "english_title", "artist", MAX("entropy") AS "highest complexity of the artwork" FROM "views"
    WHERE "brightness" > 0.5
    ORDER BY "entropy" DESC
    LIMIT 5;
