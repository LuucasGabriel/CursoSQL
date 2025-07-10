
--xercício 1: Média móvel de vendas por produto

--Objetivo: Calcular a média móvel de 3 meses para cada produto.

-- Use CTE para preparar os dados mensais, depois aplique AVG(...) OVER(...).

--Requisito: Liste os produtos (ProductKey, EnglishProductName), o mês (Month, Year), e a média móvel de 3 meses do SalesAmount.


Use ContosoRetailDW; 


With Produto (ID,NomeProduto, Mes, Ano, MesAno, TotalVendas )
As(
   SELECT 
        P.ProductKey,
        P.ProductName,
        FORMAT(D.Datekey, 'yyyy-MM') AS MesAno,
        YEAR(D.Datekey) AS Ano,
        MONTH(D.Datekey) AS Mes,
        SUM(S.SalesAmount) AS TotalMes
    FROM FactSales S
    INNER JOIN DimDate D ON D.DateKey = S.DateKey
    INNER JOIN DimProduct P ON P.ProductKey = S.ProductKey
    GROUP BY P.ProductKey, P.ProductName, FORMAT(D.Datekey, 'yyyy-MM'),
             YEAR(D.Datekey), MONTH(D.Datekey)
), MediaMovel
As(
Select 
	P2.*,
	AVG(P2.TotalVendas) Over(Partition By P2.ID Order By P2.Mes, P2.Ano Rows Between 2 Preceding And Current Row ) As 'Média Móvel de 3	Meses'
From Produto P2
)

Select
MM.*
From MediaMovel MM
Order By MM.ID, MM.Ano, MM.Mes