

Declare @User Varchar(30)

Set @User = 'Maria Maria'
-------------------------
Select @User, Len(@User), RTRIM(@User), LTRIM(@User), TRIM(@User), UPPER(TRIM(@User)), LOWER(TRIM(@User))


