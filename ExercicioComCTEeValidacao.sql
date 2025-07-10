Use ContosoRetailDW;

-- 2) Liste os clientes (CustomerKey, FirstName, LastName) que fizeram mais compras que a média de compras dos clientes.
-- Desafio: Inclua a cidade do cliente (CustomerCity) e ordene pelo número de compras.

With Compras(C, F, L, P, R, QTD_Compras)
As(
	Select 
		C.CustomerKey As C, 
		C.FirstName As F, 
		C.LastName As L, 
		F.ProductKey As P,
		G.CityName As CT,
		Count(F.SalesQuantity) As QTD_Compras
	From DimCustomer C
	Inner Join FactSales F On F.ProductKey = C.CustomerKey
	Inner Join DimGeography G On G.GeographyKey = C.GeographyKey
	Group By C.CustomerKey, C.FirstName, C.LastName, F.ProductKey, G.CityName
	Having Count(F.SalesQuantity) > (Select AVG(SalesQuantity) From FactSales)
	)

Select
	Cp.*
From Compras Cp
Order by QTD_Compras DESC

--Validação
Select 
	Count(F.SalesQuantity), 
	F.ProductKey
From FactSales F
Group BY F.ProductKey
Having Count(F.SalesQuantity) > AVG(F.SalesQuantity)
order by Count(F.SalesQuantity) Desc