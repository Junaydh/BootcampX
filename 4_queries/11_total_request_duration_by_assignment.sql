SELECT day, count(*) as number_of_assigments, sum(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;