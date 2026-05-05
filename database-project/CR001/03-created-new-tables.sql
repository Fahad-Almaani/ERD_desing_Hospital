-- CR

CREATE TABLE Airline (
	airline_id INT PRIMARY KEY IDENTITY,
	iata_code VARCHAR(255) UNIQUE NOT NULL,
	name VARCHAR(255) UNIQUE NOT NULL,
	country VARCHAR(255) NOT NULL,
	contanct_email VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Gate (
	gate_id INT PRIMARY KEY IDENTITY,
	gate_code VARCHAR(255) NOT NULL,
	terminal VARCHAR(255) NOT NULL,
	airport_id VARCHAR(10) NOT NULL, -- FK of Airport(IATA_code)

	CONSTRAINT FK_Gate_Airport 
		FOREIGN KEY (airport_id) REFERENCES Airport(IATA_code)
);


CREATE TABLE Baggage (
	baggage_id INT PRIMARY KEY IDENTITY,
	weight_kg DECIMAL(10, 2) NOT NULL,
	type varchar(255) NOT NULL,
	booking_id INT NOT NULL, -- FK of Booking(BID)
	tag_number VARCHAR(255) UNIQUE NOT NULL,

	CONSTRAINT FK_Baggage_Booking 
		FOREIGN KEY (booking_id) REFERENCES Booking(BID) ON DELETE CASCADE
);

CREATE TABLE FlightDelayLog(
	delay_id INT PRIMARY KEY IDENTITY,
	fNumber INT NOT NULL, -- FK of Flight(fNumber)
	duration_minutes INT NOT NULL,
	reason VARCHAR(255) NOT NULL,
	recoreded_at DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT FK_FlightDelayLog_Flight 
		FOREIGN KEY (fNumber) REFERENCES Flight(fNumber) ON DELETE CASCADE
);

