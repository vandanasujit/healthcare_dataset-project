CREATE TABLE `healthcare_datasetstaging2` (
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
  `Row_Num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from healthcare_datasetstaging2;

insert into healthcare_datasetstaging2
select *,
 row_number() over(partition By `Name`, Age, Gender,`Blood Type`, `Medical condition`, `Date of Admission`, Doctor, Hospital,`Insurance Provider`, `Billing Amount`,`Room Number`, `Admission Type`,`Discharge Date`, Medication, `Test Results`) as Row_Num
from healthcare_datasetStaging;

/* deleting  all the duplicate rows */
delete from healthcare_datasetstaging2
 where Row_Num>1;
 
 /* found out same patient with age entered wrong  so again finding duplicate rows ithout considering column Age*/
  with duplicate_age_CTE as
  (select *, row_number() over(partition by `Name`,Gender,`Blood Type`, `Medical condition`, `Date of Admission`, Doctor, Hospital,`Insurance Provider`, `Billing Amount`,`Room Number`, `Admission Type`,`Discharge Date`, Medication, `Test Results`) as row_num2
  from healthcare_datasetstaging2)
  select * from duplicate_age_CTE where row_num2>1;
  
  


 /* STANDARDIZING DATA */
 
 select * from healthcare_datasetstaging2;
 SELECT `Name`, trim(`Name`) from healthcare_datasetstaging2;
 
 /* capitalizing Name */
 select `Name`, upper(`Name`) from healthcare_datasetstaging2;
 update healthcare_datasetstaging2
 set `Name` = upper(`Name`);
 
 /* checking each column has valid entry */
 select distinct(Gender) from healthcare_datasetstaging2;
 select distinct(`Blood Type`) from healthcare_datasetstaging2;
  select distinct(`Medical Condition`) from healthcare_datasetstaging2;
    select distinct(Doctor) from healthcare_datasetstaging2;
      select distinct(`Insurance Provider`) from healthcare_datasetstaging2;
        select distinct(`Medication`) from healthcare_datasetstaging2;
          select distinct(`Admission Type`) from healthcare_datasetstaging2;
            select distinct(`Test Results`) from healthcare_datasetstaging2;
             select distinct(Hospital) from healthcare_datasetstaging2;
    
    /* removing unwanted ',' from column Hospital */
    select Hospital, replace(Hospital, ',','') from healthcare_datasetstaging2;
    update healthcare_datasetstaging2
    set Hospital =  replace(Hospital, ',','');
    
    
select * from healthcare_datasetstaging2 where `Name` = 'ADAM FLETCHER';
  

