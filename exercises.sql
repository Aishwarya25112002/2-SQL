select * from cd.bookings
/*1.	How can you retrieve all the information from 
the cd.facilities table?*/
select * from cd.facilities

/*2.	You want to print out a list of all of the 
facilities and their cost to members. How would you 
retrieve a list of only facility names and costs?*/

SELECT name, membercost
FROM cd.facilities;

/*3.	How can you produce a list of facilities 
that charge a fee to members?*/

SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;


/*4.	How can you produce a list of 
facilities that charge a fee to members, 
and that fee is less than 1/50th of the monthly 
maintenance cost? Return the facid, facility name, 
member cost, and monthly
maintenance of the facilities in question.*/

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND
membercost < monthlymaintenance/50;

/*5.	How can you produce a list of 
all facilities with the word 
'Tennis' in their name?*/
select * from cd.facilities
where name like '%Tennis%'

/*6.	How can you retrieve the details of
facilities with ID 1 and 5? Try to do 
it without using the OR operator.*/
select * from cd.facilities 
where facid in (1,5);

/*7.	How can you produce a list 
of members who joined after the start of 
September 2012? Return the memid, surname,
firstname, and
joindate of the members in question*/

SELECT memid, surname, firstname, joindate 
FROM cd.members 
where joindate > '2012-09-01 00:00:00';

/*8.	How can you produce an ordered list of the 
first 10 surnames in the members table? 
The list must not contain duplicates.*/
SELECT DISTINCT surname 
from cd.members 
ORDER BY surname
LIMIT 10; 

/*9.	You'd like to get the signup date of 
your last member. 
How can you retrieve this information?*/

select joindate as signup 
from cd.members
order by joindate desc 
limit 1; 

/*10.	Produce a count of the number of 
facilities that have a
cost to guests of 10 or more.*/

Select count(*) from cd.facilities 
where guestcost >= 10;

/*11.	Produce a list of the total number of
slots booked per facility in the month
of September 2012. Produce an output table 
consisting of facility id and slots, 
sorted by the number of slots.*/

select facid,sum(slots) from cd.bookings 
where starttime > '2012-09-01' AND starttime < '2012-10-01' 
group by facid 
ORDER BY SUM(slots) ;

/*
14.	Produce a list of facilities with more than 
1000 slots booked. Produce an output table 
consisting of facility id and total slots,
sorted by facility id.*/

select facid,sum(slots) as total_slots 
from cd.bookings 
group by facid
having sum(slots)>1000 
order by facid

/*15.	How can you produce a list of the 
start times for bookings for tennis courts, 
for the date '2012-09-21'? Return a list of start 
time and  facility name pairings, ordered by the time.*/

select starttime as start ,name from cd.bookings 
left join cd.facilities
on cd.facilities.facid=cd.bookings.facid
where cd.facilities.name like '%Tennis%' 
and cd.bookings.starttime 
between'2012-09-21 00:00:00' and '2012-09-21 24:00:00'
order by start;

/*14.	How can you produce a list of 
the start times for bookings by members named 
'David Farrell'?*/

SELECT starttime
FROM cd.bookings
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE surname LIKE '%Farrell%' AND firstname 
LIKE '%David%'  
ORDER BY starttime;