| Table Name  | Columns                               | Primary Key   | Foreign Key                                |
|-------------|----------------------------------------|--------------|--------------------------------------------|
| EMPLOYEE    | SSN, (First_Name,Last_Name), DOB, DNum | SSN          | DNum → DEPARTMENT(DNum)                   |
| DEPARTMENT  | DNum, Dname, Location, Manager_SSN,Manager_hiring_date    | DNum         | Manager_SSN → EMPLOYEE(SSN)               |
| PROJECT     | Pnum, Pname, Location, DNum           | Pnum         | DNum → DEPARTMENT(DNum)                   |
| DEPENDENT   | SSN, Dname, DOB                       | (SSN, Dname) | SSN → EMPLOYEE(SSN)                       |
| WORKS_ON    | SSN, Pnum                              | (SSN, Pnum)    | SSN → EMPLOYEE(SSN), Pnum → PROJECT(Pnum) |
| LOCATIONS    | DNum, location                        |  (DNum,location) | DNum → DEPARTMENT(DNum) |