#  Healthcare  Project using SQL
## Project Overview
This project involves cleaning and performing exploratory data analysis (EDA) on a healthcare dataset. The dataset contains various details of patients, including their name, age, gender, blood type, medical condition, date of admission, hospital information, insurance provider, billing amount, and discharge date. The project aims to remove duplicates, standardize the data, convert data types, and explore key insights through SQL queries.

## Key Steps Performed
### Data Duplication Handling:

*Initial Staging Table: A staging table (healthcare_datasetstaging2) was created to safely manipulate the data without affecting the original dataset. This ensures that data transformations and cleaning operations are reversible if needed.
Duplicate Removal: Using SQL window functions like ROW_NUMBER(), duplicates were identified based on multiple patient attributes (e.g., name, age, gender, etc.), and then removed by deleting rows with a Row_Num > 1.
Handling Age Errors: Further duplicate rows were found by ignoring the Age column in the comparison, addressing cases where the same patient had been entered with incorrect age values.
Data Standardization:

Standardizing Names: Patient names were converted to uppercase to ensure consistency across the dataset. This avoids issues where the same name might appear with different cases.
Validating Columns: Distinct values for various columns (e.g., Gender, Blood Type, Medical Condition, etc.) were inspected to ensure that the entries are valid and consistent.
Removing Unwanted Characters: Unwanted commas in the Hospital field were removed to maintain data integrity.
Data Type Conversion:

The Date of Admission and Discharge Date fields were initially stored as text, which were later converted to DATE type for more accurate date-based analysis.
A new column was created for the converted Date of Admission and Discharge Date as part of the data cleaning process.
Exploratory Data Analysis (EDA): Several insightful queries were performed to explore trends and key metrics in the healthcare dataset:

Age Distribution: The age range of patients was analyzed, with a minimum age of 13 and a maximum of 85.
Gender Distribution: More female patients were present compared to male patients.
Blood Type Analysis: The blood group with the highest number of patients was AB+, while O- had the fewest patients.
Medical Conditions: Arthritis was the most common medical condition among the patients.
Insurance Providers: Most patients used insurance from Cigna, while Aetna was the least used.
Billing Amount: The highest billing amount was paid by a female patient (Todd Carrillo) with hypertension who stayed in the hospital for 26 days.
Length of Stay: The length of patient stay ranged from 1 to 30 days, with an average stay calculated based on the date difference between admission and discharge.
Admission Type: Elective admissions were more frequent than emergency cases.
Yearly Admissions: The highest number of patients were admitted in 2020, with admission trends analyzed for the period from 2019 to 2024.
Seasonal Trends: The number of patients admitted per month was analyzed, showing monthly trends in hospital admissions.
Key Insights from EDA
Most Frequent Medical Condition: Arthritis was the leading medical condition among patients, particularly in the years 2023 and 2024.
Peak Admission Year: 2020 had the highest number of patient admissions.
Length of Stay and Billing: Patients with extended hospital stays, particularly those with hypertension or diabetes, had higher billing amounts.
Admission Type Trends: Elective procedures were more common than emergency cases, indicating that a significant portion of hospital admissions may have been planned.
Conclusion
This project successfully cleaned and standardized a healthcare dataset, removed duplicates, and performed extensive exploratory data analysis. The results highlight trends in patient demographics, medical conditions, insurance usage, and hospital stay durations, providing valuable insights for potential healthcare management and decision-making.
