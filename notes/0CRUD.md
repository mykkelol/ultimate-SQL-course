help;

mysql-ctl start vs mysql-ctl stop
mysql-ctl cli;
SHOW DATABASES; 
SHOW WARNINGS; <!-- shows the warning and automatically convert the warning into a default value -->

<!-- create & drop/delete the entire database -->
CREATE DATABASE database_name;
DROP DATABASE database_name;

<!-- use database & show current use database -->
USE <database name>; 
SELECT database(); 

<!-- create/drop tables -->
CREATE TABLE tablename      CREATE TABLE tablename                  CREATE TABLE tablename (or have both NOT NULL and DEFAULT)
  (                             (                                       (
    column_name data_type,          column_name data_type NOT NULL,         column_name data_type DEFAULT 'unnamed',
    column_name data_type,          column_name data_type NOT NULL,         column_name data_type DEFAULT 99,
    cat_id  INT NOT NULL AUTO_INCREMENT,                                    cat_id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PRIMARY KEY (col_id) 
  );                            );                                      );
DROP TABLE tablename;
  
<!-- show tables -->
SHOW TABLES;
<!-- show columns of tables or describe tables (samething in this context) -->
SHOW COLUMNS FROM tablename;
DESC tablename;

<!-- INSERT INTO -->
INSERT INTO tablename (col1, col2)
VALUES (val1, val2);

OR 

VALUES (val1, val2),
       (val1, val2),
       (val1, val2);

<!-- SELECT -->
SELECT * FROM cats; <!-- shows all columns -->
SELECT age, name, cats_id FROM cats WHERE name = 'Ringo';
SELECT * FROM cats WHERE age = 4;
SELECT cats_id AS id, name FROM cats; <!-- AS is alias, changing header names temporary -->