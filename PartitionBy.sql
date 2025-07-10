SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds] 
      ,[Bytes]
      ,[UnitPrice]
	  ,ROW_NUMBER() Over (Order by [Milliseconds] Asc) As 'Row_Number'
	  ,ROW_NUMBER() Over ( Partition By Composer Order by Milliseconds Asc) As 'Row_Number_Partition_By'
  FROM [Chinook].[dbo].[Track]
  Where Composer is not null