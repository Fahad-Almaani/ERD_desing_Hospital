## Relationships

Department  ---one-to-many------< Doctor  
Department  ---one-to-many------< Service
Doctor      ---one-to-many------< Appointment
Doctor      ---one-to-many------< Medical-record
Patient     ---one-to-many------< Appointment
Patient     ---one-to-many------< Medical-Recorded
Patient     ---one-to-many------< Billing
Appointment ---one-to-one-------- Medical-Recorded
Appointment >--many-to-many-----< Service



