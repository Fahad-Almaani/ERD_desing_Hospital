-- PART 1:
-- 1.
SELECT p.F_name, a.date FROM Patient p
JOIN Appointment a on p.Patient_id = a.Patient_id;


-- 2
SELECT d.name, dep.Dept_name FROM Doctor d, Department dep


-- 3
-- Appointment ID , status , patient name

SELECT a.Appointment_id, a.Status, p.F_name FROM Appointment a, Patient p
WHERE a.Patient_id = p.Patient_id;


--4
-- Appountment ID , doctor name and appointment status
SELECT a.Appointment_id,d.name,a.status FROM Appointment a, Doctor d
WHERE a.Doctor_id = d.Doctor_id;


-- 5
-- service name, unit_price and department name
SELECT s.Service_name,s.Unit_price from Service s, Department d
WHERE s.Dept_id = d.Dept_id;


--PART 2:
-- Applay filter add where conditon 
-- 1 .show appoiuntment that are completed with patient name
SELECT p.F_name FROM Patient p, Appointment a
where a.Patient_id = p.Patient_id and a.Status = 'completed';

-- 2. show doctors only from cardilogy department
SELECT name FROM Doctor where Specialization = 'Cardiologist';

-- 3. show service with price > 20
SELECT Service_name FROM Service where Unit_price> 20;


-- PART 3: Challange 

-- show patient name doctor name and appointment date
SELECT p.F_name, d.name, a.date FROM Patient p
JOIN Doctor d ON p.Patient_id = d.Doctor_id
JOIN Appointment a ON p.Patient_id = a.Patient_id





-- show patient name appointment status, department name
SELECT 
	p.F_name as patient_name,
	a.Status as appointment_status,
	dep.Dept_name as department_name
FROM		
	Patient p
JOIN Appointment a ON p.Patient_id = a.Patient_id
JOIN Doctor d ON a.Doctor_id = d.Doctor_id
JOIN Department dep ON d.Dept_id = dep.Dept_id;


-- 11. patemnt name, service name, qty 
SELECT 
	p.F_name as patient_name,
	s.Service_name as service_name,
	aps.Quantity as quantity
FROM Patient p 
JOIN Appointment a ON p.Patient_id = a.Patient_id
JOIN Appointment_Service aps ON a.Appointment_id = aps.Appointment_id
JOIN Service s ON aps.Service_id = s.Service_id;


	

-- Final Challenge
-- show patient name, doctor name , service name, appointement date
SELECT 
	p.F_name as patient_name,
	d.name as doctor_name,
	s.Service_name as service_name,
	a.date as appointment_date
FROM Patient p
JOIN Appointment a ON p.Patient_id = a.Patient_id
JOIN Doctor d ON a.Doctor_id = d.Doctor_id
JOIN Appointment_Service aps ON a.Appointment_id = aps.Appointment_id
JOIN Service s ON aps.Service_id = s.Service_id;
