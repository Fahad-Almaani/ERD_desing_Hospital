SELECT *
FROM Appointment
WHERE Status = 'Scheduled';


UPDATE Appointment
SET Status = 'Completed'
WHERE Appointment_id = 3;


-- 2. Bill: Pending → Paid
UPDATE Billing
SET Payment_status = 'Paid'
WHERE Payment_status = 'Pending' AND Bill_id = 5;


-- 2. Bill: Pending → Paid
UPDATE Billing
SET Payment_status = 'Paid'
WHERE Payment_status = 'Pending' AND Bill_id = 5;


-- 4. Update one patient phone number
UPDATE Patient
SET Phone_no = '90000000'
WHERE Patient_id = 2;



-- 5. Move doctor to another department
UPDATE Doctor
SET Dept_id = 2
WHERE Doctor_id = 1;

-- DELETE TASKS

-- 1. Delete cancelled appointment ------------------
DELETE FROM Appointment
WHERE Status = 'Cancelled' AND Appointment_id = 5;

-- 2. Delete unused service
DELETE FROM Service
WHERE Service_id NOT IN (
    SELECT DISTINCT Service_id FROM Appointment_Service
);


-- 3. Delete mistaken billing record
DELETE FROM Billing
WHERE Bill_id = 7;


-- 4. Try deleting patient with appointments ---------------
DELETE FROM Patient
WHERE Patient_id = 1;



-- Select

SELECT COUNT(*) AS Total_Patients FROM Patient;

SELECT COUNT(*) AS Total_Doctors FROM Doctor;

SELECT COUNT(*) AS Total_Appointments FROM Appointment;

SELECT SUM(Total_amount) AS Total_Billing FROM Billing;

SELECT AVG(Unit_price) AS Avg_Service_Price FROM Service;


SELECT 
    MAX(Unit_price) AS Highest_Price,
    MIN(Unit_price) AS Lowest_Price
FROM Service;



SELECT Dept_id, COUNT(*) AS Doctor_Count
FROM Doctor
GROUP BY Dept_id;



SELECT Doctor_id, COUNT(*) AS Appointment_Count
FROM Appointment
GROUP BY Doctor_id;


SELECT Doctor_id, COUNT(*) AS Appointment_Count
FROM Appointment
GROUP BY Doctor_id;



SELECT Payment_status, SUM(Total_amount) AS Total_Amount
FROM Billing
GROUP BY Payment_status;


SELECT Service_type, AVG(Unit_price) AS Avg_Price
FROM Service
GROUP BY Service_type;



SELECT Service_id, SUM(Quantity) AS Total_Used
FROM Appointment_Service
GROUP BY Service_id;

SELECT Doctor_id, COUNT(*) AS Total_Apps
FROM Appointment
GROUP BY Doctor_id
HAVING COUNT(*) > 1;


SELECT Doctor_id, COUNT(*) AS Total_Apps
FROM Appointment
GROUP BY Doctor_id
HAVING COUNT(*) > 1;


SELECT Service_id, SUM(Quantity) AS Uses
FROM Appointment_Service
GROUP BY Service_id
HAVING SUM(Quantity) > 2;


SELECT Dept_id, COUNT(*) AS Doctors
FROM Doctor
GROUP BY Dept_id
HAVING COUNT(*) > 1;


SELECT Payment_status, SUM(Total_amount) AS Total
FROM Billing
GROUP BY Payment_status
HAVING SUM(Total_amount) > 50;


SELECT TOP 1 
    Service_id,
    SUM(Quantity) AS Total_Used
FROM Appointment_Service
GROUP BY Service_id
ORDER BY Total_Used DESC;

-- Highest revenue service (Quantity × Price) 
SELECT 
    s.Service_id,
    SUM(asv.Quantity * s.Unit_price) AS Revenue
FROM Appointment_Service asv
JOIN Service s ON asv.Service_id = s.Service_id
GROUP BY s.Service_id
ORDER BY Revenue DESC;