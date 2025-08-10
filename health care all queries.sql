select * from patients;
select * from doctor;
select * from labresult;
select * from treatment;

/* Pateint dashboard kpis */

# 1 Total pateint 
		select count(*) as Total_Pateint from patients;

# 2 Avg age of patient

select round(avg(age),0) as avg_age_pateint from patients;

# 3 Avg medicatation cost 
select Avg(cost) as avg_medication_cost from treatment ;

# 4 Total Treatments

	select count(*) as Total_treatment from treatment;
    

# 5 Follow up rate

	SELECT ROUND(100.0 * SUM(CASE WHEN `Follow Up Required` = 'Yes' THEN 1 ELSE 0 END) /
	COUNT(*), 0) AS Follow_Up_Rate_Percent
	FROM visit;
 

# 6 Top 5 Diagnosed Conditions 
		select (diagnosis) , count(*) 
		from visit
		group by diagnosis 
		order by count(*) desc;

# 7) Lab Test Counducted 

select count(*) as test, `Test Result`
from labresult
group by `Test Result` ;

# 8) % abnormal  lab result

SELECT ROUND(100.0 * SUM(CASE WHEN `Test Result` = 'Abnormal' THEN 1 ELSE 0 END) /
 COUNT(*),2) AS Abnormal_Result_Percent
FROM labresult;

# 9) most common medications
	select distinct(`Prescribed Medications`),count(*) quantity
		from visit
        group by `Prescribed Medications`
		order by count(*) desc;

# 10 Lab Result Status 
SELECT `Test Result`, COUNT(*) AS Count
FROM labresult
GROUP BY `Test Result`;


# Doctors Dashboard 

# 1 Total doctors
select count(*) as total_doctors from doctor;


# 2 Avg patients per Doctor (Doctore workload )

SELECT ROUND(COUNT(DISTINCT `Patient ID`) / COUNT(DISTINCT `Doctor ID`), 2) AS Avg_Patients_Per_Doctor
FROM Visit;


# 3 Top doctor by condition
SELECT  (Diagnosis), COUNT(*) AS Count
FROM visit
GROUP BY Diagnosis
ORDER BY Count DESC
;




# 4 availabilty per Doctor specility 

select Specialty,count(*)
from doctor
group by specialty;




#5 most common conditioned treated 
select distinct diagnosis
from visit;


# 6 Total revenue Visit cout by specaility 

SELECT D.Specialty, COUNT(V.`Visit ID`) AS Visit_Count, SUM(T.`Treatment Cost`) AS Total_Revenue
FROM Visit V
JOIN Doctor D ON V.`Doctor ID` = D.`Doctor ID`
JOIN Treatment T ON V.`Visit ID` = T.`Visit ID`
GROUP BY D.Specialty;


# 7 Avg age experince Doctor by specility 
select round(avg(`Years Of Experience`) ,0) as Avg_Years_Of_Exp
from doctor;


