Use BikeStores

Select 
	P.CategoryID, 
	P.BrandID, 
	P.ProductID, 
	P.Name, 
	P.ListPrice,
	Count(*) Over() As Produtos, 
	COUNT(*) Over(Partition By P.BrandID) As Produtos_Brnad, 
	Sum(P.ListPrice) Over() AS Soma_Precos, 
	Sum(P.ListPrice) Over(Partition By P.BrandID) AS Soma_Brand, 
	AVG(P.ListPrice) Over() As Precos_AVG, 
	MAX(P.ListPrice) Over() AS Precos_MAX,
	MIN(P.ListPrice) Over() AS Precos_MIN

From Production.Product P
Where P.CategoryID = 1
Order BY BrandID