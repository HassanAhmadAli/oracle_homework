SELECT *
FROM (
        SELECT o.OccasionName,
            l.LocationName
        FROM Fact_Reservations f
            JOIN Dim_Occasion o ON f.OccasionDimID = o.OccasionDimID
            JOIN Dim_Location l ON f.LocationDimID = l.LocationDimID
    ) PIVOT (
        COUNT(LocationName) FOR LocationName IN (
            'Seaside Grill',
            'Mountain View Steakhouse',
        )
    )
ORDER BY OccasionName;