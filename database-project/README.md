# SkyTrack Airline System - Database Project

## Brief Description
This project is a simple airline database for SkyTrack. It helps store and manage airports, flights, passengers, bookings, aircraft, and crew assignments.

## ERD Summary
Main entities: `Airport`, `Flight`, `Passenger`, `Booking`, `Aircraft`, `Crew`, and `FlightCrew`.

Key relationships:
- One airport can have many flights (as departure or arrival).
- One aircraft can be used in many flights.
- One passenger can have many bookings.
- One flight can have many bookings.
- Flights and crew members are many-to-many through `FlightCrew`.

Design decisions:
- I used `FlightCrew` as a bridge table to handle many-to-many between flights and crew.
- I added checks for values like booking class, flight status, positive price, and valid time order.

## Mapping Decisions (Foreign Keys)
I placed foreign keys on the "many" side to keep relationships clear:
- `Flight.from_airport` and `Flight.to_airport` -> `Airport.IATA_code`
- `Flight.aircraft_id` -> `Aircraft.Reg_number`
- `Booking.passenger_id` -> `Passenger.PID`
- `Booking.flight_number` -> `Flight.fNumber`
- `FlightCrew.fNumber` -> `Flight.fNumber`
- `FlightCrew.crewID` -> `Crew.crewID`

Why: this keeps referential integrity, so no child record can point to a parent that does not exist.

## Errors I Faced (INSERT / DELETE)
- I got foreign key errors when trying to delete a flight that still had related rows in `Booking` and `FlightCrew`.
- I solved it by deleting child rows first, then deleting the parent flight.
- Same idea for passenger delete: bookings must be removed first.

## WHERE vs HAVING (My Words)
- `WHERE` filters rows before grouping.
- `HAVING` filters grouped results after `GROUP BY`.

## Most Useful Query
The most useful query for me was the booking details join (booking + passenger + flight + airports), because it gives one full view with passenger name, origin, and destination in one result.

## BONUS: Indexes Added + Justification
I added:
1. `idx_booking_flight` on `Booking(flight_number)`
	- Justification: many joins and filters use `flight_number`, so this improves booking-by-flight lookups and join speed.

2. `idx_flight_status` on `Flight(status)`
	- Justification: status is used often in filtering (like completed/cancelled flights), so this speeds up those queries.
