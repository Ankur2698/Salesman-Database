/*---DROP all Tables---*/
/*DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Product_Line CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE "Order" CASCADE CONSTRAINTS;
DROP TABLE Order_Line CASCADE CONSTRAINTS;
DROP TABLE Territory CASCADE CONSTRAINTS;
DROP TABLE DoesBusinessIn CASCADE CONSTRAINTS;
DROP TABLE Salesperson CASCADE CONSTRAINTS;
DROP TABLE PriceUpdate CASCADE CONSTRAINTS;*/

/*---CREATE and INSERT INTO all Tables---*/
/* Statements for Customer Table */
CREATE TABLE Customer(  CustomerID INT PRIMARY KEY, 
                        CustomerName CHAR(30), 
                        CustomerAddress CHAR(30), 
                        CustomerCity CHAR(20), 
                        CustomerState CHAR(2), 
                        CustomerPostalCode CHAR(10), 
                        CustomerEmail CHAR(30), 
                        CustomerUserName CHAR(30), 
                        CustomerPassword CHAR(30));
/*DESCRIBE Customer;*/
/* Inserts for Customer */
INSERT INTO Customer VALUES(1, 'Contemporary Casuals', '1355 S Hines Blvd.', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL);
INSERT INTO Customer VALUES(2, 'Value Furnitures', '15145 S. W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL);
INSERT INTO Customer VALUES(3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125', 'homefurnishings@gmail.com', 'CUSTOMER1,', 'CUSTOMER1#');
INSERT INTO Customer VALUES(4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL);
INSERT INTO Customer VALUES(5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL);
INSERT INTO Customer VALUES(6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL);
INSERT INTO Customer VALUES(7, 'New Furniture', 'Palace Ave.', 'Farmington', 'NM', NULL, NULL, NULL, NULL);
INSERT INTO Customer VALUES(8, 'Dunkins Furniture', '7700 Main St.', 'Syracuse', 'NY', '31590', NULL, NULL, NULL);
INSERT INTO Customer VALUES(9, 'A Carpet', '434 Abe Dr.', 'Rome', 'NY', '13440', NULL, NULL, NULL);
INSERT INTO Customer VALUES(12, 'Flanigan Furniture', 'Snow Flake Rd.', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL);
INSERT INTO Customer VALUES(13, 'Ikards', '1011 S Main St.', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL);
INSERT INTO Customer VALUES(14, 'Wild Bills', 'Four Horse Rd.', 'Oak Brook', 'IL', '60522', NULL, NULL, NULL);
INSERT INTO Customer VALUES(15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer VALUES(16, 'ABC Furniture Co.', '152 Geranimo Dr.', 'Rome', 'NY', '13440', NULL, NULL, NULL);
/*SELECT * FROM Customer C;*/

/* Statements for Product_Line Table */
CREATE TABLE Product_Line(  ProductLineID INT PRIMARY KEY, 
                            ProductLineName CHAR(20));
/*DESCRIBE Product_Line;*/
/* Inserts for Product_Line */
INSERT INTO Product_Line VALUES(1, 'Cherry Tree');
INSERT INTO Product_Line VALUES(2, 'Scandanavia');
INSERT INTO Product_Line VALUES(3, 'Country Look');
/*SELECT * FROM Product_Line PL;*/

/* Statements for Product Table */
CREATE TABLE Product(   ProductID INT PRIMARY KEY, 
                        ProductName CHAR(30), 
                        ProductFinish Char(20), 
                        ProductStandardPrice REAL, 
                        ProductLineID INT, 
                        Photo CHAR(20), 
                        FOREIGN KEY (ProductLineID) REFERENCES Product_Line(ProductLineID));
/*DESCRIBE Product;*/
/* Inserts for Product */
INSERT INTO Product VALUES(1, 'End Table', 'Cherry', 175, 1, 'table.jpg');
INSERT INTO Product VALUES(2, 'Coffee Table', 'Natural Ash', 200, 2, NULL);
INSERT INTO Product VALUES(3, 'Computer Desk', 'Natural Ash', 375, 2, NULL);
INSERT INTO Product VALUES(4, 'Entertainment Center', 'Natural Maple', 650, 3, NULL);
INSERT INTO Product VALUES(5, 'Writers Desk', 'Cherry', 325, 1, NULL);
INSERT INTO Product VALUES(6, '8-Drawer Desk', 'White Ash', 750, 2, NULL);
INSERT INTO Product VALUES(7, 'Dining Table', 'Natural Ash', 800, 2, NULL);
INSERT INTO Product VALUES(8, 'Computer Desk', 'Walnut', 250, 3, NULL);
/*SELECT * FROM Product P;*/

/* Statements for "Order" Table */
CREATE TABLE "Order"(   OrderID INT PRIMARY KEY, 
                        OrderDate DATE, 
                        CustomerID INT, 
                        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
/*DESCRIBE "Order";*/
/* Inserts for "Order" */
INSERT INTO "Order" VALUES(1001, '21-AUG-2016', 1);
INSERT INTO "Order" VALUES(1002, '21-JUL-2016', 8);
INSERT INTO "Order" VALUES(1003, '22-AUG-2016', 15);
INSERT INTO "Order" VALUES(1004, '22-OCT-2016', 5);
INSERT INTO "Order" VALUES(1005, '24-JUL-2016', 3);
INSERT INTO "Order" VALUES(1006, '24-OCT-2016', 2);
INSERT INTO "Order" VALUES(1007, '27-AUG-2016', 5);
INSERT INTO "Order" VALUES(1008, '30-OCT-2016', 12);
INSERT INTO "Order" VALUES(1009, '05-NOV-2016', 4);
INSERT INTO "Order" VALUES(1010, '05-NOV-2016', 1);
/*SELECT * FROM "Order" O;*/

/* Statements for Order_Line Table */
CREATE TABLE Order_Line(OrderID INT, 
                        ProductID INT, 
                        OrderedQuantity INT, 
                        SalePrice REAL, 
                        PRIMARY KEY(OrderID, ProductID), 
                        FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID), 
                        FOREIGN KEY (ProductID) REFERENCES Product(ProductID));
/*DESCRIBE Order_Line;*/
/* Inserts for Order_Line */
INSERT INTO Order_Line VALUES(1001, 1, 2, NULL);
INSERT INTO Order_Line VALUES(1001, 2, 2, NULL);
INSERT INTO Order_Line VALUES(1001, 4, 1, NULL);
INSERT INTO Order_Line VALUES(1002, 3, 5, NULL);
INSERT INTO Order_Line VALUES(1003, 3, 3, NULL);
INSERT INTO Order_Line VALUES(1004, 6, 2, NULL);
INSERT INTO Order_Line VALUES(1004, 8, 2, NULL);
INSERT INTO Order_Line VALUES(1005, 4, 4, NULL);
INSERT INTO Order_Line VALUES(1006, 4, 1, NULL);
INSERT INTO Order_Line VALUES(1006, 5, 2, NULL);
INSERT INTO Order_Line VALUES(1006, 7, 2, NULL);
INSERT INTO Order_Line VALUES(1007, 1, 3, NULL);
INSERT INTO Order_Line VALUES(1007, 2, 2, NULL);
INSERT INTO Order_Line VALUES(1008, 3, 3, NULL);
INSERT INTO Order_Line VALUES(1008, 8, 3, NULL);
INSERT INTO Order_Line VALUES(1009, 4, 2, NULL);
INSERT INTO Order_Line VALUES(1009, 7, 3, NULL);
INSERT INTO Order_Line VALUES(1010, 8, 10, NULL);
/*SELECT * FROM Order_Line OL;*/

/* Statements for Territory Table */
CREATE TABLE Territory( TerritoryID INT PRIMARY KEY, 
                        TerritoryName CHAR(20));
/*DESCRIBE Territory;*/
/* Inserts for Territory */
INSERT INTO Territory VALUES(1, 'SouthEast');
INSERT INTO Territory VALUES(2, 'SouthWest');
INSERT INTO Territory VALUES(3, 'NorthEast');
INSERT INTO Territory VALUES(4, 'NorthWest');
INSERT INTO Territory VALUES(5, 'Central');
/*SELECT * FROM Territory T;*/

/* Statements for DoesBusinessIn Table */
CREATE TABLE DoesBusinessIn(CustomerID INT, 
                            TerritoryID INT, 
                            PRIMARY KEY (CustomerID, TerritoryID), 
                            FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID), 
                            FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));
/*DESCRIBE DoesBusinessIn;*/
/* Inserts for DoesBusinessIn */
INSERT INTO DoesBusinessIn VALUES(1, 1);
INSERT INTO DoesBusinessIn VALUES(2, 2);
INSERT INTO DoesBusinessIn VALUES(3, 3);
INSERT INTO DoesBusinessIn VALUES(4, 4);
INSERT INTO DoesBusinessIn VALUES(5, 5);
INSERT INTO DoesBusinessIn VALUES(6, 1);
INSERT INTO DoesBusinessIn VALUES(7, 2);
/*SELECT * FROM DoesBusinessIn DBI;*/

/* Statements for Salesperson Table */
CREATE TABLE Salesperson(   SalespersonID INT PRIMARY KEY,
                            SalespersonName CHAR(30), 
                            SalespersonPhone CHAR(10), 
                            SalespersonEmail CHAR(30), 
                            SalespersonUserName CHAR(30), 
                            SalespersonPassword CHAR(30), 
                            TerritoryID INT, 
                            FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));
/*DESCRIBE Salesperson;*/
/* Inserts for Salesperson */
INSERT INTO Salesperson VALUES(1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1);
INSERT INTO Salesperson VALUES(2, 'Robert Lewis', '8139264006', '', '', '', 2);
INSERT INTO Salesperson VALUES(3, 'William Strong', '5053821212', '', '', '', 3);
INSERT INTO Salesperson VALUES(4, 'Julie Dawson', '4355346677', '', '', '', 4);
INSERT INTO Salesperson VALUES(5, 'Jacob Winslow', '2238973498', '', '', '', 5);
/*SELECT * FROM Salesperson SP;*/

/* Statements for PriceUpdate Table */
CREATE TABLE PriceUpdate(   PriceUpdateID INT PRIMARY KEY,
                            DateChanged DATE, 
                            OldPrice REAL, 
                            NewPrice REAL);
/*DESCRIBE PriceUpdate;*/
/*SELECT * FROM PriceUpdate PU;*/

/*---DROP all Views---*/
/*DROP VIEW View_Comparison;
DROP VIEW View_TotalValue;
DROP VIEW View_CustomerData;
DROP VIEW View_Shipment;
DROP VIEW View_PurchaseHistory;*/

/*---CREATE all Views---*/
CREATE VIEW View_Comparison AS
SELECT PL.ProductLineID, P.ProductID, SUM(OL.OrderedQuantity) AS Total_Sold
FROM Product_Line PL, Product P, Order_Line OL
WHERE P.ProductLineID=PL.ProductLineID AND OL.ProductID=P.ProductID
GROUP BY PL.ProductLineID, P.ProductID
ORDER BY PL.ProductLineID;
/*SELECT * FROM View_Comparison;*/

CREATE VIEW View_TotalValue AS
SELECT P.ProductID, SUM(OL.OrderedQuantity*P.ProductStandardPrice) AS Total_Value_of_Orders
FROM Product P, Order_Line OL
WHERE OL.ProductID=P.ProductID
GROUP BY P.ProductID
ORDER BY P.ProductID;
/*SELECT * FROM View_TotalValue;*/

CREATE VIEW View_CustomerData AS
SELECT DBI.TerritoryID, DBI.CustomerID, P.ProductID, P.ProductName, P.ProductStandardPrice
FROM DoesBusinessIn DBI, "Order" O, Order_Line OL, Product P
WHERE DBI.CustomerID=O.CustomerID AND O.OrderID=OL.OrderID AND OL.ProductID=P.ProductID
ORDER BY DBI.TerritoryID, DBI.CustomerID, P.ProductID;
/*SELECT * FROM View_CustomerData;*/

CREATE VIEW View_Shipment AS
SELECT C.CustomerState, COUNT(*) "#CustomersInState"
FROM Customer C
GROUP BY C.CustomerState;
/*SELECT * FROM View_Shipment;*/

CREATE VIEW View_PurchaseHistory AS
SELECT O.CustomerID, O.OrderDate, P.ProductName, OL.OrderedQuantity, P.ProductStandardPrice
FROM "Order" O, Product P, Order_Line OL
WHERE OL.OrderID=O.OrderID AND OL.ProductID=P.ProductID
ORDER BY O.CustomerID;
/*SELECT * FROM View_PurchaseHistory;*/

/*---End of Initialization---*/

/*---Start Question #1:Procedure---*/
/*-Drop to test Procedure-*/
/*ALTER TABLE Product DROP COLUMN SalePrice;*/
/*-Primary Code-*/
CREATE OR REPLACE PROCEDURE ProductLineSale AS
alter_error EXCEPTION;
pragma exception_init(alter_error, -01430);
BEGIN
    EXECUTE IMMEDIATE('ALTER TABLE Product ADD SalePrice DECIMAL(6,2)');
    EXECUTE IMMEDIATE('UPDATE Product P SET P.SalePrice=ProductStandardPrice*0.9 WHERE P.Productstandardprice >= 400');
    EXECUTE IMMEDIATE('UPDATE Product P SET P.SalePrice=ProductStandardPrice*0.85 WHERE P.Productstandardprice < 400');
    EXCEPTION WHEN alter_error THEN
    EXECUTE IMMEDIATE('UPDATE Product P SET P.SalePrice=ProductStandardPrice*0.9 WHERE Productstandardprice >= 400');
    EXECUTE IMMEDIATE('UPDATE Product P SET P.SalePrice=ProductStandardPrice*0.85 WHERE P.Productstandardprice < 400');
END;
/
/*-Test Procedure-*/
/*begin
ProductLineSale();
end;
/
SELECT * FROM Product P;
/*---End Question #1:Procedure---*/

/*---Start Question #2:Trigger---*/
/*-Primary Code-*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate 
AFTER UPDATE ON Product
FOR EACH ROW
DECLARE
    total_updates INT;
BEGIN
    SELECT COUNT(*) INTO total_updates FROM PriceUpdate PU;
    INSERT INTO PriceUpdate VALUES((total_updates+1), SYSDATE, :old.ProductStandardPrice, :new.ProductStandardPrice);
END;
/
/*-Test Trigger-*/
/*UPDATE Product P SET P.ProductStandardPrice=123 WHERE P.ProductId=1;
UPDATE Product P SET P.ProductStandardPrice=234 WHERE P.ProductId=2;
UPDATE Product P SET P.ProductStandardPrice=345 WHERE P.ProductId=2;
UPDATE Product P SET P.ProductStandardPrice=456 WHERE P.ProductId=3;
SELECT * FROM PriceUpdate PU;*/
/*---End Question #1:Procedure---*/

/*-----END-----*/