# First Normal Form (1NF)

| Table | Attributes |
|---|---|
| Airport | IATA_code (PK), name, city, country |
| Aircraft | Reg_number (PK), seat_capacity, model, manufacturer, year_of_manf |
| Flight | FNumber (PK), From_airport (FK), to_airport (FK), Aircraft_id (FK), a_time, d_time, status |
| Crew_Member | CrewID (PK), License_num, role, full_name |
| Passenger | PID (PK), full_name, DOB, nationality, email, phone |
| Booking | BID (PK), class, price, passenger_id (FK), Flight_number (FK), seat_number, booking_date |
| FlightCrew | ID (PK), Flight_number (FK), CrewMember_id (FK) |


# Second Normal Form (2NF)

| Table | Attributes |
|---|---|
| Airport | IATA_code (PK), name, city, country |
| Aircraft | Reg_number (PK), seat_capacity, model, manufacturer, year_of_manf |
| Flight | FNumber (PK), From_airport (FK), to_airport (FK), Aircraft_id (FK), a_time, d_time, status |
| Crew_Member | CrewID (PK), License_num (UNIQUE), role, full_name |
| Passenger | PID (PK), full_name, DOB, nationality, email, phone |
| Booking | BID (PK), passenger_id (FK), Flight_number (FK), class, price, seat_number, booking_date |
| FlightCrew | Flight_number (PK, FK), CrewMember_id (PK, FK) |


# Final Design (3NF Style)

| Table | Attributes |
|---|---|
| Airport | IATA_code (PK), name, city, country |
| Aircraft | Reg_number (PK), seat_capacity, model, manufacturer, year_of_manf |
| Flight | FNumber (PK), From_airport (FK), to_airport (FK), Aircraft_id (FK), a_time, d_time, status |
| Crew_Member | CrewID (PK), License_num (UNIQUE), role, full_name |
| Passenger | PID (PK), full_name, DOB, nationality, email, phone |
| Booking | BID (PK), class, price, passenger_id (FK), Flight_number (FK), seat_number, booking_date |
| FlightCrew | Flight_number (PK, FK), CrewMember_id (PK, FK) |