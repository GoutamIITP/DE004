/*
Enter your query here.
*/
select
case
    when G.Grade < 8 then 'NULL'
    else S.Name
End as Name, G.Grade, S.Marks
from Students S
join Grades G on S.Marks between G.Min_Mark and G.Max_Mark
order by G.Grade desc,
Case
    when G.Grade >= 8 then S.Name
    else null
end asc,
case
    when G.Grade < 8 then S.Marks
    else null
end asc;
    
    
    
    
    
    
    