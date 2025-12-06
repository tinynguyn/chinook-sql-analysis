/* =========================================================
   PROJECT: Music Store Sales Analysis (Chinook)
   SCHEMA : Chinook_AutoIncrement
   AUTHOR : <Vu, Thi Thao Nguyen>
   ========================================================= */
   
   -- Top 5 genres with the highest revenue
   Select g.name, g.GenreId, Round(Sum(il.UnitPrice * il.Quantity), 2) As Revenue
   From Genre g
   Join Track t
   On g.GenreID = t.GenreID
   Join InvoiceLine il
   On t.TrackId = il.TrackId
   Group By g.Name, g.GenreId
   Order By Revenue DESC
   Limit 5;
   
   -- Top 5 genres with the lowest revenue
   Select g.name, g.GenreId, Round(Sum(il.UnitPrice * il.Quantity), 2) As Revenue
   From Genre g
   Join Track t
   On g.GenreID = t.GenreID
   Join InvoiceLine il
   On t.TrackId = il.TrackId
   Group By g.Name, g.GenreId
   Order By Revenue ASC
   Limit 5;
   
   -- Top 10 genres with the lowest revenue and their revenue per track
   Select 
		g.name, 
        g.GenreId, 
        Round(Sum(il.UnitPrice * il.Quantity), 2) As Revenue,
        Count(Distinct t.TrackId) As NumberTrack,
        Round(Sum(il.UnitPrice * il.Quantity)/ Count(Distinct t.TrackId), 2) As RevenuePerTrack
   From Genre g
   Join Track t
   On g.GenreID = t.GenreID
   Join InvoiceLine il
   On t.TrackId = il.TrackId
   Group By g.Name, g.GenreId
   Order By Revenue ASC
   Limit 10;
   
   -- Top 10 best-selling albums
   Select a.Title As Album , Sum(il.Quantity) As UnitsSold
   From Album a
   Join Track t
   On a.AlbumId = t.AlbumId
   Join InvoiceLine il
   On t.TrackId = il.TrackId
   Group By a.Title
   Order By UnitsSold DESC
   Limit 10;
   
   -- Top 10 artists with the highest revenue
   Select 
		ar.name,
        Round(Sum(il.UnitPrice * il.Quantity), 2) As Revenue
   From Artist ar
   Join Album a On ar.ArtistId = a.ArtistId
   Join Track t On a.AlbumId = t.AlbumId
   Join InvoiceLine il On t.TrackId = il.TrackId
   Group By ar.name
   Order By Revenue DESC
   Limit 10;
   
   -- Top 10 artists with the highest number of tracks sold
   Select 
		ar.name,
        Sum(il.Quantity) As Sold
   From Artist ar
   Join Album a On ar.ArtistId = a.ArtistId
   Join Track t On a.AlbumId = t.AlbumId
   Join InvoiceLine il On t.TrackId = il.TrackId
   Group By ar.name
   Order By Sold DESC
   Limit 10;
   
   -- Yearly revenue by genre and growth over the years
   With GenreYearlyRevenue As (
	   Select 
			g.Name As Genre,
			Round(Sum(il.Quantity * il.UnitPrice), 2) As Revenue,
            Year(i.InvoiceDate) As Year
	   From Genre g
	   Join Track t On g.GenreId = t.GenreId
	   Join InvoiceLine il On t.TrackId = il.TrackId
	   Join Invoice i On il.InvoiceId = i.InvoiceId
       Group By Genre, Year
	), 
    GenrePreRevenue As (
		Select
			Genre, 
            Year,
            Revenue,
            Lag(Revenue) Over (Partition By Genre Order By Year) As PreRevenue
		From GenreYearlyRevenue
	)
    Select
		Genre,
        Year, 
        Revenue,
        Round(100 * (Revenue - PreRevenue)/Prerevenue, 2) As GrowthRate
	From GenrePreRevenue
    Order By Genre, Year;
    
    -- Total revenue by country (which markets generate the most sales?)
	Select
		c.Country,
		ROUND(SUM(il.UnitPrice * il.Quantity), 2) As Revenue
	From Invoice i
	Join Customer c On i.CustomerId = c.CustomerId
	Join InvoiceLine il On i.InvoiceId = il.InvoiceId
	Group By c.Country
	Order By Revenue DESC;
    
    
    -- Top 10 customers by total revenue
	Select
		c.CustomerId,
		CONCAT(c.FirstName, ' ', c.LastName) As CustomerName,
		c.Country,
		ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue
	From Customer c
	Join Invoice i On c.CustomerId = i.CustomerId
	Join InvoiceLine il On i.InvoiceId = il.InvoiceId
	Group By c.CustomerId, CustomerName, c.Country
	Order By Revenue DESC
	Limit 10;
    
   
   