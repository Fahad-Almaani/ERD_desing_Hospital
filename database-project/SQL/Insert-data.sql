
-- airport
INSERT INTO Airport VALUES ('MCT', 'Muscat International Airport', 'Muscat', 'Oman'),
('DXB', 'Dubai International Airport', 'Dubai', 'UAE'),
('LHR', 'Heathrow Airport', 'London', 'United Kingdom'),
('JFK', 'John F. Kennedy International Airport', 'New York', 'USA'),
('NRT', 'Narita International Airport', 'Tokyo', 'Japan');



-- aircraft

INSERT INTO Aircraft VALUES 
('A6-OAA', 300, 'A380', 'Airbus', 2018),
('A4O-BK', 180, '737 MAX 8', 'Boeing', 2020),
('G-ABCD', 250, '787 Dreamliner', 'Boeing', 2019),
('N789AA', 220, 'A330', 'Airbus', 2017),
('JA123K', 150, 'E190', 'Embraer', 2021);


-- Passenger
INSERT INTO Passenger VALUES
(1, 'Fahad Almaani', '2002-05-10', 'fahad@email.com', '91234567','oman'),
(2, 'John Smith', '1990-08-21', 'john@email.com', '92345678','KSA'),
(3, 'Aisha Khan', '1995-11-14', 'aisha@email.com', '93456789','USA'),
(4, 'Hiro Tanaka', '1988-03-09', 'hiro@email.com', '94567890','UAE'),
(5, 'Sara Williams', '1992-06-18', 'sara@email.com', '95678901','oman'),
(6, 'Ahmed Ali', '1985-12-01', 'ahmed@email.com', '96789012','UK'),
(7, 'Maria Garcia', '1998-04-25', 'maria@email.com', '97890123','Kwait'),
(8, 'David Brown', '1993-09-30', 'david@email.com', '98901234','oman');



-- Crew
INSERT INTO Crew VALUES
(1, 'LIC1001', 'Pilot', 'Captain James Walker'),
(2, 'LIC1002', 'Co-Pilot', 'Michael Reed'),
(3, 'LIC1003', 'Flight Attendant', 'Emily Stone'),
(4, 'LIC1004', 'Flight Attendant', 'Sophia Green'),
(5, 'LIC1005', 'Engineer', 'Daniel White'),
(6, 'LIC1006', 'Pilot', 'Omar Hassan');



-- flight
INSERT INTO Flight VALUES
(101, 'MCT', 'DXB', 'A6-OAA',
 '2026-05-10 09:00:00',
 '2026-05-10 07:30:00',
 'Scheduled'),

(102, 'DXB', 'LHR', 'A4O-BK',
 '2026-05-11 15:00:00',
 '2026-05-11 10:00:00',
 'Delayed'),

(103, 'LHR', 'JFK', 'G-ABCD',
 '2026-05-12 20:00:00',
 '2026-05-12 14:00:00',
 'Completed'),

(104, 'JFK', 'NRT', 'N789AA',
 '2026-05-13 23:00:00',
 '2026-05-13 16:00:00',
 'Cancelled'),

(105, 'NRT', 'MCT', 'JA123K',
 '2026-05-14 18:00:00',
 '2026-05-14 09:00:00',
 'Scheduled'),

(106, 'MCT', 'LHR', 'A6-OAA',
 '2026-05-15 16:00:00',
 '2026-05-15 11:00:00',
 'Completed'),

(107, 'DXB', 'JFK', 'G-ABCD',
 '2026-05-16 22:00:00',
 '2026-05-16 13:00:00',
 'Delayed'),

(108, 'LHR', 'NRT', 'N789AA',
 '2026-05-17 19:00:00',
 '2026-05-17 08:00:00',
 'Scheduled');



 -- booking 
INSERT INTO Booking VALUES
(1, 'Economy', 120.00, 1, 101, '12A', DEFAULT),
(2, 'Business', 450.00, 2, 102, '2B', DEFAULT),
(3, 'First', 900.00, 3, 103, '1A', DEFAULT),
(4, 'Economy', 150.00, 4, 104, '15C', DEFAULT),
(5, 'Business', 500.00, 5, 105, '3D', DEFAULT),
(6, 'Economy', 180.00, 6, 106, '18F', DEFAULT),
(7, 'First', 1000.00, 7, 107, '1C', DEFAULT),
(8, 'Business', 600.00, 8, 108, '4A', DEFAULT),
(9, 'Economy', 140.00, 1, 102, '20B', DEFAULT),
(10, 'First', 1100.00, 2, 103, '1D', DEFAULT);



-- flight_crew

INSERT INTO FlightCrew VALUES
(101, 1),
(101, 3),

(102, 1),
(102, 4),

(103, 6),
(103, 3),

(104, 6),
(104, 4),

(105, 1),
(105, 3),

(106, 6),
(106, 4),

(107, 1),
(107, 3),

(108, 6),
(108, 4);