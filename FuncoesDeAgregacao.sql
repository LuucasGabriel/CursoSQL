Use ContosoRetailDW
--Select
Select 
	SalesAmount
From FactSales
--Somando
Select
	Sum(SalesAmount) As Soma
From FactSales
--M�dia
Select
	Avg(SalesAmount) As M�dia
From FactSales
--Contagem 
Select
	Count(SalesAmount) As QtdLinhas 
From FactSales
--Maximo
Select
	Max(SalesAmount) As Maximo
From FactSales
--Minimo
Select
	Min(SalesAmount) As Minimo
From FactSales

--Media V2
Select
	Sum(SalesAmount)/Count(SalesAmount) As M�dia_V2
From FactSales

Select 
	AVG(SalesAmount)
From FactSales