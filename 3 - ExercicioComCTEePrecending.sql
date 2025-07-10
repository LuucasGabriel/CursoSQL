--3. Evolução mensal de vendas por produto
--Objetivo: Mostrar a venda de cada produto por mês, e também a média móvel dos últimos 3 meses com SUM() + OVER (ORDER BY ROWS BETWEEN...)

WITH VendasMensais AS (
    SELECT 
        FS.ProductKey,
        P.ProductName,
        FORMAT(FS.DateKey, 'yyyy-MM') AS MesAno,
        SUM(FS.SalesAmount) AS TotalMes
    FROM FactSales FS
    INNER JOIN DimProduct P ON P.ProductKey = FS.ProductKey
    GROUP BY FS.ProductKey, P.ProductName, FORMAT(FS.DateKey, 'yyyy-MM')
),
MediaMovel AS (
    SELECT *,
           AVG(TotalMes) OVER (
               PARTITION BY ProductKey 
               ORDER BY MesAno 
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           ) AS MediaMovel3Meses
    FROM VendasMensais
)
SELECT *
FROM MediaMovel
ORDER BY ProductKey, MesAno;