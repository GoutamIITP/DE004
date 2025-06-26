/*
Enter your query here.
*/
select distinct CITY
from STATION
where lower(left(CITY, 1)) in ('a' , 'e' , 'i', 'o', 'u') and 
      lower(right(CITY, 1)) in ('a' , 'e' , 'i', 'o', 'u'); 