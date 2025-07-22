select * from s_india
select * from s_india where total > 0
select state, count(gender) as number_of_people from s_india group by state
select state, sum(total) as total_people_in_state from s_india group by state
select sum(total) from s_india
delete from s_india where state like 'Total%'
delete from s_india where age_group = '0-100+'

---Basic Questions
--Write a query to find the total number of records in the dataset.
select count(state) from s_india
--How would you retrieve all rows where the gender is 'Male' and the age group is '15-24'?
select * from s_india where gender = 'Male' and age_group = '15-29'
--Write a query to select distinct states from the dataset.
select distinct(state) from s_india

---Aggregation and Grouping
--Write a query to find the total number of cases reported(total) for each state
select state, sum(total) from s_india group by state
--Find the total cases per year for each gender.
SELECT year, gender, SUM(total) AS total_cases
FROM s_india
GROUP BY year, gender
ORDER BY year, gender;
--How would you find the average number of cases per age group?
select age_group,avg(total) from s_india group by age_group
--Write a query to get the state with the highest total cases in a single year.
select state, total from s_india where total = (select max(total) from s_india)

---Filtering and Having Clause
--Write a query to find states that reported more than 50,000 total cases in any year.
select state, year, sum(total) as total_cases 
from s_india 
group by state, year 
having sum(total) > 50000 
order by state, year
--Find all age groups where the total number of cases (summed across all rows) is greater than 1,00,000.
select age_group, sum(total) as total_cases from s_india group by age_group having sum(total) > 100000 order by total_cases

---Order by and Limit
--List the top 5 states with the highest number of total cases overall.
select state, sum(total) as total_cases from s_india group by state order by total_cases desc limit 5
--How would you retrieve the top 3 age groups with the most reported cases in 2010?
select age_group, sum(total) as total_cases from s_india
where year = 2010 
group by age_group 
order by total_cases desc 
limit 3

---Similar Questions
--Find the total cases per state for each year.
select state, year, sum(total) as total_cases from s_india group by state, year
--Find the total number of cases reported for each age group across all years.
select year, age_group, sum(total) as total_cases from s_india group by year, age_group
--Find the year with the highest number of total cases overall.
select year, sum(total) as total_cases from s_india group by year order by total_cases desc limit 1
--Find the total number of cases reported for each type of crime.
select type_code, type, sum(total) as total_cases from s_india group by type_code, type
--Find the total cases for each gender for the state 'Maharashtra'.
select gender, sum(total) as total_cases from s_india where state = 'Maharashtra' group by gender
--Find total cases for each type of crime for the year 2009.
select type_code, type, sum(total) as total_cases from s_india where year = 2009 group by type_code, type 
--Find the average number of cases reported per year across all states.
select state, year, avg(total) as average_cases from s_india group by state, year
--Find which age group had the highest total number of cases for females.
select age_group, sum(total) as total_cases from s_india where gender = 'Female' group by age_group order by total_cases desc limit 1

---Extra Questions
--Find age groups that reported more than 1,50,000 total cases overall.
select age_group, sum(total) as total_cases from s_india group by age_group having sum(total) > 150000
--Find states where the total number of cases for females exceeded 20,000 in any year.
select state, year, sum(total) from s_india where gender = 'Female' group by state, year having sum(total) >
20000
--Find crime types (type) that had more than 5,000 cases in 2008.
select type_code, type, sum(total) from s_india where year = 2008 group by type_code, type having sum(total) > 5000
--Find years in which the total number of cases for males exceeded 250,000.
select year, sum(total) from s_india where gender = 'Male' group by year having sum(total) > 250000 
--Find crime types that never crossed 500 cases in any year.
select type, year, sum(total) as total_cases from s_india group by type, year having sum(total) < 500
--Find states and years where cases by individuals aged '0-14' exceeded 1,500.
select state, year, sum(total) as total_cases from s_india where age_group = '0-14' group by state, year having sum(total) > 1500
--Find state and gender combinations with more than 35,000 cases in a year.
select state, year, sum(total) as total_cases from s_india group by state, year having sum(total)> 35000
--Find years and age groups where cases were below 500.
select year, age_group, sum(total) as total_cases from s_india group by year, age_group having sum(total) < 10000
