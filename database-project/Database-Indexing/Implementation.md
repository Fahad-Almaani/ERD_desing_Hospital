# Implementing Database-indexing 


#### Implementing an index for:
    - flight number column `flight_number` in Booking table  
        because this column is heavily used in join oprations and flight realted queries the index improves the query performance by reducing full table scans when searching or    grouping booking by flight.

    - same thing for flight status 


```
CREATE INDEX idx_booking_flight
ON Booking(flight_number);


CREATE INDEX idx_flight_status
ON Flight(status);
```
