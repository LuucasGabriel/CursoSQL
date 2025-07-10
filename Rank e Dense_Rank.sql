

SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[Milliseconds] 
      ,[UnitPrice]
	  ,ROW_NUMBER() Over (Order by UnitPrice Asc) As 'Row_Number'
	  , RANK() Over (Order By UnitPrice Asc)	As 'Rank'
	  , Dense_RANK() Over (Order By UnitPrice Asc)	As 'Dense_Rank'

  FROM [Chinook].[dbo].[Track]
