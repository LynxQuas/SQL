CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "check-ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,

    PRIMARY KEY("id")
);

CREATE TABLE "concourses" (
    "id" INTEGER,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),

    PRIMARY KEY("id")

);

CREATE TABLE "airline-concourses" (
    "concourse_id" INTEGER,
    "airline_id" INTEGER,

    PRIMARY KEY("concourse_id", "airline_id"),
    FOREIGN KEY ("concourse_id") REFERENCES "concourses"("id"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "airline_id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "origin_airport" TEXT NOT NULL,
    "destination_airport" TEXT NOT NULL,
    "departure_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,

    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
); 
