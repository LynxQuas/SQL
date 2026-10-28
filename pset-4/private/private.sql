CREATE TABLE "cipher" (
    "id" INTEGER,
    "sentence_id" INTEGER,
    "start" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,

    PRIMARY KEY("id"),
    FOREIGN KEY ("sentence_id") REFERENCES "sentences"("id")
);

INSERT INTO "cipher" ("id", "sentence_id", "start", "length")
VALUES
    (1, 14,   98, 4),
    (2, 114,   3, 5),
    (3, 618,  72, 9),
    (4, 630,   7, 3),
    (5, 932,  12, 5),
    (6, 2230, 50, 7),
    (7, 2346, 44, 10),
    (8, 3041, 14, 5);

CREATE VIEW "message" AS
SELECT
    substr(
        "sentences"."sentence",
        "cipher"."start",
        "cipher"."length"
    ) AS "phrase"
FROM "cipher"
JOIN "sentences"
    ON "cipher"."sentence_id" = "sentences"."id";
