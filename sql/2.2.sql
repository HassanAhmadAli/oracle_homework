CREATE OR REPLACE TRIGGER PreventLateNightReservations BEFORE
INSERT ON Reservation FOR EACH ROW
DECLARE v_hour NUMBER;
BEGIN v_hour := TO_NUMBER(SUBSTR(:NEW.ReservationTime, 1, 2));
IF v_hour >= 2
AND v_hour < 10 THEN RAISE_APPLICATION_ERROR(
    -20001,
    'Reservations are not allowed between 2:00 AM and 10:00 AM.'
);
END IF;
EXCEPTION
WHEN VALUE_ERROR THEN RAISE_APPLICATION_ERROR(
    -20002,
    'Invalid time format. Please use HH24:MI.'
);
END;