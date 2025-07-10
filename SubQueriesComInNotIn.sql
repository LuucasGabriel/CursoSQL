

--IN

Select
	* 
From FactSales As S
Where S.ProductKey In (
Select	
	ProductKey
From DimProduct
Where UnitPrice  <= (Select AVG(UnitPrice) From DimProduct))
Order By UnitPrice Desc

--Not IN

Select
	* 
From FactSales As S
Where S.ProductKey Not In (
Select	
	ProductKey
From DimProduct
Where UnitPrice  <= (Select AVG(UnitPrice) From DimProduct))
Order By UnitPrice Asc