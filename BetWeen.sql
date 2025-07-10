Use ContosoRetailDW

Select  
	EmailAddress As	'Endereço de Email',
	Gender, 
	MaritalStatus, 
	TotalChildren, 
	NumberCarsOwned,
	NumberChildrenAtHome  As 'Quantidade Carros', 
	Education
From DimCustomer
Where
	MaritalStatus Is Not Null
	--And TotalChildren >= 2 And TotalChildren <= 4 
	And TotalChildren Between 2 And 4
	And BirthDate BetWeen '1950-01-01' And '1960-01-02'
Order By BirthDate Desc 





