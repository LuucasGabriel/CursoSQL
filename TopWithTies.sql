Use ContosoRetailDW

Select Top (10) With Ties 
	EmailAddress, 
	Gender, 
	MaritalStatus, 
	TotalChildren, 
	NumberCarsOwned,
	NumberChildrenAtHome  As 'Quantidade Carros', 
	Education
From DimCustomer
Order By 2 Desc, 3 Desc, 4 Desc, [Quantidade Carros] Desc