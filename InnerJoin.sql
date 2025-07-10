Use ContosoRetailDW

Select top 100 
	SalesKey, 
	DateKey, 
	DimChannel.ChannelKey,
	FactSales.channelKey, 
	DimChannel.ChannelName, 
	DimChannel. *
From FactSales
Inner Join DimChannel on DimChannel.ChannelKey = FactSales.channelKey

--Inner Join, pega dados que aparecem em ambas tabelas que contém chave primária