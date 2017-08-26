<!-- DISTINCT, makes our selection show only unique values/no duplicates -->
    SELECT DISTINCT
        author_fname, author_lname
    FROM books;
    
<!-- ORDER BY, automatically ordered ascending columns  ASC vs DESC-->
    SELECT
        title, author_fname, author_lname FROM books
        ORDER BY 2 DESC;
    
    SELECT
        author_fname, author_lname FROM books
        ORDER BY 2, 1;
    
<!-- LIMIT, limit to certain amount of rows -->
    SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 2,5;
    
<!-- LIKE, the %% are 'wildcards', give me anything in WHERE that's like the wildcard -->
    SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%'; 
        <!-- this will show us all fname that contains "da" -->
        <!-- e.g. Dave, David, Freida, Dan -->
    SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
        <!-- will only show name that starts with da e.g. Dave, Dan, David -->
        <!-- '%da' would specify anything ENDs with da -->
        <!-- 'da' would speicify anything that ONLY contains da -->
    SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
        <!-- give me anything that has 4 digits -->
        <!-- could be useful for phone#: (___)____-_____ -->