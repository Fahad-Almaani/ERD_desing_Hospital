use Airport

--Basic
--1
SELECT name,country FROM Airline

--2
SELECT g.gate_code,g.terminal,a.name AS airport_name
	FROM Gate g
	JOIN Airport a ON g.airport_id= a.IATA_code
	
--3 
SELECT * from Baggage order by weight_kg


-- 4
SELECT fNumber, reason,duration_minutes,recoreded_at from FlightDelayLog
ORDER BY recoreded_at ASC;


--5 flight with no gate
SELECT * FROM Flight where gate_id is null

