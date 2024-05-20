
/* exploratory analysis */
  select max(Age), min(Age) from healthcare_datasetstaging3;
  /* max age was 85 and min age of the patients was 13 */

  select Gender,count(Gender) from healthcare_datasetstaging3 group by Gender;
  /* females came with most of the disease */
  
  select `Blood Type`, count(`Blood Type`) from healthcare_datasetstaging3 group by `Blood Type` order by 2;
  /* patients with AB+ blood group where more than the other blood groups. and o- blood group patients where min.  */
  
  select `Medical Condition`,count(`Medical Condition`) from healthcare_datasetstaging3 group by `Medical Condition` order by 2;
  /* patients with Arthritis is more than other medical conditions */
  
select `Insurance Provider`, count(`Insurance Provider`) from healthcare_datasetstaging3 group by `Insurance Provider` order by 2;
/* most of the persons used insurance cigna, less used aetna */

select `Name`,Gender,`Medical Condition`,Doctor,Hospital,`Insurance Provider`,datediff(`new_date of discharge`,`new_Date of Admission`),`Test Results`,`Billing Amount` from healthcare_datasetstaging3  where `Billing Amount`= (select max(`Billing Amount`) from healthcare_datasetstaging3);
/* TODD CARRILLO female stayed in the hospital for 26 days with the medical condition hypertension payed the highest billing amount  52764.2767 */

select `Name`, datediff(`new_date of discharge`,`new_Date of Admission`) as no_of_days_stayed from healthcare_datasetstaging3 ;
/* no. of days patient stayed at hospital range from 1 to 30. min WILLIAM*/

select count(`Name`),`Admission Type`from healthcare_datasetstaging3 group by `Admission Type`;
/* emergency cases where less compared to other. elective cases where high */

select year(`new_Date of Admission`),count(`Name`) from healthcare_datasetstaging3 group by  year(`new_Date of Admission`);
/* got the no.of patients admitted on each year 2019-2024. highest no. of patients admitted in 2020 and it is 10156 */

select `Medical Condition`, count(`Medical Condition`) ,year(`new_Date of Admission`) from healthcare_datasetstaging3 
 group by `Medical Condition`, year(`new_Date of Admission`) order by 4;
/* in 2019 max patients admitted beacaude of asthma, in 2020  with obesity, 2021 with hypertension, 2022 with diabetes,
 2023 with diabetes & arthritis, 2024 with arthritis  */
 
 select max(`new_Date of Admission`) , min(`new_Date of Admission`) from healthcare_datasetstaging3;
 /* we have data of patients admitted between may 2019 and may 2024  */
 
 select substring(`new_Date of Admission`,6,2),`Admission Type`, count(`Admission Type`) from healthcare_datasetstaging3  group by substring(`new_Date of Admission`,6,2),`Admission Type` order by 1;
 /* admission type on each month jan to dec*/
 
select substring(`new_Date of Admission`,6,2),count(`Name`) from healthcare_datasetstaging3 group by substring(`new_Date of Admission`,6,2) order by 1;
/* no. of patients admitted each month */