Create Database DSA
USE DSA;

Drop DATABASE DSA 

Create Table Employee(
Staffid varchar(10),
FirstName varchar(100),
SecondName varchar(100),
Date_of_birth date,
HireDate date
)
drop table Employee

---START--
SELECT * FROM [dbo].[oldest_companies]

---The range of the founding years of the oldest companies in the world---
SELECT MAX("Year")-MIN("Year") AS Range FROM [dbo].[oldest_companies]

---The oldest company in the world and the industry it belongs to---
SELECT top 1 MAX("Year") AS MaxYear, Current_location From [dbo].[oldest_companies]
group by Current_location 
order by MaxYear desc

---The oldest company in the world and the industry it belongs to---
SELECT MAX("YEAR") AS [MAXIMUM YEAR], Current_location FROM [dbo].[oldest_companies]
where year = (select max("Year") from [dbo].[oldest_companies])
Group by Current_location

---How many companies—and which ones—were founded before 1000 AD---
SELECT COUNT("Company") AS [TOTAL COMPANIES] FROM [dbo].[oldest_companies]
SELECT Year,Company FROM [dbo].[oldest_companies]
WHERE Year<1000

---How many companies were founded before 1000 AD---
---How many countries were recorded before the year 1000?---
SELECT COUNT("Current_location") FROM [dbo].[oldest_companies]
WHERE YEAR<1000

---The most common field to which the oldest companies belong to---
SELECT Field,MAX(Company) FROM [dbo].[oldest_companies]
group by Field

---Which are the top 5 oldest recorded countries in the dataset?---
SELECT TOP 5 * FROM
(select DISTINCT Current_location from [dbo].[oldest_companies])
oldest_companies

---How many countries were recorded before the year 1000?---
SELECT Current_location,year FROM [dbo].[oldest_companies]
WHERE YEAR < 
(SELECT YEAR FROM [dbo].[oldest_companies]
where year=1000)

---Which country has the most records of companies related to ancient countries?---
select top 1 count(Current_location) as highest, Current_location from [dbo].[oldest_companies]
group by Current_location
order by highest desc

---How has the number of recorded countries changed over centuries?---
---How many countries were there in the 1500s? Were there more or fewer in the 1800s?---
SELECT 
  Current_location,
  SUM(CASE WHEN year < 1000 THEN 1 ELSE 0 END) AS count_before_1000,
  SUM(CASE WHEN year >= 1000 THEN 1 ELSE 0 END) AS count_after_1000
FROM [dbo].[oldest_companies]
GROUP BY Current_location;

select Current_location from [dbo].[oldest_companies]
where year= any
(select min(year) from [dbo].[oldest_companies])