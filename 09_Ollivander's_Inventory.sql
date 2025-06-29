/*
Enter your query here.
*/
select W.id, WP.age, W.coins_needed, W.power
from Wands W
join Wands_Property WP on W.code = WP.code
where WP.is_evil = 0
    and W.coins_needed = (
        select min(W2.coins_needed)
        from Wands W2
        join Wands_Property WP2 on W2.code = WP2.code
        where WP2.is_evil = 0
            and W2.power = W.power
            and WP2.age = WP.age
    )
        
order by W.power desc, WP.age desc; 
