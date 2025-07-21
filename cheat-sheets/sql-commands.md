# SQL Commands Reference Table

## Data Query Language (DQL) - SELECT

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `SELECT` | Retrieves data from tables | `SELECT * FROM users;` |
| `SELECT column1, column2` | Selects specific columns | `SELECT name, email FROM users;` |
| `SELECT DISTINCT` | Returns unique values | `SELECT DISTINCT country FROM users;` |
| `SELECT AS` | Creates column alias | `SELECT name AS full_name FROM users;` |
| `SELECT TOP/LIMIT` | Limits number of rows | `SELECT * FROM users LIMIT 10;` (PostgreSQL/MySQL)<br>`SELECT TOP 10 * FROM users;` (SQL Server) |
| `SELECT ... WHERE` | Filters rows | `SELECT * FROM users WHERE age > 18;` |
| `SELECT ... ORDER BY` | Sorts results | `SELECT * FROM users ORDER BY name ASC;` |
| `SELECT ... ORDER BY ... DESC` | Sorts descending | `SELECT * FROM users ORDER BY created_at DESC;` |
| `SELECT ... GROUP BY` | Groups rows | `SELECT country, COUNT(*) FROM users GROUP BY country;` |
| `SELECT ... HAVING` | Filters grouped results | `SELECT country, COUNT(*) FROM users GROUP BY country HAVING COUNT(*) > 100;` |

## WHERE Clause Operators

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `=` | Equal to | `WHERE age = 25` |
| `!=` or `<>` | Not equal to | `WHERE status != 'inactive'` |
| `>` | Greater than | `WHERE price > 100` |
| `<` | Less than | `WHERE quantity < 10` |
| `>=` | Greater than or equal | `WHERE age >= 18` |
| `<=` | Less than or equal | `WHERE discount <= 50` |
| `BETWEEN` | Between two values | `WHERE age BETWEEN 18 AND 65` |
| `LIKE` | Pattern matching | `WHERE name LIKE 'John%'` |
| `ILIKE` | Case-insensitive LIKE (PostgreSQL) | `WHERE name ILIKE 'john%'` |
| `IN` | Matches any value in list | `WHERE country IN ('USA', 'UK', 'Canada')` |
| `NOT IN` | Not in list | `WHERE status NOT IN ('deleted', 'banned')` |
| `IS NULL` | Is null value | `WHERE phone IS NULL` |
| `IS NOT NULL` | Is not null | `WHERE email IS NOT NULL` |
| `AND` | Logical AND | `WHERE age > 18 AND country = 'USA'` |
| `OR` | Logical OR | `WHERE status = 'active' OR status = 'pending'` |
| `NOT` | Logical NOT | `WHERE NOT (age < 18)` |
| `EXISTS` | Subquery returns rows | `WHERE EXISTS (SELECT * FROM orders WHERE orders.user_id = users.id)` |
| `ANY/SOME` | Compares to any value | `WHERE age > ANY (SELECT age FROM managers)` |
| `ALL` | Compares to all values | `WHERE salary > ALL (SELECT salary FROM interns)` |

## JOIN Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `INNER JOIN` | Returns matching rows from both tables | `SELECT * FROM users INNER JOIN orders ON users.id = orders.user_id;` |
| `LEFT JOIN` | Returns all from left table | `SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id;` |
| `RIGHT JOIN` | Returns all from right table | `SELECT * FROM users RIGHT JOIN orders ON users.id = orders.user_id;` |
| `FULL OUTER JOIN` | Returns all from both tables | `SELECT * FROM users FULL OUTER JOIN orders ON users.id = orders.user_id;` |
| `CROSS JOIN` | Cartesian product | `SELECT * FROM colors CROSS JOIN sizes;` |
| `SELF JOIN` | Joins table to itself | `SELECT e1.name, e2.name AS manager FROM employees e1 JOIN employees e2 ON e1.manager_id = e2.id;` |
| `NATURAL JOIN` | Joins on common columns | `SELECT * FROM users NATURAL JOIN orders;` |
| Multiple JOINs | Joins multiple tables | `SELECT * FROM users JOIN orders ON users.id = orders.user_id JOIN products ON orders.product_id = products.id;` |

## Data Manipulation Language (DML)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `INSERT INTO` | Inserts new rows | `INSERT INTO users (name, email) VALUES ('John', 'john@email.com');` |
| `INSERT INTO ... VALUES` | Inserts multiple rows | `INSERT INTO users (name, email) VALUES ('John', 'john@email.com'), ('Jane', 'jane@email.com');` |
| `INSERT INTO ... SELECT` | Inserts from query | `INSERT INTO users_backup SELECT * FROM users WHERE active = true;` |
| `UPDATE` | Updates existing rows | `UPDATE users SET email = 'newemail@email.com' WHERE id = 1;` |
| `UPDATE ... SET` | Updates multiple columns | `UPDATE users SET name = 'John Doe', age = 30 WHERE id = 1;` |
| `UPDATE ... FROM` | Updates with join (PostgreSQL) | `UPDATE users SET status = 'premium' FROM orders WHERE users.id = orders.user_id AND orders.total > 1000;` |
| `DELETE FROM` | Deletes rows | `DELETE FROM users WHERE status = 'inactive';` |
| `DELETE FROM ... USING` | Deletes with join (PostgreSQL) | `DELETE FROM users USING orders WHERE users.id = orders.user_id AND orders.status = 'cancelled';` |
| `TRUNCATE TABLE` | Deletes all rows (faster) | `TRUNCATE TABLE logs;` |
| `MERGE` | Upsert operation (SQL Server) | `MERGE users AS target USING source ON target.id = source.id WHEN MATCHED THEN UPDATE... WHEN NOT MATCHED THEN INSERT...;` |
| `INSERT ... ON CONFLICT` | Upsert (PostgreSQL) | `INSERT INTO users (id, name) VALUES (1, 'John') ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name;` |
| `INSERT ... ON DUPLICATE KEY` | Upsert (MySQL) | `INSERT INTO users (id, name) VALUES (1, 'John') ON DUPLICATE KEY UPDATE name = VALUES(name);` |

## Data Definition Language (DDL)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `CREATE DATABASE` | Creates new database | `CREATE DATABASE myapp;` |
| `DROP DATABASE` | Deletes database | `DROP DATABASE myapp;` |
| `CREATE TABLE` | Creates new table | `CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100) UNIQUE);` |
| `CREATE TABLE IF NOT EXISTS` | Creates if not exists | `CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY, name VARCHAR(100));` |
| `DROP TABLE` | Deletes table | `DROP TABLE users;` |
| `DROP TABLE IF EXISTS` | Deletes if exists | `DROP TABLE IF EXISTS users;` |
| `ALTER TABLE ADD` | Adds column | `ALTER TABLE users ADD COLUMN age INT;` |
| `ALTER TABLE DROP` | Drops column | `ALTER TABLE users DROP COLUMN age;` |
| `ALTER TABLE MODIFY` | Modifies column (MySQL) | `ALTER TABLE users MODIFY COLUMN name VARCHAR(200);` |
| `ALTER TABLE ALTER COLUMN` | Modifies column (SQL Server) | `ALTER TABLE users ALTER COLUMN name VARCHAR(200);` |
| `ALTER TABLE RENAME` | Renames table | `ALTER TABLE users RENAME TO customers;` |
| `ALTER TABLE ADD CONSTRAINT` | Adds constraint | `ALTER TABLE users ADD CONSTRAINT chk_age CHECK (age >= 0);` |
| `ALTER TABLE DROP CONSTRAINT` | Drops constraint | `ALTER TABLE users DROP CONSTRAINT chk_age;` |
| `CREATE INDEX` | Creates index | `CREATE INDEX idx_email ON users(email);` |
| `CREATE UNIQUE INDEX` | Creates unique index | `CREATE UNIQUE INDEX idx_username ON users(username);` |
| `DROP INDEX` | Drops index | `DROP INDEX idx_email;` |
| `CREATE VIEW` | Creates view | `CREATE VIEW active_users AS SELECT * FROM users WHERE status = 'active';` |
| `CREATE OR REPLACE VIEW` | Creates/replaces view | `CREATE OR REPLACE VIEW user_orders AS SELECT u.*, o.order_count FROM users u JOIN (SELECT user_id, COUNT(*) as order_count FROM orders GROUP BY user_id) o ON u.id = o.user_id;` |
| `DROP VIEW` | Drops view | `DROP VIEW active_users;` |

## Constraints

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `PRIMARY KEY` | Unique identifier | `id INT PRIMARY KEY` |
| `FOREIGN KEY` | References another table | `user_id INT, FOREIGN KEY (user_id) REFERENCES users(id)` |
| `UNIQUE` | Ensures unique values | `email VARCHAR(100) UNIQUE` |
| `NOT NULL` | Prevents null values | `name VARCHAR(100) NOT NULL` |
| `CHECK` | Validates data | `age INT CHECK (age >= 0)` |
| `DEFAULT` | Sets default value | `status VARCHAR(20) DEFAULT 'active'` |
| `AUTO_INCREMENT` | Auto-incrementing (MySQL) | `id INT AUTO_INCREMENT PRIMARY KEY` |
| `SERIAL` | Auto-incrementing (PostgreSQL) | `id SERIAL PRIMARY KEY` |
| `IDENTITY` | Auto-incrementing (SQL Server) | `id INT IDENTITY(1,1) PRIMARY KEY` |

## Aggregate Functions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `COUNT()` | Counts rows | `SELECT COUNT(*) FROM users;` |
| `COUNT(DISTINCT)` | Counts unique values | `SELECT COUNT(DISTINCT country) FROM users;` |
| `SUM()` | Sums values | `SELECT SUM(amount) FROM orders;` |
| `AVG()` | Calculates average | `SELECT AVG(age) FROM users;` |
| `MIN()` | Finds minimum value | `SELECT MIN(price) FROM products;` |
| `MAX()` | Finds maximum value | `SELECT MAX(salary) FROM employees;` |
| `GROUP_CONCAT()` | Concatenates grouped values (MySQL) | `SELECT country, GROUP_CONCAT(name) FROM users GROUP BY country;` |
| `STRING_AGG()` | Concatenates grouped values (PostgreSQL) | `SELECT country, STRING_AGG(name, ', ') FROM users GROUP BY country;` |
| `STDDEV()` | Standard deviation | `SELECT STDDEV(salary) FROM employees;` |
| `VARIANCE()` | Variance | `SELECT VARIANCE(salary) FROM employees;` |

## String Functions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `CONCAT()` | Concatenates strings | `SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;` |
| `||` | Concatenation operator (PostgreSQL) | `SELECT first_name || ' ' || last_name AS full_name FROM users;` |
| `LENGTH()` | String length | `SELECT LENGTH(name) FROM users;` |
| `UPPER()` | Converts to uppercase | `SELECT UPPER(name) FROM users;` |
| `LOWER()` | Converts to lowercase | `SELECT LOWER(email) FROM users;` |
| `TRIM()` | Removes spaces | `SELECT TRIM(name) FROM users;` |
| `LTRIM()` | Removes left spaces | `SELECT LTRIM(name) FROM users;` |
| `RTRIM()` | Removes right spaces | `SELECT RTRIM(name) FROM users;` |
| `SUBSTRING()` | Extracts substring | `SELECT SUBSTRING(name, 1, 3) FROM users;` |
| `REPLACE()` | Replaces substring | `SELECT REPLACE(email, '@old.com', '@new.com') FROM users;` |
| `POSITION()` | Finds substring position | `SELECT POSITION('@' IN email) FROM users;` |
| `LEFT()` | Left characters | `SELECT LEFT(name, 5) FROM users;` |
| `RIGHT()` | Right characters | `SELECT RIGHT(phone, 4) FROM users;` |
| `REVERSE()` | Reverses string | `SELECT REVERSE(name) FROM users;` |

## Date and Time Functions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `NOW()` | Current date and time | `SELECT NOW();` |
| `CURRENT_DATE` | Current date | `SELECT CURRENT_DATE;` |
| `CURRENT_TIME` | Current time | `SELECT CURRENT_TIME;` |
| `DATE()` | Extracts date part | `SELECT DATE(created_at) FROM orders;` |
| `TIME()` | Extracts time part | `SELECT TIME(created_at) FROM orders;` |
| `YEAR()` | Extracts year | `SELECT YEAR(birth_date) FROM users;` |
| `MONTH()` | Extracts month | `SELECT MONTH(created_at) FROM orders;` |
| `DAY()` | Extracts day | `SELECT DAY(created_at) FROM orders;` |
| `DATEADD()` | Adds to date (SQL Server) | `SELECT DATEADD(day, 7, order_date) FROM orders;` |
| `DATE_ADD()` | Adds to date (MySQL) | `SELECT DATE_ADD(order_date, INTERVAL 7 DAY) FROM orders;` |
| `+ INTERVAL` | Adds to date (PostgreSQL) | `SELECT order_date + INTERVAL '7 days' FROM orders;` |
| `DATEDIFF()` | Date difference | `SELECT DATEDIFF(end_date, start_date) FROM projects;` |
| `DATE_FORMAT()` | Formats date (MySQL) | `SELECT DATE_FORMAT(created_at, '%Y-%m-%d') FROM orders;` |
| `TO_CHAR()` | Formats date (PostgreSQL) | `SELECT TO_CHAR(created_at, 'YYYY-MM-DD') FROM orders;` |
| `EXTRACT()` | Extracts date part | `SELECT EXTRACT(YEAR FROM created_at) FROM orders;` |

## Window Functions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `ROW_NUMBER()` | Assigns row numbers | `SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank, * FROM employees;` |
| `RANK()` | Assigns rank with gaps | `SELECT RANK() OVER (ORDER BY score DESC) AS rank, * FROM scores;` |
| `DENSE_RANK()` | Assigns rank without gaps | `SELECT DENSE_RANK() OVER (ORDER BY score DESC) AS rank, * FROM scores;` |
| `NTILE()` | Divides into buckets | `SELECT NTILE(4) OVER (ORDER BY salary) AS quartile, * FROM employees;` |
| `LAG()` | Accesses previous row | `SELECT LAG(price, 1) OVER (ORDER BY date) AS prev_price FROM stocks;` |
| `LEAD()` | Accesses next row | `SELECT LEAD(price, 1) OVER (ORDER BY date) AS next_price FROM stocks;` |
| `FIRST_VALUE()` | First value in window | `SELECT FIRST_VALUE(price) OVER (PARTITION BY product_id ORDER BY date) FROM prices;` |
| `LAST_VALUE()` | Last value in window | `SELECT LAST_VALUE(price) OVER (PARTITION BY product_id ORDER BY date) FROM prices;` |
| `SUM() OVER()` | Running sum | `SELECT SUM(amount) OVER (ORDER BY date) AS running_total FROM transactions;` |
| `AVG() OVER()` | Moving average | `SELECT AVG(price) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg FROM stocks;` |

## Common Table Expressions (CTEs)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `WITH` | Defines CTE | `WITH high_value_customers AS (SELECT * FROM customers WHERE total_spent > 1000) SELECT * FROM high_value_customers;` |
| `WITH RECURSIVE` | Recursive CTE | `WITH RECURSIVE subordinates AS (SELECT * FROM employees WHERE manager_id IS NULL UNION ALL SELECT e.* FROM employees e JOIN subordinates s ON e.manager_id = s.id) SELECT * FROM subordinates;` |
| Multiple CTEs | Multiple CTEs | `WITH cte1 AS (SELECT...), cte2 AS (SELECT...) SELECT * FROM cte1 JOIN cte2 ON...;` |

## Transactions and Locking

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `BEGIN` | Starts transaction | `BEGIN;` or `BEGIN TRANSACTION;` |
| `COMMIT` | Commits transaction | `COMMIT;` |
| `ROLLBACK` | Rolls back transaction | `ROLLBACK;` |
| `SAVEPOINT` | Creates savepoint | `SAVEPOINT my_savepoint;` |
| `ROLLBACK TO` | Rolls back to savepoint | `ROLLBACK TO my_savepoint;` |
| `SET TRANSACTION` | Sets transaction properties | `SET TRANSACTION ISOLATION LEVEL READ COMMITTED;` |
| `LOCK TABLE` | Locks table | `LOCK TABLE users IN EXCLUSIVE MODE;` |
| `SELECT ... FOR UPDATE` | Row-level lock | `SELECT * FROM users WHERE id = 1 FOR UPDATE;` |
| `SELECT ... FOR SHARE` | Shared lock | `SELECT * FROM users WHERE id = 1 FOR SHARE;` |