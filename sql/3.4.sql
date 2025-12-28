SELECT l.LocationName,
    o.OccasionName,
    c.CustomerName,
    COUNT(*) AS Total_Reservations
FROM Fact_Reservations f
    JOIN Dim_Location l ON f.LocationDimID = l.LocationDimID
    JOIN Dim_Occasion o ON f.OccasionDimID = o.OccasionDimID
    JOIN Dim_Customer c ON f.CustomerDimID = c.CustomerDimID
GROUP BY ROLLUP (l.LocationName, o.OccasionName, c.CustomerName);