Use ContosoRetailDW

Select   
	G.CityName,
	ST.StoreName, 
	Sum(S.SalesQuantity) As 'Quantidade Total' 
From FactSales As S 
Inner Join DimStore As ST on ST.StoreKey = S.StoreKey 
Inner Join DimGeography as G On G.GeographyKey = ST.GeographyKey
Group By G.CityName, ST.StoreName
With Rollup --Mostra a soma total 