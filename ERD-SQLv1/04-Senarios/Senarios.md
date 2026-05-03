### Appointments Cancellation
 Appointment cancellation may required clean-up first because it is reference in the Appointment-Service relation ships and the medical records

### Doctor Leaving
Doctor leaving will need to either delete the clear the related records in the appointments and medical records or implement a flag that set the doctor status as inactive but keep the row 

### Payment Handling (including partial payments)

partial payments can be implemented by adding an attribute to the paid amount from the total bill and maybe a status to indicate if it is paid , unpaid, partially-paid 

### Service Price Changes

for Service price changes to not affect the previous bills and appointments each Appointment will reference a Service and a copy of the service price at that time so when it is change it dose not affect old data