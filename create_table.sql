CREATE TABLE `walmart_data`.`categories`(
    `CategoryID` INT,
    `CategoryName` VARCHAR(50),
    PRIMARY KEY(`CategoryID`)
);

CREATE TABLE `walmart_data`.`products`(
    `ProductID` INT,
    `ProductName` VARCHAR(100),
    `Price` INT,
    `CategoryID` INT,
    `Class` VARCHAR(50),
    `ModifyDate` DATE,
    `Resistant` VARCHAR(50),
    `IsAllergic` VARCHAR(50),
    `VitalityDays` INT,
    PRIMARY KEY(`ProductID`),
    FOREIGN KEY(`CategoryID`) REFERENCES `walmart_data`.`categories`(`CategoryID`)
);

CREATE TABLE `walmart_data`.`countries`(
    `CountryID` INT,
    `CountryName` VARCHAR(50),
    `CountryCode` VARCHAR(50),
    PRIMARY KEY(`CountryID`)
);

CREATE TABLE `walmart_data`.`cities`(
    `CityID` INT,
    `CityName` VARCHAR(50),
    `Zipcode` VARCHAR(50),
    `CountyID` INT,
    PRIMARY KEY(`CityID`),
    FOREIGN KEY(`CountyID`) REFERENCES `walmart_data`.`countries`(`CountryID`)
);

CREATE TABLE `walmart_data`.`customers`(
    `CustomerID` INT,
    `FirstName`	VARCHAR(50),
    `MiddleInitial`	VARCHAR(10),
    `LastName` VARCHAR(50),
    `CityID` INT,
    `Address` VARCHAR(100),
    PRIMARY KEY(`CustomerID`),
    FOREIGN KEY(`CityID`) REFERENCES `walmart_data`.`cities`(`CityID`)
);

CREATE TABLE `walmart_data`.`employees`(
    `EmployeeID` INT,
    `FirstName` VARCHAR(50),
    `MiddleInitial`	VARCHAR(10),
    `LastName` VARCHAR(50),
    `BirthDate` DATE,
    `Gender` VARCHAR(50),
    `CityID` INT,
    `HireDate` DATE,
    PRIMARY KEY(`EmployeeID`),
    FOREIGN KEY(`CityID`) REFERENCES `walmart_data`.`cities`(`CityID`)
);

CREATE TABLE `walmart_data`.`sales`(
    `SalesID` INT,
    `SalesPersonID` INT,
    `CustomerID` INT,
    `ProductID` INT,
    `Quantity` INT,
    `Discount` INT,
    `TotalPrice` INT,
    `SalesDate` DATE,
    `TransactionNumber` VARCHAR(50),
    PRIMARY KEY(`SalesID`),
    FOREIGN KEY(`SalesPersonID`) REFERENCES `walmart_data`.`employees`(`EmployeeID`),
    FOREIGN KEY(`CustomerID`) REFERENCES `walmart_data`.`customers`(`CustomerID`),
    FOREIGN KEY(`ProductID`) REFERENCES `walmart_data`.`products`(`ProductID`)
);

UPDATE `walmart_data`.`sales`
SET `Discount` = CASE
WHEN RAND() < 0.25 THEN 0
WHEN RAND() < 0.50 THEN 5
WHEN RAND() < 0.75 THEN 10
ELSE 20
END

ALTER TABLE `walmart_data`.`sales`
DROP COLUMN `TotalPrice`
