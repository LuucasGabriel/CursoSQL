--Top 5 produtos mais vendidos e mostrar sua tabela inteira 
Select TOP 5
	S2.*
From FactSales S2
Inner Join (
	Select top 5 
			S.ProductKey, 
			SUM(S.SalesAmount) as Soma
		From FactSales S
		Group By S.ProductKey
		Order BY Soma Desc	
) As TOP5 On TOP5.ProductKey = S2.ProductKey


Select 
	S2.*
From FactSales S2
Inner Join(
	Select Top 10
		S.ProductKey, 
		Sum(S.SalesAmount) As Montante
	From FactSales S
	Group By S.ProductKey
	Order By Montante Desc
)  As Top10 on Top10.ProductKey = S2.ProductKey

Select
	Distinct(VAL.ProductKey)
From FactSales As S4
Inner Join (
		Select top 10
			S3.ProductKey, 
			SUM(S3.SalesAmount) AS Soma
		From FactSales S3
		Group By S3.ProductKey, S3.SalesAmount
		Order By Soma DESC
) As VAl on VAL.ProductKey = S4.ProductKey
