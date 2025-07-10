Use ContosoRetailDW

Select Top (100) With Ties 
	EmailAddress, 
	Gender, 
	MaritalStatus, 
	TotalChildren, 
	NumberCarsOwned,
	NumberChildrenAtHome  As 'Quantidade Carros', 
	Education
From DimCustomer
Where
	Education = 'High School'
	And NumberChildrenAtHome >= 1
	And  NumberCarsOwned > 2
	And not MaritalStatus = 'M'
	and (TotalChildren = 3 or TotalChildren = 4 ) -- O parenteses serve para ele entender que busque entre 3 ou 4 

Order By 2 Desc, 3 Desc, 4 Desc, [Quantidade Carros] Desc
