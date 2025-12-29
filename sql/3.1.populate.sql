CREATE OR REPLACE PROCEDURE Load_Reservation_DW AS BEGIN -- Step 1: Clear existing data (for a full refresh)
    EXECUTE IMMEDIATE 'TRUNCATE TABLE Fact_Reservations';
EXECUTE IMMEDIATE 'TRUNCATE TABLE Dim_Time';
EXECUTE IMMEDIATE 'TRUNCATE TABLE Dim_Location';
EXECUTE IMMEDIATE 'TRUNCATE TABLE Dim_Customer';
EXECUTE IMMEDIATE 'TRUNCATE TABLE Dim_Occasion';
-- Step 2: Populate Dimension Tables
-- Populate Dim_Customer
INSERT INTO Dim_Customer (
        CustomerDimID,
        OriginalCustomerID,
        CustomerName,
        PhoneNumber,
        Email
    )
SELECT CustomerID,
    CustomerID,
    C_Name,
    PhoneNumber,
    Email
FROM Customer;
-- Populate Dim_Occasion
INSERT INTO Dim_Occasion (OccasionDimID, OccasionName)
SELECT Occasion,
    Description
FROM Occasion;
-- Populate Dim_Location (joining RestaurantTable and Location)
INSERT INTO Dim_Location (LocationDimID, TableID, LocationName, SpotNumber)
SELECT rt.TableID,
    rt.TableID,
    l.Name,
    rt.Spot
FROM RestaurantTable rt
    JOIN Location l ON rt.LocationID = l.LocationID;
-- Populate Dim_Time with a range of dates
-- (This is a simplified example; a full time dimension is often pre-populated for many years)
INSERT INTO Dim_Time (
        TimeID,
        FullDate,
        Year,
        Quarter,
        Month,
        Week,
        Day,
        DayOfWeek
    )
SELECT ROWNUM,
    d.FullDate,
    TO_NUMBER(TO_CHAR(d.FullDate, 'YYYY')),
    TO_NUMBER(TO_CHAR(d.FullDate, 'Q')),
    TO_NUMBER(TO_CHAR(d.FullDate, 'MM')),
    TO_NUMBER(TO_CHAR(d.FullDate, 'IW')),
    TO_NUMBER(TO_CHAR(d.FullDate, 'DD')),
    TO_CHAR(d.FullDate, 'Day')
FROM (
        SELECT DISTINCT ReservationDate AS FullDate
        FROM Reservation
    ) d;
-- Step 3: Populate the Fact Table
INSERT INTO Fact_Reservations (
        TimeID,
        LocationDimID,
        CustomerDimID,
        OccasionDimID,
        Duration_Minutes
    )
SELECT dt.TimeID,
    dl.LocationDimID,
    dc.CustomerDimID,
    do.OccasionDimID,
    r.Period AS Duration_Minutes
FROM Reservation r
    JOIN ReservedTable rt ON r.CustomerID = rt.CustomerID
    AND r.ReservationDate = rt.ReservationDate
    JOIN Dim_Time dt ON r.ReservationDate = dt.FullDate
    JOIN Dim_Location dl ON rt.TableID = dl.TableID
    JOIN Dim_Customer dc ON r.CustomerID = dc.OriginalCustomerID
    JOIN Dim_Occasion do ON r.Occasion = do.OccasionDimID;
COMMIT;
DBMS_OUTPUT.PUT_LINE('Data Warehouse load complete.');
EXCEPTION
WHEN OTHERS THEN ROLLBACK;
DBMS_OUTPUT.PUT_LINE('Error during DW load: ' || SQLERRM);
END;