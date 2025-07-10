Use ContosoRetailDW

Select  
	EmailAddress, 
	Gender, 
	MaritalStatus, 
	TotalChildren, 
	NumberCarsOwned,
	NumberChildrenAtHome  As 'Quantidade Carros', 
	Education
From DimCustomer
Where
	Education In ('High School', 'Partial High School', 'Partial College' )
	And NumberChildrenAtHome >= 1
	And  NumberCarsOwned >= 2
	And not MaritalStatus = 'M'
	And TotalChildren In (3,4) -- Tem a mesma função do OR 


	--Select Distinct Education from DimCustomer
