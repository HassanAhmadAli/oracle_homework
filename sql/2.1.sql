SELECT l.Name,
    COUNT(*) AS ReservationCount
FROM Location l
    JOIN RestaurantTable rt ON l.LocationID = rt.LocationID
    JOIN ReservedTable rvt ON rt.TableID = rvt.TableID
GROUP BY l.Name
ORDER BY ReservationCount DESC
FETCH FIRST 2 ROWS ONLY;