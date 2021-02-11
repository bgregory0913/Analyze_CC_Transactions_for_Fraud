-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Card_Holder" (
    "id" BIGINT   NOT NULL,
    "name" VARCHAR(150)   NOT NULL,
    CONSTRAINT "pk_Card_Holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Credit_Cards" (
    "cardholder_id" BIGINT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL
);

CREATE TABLE "Merchant_Categories" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Merchant_Categories" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Merchant_Categories_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Merchants" (
    "id" BIGINT   NOT NULL,
    "name" VARCHAR(200)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_Merchants" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Merchants_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Transactions" (
    "id" BIGINT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" DECIMAL(2)   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" BIGINT   NOT NULL,
    CONSTRAINT "pk_Transactions" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Credit_Cards" ADD CONSTRAINT "fk_Credit_Cards_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "Card_Holder" ("id");

ALTER TABLE "Merchants" ADD CONSTRAINT "fk_Merchants_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "Merchant_Categories" ("id");

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_card" FOREIGN KEY("card")
REFERENCES "Credit_Cards" ("card");

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "Merchants" ("id");

