-- Добавление нового продукта + Обновление цены продукта
DO $$
BEGIN

-- Добавление нового продукта
INSERT INTO otus."Products"("ProductName", "Description", "Price", "QuantityInStock")
	VALUES 
		('Новый продукт', 'Описание Новый продукт', Null, 5000.0);

-- Обновление цены продукта - последнего добавленного продукта
UPDATE  otus."Products"
	SET "Price"=498990.50
	WHERE "ProductID" in (select "ProductID" from otus."Products" order by "ProductID" desc LIMIT 1);
	
END;
$$

-- SELECT * FROM otus."Products" WHERE "ProductName"='Новый продукт'

-- Выбор всех заказов определенного пользователя c id=1
SELECT O."OrderID", O."UserID", O."OrderDate", O."Status"
		FROM otus."Orders" O			
		WHERE "UserID"=1;			-- пользователь с id=1
		
-- Расчет общей стоимости заказа
SELECT O."OrderID", O."UserID", U."UserName", O."OrderDate", O."Status", SUM(OD."TotalCost") summa
		FROM otus."Orders" O
			left join otus."Users" U
				on O."UserID"=U."UserID"
			left join otus."OrderDetails" OD
				on O."OrderID"=OD."OrderID"
		GROUP BY O."OrderID", O."UserID", O."OrderDate", O."Status", U."UserName"
		ORDER BY O."OrderDate" desc;
		
--Подсчет количества товаров на складе
SELECT SUM("QuantityInStock") FROM otus."Products"

--Получение 5 самых дорогих товаров
SELECT  "ProductID", "ProductName", "Description", "Price"/"QuantityInStock" Стоимость
	FROM otus."Products" ORDER BY "Price"/"QuantityInStock" DESC LIMIT 5; 

--Список товаров с низким запасом (менее 5 штук)
SELECT  "ProductID", "ProductName", "Description", "QuantityInStock", "Price"
	FROM otus."Products" 
	WHERE "QuantityInStock"<5
	
--SELECT * from otus."Products"	
		

