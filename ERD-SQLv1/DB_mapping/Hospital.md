| Table Name        | Columns                                       | Primary Key  | Foreign Key                                |
|-------------------|-----------------------------------------------|--------------|--------------------------------------------|
|Department         |DID, name, `head_id`                           |DID           |head_id --> Doctor                          |
|Doctor             |DocID,prof,name,`DID`                          |              |                                            |
|Patient            |PID,name,BOD,phoneNO                           |              |                                            |
|Medical Recorded   |MID,diagnosis,treatment,`AID`,`SID`,`PID`            |              |                                            |
|Appointment        |AID,datetime,`DocID`,`PID`,Status,Type,`SID`   |              |                                            |
|Service            |SID,category,name,type,price,`DID`             |              |                                            |
|Schedule           |SchID,datetime,`DocID`,`AID`                   |              |                                            |
|Billing            |BID,`PID`,paymentDetails,total,`MID`           |              |                                            |
|PaymentMethod      |PMID,type,cardDetails,`PID`                    |              |                                            |
|Insurance          |IID, type, insurance_details                   |              |                                            |
|Service_and_Appointment |
