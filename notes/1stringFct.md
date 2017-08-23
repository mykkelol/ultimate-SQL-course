<!-- concatenating first and last name -->
    SELECT
        CONCAT(author_fname, ' ', author_lname) AS 'full name'
    FROM books;
    SELECT
        author_fname AS 'first', author_lname AS' last',
        CONCAT(author_fname, ' ', author_lname) AS 'full name'
    FROM books;

<!-- CONCAT_WS (WITH SEPERATOR)  -->
    SELECT
        CONCAT_WS(' - ', title, author_fname, author_lname)
    FROM books;
    
<!-- SUBSTRING -->
    SUBSTRING('Hello World', 1, 4) returns Hell
    SUBSTRING('Hello World', 7) returns 7 and everything after or World
    SUBSTRING('Hello World', -3) returns the last three or rld
    
<!-- CONCAT+SUBSTRING -->
    SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short tile' FROM books;
    
<!-- REPLACE -->
    SELECT REPLACE(title, 'e', '3') FROM books;
    SELECT
        SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
    FROM books;
    
<!-- REVERSE -->
    SELECT REVERSE('Hello world');
    
<!-- CHAR_LENGTH -->
    SELECT CHAR_LENGTH(author_fname) FROM books;
    SELECT 
        CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long.') AS 'char desc' 
    FROM books;

<!-- UPPER & LOWER -->
    SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
    
SELECT
    CONCAT(SUBSTRING(title, 1, 10),'...') AS 'short title', 
    CONCAT(author_lname,',',author_fname) AS 'author', 
    CONCAT(stock_quantity, ' in stock') AS 'quantity' 
FROM books
WHERE author_lname in ('Gaiman', 'Eggers');