CREATE TABLE "meteorites_temp" (
    "name",
    "id",
    "nametype",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '' or "lat" = 0.0 or lat = 0;

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '' or "long" = 0.0 or lat = 0;

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

DELETE FROM "meteorites_temp" 
WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,

    PRIMARY KEY("id")
);

INSERT INTO "meteorites" 
("id", "name", "class", "mass", "discovery", "year", "lat", "long")
SELECT 
    ROW_NUMBER() OVER (ORDER BY "year", "name") AS "id",
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long" 
FROM "meteorites_temp";

DROP TABLE "meteorites_temp";
