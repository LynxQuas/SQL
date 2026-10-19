-- *** The Lost Letter ***
SELECT * FROM "scans" 
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
);

SELECT * FROM "addresses" WHERE "id" = 854;

-- *** The Devious Delivery ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
) AND "action" = 'Drop';

SELECT "type" FROM "addresses" WHERE "id" = 348;

SELECT "contents" FROM "packages" WHERE "id" = 5098;

-- *** The Forgotten Gift ***
SELECT * FROM "addresses"
WHERE "address" IN ('728 Maple Place', '109 Tileston Street')

SELECT "scans".*, "packages"."contents" FROM "scans"
    JOIN "packages" ON "scans"."package_id" = "packages"."id"
    WHERE "packages"."from_address_id" = 9873
    AND "packages"."to_address_id" = 4983
    ORDER BY "timestamp" DESC;

SELECT * FROM "drivers" WHERE "id" = 17;
