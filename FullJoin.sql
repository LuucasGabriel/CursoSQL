Use ContosoRetailDW
Select Distinct
	P.ProductKey,
	P.ProductName, 
	S.ProductKey As 'S.ProductKey'
From DimProduct as P
Full Join FactSales as S on S.ProductKey = P.ProductKey 
Order BY 3 Asc