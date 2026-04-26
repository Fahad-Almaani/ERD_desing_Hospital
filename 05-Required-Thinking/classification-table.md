| Item | Classification | Reason |
|------|---------------|--------|
| Patient | Strong Entity | Has its own primary key and exists independently in the system. |
| Patient_ID | Key Attribute | Unique identifier for each patient. |
| First_Name | Simple Attribute | Stores a single value of patient's first name. |
| Last_Name | Simple Attribute | Stores a single value of patient's last name. |
| Phone | Attribute | Stores contact number of patient. |
| Email | Attribute | Stores patient email address. |
| Address | Composite Attribute | Can be divided into street, city, area, etc. |
| DOB | Attribute | Stores patient date of birth. |
| Age | Derived Attribute | Calculated from DOB. |
| Blood_Group | Attribute | Stores blood type of patient. |
| Gender | Attribute | Stores gender information. |
| Doctor | Strong Entity | Exists independently with unique identity. |
| Doctor_ID | Key Attribute | Unique identifier for each doctor. |
| Name | Attribute | Stores doctor name. |
| Specialization | Attribute | Stores doctor medical specialty. |
| License_No | Candidate Key | Unique professional license number. |
| Qualification | Multi-valued Attribute | Doctor may have multiple qualifications. |
| Years_Experience | Derived Attribute | Can be calculated from employment/start date. |
| Department | Strong Entity | Represents a hospital department. |
| Dept_ID | Key Attribute | Unique identifier for department. |
| Dept_Name | Candidate Key | Likely unique department name. |
| Location | Attribute | Stores department location. |
| Head_Doctor | Relationship | Refers to doctor managing department. |
| Appointment | Associative Entity | Connects Patient and Doctor with transaction data. |
| Appointment_ID | Key Attribute | Unique identifier for appointment. |
| Date | Attribute | Stores appointment date. |
| Time | Attribute | Stores appointment time. |
| Status | Attribute | Indicates booked, completed, cancelled, etc. |
| Appointment_Type | Attribute | Stores consultation, follow-up, emergency, etc. |
| Patient ↔ Appointment | 1:M Relationship | One patient can have many appointments. |
| Doctor ↔ Appointment | 1:M Relationship | One doctor handles many appointments. |
| Service | Strong Entity | Represents hospital services independently. |
| Service_ID | Key Attribute | Unique identifier for service. |
| Service_Name | Attribute | Stores service name. |
| Service_Type | Attribute | Stores category such as test or treatment. |
| Price | Attribute | Stores service price. |
| Appointment ↔ Service | M:N Relationship | One appointment can have many services, one service used in many appointments. |
| Quantity | Relationship Attribute | Belongs to Appointment-Service relationship, tracks usage count. |
| Medical_Record | Weak/Dependent Entity | Usually depends on patient visit/appointment context. |
| Record_ID | Key Attribute | Unique identifier for medical record. |
| Diagnosis | Attribute | Stores diagnosis details. |
| Treatment | Attribute | Stores treatment plan. |
| Appointment ↔ Medical_Record | 1:1 Relationship | One appointment may create one record. |
| Billing | Dependent Entity | Usually generated from appointment/services. |
| Bill_ID | Key Attribute | Unique identifier for bill. |
| Total_Amount | Derived Attribute | Calculated from related services and quantities. |
| Payment_Status | Attribute | Paid, unpaid, partial. |
| Payment_Method | Attribute | Cash, card, transfer, etc. |
| Appointment ↔ Billing | 1:1 Relationship | Each completed appointment may generate one bill. |
| Partial Payment | Business Rule / Attribute | Represented through payment status or payment transactions. |