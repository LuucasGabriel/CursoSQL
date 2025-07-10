
Use PRIMEIRO_BD

Update CLIENTES
Set EMAIL = 'lucasGabriel@gmail.com'
Where ID_CLIENTE = 1

Update CLIENTES
Set 
	NOME = 'Gabriel Lucas',
	EMAIL = 'gabriellucas@gmail.com'
Where 
	ID_CLIENTE = 2

Update CLIENTES
Set 
	NOME = 'Lucas Gabriel Silva ',
	EMAIL = 'LucasGabrielSilva@gmail.com'
Where 
	ID_CLIENTE = 3


SELECT TOP (1000) [ID_CLIENTE]
      ,[NOME]
      ,[DATA_CADASTRO]
      ,[EMAIL]
  FROM [PRIMEIRO_BD].[dbo].[CLIENTES]
