-- Challenges
-- https://www.hackerrank.com/challenges/challenges/problem

/* count total submissions of challenges of each user */
  select a.hacker_id,a.name,count(b.hacker_id)    
    from Hackers a, Challenges b
    WHERE a.hacker_id = b.hacker_id
    GROUP BY a.hacker_id,a.name
    HAVING count(b.hacker_id) not in (select  distinct          count(hacker_id) from Challenges
    WHERE hacker_id <> a.hacker_id
    group by hacker_id
    having count(hacker_id) < (select                           max(x.challenge_count) 
    from (select count(b.challenge_id) as challenge_count                 from Challenges b GROUP BY b.hacker_id) as x ))
    ORDER BY count(b.hacker_id) desc, a.hacker_id 