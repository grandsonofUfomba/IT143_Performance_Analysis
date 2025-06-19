-- Performance Analysis Script: W6.4
-- Purpose: Identify missing index, create the recommended index, and compare performance.

USE AdventureWorks2014;
GO

-- Step 1: Run original query (with execution plan enabled manually in SSMS)
-- Press Ctrl+M before running this block to include actual execution plan
SELECT c.CustomerID, c.AccountNumber, s.Name
FROM Sales.Customer c
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
WHERE s.Name = 'Advanced Bike Components';
GO

-- Step 2: After running the above, right-click on the "Missing Index" text in the execution plan
-- and select "Missing Index Details" to generate the recommendation.
-- Below is a typical example of the index SQL (adjust index name as needed):

-- Step 3: Create the missing index
CREATE NONCLUSTERED INDEX IX_Store_Name
ON Sales.Store ([Name])
INCLUDE ([BusinessEntityID]);
GO

-- Step 4: Re-run the same query to compare estimated subtree cost and runtime
SELECT c.CustomerID, c.AccountNumber, s.Name
FROM Sales.Customer c
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
WHERE s.Name = 'Advanced Bike Components';
GO
