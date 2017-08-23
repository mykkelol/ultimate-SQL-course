SELECT * FROM cats WHERE name = 'Misty';

<!-- update -->
UPDATE cats SET breed = 'Shorthair', name = 'roar'
WHERE breed = 'Tabby';

<!-- delete -->
DELETE FROM tablename WHERE col = val;
DELETE FROM tablename <!-- delete all rows -->
