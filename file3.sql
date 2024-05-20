CREATE TABLE `healthcare_datasetstaging3` (
  `Name` text,
  `Age` int DEFAULT NULL,
  `Gender` text,
  `Blood Type` text,
  `Medical Condition` text,
  `Date of Admission` text,
  `Doctor` text,
  `Hospital` text,
  `Insurance Provider` text,
  `Billing Amount` double DEFAULT NULL,
  `Room Number` int DEFAULT NULL,
  `Admission Type` text,
  `Discharge Date` text,
  `Medication` text,
  `Test Results` text,
  `Row_Num` int ,
  `row_num2` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Insert into healthcare_datasetstaging3
select * , row_number() over(partition by `Name`,Gender,`Blood Type`, `Medical condition`, `Date of Admission`, Doctor, Hospital,`Insurance Provider`, `Billing Amount`,`Room Number`, `Admission Type`,`Discharge Date`, Medication, `Test Results`) as row_num2
  from healthcare_datasetstaging2;
  
delete from healthcare_datasetstaging3 
where row_num2>1;
alter table healthcare_datasetstaging3
drop `Row_Num`;


select * from healthcare_datasetstaging3;

update healthcare_datasetstaging3
set Doctor = upper(Doctor);
 
 /* converting column Date of Admission from text to date */
 
select `Date of Admission`,str_to_date(`Date of Admission`,'%Y-%m-%d') from healthcare_datasetstaging3;
update healthcare_datasetstaging3
set `Date of Admission` = str_to_date(`Date of Admission`,'%Y-%m-%d');
/* was unable to update by the above statement */

alter table healthcare_datasetstaging3 add `new_Date of Admission` date;
alter table healthcare_datasetstaging3 add `new_date of discharge` date;
update healthcare_datasetstaging3
set `new_date of discharge` = str_to_date(`Discharge Date`, '%Y-%m-%d');
alter table healthcare_datasetstaging3
drop `Discharge Date`;
update healthcare_datasetstaging3
set `new_Date of Admission`= str_to_date(`Date of Admission`,'%Y-%m-%d');
alter table healthcare_datasetstaging3
drop `Date of Admission`;

alter table healthcare_datasetstaging3
drop row_num2;


select `Test Results`,count(`Test Results`) from healthcare_datasetstaging3 group by `Test Results`;




  
  
  
  