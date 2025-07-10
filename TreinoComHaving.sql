Use ContosoRetailDW 

Select
	S.ProductKey, 
	P.PromotionName,
	Sum(S.SalesQuantity) As Qtd
From FactSales S, DimPromotion P
Where P.PromotionName like '%A%'
Group By S.ProductKey, P.PromotionName
Having Sum(S.SalesQuantity) > 9000
Order By Qtd desc


