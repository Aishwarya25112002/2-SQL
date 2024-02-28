create table countries(
country_id varchar(3),
country_name varchar(45),
region_id decimal(10,0)
);

select * from countries

/*write sql statement to create the 
structure of the table dup_countries*/

create table dup_countries as
select * from countries

/* write the sql statement to create table 
contries,set the costraint null*/

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(3) NOT NULL,
COUNTRY_NAME varchar(45) NOT NULL,
REGION_ID decimal(10) NOT NULL
);

/*write sql statement  to create a table named jobs including columns
job_id,job_title,min_salary,max_salary and
check whether the max_salary amount exceeding the upper limit 25000*/

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID varchar(10) NOT NULL UNIQUE, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT NULL, 
MAX_SALARY decimal(6,0),
check (max_salary <=25000)
);

/*write the sql statement to create table named countries including column country_id,
country_name,region_id and make sure that no countries
except Italy ,india and china will be entered in the table*/

create table countries(
country_id varchar(2),
country_name varchar(40)
check(country_name in('Italy','India','china')),
region_id decimal(10,0)
);

select * from countries

/* write a sql statement to create a table named countries
including columns country_id,country_name,and region_id
and make sure that do duplicate data against column coum=ntry_id*/

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
UNIQUE(COUNTRY_ID)
);

/*write sql statement to create a table named jobs
including columns job_id,job_title,min_salary,max_salary,
and make sure tht ,the default value for job_title is blank
and min_salary is 8000 and max_salaryis null will be
entred automatically at the time of insertion if no value assigned for 
the specified columns*/

CREATE TABLE IF NOT EXISTS jobs ( /* if not exist-check condition true or false*/
JOB_ID varchar(10) NOT NULL UNIQUE, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);
/*write a sql statement to create a table named counteries
including columns country_id,country_name and region_id
and make sure that te country_id column_name and region_id
and make sure that the country_id column will be feild
which not contain any duplicate data in time intruction*/
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL unique primary key,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL

);

/* write the sql statement  to create a table countries
including the column*/
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID serial primary key,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);
/* write the sql statement  to create a table countries
including columns,country_id,country_name,region_id and make sure
that combination of column country_id and region_id will be unique*/

CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

/* write the sql statement to create table job_history
including the columns employee_id,start_date,end_date,
job_id and department_id and make sure that
employee_id column does not contain any duplicate values
at the time of insertion and foreign key column job_id contain
only those value which exist in the job table*/

create table job_history(
employee_id decimal(6,0)not null primary key,
start_date date not null,
end_date date not null,
job_id varchar(10)not null,
deparment_id decimal(4,0)default  null,
	foreign key(job_id)references jobs (job_id)
);

/*Write a query to find the addresses 
(location_id, street_address, city, state_province, 
country_name) of all the departments.*/

create table location
SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

