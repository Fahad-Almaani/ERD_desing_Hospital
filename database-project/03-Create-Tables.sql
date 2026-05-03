CREATE TABLE Airport (
	IATA_code VARCHAR(10) Primary Key,
	name VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL
);

CREATE TABLE Passenger(
	PID int Primary Key,
	full_name VARCHAR(100) NOT NULL,
	DOB DATE NOT NULL,
	email VARCHAR(100) NOT NULL,
	phone VARCHAR(30),
	nationality VARCHAR(50)
);

CREATE TABLE Aircraft(
	Reg_number VARCHAR(20) PRIMARY KEY,
	seat_capacity INT NOT NULL
		CHECK (seat_capacity > 0),
	model VARCHAR(100) NOT NULL,
	manfucatruer VARCHAR(100) NOT NULL,
	year_of_manf INT,
);

CREATE TABLE Crew(
	crewID INT Primary Key,
	license_num VARCHAR(50) NOT NULL,
	role VARCHAR(50) NOT NULL
		CHECK (role in ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer')),
	full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Flight (
	fNumber INT Primary Key,
	from_airport VARCHAR(10) NOT NULL,
	to_airport VARCHAR(10),
	aircraft_id VARCHAR(20),
	a_time DATETIME NOT NULL,
	d_time DATETIME NOT NULL,
	status VARCHAR(50) NOT NULL
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
	class VARCHAR(30) NOT NULL
		CHECK (class IN ('Economy', 'Business', 'First')),
	price DECIMAL(10,2) NOT NULL
		CHECK (price > 0),
	passenger_id INT,
	flight_number INT,
	seat_number VARCHAR(10) NOT NULL,
	booking_date DATE NOT NULL
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
