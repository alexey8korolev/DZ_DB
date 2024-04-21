DO $$
BEGIN

--Таблица "Products" (Продукты)
CREATE TABLE IF NOT EXISTS  otus."Products"
(
    "ProductID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "ProductName" character varying(250) COLLATE pg_catalog."default",
    "Description"  character varying(500) COLLATE pg_catalog."default",
    "Price" money,
    "QuantityInStock" numeric(25, 8),
	CONSTRAINT "Products_pkey" PRIMARY KEY ("ProductID")
)
TABLESPACE pg_default;

ALTER TABLE otus."Products"
    OWNER to "lOtus";
	
--Таблица "Users" (Пользователи):	
CREATE TABLE IF NOT EXISTS  otus."Users"
(
    "UserID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "UserName" character varying(250) COLLATE pg_catalog."default",
    "Email"  character varying(500) COLLATE pg_catalog."default",
    "RegistrationDate" date,
	CONSTRAINT "Users_pkey" PRIMARY KEY ("UserID")	
)
TABLESPACE pg_default;
ALTER TABLE otus."Users" ALTER COLUMN "RegistrationDate" TYPE date USING ("RegistrationDate"::text::date);
ALTER TABLE otus."Users"
    OWNER to "lOtus";
	
--Таблица "Orders" (Заказы)
CREATE TABLE IF NOT EXISTS  otus."Orders"
(
    "OrderID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "UserID"  integer NOT NULL ,
    "OrderDate" date,
	"Status" character varying(50) COLLATE pg_catalog."default",
	CONSTRAINT "Orders_pkey" PRIMARY KEY ("OrderID"),
	CONSTRAINT "Orders_Users_fkey" FOREIGN KEY ("UserID") REFERENCES otus."Users"
)
TABLESPACE pg_default;
ALTER TABLE otus."Orders" ALTER COLUMN "OrderDate" TYPE date USING ("OrderDate"::text::date);
ALTER TABLE otus."Orders"
    OWNER to "lOtus";	
	
--Таблица "OrderDetails" (Детали заказа)
CREATE TABLE IF NOT EXISTS  otus."OrderDetails"
(
    "OrderDetailID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "OrderID"  integer NOT NULL ,
    "ProductID"  integer NOT NULL ,	
    "Quantity" numeric(25, 8),
    "TotalCost" money,
	CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("OrderDetailID"),	
	CONSTRAINT "OrderDetails_Order_fkey" FOREIGN KEY ("OrderID") REFERENCES otus."Orders",
	CONSTRAINT "OrderDetails_Product_fkey" FOREIGN KEY ("ProductID") REFERENCES otus."Products"	
)
TABLESPACE pg_default;
ALTER TABLE otus."OrderDetails"
    OWNER to "lOtus";		
	
END;
$$
