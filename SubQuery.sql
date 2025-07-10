Use ContosoRetailDW

Select	
	AVG(P.UnitPrice), 
	P.ProductName
From DimProduct AS P
Group By P.UnitPrice, P.ProductName
Order BY P.UnitPrice, P.ProductName

Select	
	ProductKey,
	UnitPrice
From DimProduct
Where UnitPrice   <= (Select
					AVG(UnitPrice)
					From DimProduct
					)

