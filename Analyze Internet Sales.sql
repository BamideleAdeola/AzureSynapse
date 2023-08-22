
-- Internet sales totals for each year
 SELECT  d.CalendarYear AS Year,
         SUM(i.SalesAmount) AS InternetSalesAmount
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 GROUP BY d.CalendarYear
 ORDER BY Year;


 -- Adding more granularity
  SELECT  d.CalendarYear AS Year,
         d.MonthNumberOfYear AS Month,
         SUM(i.SalesAmount) AS InternetSalesAmount
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 GROUP BY d.CalendarYear, d.MonthNumberOfYear
 ORDER BY Year, Month;

 -- Adding geography to the previous query using 2 multiple joins
  SELECT  d.CalendarYear AS Year,
         g.EnglishCountryRegionName AS Region,
         SUM(i.SalesAmount) AS InternetSalesAmount
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
 JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
 GROUP BY d.CalendarYear, g.EnglishCountryRegionName
 ORDER BY Year, Region;


-- Yearly regional sales by product category
  SELECT  d.CalendarYear AS Year,
         pc.EnglishProductCategoryName AS ProductCategory,
         g.EnglishCountryRegionName AS Region,
         SUM(i.SalesAmount) AS InternetSalesAmount
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
 JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
 JOIN DimProduct AS p ON i.ProductKey = p.ProductKey
 JOIN DimProductSubcategory AS ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
 JOIN DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
 GROUP BY d.CalendarYear, pc.EnglishProductCategoryName, g.EnglishCountryRegionName
 ORDER BY Year, ProductCategory, Region;


/*
USING RANKING FUNCTION
*/

 SELECT  g.EnglishCountryRegionName AS Region,
         ROW_NUMBER() OVER(PARTITION BY g.EnglishCountryRegionName
                           ORDER BY i.SalesAmount ASC) AS RowNumber,
         i.SalesOrderNumber AS OrderNo,
         i.SalesOrderLineNumber AS LineItem,
         i.SalesAmount AS SalesAmount,
         SUM(i.SalesAmount) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionTotal,
         AVG(i.SalesAmount) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionAverage
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
 JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
 WHERE d.CalendarYear = 2022
 ORDER BY Region;


 -- USING A GROUP BY IN A WINDOWING FUNCTION

  SELECT  g.EnglishCountryRegionName AS Region,
         g.City,
         SUM(i.SalesAmount) AS CityTotal,
         SUM(SUM(i.SalesAmount)) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionTotal,
         RANK() OVER(PARTITION BY g.EnglishCountryRegionName
                     ORDER BY SUM(i.SalesAmount) DESC) AS RegionalRank
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
 JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
 GROUP BY g.EnglishCountryRegionName, g.City
 ORDER BY Region;

-- The results include a row for each city, grouped by region.
-- The total sales (sum of individual sales amounts) is calculated for each city
-- The regional sales total (the sum of the sum of sales amounts for each city in the region) is calculated based on the regional partition.
-- The rank for each city within its regional partition is calculated by ordering the total sales amount per city in descending order.

--RETRIEVING AN APPROXIMATE COUNT
 SELECT d.CalendarYear AS CalendarYear,
     COUNT(DISTINCT i.SalesOrderNumber) AS Orders
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 GROUP BY d.CalendarYear
 ORDER BY CalendarYear; 

-- APPROX_COUNT_DISTINCT total execution time is lower than the normal count
  SELECT d.CalendarYear AS CalendarYear,
     APPROX_COUNT_DISTINCT(i.SalesOrderNumber) AS Orders
 FROM FactInternetSales AS i
 JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
 GROUP BY d.CalendarYear
 ORDER BY CalendarYear;
