CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
MemberID INT
);

CREATE TABLE Member (
MemberID INT PRIMARY KEY,
Discount DECIMAL(5,2),
JoinDate DATE,
ExpiryDate DATE
);

CREATE TABLE RestaurantTable (
TableNumber INT PRIMARY KEY,
Capacity INT
);

CREATE TABLE Dish (
DishName VARCHAR(50) PRIMARY KEY,
Description VARCHAR(100),
Price DECIMAL(8,2)
);


CREATE TABLE Staff (
StaffID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
Wage DECIMAL(10,2),
ManagerID INT,
Department VARCHAR(50),
HireDate DATE
);

CREATE TABLE RestaurantOrder (
OrderID INT PRIMARY KEY,
OrderDatetime DATETIME,
CustomerID INT,
StaffID INT,
TableNumber INT
);

CREATE TABLE OrderedDish (
OrderID INT,
DishName VARCHAR(50),
Quantity INT,
PRIMARY KEY (OrderID, DishName)
);

CREATE TABLE Supplier (
SupplierID INT PRIMARY KEY,
Name VARCHAR(50),
Phone VARCHAR(15)
);

CREATE TABLE Ingredient (
IngredientID INT PRIMARY KEY,
IngredientName VARCHAR(50)
);

CREATE TABLE IngredientsUsed (
IngredientID INT,
DishName VARCHAR(50),
Quantity DECIMAL(5,2),
PRIMARY KEY (IngredientID, DishName)
);

CREATE TABLE IngredientsSupplied (
IngredientID INT,
SupplierID INT,
Quantity DECIMAL(5,2),
PRIMARY KEY (IngredientID, SupplierID)
);

CREATE TABLE Receipt (
ReceiptID INT PRIMARY KEY,
Amount DECIMAL(10,2),
SaleDatetime DATETIME,
PaymentMethod VARCHAR(20),
OrderID INT
);