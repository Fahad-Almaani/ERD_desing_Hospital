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