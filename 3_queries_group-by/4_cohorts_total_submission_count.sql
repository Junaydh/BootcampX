SELECT cohorts.name, COUNT(assignment_submissions.*)
FROM cohorts 
JOIN students ON cohort_id = cohorts.id
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY COUNT(assignment_submissions.*) DESC;