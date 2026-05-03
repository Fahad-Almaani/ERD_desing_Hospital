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