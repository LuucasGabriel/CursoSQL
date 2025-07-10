--Exercício 2: Classificação de vendas por cliente

--Objetivo: Atribuir uma classificação para os clientes com base no total de vendas.

 -- Use ROW_NUMBER() ou RANK() com CTE.

-- Requisito: Liste os 5 clientes que mais compraram (CustomerKey, TotalVendas) usando RANK() e traga apenas os top 5.

Use ContosoRetailDW; 

With TopClientes ( Nome, ID, TotalVendas)
As(
Select 
	C.FirstName Nome,
	C.CustomerKey ID,
	SUM(F.SalesAmount) TotalVendas
From FactSales F
Inner Join DimStore S On S.StoreKey = F.StoreKey
Inner Join DimGeography G On G.GeographyKey = S.GeographyKey
Inner Join DimCustomer C On C.GeographyKey = G.GeographyKey
Group By C.CustomerKey, C.FirstName
)

Select Top 5 
	TC.*,
	Rank() Over( Order By TC.TotalVendas DESC) AS 'Top 5 Clientes'
From TopClientes TC



