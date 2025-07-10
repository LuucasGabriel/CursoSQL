Use ContosoRetailDW

-- 1)Liste todas as vendas que possuem o maior valor de SalesAmount na tabela FactSales

Select 
	*
From FactSales S
where S.SalesAmount = (select MAX(SalesAmount) From FactSales)

-- Aqui eu estou selecionando tudo da tabela factsales, aonde o SalesAmount é igual ao valor maximo da tabaela factesales salesamount


--2) Liste os clientes (CustomerKey) que possuem pelo menos uma compra maior que a média de todas as vendas. 

SELECT DISTINCT 
	C.CustomerKey,
	C.FirstName, 
	S.SalesAmount
FROM FactSales S
Inner Join DimCustomer C on C.CustomerKey = S.ProductKey
WHERE S.SalesAmount > (SELECT AVG(SalesAmount) FROM FactSales)
Order By C.CustomerKey, S.SalesAmount  DESC

-- Aqui estou pegando as tabelas distintas do customerKey, name e SalesAmount da Factsales e dando um Inner join na Dimcustomer para puxar o CustumerKey
-- First name, aonde o S.SalesAmount é maior que a média do Salesamount da tabela factsales 


-- 3) Liste os produtos (ProductKey) que possuem um UnitPrice maior que a média de todos os produtos na tabela DimProduct.

Select 
	P.ProductKey, 
	C.CustomerKey, 
	C.FirstName,
	P.ProductName, 
	P.ProductDescription, 
	P.UnitPrice
From DimProduct P
Inner Join DimCustomer C on C.CustomerKey = P.ProductKey
where P.UnitPrice > (Select AVG(ProductKey) From DimProduct)
Order By P.UnitPrice DESC


--4) Liste as lojas (StoreKey, StoreName) que possuem um faturamento total maior que a média de faturamento de todas as lojas.

Select		
	S.StoreKey,
	S.StoreName, 
	S.StorePhone,
	S.AddressLine1
From DimStore S
Inner Join FactSales FS on FS.StoreKey = S.StoreKey
Group By S.StoreKey, S.StoreName, S.StorePhone, S.AddressLine1
Having SUM(FS.SalesAmount) > (Select AVG(Totalsales) From (Select StoreKey, SUM(SalesAmount) As Totalsales
															From FactSales
															Group By StoreKey) a )


-- 5) Liste os clientes (CustomerKey, FirstName, LastName) que compraram pelo menos um produto da categoria "Computers".

Select Distinct
	C.CustomerKey, 
	PC.ProductCategoryName,
	C.FirstName, 
	C.LastName
From DimCustomer C
Inner Join DimProductCategory PC On PC.ProductCategoryKey = C.CustomerKey
Where PC.ProductCategoryKey IN (Select PS.ProductCategoryKey From DimProductSubcategory PS
					  Inner Join DimProductCategory PC On PC.ProductCategoryKey = PS.ProductCategoryKey
					  Where PC.ProductCategoryName = 'Computers'  )




--6) 🔹 Liste os produtos (ProductKey, EnglishProductName) cujas vendas totais foram maiores que a média de vendas de sua própria categoria.

Select	
	
	P.ProductKey,
	P.ProductName

From DimProduct P
Inner Join FactSales S On S.ProductKey = P.ProductKey
Group By P.ProductKey, P.ProductName
Having SUM(S.SalesAmount) > (Select AVG(TotalVendas)
							 From (Select SUM(SalesAmount), ProductKey From DimProduct P) as TotalVendas)
							 Inner Join )a)