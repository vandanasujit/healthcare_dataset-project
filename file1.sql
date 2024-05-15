select * from healthcare_dataset;

/* creating a staging table by just copying the original table */
create table healthcare_datasetStaging like healthcare_dataset ;
insert healthcare_datasetStaging 
select * from healthcare_dataset;

select * from healthcare_datasetStaging;

/* removing duplicates */

with duplicate_CTE as
(select *,
 row_number() over(partition By `Name`, Age, Gender,`Blood Type`, `Medical condition`, `Date of Admission`, Doctor, Hospital,`Insurance Provider`, `Billing Amount`,`Room Number`, `Admission Type`,`Discharge Date`, Medication, `Test Results`) as Row_Num
from healthcare_datasetStaging)
select * from duplicate_CTE
where Row_Num>1;
select * from healthcare_datasetstaging where `Name` = 'AdAM tHOmaS';   /* found duplicate */

select * from healthcare_datasetstaging2;


