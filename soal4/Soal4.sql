--create a database
CREATE DATABASE KALBE;
--user kalbe database
USE KALBE;
--create table inventory
CREATE TABLE Inventory (
    Item_code CHAR(10) PRIMARY KEY,
    Item_name VARCHAR(255),
    Item_price CHAR(10),
    Item_total CHAR(10)
);
--insert data below table
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES 
(2341, 'Promag Tablet', 3000, 100),
(2342, 'Hydro Coco 250ML', 7000, 20),
(2343, 'Nutrive Benecol 100ML', 20000, 30),
(2344, 'Blackmores Vit C 500Mg', 95000, 45),
(2345, 'Entrasol Gold 370G', 90000, 120);
--show item_name has the highest number in item_total
SELECT Item_name 
FROM Inventory 
WHERE Item_total = (SELECT MAX(Item_total) FROM Inventory);
--update item_price
UPDATE Inventory
SET Item_price = 5000
WHERE Item_name = 'Promag Tablet';

--  What will happen if we insert another Item_name with Item_code of 2343 into the table? 
-- Answer : If i try to insert another item with Item_code 2343 and,
-- it's a primary key or unique constraint violation, it will result in an error, and the insertion will fail.

--delete the item_name has the lowest number of item_total
DELETE FROM Inventory 
WHERE Item_total = (SELECT MIN(Item_total) FROM Inventory);
