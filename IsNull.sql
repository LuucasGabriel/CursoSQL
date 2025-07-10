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
Where MaritalStatus Is Null





