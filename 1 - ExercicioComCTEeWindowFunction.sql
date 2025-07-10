
Use ContosoRetailDW;

-- 1. Top 3 clientes com maior valor total de compras por região
-- Objetivo: Para cada região, listar os 3 clientes que mais gastaram (SUM(SalesAmount)), usando CTE + RANK().



With  Regiao (ID, NomeCliente, NomeRegiao, TotalVendas )
As(
Select 
	F.ProductKey As ID,
	C.FirstName As NomeCliente,
	G.RegionCountryName As NomeRegiao,
	Sum(F.SalesAmount) As TotalVendas
From FactSales F
Inner Join DimCustomer C On C.CustomerKey = F.ProductKey
Inner Join DimGeography G On G.GeographyKey = C.CustomerKey
Group By F.ProductKey,C.FirstName, G.RegionCountryName, F.SalesAmount 
), Total As(

Select 
	R.NomeRegiao,
	R.TotalVendas,
	Rank () Over(Partition By R.NomeRegiao Order By SUM(R.TotalVendas) Asc) As TotalPorRegiao
From Regiao R
Group By R.NomeRegiao, R.TotalVendas)

Select 
	T.*
From Total T
Where T.TotalPorRegiao <= 3