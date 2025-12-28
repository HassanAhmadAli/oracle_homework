SELECT AuditID,
    OperationDate,
    JSON_VALUE(OldValues_JSON, '$.CustomerID') AS Cust_ID,
    JSON_VALUE(OldValues_JSON, '$.ReservationTime') AS Old_Time,
    JSON_VALUE(NewValues_JSON, '$.ReservationTime') AS New_Time,
    JSON_VALUE(OldValues_JSON, '$.Period') AS Old_Period,
    JSON_VALUE(NewValues_JSON, '$.Period') AS New_Period
FROM Reservation_Audit
WHERE OperationType = 'UPDATE'
ORDER BY OperationDate DESC;