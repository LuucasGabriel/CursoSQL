Use ContosoRetailDW

Select   
	S.ProductKey, 
	Sum(S.SalesQuantity) As 'Quantidade Total' 
From FactSales As S 
Where S.DateKey >= '2009-01-01' 
Group By S.ProductKey
Having Sum(S.SalesQuantity) Between 1500 And 1600
Order By 'Quantidade Total' Desc
