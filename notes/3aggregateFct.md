<!-- COUNT -->
    SELECT COUNT(*) FROM books;
    SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
    SELECT COUNT(title) FROM books WHERE title LIKE "%the%";
    
<!-- GROUPBY, summarizes/aggregate identical data into a single row -->
    SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
        <!-- count all books in each of group of author_lname -->
    SELECT author_fname, author_lname FROM books GROUP BY author_lname, author_fname;
    
<!-- MIN/MAX -->
    SELECT MIN(pages) FROM books;
    <!-- SUBQUERY with MAX/MIN -->
        SELECT * FROM books
            WHERE pages = (SELECT MAX(pages) * FROM books);
    <!-- WITH LIMIT AND ORDER BY -->
        SELECT * FROM books
            ORDER BY pages DESC LIMIT 1;
    <!-- GROUP BY -->
        SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
        
<!-- SUM -->
    SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_lname, author_fname;
    
<!-- AVG -->
    SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;