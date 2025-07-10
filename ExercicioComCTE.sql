Use ContosoRetailDW;

-- 1 Liste os produtos (ProductKey, EnglishProductName) que tiveram um faturamento maior que a média geral de vendas.
-- Desafio: Modifique a query para considerar apenas vendas de 2009.

With Faturamento(ANO,P, N, TotalSales)
As(
	Select 
		DATEPART(YEAR, F.DateKey) ANO,
		P.ProductKey As P, 
		P.ProductName As N, 
		SUM(F.SalesAmount) As TotalSales 
	From DimProduct P
	Inner Join FactSales F On F.ProductKey =  P.ProductKey
	Group By P.ProductKey, P.ProductName, DATEPART(YEAR, F.DateKey)
	Having Sum(SalesAmount) > (Select AVG(SalesAmount) AS T From FactSales)
	)

Select
	F.*,
	F.ANO
From Faturamento F 
Where ANO = '2009'	
Order By TotalSales Desc


