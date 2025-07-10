Use ContosoRetailDW

Select top 100 
	S.SalesKey, 
	S.DateKey, 
	C.ChannelKey,
	S.channelKey, 
	C.ChannelName, 
	C. *
From FactSales As S
Inner Join DimChannel As C on C.ChannelKey = S.channelKey