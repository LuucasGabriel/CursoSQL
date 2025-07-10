Use ContosoRetailDW


--Liste os produtos (ProductKey, EnglishProductName) cujas vendas totais foram maiores que a média de vendas de sua própria categoria.
							
SELECT P.ProductKey, P.ProductName, PC.ProductCategoryName, PC.ProductCategoryKey ,SUM(S.SalesAmount) AS TotalSales
FROM DimProduct P
INNER JOIN FactSales S ON P.ProductKey = S.ProductKey
INNER JOIN DimProductCategory PC ON P.ProductSubcategoryKey = PC.ProductCategoryKey
GROUP BY P.ProductKey, P.ProductName, PC.ProductCategoryName,PC.ProductCategoryKey, P.ProductSubcategoryKey
HAVING SUM(S.SalesAmount) > 
       (SELECT AVG(TotalSales) 
        FROM (SELECT Dp.ProductCategoryKey, SUM(F.SalesAmount) AS TotalSales
              FROM FactSales F
              INNER JOIN DimProduct P ON F.ProductKey = P.ProductKey
			  Inner Join DimProductCategory Dp On Dp.ProductCategoryKey = P.ProductKey 
              GROUP BY Dp.ProductCategoryKey) AS SubQuery
        WHERE SubQuery.ProductCategoryKey = PC.ProductCategoryKey)
		Order By TotalSales




SELECT Dp.ProductCategoryKey, SUM(F.SalesAmount) AS TotalSales
              FROM FactSales F
              INNER JOIN DimProduct P ON F.ProductKey = P.ProductKey
			  Inner Join DimProductCategory Dp On Dp.ProductCategoryKey = P.ProductKey 
              GROUP BY Dp.ProductCategoryKey 
			  Order By TotalSales