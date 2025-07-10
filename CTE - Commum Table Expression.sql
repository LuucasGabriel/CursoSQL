Use ContosoRetailDW;


With Analise_Produto(Ano, Mes,Id_Produto,Id_Name, Qtd) 
As
(
	Select 
		DATEPART(YEAR, S.DateKey) AS Ano,
		DATEPART(MONTH, S.DateKey) As Mes,
		S.ProductKey As Id_Produto, 
		P.ProductName As Id_Name, 
		SUM(S.SalesQuantity) As Qtd
	From FactSales S
	Inner Join DimProduct P On P.ProductKey = S.ProductKey
	Group By DATEPART(YEAR, S.DateKey),DATEPART(MONTH, S.DateKey),S.ProductKey, P.ProductName
)
 
Select 
	AVG(Qtd)
From Analise_Produto
