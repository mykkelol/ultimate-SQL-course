-- CHAR (has a fixed length of 0-255, if you specify 5--it will have 5, no less/more) vs VARCHAR
    -- since CHAR is fixed, it's quicker to process than VARCHAR
    -- both CHAR and VARCHAR will truncate the string if it goes over the specification
        -- however, CHAR will have fixed storage after truncate whereas VARCHAR will grow/shrink depending on length string

-- DECIMAL(total num of digits, digits after decimal)
    -- (5, 2) would be 999.99
        -- 9.9999 would round up to only have two decimal places
        
-- DOUBLE vs FLOAT
    -- float precision issues starts at 7 digits
    -- double precision issues starts at 15 digits
    
-- DATE, TIME, DATETIME
    -- 'YYYY-MM-DD'
    -- 'HH:MM:SS'
    -- 'YYYY-MM-DD HH:MM:SS
    
-- CURDATE(), CURTIME(), NOW()
    -- gives current date, time, datetime
    -- DAY(), DAYNAME(), DAYOFWEEK(), DAYOFYEAR()
    -- MONTH(), MONTHNAME()
    -- HOUR(), MIN()
    -- DATE_FORMAT(birthdt, '%M, %D, %Y') FROM people; 
        -- uppercase and lowercase matters
        -- DATE_FORMAT(bithdt, '%m/%d/%Y at %H:%m')
        
-- DATEMATH
    -- DATEDIFF(date1, date2)
    -- DATEADD(date, INTERVAL 3 MONTH)
    -- +/-
        -- SELECT date - INTERVAL 1 YEAR + INTERVAL 10 HOUR FROM table;
        
-- TIMESTAMPS
    --CREATE TABLE comments (
    --    content VARCHAR(100),
    --    created_at TIMESTAMP DEFAULT NOW(), // set default value to NOW()
    --    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
    --);
    -- can sort ORDER BY created_at
    -- CURRENT_TIMESTAMP is same as NOW()
    
-- DATETIME vs TIMESTAMP
    -- timestamp has a smaller range from yr 1970 to something
    -- datetime is twice as large as timestamp