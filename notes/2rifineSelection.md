<!-- DISTINCT, makes our selection show only unique values/no duplicates -->
    SELECT DISTINCT
        author_fname, author_lname
    FROM books;
    
<!-- ORDER BY, automatically ordered ascending columns  ASC vs DESC-->
    SELECT
        title, author_fname, author_lname FROM books
        ORDER BY 2 DESC
    FROM books;
    
    SELECT
        author_fname, author_lname FROM books
        ORDER BY 2, 1
    FROM books;
    
<!-- LIMIT, limit to certain amount of rows -->
    SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 2,5;