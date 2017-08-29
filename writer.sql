CREATE TABLE students (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

SELECT first_name, IFNULL(title,'MISSING') AS title, IFNULL(grade,0) AS grade FROM students
    LEFT JOIN papers ON students.id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students
    LEFT JOIN papers ON students.id = papers.student_id GROUP BY id ORDER BY 2 DESC;
    
SELECT first_name, IFNULL(AVG(grade), 0) AS average, 
    CASE
        WHEN IFNULL(AVG(grade), 0) < 75 THEN 'FAILING'
        ELSE 'PASSING'
    END AS passing_status
FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY id ORDER BY 2 DESC;