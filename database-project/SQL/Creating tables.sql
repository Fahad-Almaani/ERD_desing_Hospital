CREATE TABLE Airport (
	IATA_code VARCHAR(10) Primary Key,
	name VARCHAR(100),
	city VARCHAR(100),
	country VARCHAR(100)
);

CREATE TABLE Passenger(
	PID int Primary Key,
	full_name VARCHAR(100),
	DOB DATE,
	email VARCHAR(100),
	phone VARCHAR(30)
);

CREATE TABLE Aircraft(
	Reg_number VARCHAR(20) PRIMARY KEY,
	seat_capacity INT
		CHECK (seat_capacity > 0),
	model VARCHAR(100),
	manfucatruer VARCHAR(100),
	year_of_manf INT,
);

CREATE TABLE Crew(
	crewID INT Primary Key,
	license_num VARCHAR(50),
	role VARCHAR(50)
		CHECK (role in ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer')),
	full_name VARCHAR(100)
);

CREATE TABLE Flight (
	fNumber INT Primary Key,
	from_airport VARCHAR(10),
	to_airport VARCHAR(10),
	aircraft_id VARCHAR(20),
	a_time DATETIME,
	d_time DATETIME,
	status VARCHAR(50)
		DEFAULT 'Scheduled',
		CHECK (status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),



	CONSTRAINT CHK_Flight_Times
		CHECK (a_time > d_time),

	CONSTRAINT FK_Flight_FromAirport
		FOREIGN KEY (from_airport)
		REFERENCES Airport(IATA_code),

	CONSTRAINT FK_Flight_ToAirport
		FOREIGN KEY (to_airport)
		REFERENCES Airport(IATA_code),

	CONSTRAINT FK_Flight_Aircraft
		FOREIGN KEY (aircraft_id)
		REFERENCES Aircraft(Reg_number)

);


CREATE TABLE Booking (
	BID INT PRIMARY KEY,
	class VARCHAR(30)
		CHECK (class IN ('Economy', 'Business', 'First')),
	price DECIMAL(10,2)
		CHECK (price > 0),
	passenger_id INT,
	flight_number INT,
	seat_number VARCHAR(10),
	booking_date DATE
		DEFAULT GETDATE(),

	CONSTRAINT FK_Booking_Flight
		FOREIGN KEY (flight_number)
		REFERENCES Flight(fNumber),

	CONSTRAINT FK_BookingPassenger
		FOREIGN KEY (passenger_id)
		REFERENCES Passenger(PID)
);


CREATE TABLE FlightCrew(
	fNumber INT,
	crewID INT,

	PRIMARY KEY (fNumber,CrewID),

	CONSTRAINT FK_FlightCrew_Flight
		FOREIGN KEY (fnumber)
		REFERENCES Flight(fNumber),

	CONSTRAINT FK_FlightCrew_Crew
		FOREIGN KEY (crewID)
		REFERENCES Crew(crewID),
	
)
