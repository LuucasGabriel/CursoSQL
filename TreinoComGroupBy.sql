Use ContosoRetailDW

Select top 10
	S.channelKey, S.PromotionKey, S.ProductKey
From FactSales As S
Where 
S.channelKey =	'1' And S.PromotionKey Between '10' and '20' And S.ProductKey Between '1212' and '2108'
Group By S.channelKey, S.PromotionKey, S.ProductKey
Order By S.channelKey, S.PromotionKey, S.ProductKey