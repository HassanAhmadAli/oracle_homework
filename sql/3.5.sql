SELECT t.Year,
    t.Month,
    COUNT(*) AS Monthly_Reservations,
    RANK() OVER (
        PARTITION BY t.Year
        ORDER BY COUNT(*) DESC
    ) AS Rank_In_Year
FROM Fact_Reservations f
    JOIN Dim_Time t ON f.TimeID = t.TimeID
GROUP BY t.Year,
    t.Month
ORDER BY t.Year,
    Rank_In_Year;