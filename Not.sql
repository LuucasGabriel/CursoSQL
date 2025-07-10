Use ContosoRetailDW

Select  
	EmailAddress As	'Endereço de Email',
	Gender, 
	MaritalStatus, 
	TotalChildren, 
	NumberCarsOwned,
	NumberChildrenAtHome  As 'Quantidade de Filhos em Casa', 
	Education, 
	BirthDate
From DimCustomer
Where
	MaritalStatus Is Not Null
	--And TotalChildren >= 2 And TotalChildren <= 4 
	And Not TotalChildren Between 2 And 4
	And Not BirthDate BetWeen '1950-01-01' And '1960-01-02'
	And NumberChildrenAtHome Not In (0, 1, 5)
Order By BirthDate Desc 





