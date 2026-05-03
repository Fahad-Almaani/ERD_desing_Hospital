UPDATE Flight 
SET status = 'Completed'
WHERE fNumber = 101;


UPDATE Flight 
SET status = 'Cancelled'
WHERE fNumber= 102;

UPDATE Booking
SET price =  price * 1.1
where class = 'Economy';


UPDATE Passenger
SET phone =  '90909090'
WHERE PID = 1;

UPDATE Crew
SET role = 'Engineer'
WHERE CrewID =4;


-- DELETE

SELECT * FROM Flight WHERE status = 'Cancelled'

DELETE FROM Flight WHERE fNumber = 102;
-- first we need to delete the used FK 
DELETE FROM Booking WHERE flight_number = 102;
-- also we need to delete the flightCrew that is assigned to this flight
DELETE FROM FlightCrew where fNumber = 102;

-- now we can delete the flight
DELETE FROM Flight WHERE fNumber = 102;




-- deleting a passenger 
DELETE FROM Passenger WHERE PID = 1;
-- it will not work because there are bookings that are related to this passenger, so we need to delete the bookings first
