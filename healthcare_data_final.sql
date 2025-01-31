USE healthcare;
select * from healthcare_data;
select count(*) from healthcare_data;

-- USE CASE 1: Trends in Admission Over Time
 -- Use Case Description: Analyze monthly patient admissions to identify trends and seasonal patterns, 
 -- helping hospitals manage resources and plan for peak periods effectively.

SELECT 
    YEAR(Admit_Date) AS Admission_Year,
    MONTH(Admit_Date) AS Admission_Month, 
    COUNT(*) AS Monthly_Admission_Count
FROM healthcare_data
GROUP BY YEAR(Admit_Date), MONTH(Admit_Date)
ORDER BY Admission_Year, Admission_Month;

-- USE CASE 2: Diagnosis Frequency Analysis
-- Use Case Description: Analyze the most common diagnosis to identify prevalent health conditions, 
-- enabling hospitals to prioritize care, allocate resources effectively, and plan for necessary treatments.

SELECT Diagnosis, COUNT(*) AS Diagnosis_Count
FROM healthcare_data
GROUP BY Diagnosis
ORDER BY Diagnosis_Count DESC
LIMIT 5;

-- USE CASE 3: Bed Occupancy Analysis
-- Use Case Description: Analyze bed occupancy patterns to optimize resource allocation and manage 
-- bed availability for improved operational efficiency.

SELECT Bed_Occupancy, COUNT(*) AS Occupancy_Count
FROM healthcare_data
GROUP BY Bed_Occupancy
ORDER BY Occupancy_Count DESC;

-- USE CASE 4: Length of stay distribution analysis
-- Use Case Description: Analyze the average and maximum length of patient stays to identify trends in 
-- hospital resource usage, optimize bed management, and improve discharge planning for better operational efficiency.

SELECT 
    AVG(DATEDIFF(Discharge_Date, Admit_Date)) AS Avg_Length_of_Stay,
    MAX(DATEDIFF(Discharge_Date, Admit_Date)) AS Max_Length_of_Stay
FROM healthcare_data;


-- USE CASE 5:  Seasonal Admission Patterns
-- Use Case Description:  Analyze monthly patient admissions to identify seasonal trends, 
-- enabling hospitals to anticipate peak periods and optimize resource allocation, staffing, and 
-- capacity planning accordingly.

SELECT MONTH(Admit_Date) AS Admission_Month,
       COUNT(*) AS Admission_Count
FROM healthcare_data
GROUP BY MONTH(Admit_Date)
ORDER BY Admission_Count DESC;


-- USE CASE 6: Seasonal Trends in Disease Occurrence
-- Use Case Description: Analyze seasonal patterns of disease occurrences to identify prevalent diagnoses in each season.

SELECT
    CASE
        WHEN MONTH(Admit_Date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(Admit_Date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(Admit_Date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Autumn'
    END AS Season,
    Diagnosis,
    COUNT(*) AS Disease_Count
FROM healthcare_data
GROUP BY Season, Diagnosis
ORDER BY Disease_Count DESC;

-- USE CASE 7: Top Doctors by Number of Patients Treated
-- Use Case Description: Identify the most frequently consulted doctors to optimize staff allocation.

SELECT Doctor, COUNT(*) AS Patient_Count
FROM healthcare_data
GROUP BY Doctor
ORDER BY Patient_Count DESC;

-- USE CASE 8: Patient Feedback Analysis per Doctor
-- Use Case Description: Analyze patient feedback scores per doctor to identify areas for improvement in care 
-- and enhance patient satisfaction.

SELECT
    Doctor,
    AVG(Feedback) AS Avg_Feedback
FROM healthcare_data
GROUP BY Doctor
ORDER BY Avg_Feedback DESC;

-- USE CASE 9: Length of Stay and Bed Utilization Analysis
-- Use Case Description: Analyze the average length of stay (LOS) for patients by bed occupancy type to 
-- identify which beds are occupied for longer periods.

SELECT 
    Bed_Occupancy,
    AVG(DATEDIFF(Discharge_Date, Admit_Date)) AS Avg_Length_of_Stay
FROM healthcare_data
WHERE Discharge_Date IS NOT NULL
GROUP BY Bed_Occupancy
ORDER BY Avg_Length_of_Stay DESC;

  
-- USE CASE 10: Average Billing vs. Insurance Coverage Discrepency by Diagnosis
-- Use Case Description: Analyze the discrepancy between average billing amounts and insurance coverage for 
-- different diagnosis to identify potential gaps in coverage and billing accuracy. 
-- This helps healthcare providers optimize billing processes and improve financial planning.

 
 SELECT
    Diagnosis,
    AVG(`Billing Amount`) AS Avg_Billing_Amount,
    AVG(`Health Insurance Amount`) AS Avg_Insurance_Coverage,
    AVG(`Billing Amount`) - AVG(`Health Insurance Amount`) AS Avg_Discrepancy,
    (AVG(`Billing Amount`) - AVG(`Health Insurance Amount`)) / AVG(`Billing Amount`) * 100 AS Discrepancy_Percentage
FROM healthcare_data
GROUP BY Diagnosis
ORDER BY Discrepancy_Percentage DESC;


-- USE CASE 11: Relation Between Test and Diagnosis
-- Use Case Description: Analyze the relation between diagnosis and the tests most frequently ordered for each condition. 


SELECT Diagnosis, Test, COUNT(*) AS Test_Count
FROM healthcare_data
GROUP BY Diagnosis, Test
ORDER BY Test_Count DESC;

-- USE CASE 12: Track Follow-up Appointments and Patient Outcomes
-- Use Case Description: Monitor patient follow-up appointments and the time taken for follow-ups after 
-- discharge, helping the hospital assess patient engagement and identify patterns that may impact treatment outcomes.

SELECT
    Diagnosis,
    COUNT(*) AS Total_Followups,
    AVG(DATEDIFF(`Followup Date`, Discharge_Date)) AS Avg_Days_To_Followup
FROM healthcare_data
WHERE `Followup Date` IS NOT NULL
GROUP BY Diagnosis
ORDER BY Total_Followups DESC;


-- USE CASE 13: Most Common Diseases and their Average Billing Amount
-- Use Case Description: Identify the most common diseases and analyze the average billing amount for each.

SELECT
    Diagnosis,
    COUNT(*) AS Disease_Count,
    AVG(`Billing Amount`) AS Avg_Billing_Amount
FROM healthcare_data
GROUP BY Diagnosis
ORDER BY Disease_Count DESC;

-- USE CASE 14: Track Bed Occupancy Trends and Identify Peak Admission Periods
-- Use Case Description: Utilize bed occupancy data to analyze admission trends, pinpoint peak periods, 
-- and optimize bed management, staffing, and resource allocation to enhance preparedness for high-demand periods.

SELECT
    YEAR(Admit_Date) AS Year,
    MONTH(Admit_Date) AS Month,
    COUNT(*) AS Total_Admissions,
    SUM(CASE WHEN Bed_Occupancy = 'ICU' THEN 1 ELSE 0 END) AS ICU_Beds_Occupied,
    SUM(CASE WHEN Bed_Occupancy = 'General' THEN 1 ELSE 0 END) AS General_Beds_Occupied,
    SUM(CASE WHEN Bed_Occupancy = 'Private' THEN 1 ELSE 0 END) AS Private_Beds_Occupied
FROM healthcare_data
GROUP BY YEAR(Admit_Date), MONTH(Admit_Date)
ORDER BY Year DESC, Month DESC;

-- USE CASE 15: Monitor Patient Recovery and Treatment Outcomes
-- Use Case Description: Analyze patient recovery and follow-up times across different diseases to identify 
-- factors that contribute to faster recovery.

SELECT 
        Diagnosis,
        AVG(DATEDIFF(Discharge_Date, Admit_Date)) AS Avg_Recovery_Time,
        AVG(DATEDIFF(`Followup Date`, Discharge_Date)) AS Avg_Followup_Time
    FROM healthcare_data
    WHERE Discharge_Date IS NOT NULL AND `Followup Date` IS NOT NULL
    GROUP BY Diagnosis
    ORDER BY Avg_Recovery_Time DESC;


-- USE CASE 16: Impact of Tests on Total Billing Amount
-- Use Case Description:  Analyze the medical tests that contribute the most to total billing amounts by evaluating
--  their average billing and frequency.

SELECT 
    Test,
    AVG(`Billing Amount`) AS Avg_Billing_Amount,
    COUNT(*) AS Test_Count
FROM healthcare_data
GROUP BY Test
ORDER BY Avg_Billing_Amount DESC;

