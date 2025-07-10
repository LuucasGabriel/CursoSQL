Use ContosoRetailDW

--Buscando Nome Completo
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like 'Aaron Painter'

--Começa Com Aaron
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like 'Aaron%'


--Termina com Allen
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like '%allen'


--Começa Com Michel
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like '%Michael%'


--Começa Com Nur__
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like 'Nur%'

--termina com nur
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like '%nev__'

--Contem com 'gon[zs]ale[zs]' ===>>>> [sz] 's' ou 'z'
Select
	FirstName + ' ' + LastName As 'Nome Completo',
	* 
From DimEmployee
Where FirstName + ' ' + LastName Like '%gon[zs]ale[zs]%'