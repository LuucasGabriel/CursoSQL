Use ContosoRetailDW

Select 
	S.channelKey, S.PromotionKey,
	Sum(S.SalesAmount) As 'Soma',
	Avg(S.SalesAmount) AS 'Média',
	Min(S.SalesAmount) AS 'Min',
	Max(S.SalesAmount) AS 'Max',
	Count(S.SalesAmount) AS 'Contagem'
From FactSales As S
Where	
	S.channelKey In(1,2) And 
	S.PromotionKey Between 1 And 5
Group By S.channelKey, S.PromotionKey
Order By S.channelKey, S.PromotionKey 