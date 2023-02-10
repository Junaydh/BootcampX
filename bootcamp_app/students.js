const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  database: 'bootcampx'
});

const arg = process.argv[2];
const arg2 = process.argv[3];

pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name like '%${arg}%'
LIMIT '${arg2}';
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
});