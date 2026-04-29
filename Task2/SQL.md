## Tables 
```
CREATE TABLE Department (
    Dept_id INT PRIMARY KEY,
    Dept_name VARCHAR(100) NOT NULL,
    Location VARCHAR(150),
    No_of_doctors INT,
    Contact_number VARCHAR(30),
    Head_Doctor_id INT
);

CREATE TABLE Doctor (
    Doctor_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone_no VARCHAR(30),
    Email VARCHAR(100),
    License_no VARCHAR(100),
    Qualification VARCHAR(100),
    Years_of_experience INT,
    Dept_id INT NOT NULL,
    CONSTRAINT FK_Doctor_Department
        FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

ALTER TABLE Department
ADD CONSTRAINT FK_Department_HeadDoctor
FOREIGN KEY (Head_Doctor_id) REFERENCES Doctor(Doctor_id);

CREATE TABLE Patient (
    Patient_id INT PRIMARY KEY,
    F_name VARCHAR(50) NOT NULL,
    L_name VARCHAR(50) NOT NULL,
    Phone_no VARCHAR(30),
    Email VARCHAR(100),
    Address VARCHAR(200),
    DOB DATE,
    Blood_group VARCHAR(10),
    Gender VARCHAR(20)
);

CREATE TABLE Service (
    Service_id INT PRIMARY KEY,
    Service_name VARCHAR(100) NOT NULL,
    Service_type VARCHAR(100),
    Unit_price DECIMAL(10,2) NOT NULL,
    Description TEXT,
    Dept_id INT NOT NULL,
    CONSTRAINT FK_Service_Department
        FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

CREATE TABLE Appointment (
    Appointment_id INT PRIMARY KEY,
    Patient_id INT NOT NULL,
    Doctor_id INT NOT NULL,
    [Date] DATE NOT NULL,
    [Time] TIME NOT NULL,
    Status VARCHAR(30),
    Appointment_type VARCHAR(50),
    Reason TEXT,
    CONSTRAINT FK_Appointment_Patient
        FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    CONSTRAINT FK_Appointment_Doctor
        FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

CREATE TABLE Appointment_Service (
    Appointment_id INT NOT NULL,
    Service_id INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    PRIMARY KEY (Appointment_id, Service_id),
    CONSTRAINT FK_AppService_Appointment
        FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    CONSTRAINT FK_AppService_Service
        FOREIGN KEY (Service_id) REFERENCES Service(Service_id)
);

CREATE TABLE Medical_Record (
    Record_id INT PRIMARY KEY,
    Appointment_id INT NOT NULL,
    Patient_id INT NOT NULL,
    Doctor_id INT NOT NULL,
    Visit_date DATE NOT NULL,
    Diagnosis TEXT,
    Treatment_plan TEXT,
    Prescribed_medications TEXT,
    Doctor_notes TEXT,
    Follow_up_required BIT,
    CONSTRAINT FK_MedicalRecord_Appointment
        FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    CONSTRAINT FK_MedicalRecord_Patient
        FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    CONSTRAINT FK_MedicalRecord_Doctor
        FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

CREATE TABLE Billing (
    Bill_id INT PRIMARY KEY,
    Appointment_id INT NOT NULL,
    Patient_id INT NOT NULL,
    Bill_date DATE NOT NULL,
    Total_amount DECIMAL(12,2) NOT NULL,
    Payment_status VARCHAR(30),
    Payment_method VARCHAR(30),
    Due_date DATE,
    CONSTRAINT FK_Billing_Appointment
        FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    CONSTRAINT FK_Billing_Patient
        FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);
```