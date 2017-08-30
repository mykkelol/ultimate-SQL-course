-- MANY TO MANY RELATIONSHIP
    -- books <> authors
    -- blog post <> tags
    -- students <> classes
    
    SELECT title, AVG(rating) 
    FROM series 
    JOIN reviews ON series.id = reviews.series_id 
    GROUP BY 1 ORDER BY 2;
    
    SELECT first_name, last_name, rating 
    FROM reviewers 
    JOIN reviews ON reviewers.id = reviews.reviewer_id;
    
    SELECT title AS 'unreviewed_series'
    FROM reviews
    RIGHT JOIN series ON reviews.series_id = series.id WHERE rating IS NULL;
    
    SELECT genre, ROUND(AVG(rating), 2) AS avg_rating
    FROM series 
    JOIN reviews ON series.id = reviews.series_id 
    GROUP BY genre;
    
    SELECT 
        first_name, 
        last_name, 
        COUNT(rating) AS 'COUNT', 
        IFNULL(MIN(rating), 0) AS 'MIN', 
        IFNULL(MAX(rating), 0) AS 'MAX', 
        ROUND(IFNULL(AVG(rating), 0), 2) AS 'AVG', 
        IF(rating IS NULL, 'INACTIVE', 'ACTIVE') AS STATUS
    FROM reviewers
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id GROUP BY last_name, first_name ORDER BY STATUS;
    
    SELECT
        title,
        rating,
        CONCAT(first_name, " ",last_name) AS 'reviewers'
    FROM reviewers
    JOIN reviews ON reviewers.id = reviews.reviewer_id
    JOIN series ON series.id = reviews.series_id
    ORDER BY 1;