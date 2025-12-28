INSERT INTO Customer (CustomerID, C_Name, PhoneNumber, Email) VALUES (1, 'John Smith', '555-0101', 'john.smith@email.com');
INSERT INTO Customer (CustomerID, C_Name, PhoneNumber, Email) VALUES (2, 'Jane Doe', '555-0102', 'jane.doe@email.com');
INSERT INTO Customer (CustomerID, C_Name, PhoneNumber, Email) VALUES (3, 'Hassan Ali', '555-0103', 'hassan.ali@email.com');
INSERT INTO Location (LocationID, Name, Description) VALUES (10, 'Seaside Grill', 'A beautiful restaurant with an ocean view.');
INSERT INTO Location (LocationID, Name, Description) VALUES (20, 'Mountain View Steakhouse', 'A cozy spot in the mountains.');
INSERT INTO Occasion (Occasion, Description) VALUES (1, 'Birthday');
INSERT INTO Occasion (Occasion, Description) VALUES (2, 'Anniversary');
INSERT INTO Occasion (Occasion, Description) VALUES (3, 'Business Dinner');
INSERT INTO Occasion (Occasion, Description) VALUES (4, 'Casual Dining');
INSERT INTO ParkingSpace (SpaceID, LotNumber, vehicleSize) VALUES (101, 1, 'Standard');
INSERT INTO ParkingSpace (SpaceID, LotNumber, vehicleSize) VALUES (102, 1, 'Large');
INSERT INTO ParkingSpace (SpaceID, LotNumber, vehicleSize) VALUES (201, 2, 'Standard');
INSERT INTO RestaurantTable (TableID, R_Row, Spot, LocationID) VALUES (1001, 1, 1, 10);
INSERT INTO RestaurantTable (TableID, R_Row, Spot, LocationID) VALUES (1002, 1, 2, 10);
INSERT INTO RestaurantTable (TableID, R_Row, Spot, LocationID) VALUES (2001, 1, 1, 20);
INSERT INTO RestaurantTable (TableID, R_Row, Spot, LocationID) VALUES (2002, 1, 2, 20);
INSERT INTO Reservation (CustomerID, ReservationDate, ReservationTime, Period, Occasion, Instructions, Token, AccessCode, ReservationEndTime, ReservationEndDate) 
VALUES (1, TO_DATE('2024-11-15', 'YYYY-MM-DD'), '19:00', 2, 1, 'Window seat if possible.', 'TOKEN_ABC', 'A1234', '21:00', TO_DATE('2024-11-15', 'YYYY-MM-DD'));
INSERT INTO Reservation (CustomerID, ReservationDate, ReservationTime, Period, Occasion, Instructions, Token, AccessCode, ReservationEndTime, ReservationEndDate) 
VALUES (2, TO_DATE('2024-11-16', 'YYYY-MM-DD'), '20:00', 3, 2, 'Champagne on arrival.', 'TOKEN_DEF', 'B5678', '23:00', TO_DATE('2024-11-16', 'YYYY-MM-DD'));
INSERT INTO Reservation (CustomerID, ReservationDate, ReservationTime, Period, Occasion, Instructions, Token, AccessCode, ReservationEndTime, ReservationEndDate) 
VALUES (3, TO_DATE('2024-11-18', 'YYYY-MM-DD'), '18:30', 2, 3, 'Quiet table required.', 'TOKEN_GHI', 'C9101', '20:30', TO_DATE('2024-11-18', 'YYYY-MM-DD'));
INSERT INTO Reservation (CustomerID, ReservationDate, ReservationTime, Period, Occasion, Instructions, Token, AccessCode, ReservationEndTime, ReservationEndDate) 
VALUES (1, TO_DATE('2024-11-20', 'YYYY-MM-DD'), '17:00', 1, 4, NULL, 'TOKEN_JKL', 'D1121', '18:00', TO_DATE('2024-11-20', 'YYYY-MM-DD'));
INSERT INTO ReservedTable (TableID, CustomerID, ReservationDate, ReserveTable) VALUES (1001, 1, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 'Yes');
INSERT INTO ReservedTable (TableID, CustomerID, ReservationDate, ReserveTable) VALUES (2001, 2, TO_DATE('2024-11-16', 'YYYY-MM-DD'), 'Yes');
INSERT INTO ReservedTable (TableID, CustomerID, ReservationDate, ReserveTable) VALUES (2002, 2, TO_DATE('2024-11-16', 'YYYY-MM-DD'), 'Yes');
INSERT INTO ReservedParkingSpace (SpaceID, CustomerID, ReservationDate) VALUES (201, 2, TO_DATE('2024-11-16', 'YYYY-MM-DD'));
INSERT INTO ReservedTable (TableID, CustomerID, ReservationDate, ReserveTable) VALUES (1002, 3, TO_DATE('2024-11-18', 'YYYY-MM-DD'), 'Yes');
INSERT INTO ReservedTable (TableID, CustomerID, ReservationDate, ReserveTable) VALUES (2001, 1, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'Yes');
INSERT INTO Cancellation (CustomerID, ReservationDate, "Comment") 
VALUES (1, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'Customer called to cancel, change of plans.');
COMMIT;