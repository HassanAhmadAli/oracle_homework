CREATE TABLE Fact_Reservations_Range (
    FactID NUMBER,
    TimeID NUMBER,
    LocationDimID NUMBER,
    CustomerDimID NUMBER,
    OccasionDimID NUMBER,
    ReservationDate DATE,
    Duration_Minutes NUMBER,
    Reservation_Count NUMBER
) PARTITION BY RANGE (ReservationDate) (
    PARTITION p_2022
    VALUES LESS THAN (TO_DATE('01-01-2023', 'DD-MM-YYYY')),
        PARTITION p_2023
    VALUES LESS THAN (TO_DATE('01-01-2024', 'DD-MM-YYYY')),
        PARTITION p_2024
    VALUES LESS THAN (TO_DATE('01-01-2025', 'DD-MM-YYYY')),
        PARTITION p_future
    VALUES LESS THAN (MAXVALUE)
);