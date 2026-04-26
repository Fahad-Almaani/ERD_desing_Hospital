### Primary keys
    - DID  in doctor Entity
    - PID in Patient Entity
    - DepID in Department Entity
    - AID in Appointment Entity
    - SID in Services Entity
    - MID in Medical-Recorded Entity
    - BID in Billing Entity

### Candidate Keys:
    ---

### Relationships  Types:


    - Department  ---one-to-many------< Doctor  
    - Department  ---one-to-many------< Service
    - Doctor      ---one-to-many------< Appointment
    - Doctor      ---one-to-many------< Medical-record
    - Patient     ---one-to-many------< Appointment
    - Patient     ---one-to-many------< Medical-Recorded
    - Patient     ---one-to-many------< Billing
    - Appointment ---one-to-one-------- Medical-Recorded
    - Appointment >--many-to-many-----< Service


### Participation 
    - A doctor must have a department 
    - Patient must have an Appointment 
    - Medical-Recorded Must have a Patient
    - Billing must have medical-record 
    -------------------------------------
    the reset is optional
    

