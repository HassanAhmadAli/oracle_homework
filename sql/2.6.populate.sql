INSERT INTO Reservation ( CustomerID, ReservationDate, ReservationTime, Period, Occasion, Instructions, Token, AccessCode )
VALUES ( 3, TO_DATE('2024-12-10', 'YYYY-MM-DD'), '20:00', 90, 4, 'Testing insert', 'TOKEN_INS', 'INS01' );
COMMIT;
-- Action: Update the instructions and period for that reservation
UPDATE Reservation
SET Instructions = 'Updated instructions!',
    Period = 120
WHERE CustomerID = 3
    AND ReservationDate = TO_DATE('2024-12-10', 'YYYY-MM-DD');
COMMIT;
-- Action: Delete the reservation
DELETE FROM Reservation
WHERE CustomerID = 3
    AND ReservationDate = TO_DATE('2024-12-10', 'YYYY-MM-DD');
COMMIT;