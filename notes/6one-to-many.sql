-- DATA RELATIONSHIP
    -- one to one: one customer has one row of data dedicated to them 
        -- e.g. a customer has a row in the customer detail table like their email, usrname, and pass
    -- one to many: one book has many reviews
        -- a book have many reviews
    -- many to many: many authors has many books
        -- a book can have two authors or an author can have many books
        
-- CROSS JOIN - connects every rows of table 1 to table 2
    -- most useless join
    -- SELECT * FROM customers, orders;

-- INNER JOIN
    -- instead of using subquery like so: 
        SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');
    -- we can use:
            -- IMPLICIT INNER JOIN
            SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
                -- customer.id refers to primary key in customers table and customer_id refers to foreign key of
            -- EXPLICIT INNER JOIN -- considered better practice due to semantics
            SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;
            
    --------------
        SELECT first_name,last_name,SUM(amount) AS 'TOTAL SPENT' 
        FROM customers 
        INNER JOIN orders ON customers.id = orders.customer_id 
        GROUP BY orders.customer_id ORDER BY 3 DESC;
        
-- LEFT / RIGHT JOIN 
    -- LEFT: takes all of left table and matching records from right
        SELECT first_name, last_name, IFNULL(SUM(amount),0) AS 'total spent'
        FROM customers 
        LEFT JOIN orders ON customers.id = orders.customer_id 
        GROUP BY customers.id ORDER BY 3;
    -- RIGHT: takes all of right and matching records from left

        
        

        
    CREATE TABLE customers (
        id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE orders (
        id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
        order_date DATE,
        amount DECIMAL(8,2),
        customer_id INT,
        FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
    );
    -- ON DELETE CASCADE will delete the orders if the matching customers is deleted
    
    INSERT INTO customers(first_name, last_name, email)
    VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
    
    INSERT INTO orders(order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5),
       ('2017/04/26', 777.77, 109);
       
    