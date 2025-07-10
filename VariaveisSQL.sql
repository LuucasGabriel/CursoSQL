

Declare @Usuario Varchar(30)

Set @Usuario = 'Roberto Carlos'

Select @Usuario As Name


---------------------------------

Use ContosoRetailDW

Declare @Prod Int
Set @Prod = 782

Select Top 1000 * From FactOnlineSales 
Where ProductKey = @Prod

-- Declare serve para declarar uma variavel aonde é usada com um nome setado 
