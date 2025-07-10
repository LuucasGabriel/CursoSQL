Use ContosoRetailDW

Select 
	COUNT(Distinct(ProductKey))
From DimProduct

Select 
	COUNT(Distinct(ProductKey))
From FactSales


Select Distinct
	P.ProductKey,
	P.ProductName, 
	S.ProductKey As 'S.ProductKey'
From DimProduct as P
Left Join FactSales as S on S.ProductKey = P.ProductKey 
Order BY 3 

