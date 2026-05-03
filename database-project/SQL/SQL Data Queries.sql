use Airport;
-----------------------------------------
-- Basic LEVEl
-----------------------------------------
-- 1
SELECT fNumber,status FROM flight ORDER BY d_time 


-- 2
SELECT * FROM Passenger ORDER BY full_name


-- 3
SELECT Reg_number, seat_capacity FROM Aircraft  ORDER BY seat_capacity DESC

-- 4
SELECT DISTINCT class FROM Booking 

-- 5
SELECT * FROM Flight Where status in ('Delayed','Cancelled')

-- 6
SELECT * FROM Passenger

SELECT * FROM Passenger WHERE nationality = 'Omani'


-- 7
SELECT * FROM Airport ORDER BY country

-----------------------------------------
-- MIDIUM LEVEL
-----------------------------------------
-- 1
SELECT * FROM Airport
SELECT * FROM Flight

SELECT F.fNumber,A1.name as 'from', A2.name as 'To'  FROM Flight F, Airport A1 , Airport A2
WHERE F.from_airport = A1.IATA_code and F.to_airport = A2.IATA_code
-- OR
SELECT F.fNumber,A1.name as 'from', A2.name as 'To'  
	FROM Flight f 
	JOIN Airport A1 ON f.from_airport = A1.IATA_code
	JOIN Airport A2 ON f.to_airport = A2.IATA_code


-- 2
SELECT * from booking
SELECT B.BID, P.full_name,F.fNumber FROM Booking B
JOIN Passenger P ON B.passenger_id = P.PID
JOIN Flight F ON B.flight_number = F.fNumber


-- 3
SELECT * FROM crew
SELECT * FROM FlightCrew

SELECT C.full_name,C.role FROM Crew C
JOIN FlightCrew F ON C.crewID = F.crewID



-- 4
SELECT * FROM Flight
SELECT F.Fnumber,A.model FROM Flight F
JOIN Aircraft A ON F.aircraft_id = A.Reg_number
WHERE F.status = 'Completed'



-- 5
SELECT * FROM Passenger

SELECT P.full_name, Count(B.BID) AS total_bookings FROM Passenger P
LEFT JOIN Booking B ON P.PID = B.passenger_id
GROUP BY P.full_name
ORDER BY total_bookings DESC

-- 6
SELECT class,SUM(price) as total_revenue FROM Booking GROUP BY class


-- 7
SELECT * FROM Flight
SELECT * FROM Aircraft

SELECT A.Reg_number , COUNT(F.aircraft_id) FROM Aircraft A
JOIN Flight F ON A.Reg_number = F.aircraft_id
GROUP BY A.Reg_number

-- 8
SELECT * FROM Flight
SELECT * FROM Booking

SELECT flight_number, COUNT(*) as bookings FROM Booking
GROUP BY flight_number
HAVING COUNT(*)> 1;


-- 9
SELECT * FROM Airport
SELECT * FROM Flight
SELECT B.*,P.full_name as passenger_name, A.name as origin ,A1.name as destination FROM Booking B
JOIN Passenger P ON B.passenger_id = P.PID
JOIN Flight F ON B.flight_number = F.fNumber
JOIN Airport A ON F.to_airport = A.IATA_code
JOIN Airport A1 ON F.from_airport = A1.IATA_code





-----------------------------------------
-- Advance LEVEl
-----------------------------------------
-- 1
SELECT 
	F.fNumber,
	A.name as origin ,
	A1.name as destination,
	Air.model,
	Air.manfucatruer,
	COUNT(DISTINCT B.passenger_id) as total_bookings
FROM Flight F
LEFT JOIN Booking B ON F.fNumber = B.flight_number
JOIN Airport A ON F.to_airport = A.IATA_code
JOIN Airport A1 ON F.from_airport = A1.IATA_code
JOIN Aircraft Air ON F.aircraft_id = Air.Reg_number
GROUP BY F.fNumber, A.name, A1.name, Air.model, Air.manfucatruer

-- 2
SELECT P.* from Passenger P
LEFT JOIN Booking B ON P.PID = B.passenger_id
WHERE B.BID IS NULL;


-- 3
SELECT * From Booking
SELECT F.fNumber , SUM(B.price) as total_revenue FROM Flight F
JOIN Booking B ON F.fNumber = B.flight_number
GROUP BY F.fNumber
HAVING SUM(B.price) > 500

-- 4
SELECT * FROM Flight 

SELECT C.full_name,COUNT(DISTINCT F.fNumber) as total_flights FROM Crew C
JOIN FlightCrew FC ON C.crewID = FC.crewID
JOIN Flight F ON FC.fNumber = F.fNumber
GROUP BY C.full_name

-- 5 
SELECT flight_number, AVG(price) as avg_price FROM Booking
GROUP BY flight_number
HAVING AVG(price) > (SELECT AVG(price) FROM Booking);

-- 6
SELECT TOP 1
	f.fNumber,
	f.from_airport,
	f.to_airport,
	COUNT(b.BID) as total_bookings
FROM Flight f
LEFT JOIN Booking b ON f.fNumber = b.flight_number
GRoUP BY f.fNumber, f.from_airport, f.to_airport
ORDER BY total_bookings DESC

-- 7
SELECT * From Flight
SELECT * From Booking

SELECT
	B.class,
	SUM(B.price) as total_revenue,
	COUNT(*) as number_of_bookings,
	AVG(B.price) as avrage,
	MIN(B.price) as min_price,
	MAX(B.price) as max_price
FROM Booking B
GROUP BY B.class

-- 8
SELECT * FROM Booking
SELECT 
	P.full_name,	
	B.flight_number ,
	B.booking_date, 
	F.status 
FROM Passenger P, Booking B, Flight F
WHERE P.PID = B.passenger_id and F.status = 'Cancelled' and B.flight_number = F.fNumber


-- 9
SELECT * FROM FlightCrew
SELECT 
	f.fNumber,
	COUNT(FC.crewID) as total_crew,
	f.a_time
	FROM FlightCrew FC
JOIN Crew C ON FC.crewID = C.crewID
JOIN Flight f ON FC.fNumber = f.fNumber
GROUP BY f.fNumber, f.a_time
HAVING
	SUM(CASE WHEN C.role = 'Pilot' THEN 1 ELSE 0 END) >= 1
	AND
	SUM(CASE WHEN C.role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1



-- 10 

SELECT
	f.fNumber,
	a1.city as from_city,
	a2.city as to_city,
	ac.model,
	ac.manfucatruer,

	COUNT(DISTINCT b.passenger_id) as total_passengers,
	COUNT(DISTINCT fc.crewID) AS total_crew,
	SUM(b.price) as total_revenue
FROM Flight f
LEFT JOIN Booking b ON f.fNumber = b.flight_number
LEFT JOIN FlightCrew fc ON f.fNumber = fc.fNumber
JOIN Aircraft ac ON f.aircraft_id = ac.Reg_number
JOIN Airport a1 ON f.from_airport = a1.IATA_code
JOIN Airport a2 ON f.to_airport = a2.IATA_code
GROUP BY f.fNumber, a1.city, a2.city, ac.model, ac.manfucatruer
ORDER BY total_revenue DESC;








