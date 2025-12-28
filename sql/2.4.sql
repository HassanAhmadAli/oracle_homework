CREATE OR REPLACE TRIGGER CalculateReservationEnd BEFORE
INSERT
    OR
UPDATE ON Reservation FOR EACH ROW
DECLARE v_start_timestamp DATE;
v_end_timestamp DATE;
BEGIN IF :NEW.ReservationTime IS NOT NULL
AND :NEW.Period IS NOT NULL THEN v_start_timestamp := TO_DATE(
    TO_CHAR(:NEW.ReservationDate, 'YYYY-MM-DD') || ' ' || :NEW.ReservationTime,
    'YYYY-MM-DD HH24:MI'
);
v_end_timestamp := v_start_timestamp + (:NEW.Period / 1440);
:NEW.ReservationEndDate := TRUNC(v_end_timestamp);
:NEW.ReservationEndTime := TO_CHAR(v_end_timestamp, 'HH24:MI');
END IF;
EXCEPTION
WHEN OTHERS THEN NULL;
END;