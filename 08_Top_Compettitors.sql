/*
Enter your query here.
*/
select H.hacker_id, H.name
from Hackers H
join (
    select
        S.hacker_id,
        count(distinct S.challenge_id) as full_solved
    from submissions S
    join challenges C on S.challenge_id = C.challenge_id
    join Difficulty D on C.difficulty_level = D.difficulty_level
    where S.score = D.score
    group by S.hacker_id
    having count(distinct S.challenge_id) > 1
) as fullScores on H.hacker_id = fullScores.hacker_id
order by fullScores.full_solved desc, H.hacker_id asc;