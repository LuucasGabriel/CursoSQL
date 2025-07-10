Use ContosoRetailDW

Select top 100
	S.SalesKey, 
	S.SalesAmount, 
	S.ProductKey, 
	P.ProductName,
	P.ProductSubcategoryKey, 
	Sc.ProductSubcategoryName, 
	Pc.ProductCategoryName
From FactSales as S
Inner Join DimProduct As P on P.ProductKey = S.ProductKey
Inner Join DimProductSubcategory As SC On Sc.ProductSubcategoryKey = P.ProductSubcategoryKey
Inner Join DimProductCategory As PC on PC.ProductCategoryKey = Sc.ProductCategoryKey