-- Fail
INSERT INTO Reservation ( CustomerID, ReservationDate, ReservationTime, Period, Occasion, Token, AccessCode)
VALUES ( 2, TO_DATE('2024-12-02', 'YYYY-MM-DD'), '03:00', 2, 4, 'TOKEN_FAIL', 'FAIL1' );