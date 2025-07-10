Use ContosoRetailDW

Select Distinct  
	FS.SalesKey, 
	FS.SalesAmount, 
	FS.ProductKey, 
	P.ProductName,
	P.ProductSubcategoryKey, 
	Sc.ProductSubcategoryName, 
	Pc.ProductCategoryName, 
	S.StoreKey,
	S.AddressLine1, 
	S.StorePhone, 
	PM.PromotionKey, 
	PM.PromotionDescription, 
	PM.PromotionName, 
	C.ChannelKey
From FactSales as FS
Inner Join DimProduct As P on P.ProductKey = FS.ProductKey
Inner Join DimProductSubcategory As SC On Sc.ProductSubcategoryKey = P.ProductSubcategoryKey
Inner Join DimProductCategory As PC on PC.ProductCategoryKey = Sc.ProductCategoryKey	
Inner Join DimStore As S on S.StoreKey = FS.StoreKey
Left Join DimPromotion AS PM on PM.PromotionKey = FS.PromotionKey
Left Join DimChannel As C on C.ChannelKey = FS.channelKey
Where ProductCategoryName = 'Cell phones'
