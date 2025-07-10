Use ContosoRetailDW

Select Distinct
	P.ProductKey,
	S.ProductKey As 'S.ProductKey'
From DimProduct as P
Cross Join FactSales as S 