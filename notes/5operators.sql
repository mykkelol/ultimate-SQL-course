-- !=
    -- SELECT title, released_year FROM books WHERE released_year != 2017; 

-- NOT LIKE
    -- SELECT title FROM books WHERE title NOT LIKE 'W%'; // return everything that doesnt start with W
    
-- >=, >, <, =<
    -- SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY 2;
    -- BOOLEAN true(1) or false(0)
    
-- && (AND) both side/conditions must be true
    -- SELECT title, author_lname, released_year 
    -- FROM books WHERE 
    -- author_fname = 'Dave' AND author_lname = 'Eggers' AND released_year > 2010
    
-- || (OR) only one side/condition must be true
    -- SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' || released_year > 2010;
    
-- BETWEEN a AND b
    -- SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
    -- When comparing dates, use CAST for fail-proof and mitigate problems
        -- SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1970-01-01' AS DATETIME) AND CAST('1993-02-04' AS DATETIME); 
    
-- NOT BETWEEN a AND b
    -- SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
    
-- IN and NOT IN
    -- SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
    -- SELECT title, released_year 
    -- FROM books WHERE 
    -- released_year >= 2000 AND 
    -- released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016) ORDER BY 2;
        -- SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY 2;
        
-- CASE STATEMENT
    -- SELECT title, released_year,
        -- CASE
            -- WHEN released_year >= 2000 THEN 'Modern Lit'
            -- ELSE '20th Century Lit'
        -- END AS GENRE
    -- FROM books;
    
    -- SELECT title, stock_quantity,
        -- CASE
            -- WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
            -- WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
            -- ELSE '***'
        -- END AS STOCK
    -- FROM books;
    
    SELECT title, author_lname,
        CASE
            WHEN COUNT(*) < 2 THEN CONCAT(COUNT(*), ' book')
            ELSE CONCAT(COUNT(*), ' books')
        END AS COUNT
    FROM books GROUP BY author_lname, author_fname;