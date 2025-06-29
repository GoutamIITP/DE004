/*
Enter your query here.
*/
with orderlat as (
select LAT_N, row_number() over (order by LAT_N) as row_num,
count(*) over () as total_rows
from STATION)
select round(avg(LAT_N * 1.0), 4) as median
from orderlat
where row_num in (
(total_rows + 1) / 2,
    (total_rows + 2) / 2 );