CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
);

CREATE TABLE "schools" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULl,
    "founded_year" INTEGER NOT NULL
);

CREATE TABLE "companies" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "connections" (
    "user_id" INTEGER,
    "friend_id" INTEGER,

    PRIMARY KEY ("user_id", "friend_id"),
    CHECK ("user_id" < "friend_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("friend_id") REFERENCES "users"("id")
);

CREATE TABLE "school_affiliations" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL, 
    "end_date" NUMERIC,
    "degree" TEXT,

    PRIMARY KEY ("user_id", "school_id", "start_date"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_affiliations" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "title" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,

    PRIMARY KEY ("user_id", "company_id", "start_date"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);
