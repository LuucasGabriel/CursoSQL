
Use BikeStores;

Select
	P.CategoryID,
	Count(*) As TotalProdutosCategoria 
From Production.Product P
Group By P.CategoryID


Select
	P.CategoryID,
	Count(*) As TotalProdutosCategoria 
From Production.Product P
Group By P.BrandID, P.CategoryID;



With TotalPorCategoria As 
(
	Select
	P.CategoryID,
	Count(*) As TotalProdutos 
From Production.Product P
Group By P.CategoryID

)

Select 
	P.CategoryID,
	P.BrandID,
	Count(*) As TotalProdutos, 
	TC.TotalProdutos as TotalCategoria , 
	Count(*)*100.0/TC.TotalProdutos As 'Percent'
	From Production.Product P
Inner Join TotalPorCategoria TC on TC.CategoryID = P.CategoryID
Group By P.CategoryID, P.BrandID, TC.TotalProdutos;



--Usando Window Function para Agregar 

With TotalProdutosCategoria AS 
(
Select
	P.CategoryID,
	P.BrandID,
	Count(*) As TotalProdutos 
From Production.Product P
Group By P.BrandID, P.CategoryID
)

Select 
	*, 
	Sum(TotalProdutos) Over (Partition BY CategoryID) As TotalBikesCategoria,
	TotalProdutos*100.0/ Sum(TotalProdutos) Over (Partition BY CategoryID) As 'Percent'
From TotalProdutosCategoria