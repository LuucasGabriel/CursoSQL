

SELECT [TrackId]
      ,[Name]
      ,[AlbumId] 
      ,[Milliseconds]
	  ,[GenreId]
      ,[UnitPrice]
	  , ROW_NUMBER() Over (Order by UnitPrice Asc) As 'Row_Number'
	  , RANK() Over (Order By UnitPrice Asc)	As 'Rank'
	  , Dense_RANK() Over (Order By UnitPrice Asc)	As 'Dense_Rank'
	  , NTILE(12) Over(Partition By GenreID Order BY UnitPrice ASC ) As 'NTILE' --Ele divide  UnitPrice por 12 e cria 12 Grupos para classifcação
  FROM [Chinook].[dbo].[Track]
