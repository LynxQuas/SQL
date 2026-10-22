CREATE TABLE "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "ingredient" TEXT NOT NULL,
    "price" INTEGER NOT NULL
);

CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" INTEGER NOT NULL,
    "price" INTEGER NOT NULL
);

CREATE TABLE "included_ingredients" (
    "ingredient_id" INTEGER, 
    "donut_id" INTEGER,
    
    PRIMARY KEY("ingredient_id", "donut_id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

CREATE TABLE "orders" (
    "order_number" INTEGER PRIMARY KEY,
    "customer_id" INTEGER,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "quantities" (
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "donut_id" INTEGER,
    "order_number" INTEGER,

    PRIMARY KEY ("order_number", "donut_id"),
    FOREIGN KEY ("order_number") REFERENCES "orders"("order_number"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

