Use ContosoRetailDW

Select 
	S.channelKey, S.PromotionKey, C.ChannelName, P.PromotionName,
	Sum(S.SalesAmount) As 'Soma',
	Avg(S.SalesAmount) AS 'Média',
	Min(S.SalesAmount) AS 'Min',
	Max(S.SalesAmount) AS 'Max',
	Count(S.SalesAmount) AS 'Contagem'

From FactSales As S
Inner Join DimChannel As C On C.ChannelKey = S. channelKey
Inner Join DimPromotion AS P on P.PromotionKey = S.PromotionKey
Where	
	S.channelKey In(1,2) And 
	S.PromotionKey Between 1 And 5 And
	C.ChannelName = 'Store' And
	P.PromotionName Like '%N'
Group By S.channelKey, S.PromotionKey, C.ChannelName, P.PromotionName
Order By S.channelKey, S.PromotionKey, C.ChannelName, P.PromotionName 