SELECT AVG(total_duration) as average_total_duration
FROM (
  SELECT SUM(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as totals_avg_duration;