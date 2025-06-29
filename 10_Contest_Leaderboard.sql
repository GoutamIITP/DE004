/*
Enter your query here.
*/
select
    H.hacker_id,
    H.name,
    sum(MaxScores.max_score) as total_score
from Hackers H
join (
    select
        S.hacker_id,
        S.challenge_id,
        max(S.score) as max_score
    from Submissions S
    group by S.hacker_id, S.challenge_id
) as MaxScores on H.hacker_id = MaxScores.hacker_id
group by H.hacker_id, H.name
having sum(MaxScores.max_score) > 0
order by total_score desc, H.hacker_id asc;