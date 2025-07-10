
Use ContosoRetailDW

--Top 5 Produtos com maior venda
Select top 5
	S.ProductKey,
	SUM(S.SalesAmount) As Soma
From FactSales S
Group By S.ProductKey
Order By Soma Desc

--Todas vendas dos Produtos com maior venda (top 5)
Select
	S2.*
From FactSales S2
Inner Join( 
	Select Top 5
		S.ProductKey, 
		SUM(S.SalesAmount) As Soma
	From FactSales S 
	Group By S.ProductKey
	Order By Soma desc
) As Top5 On Top5.ProductKey = S2.ProductKey


--validação top 5 
Select
	Distinct (Val.ProductKey)
From(
	Select
		S2.*
	From FactSales S2
	Inner Join( 
		Select Top 5
			S.ProductKey, 
			SUM(S.SalesAmount) As Soma
		From FactSales S 
		Group By S.ProductKey
		Order By Soma desc
	) As Top5 On Top5.ProductKey = S2.ProductKey
) As Val