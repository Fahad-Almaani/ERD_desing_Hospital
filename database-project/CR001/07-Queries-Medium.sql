---- Medium Level
--1 flight + aireline + gate
SELECT 
	f.fNumber,
	a1.name AS airline_name,
	g.gate_code
FROM Flight f
JOIN Airline a1 ON f.airline_id = a1.airline_id
LEFT JOIN Gate g ON f.gate_id = g.gate_id



--2
SELECT 
	bg.baggage_id,
	p.full_name AS passenger_name,
	b.flight_number
FROM Baggage bg
JOIN Booking b ON bg.booking_id = b.BID
JOIN Passenger p ON b.passenger_id = p.PID

-- 3 baggage coutn per booking
SELECT 
	b.BID,
	p.full_name AS passenger_name,
	COUNT(bg.baggage_id) AS baggage_count
FROM Booking b
JOIN Passenger p ON b.passenger_id = p.PID
LEFT JOIN Baggage bg ON b.BID = bg.booking_id
GROUP BY b.BID, p.full_name

-- 4 logs + airline + flight
SELECT 
	f.fNumber,
	a1.name AS airline_name,
	d.reason,
	d.duration_minutes
FROM FlightDelayLog d
JOIN Flight f On d.fNumber = f.fNumber
JOIN Airline a1 ON f.airline_id = f.airline_id


-- 5
SELECT 
	b.flight_number,
	SUM(bg.weight_kg) AS total_baggage_weight
FROM Baggage bg
JOIN Booking b ON bg.booking_id = b.BID
Where bg.type = 'Checked'
Group BY b.flight_number


-- 6 
SELECT 
	a.airline_id,
	a.name,
	COUNT(f.fNumber) as total_flights
FROM Airline a
LEFT JOIN Flight f ON a.airline_id= f.airline_id
GROUP BY a.airline_id,a.name

-- 7
SELECT
	f.fNumber,
	COUNT(fd.delay_id) AS delay_count
FROM Flight f
LEFT JOIN FlightDelayLog fd ON f.fNumber = fd.fNumber
Group BY f.fNumber
HAVING COUNT(fd.delay_id) > 1
