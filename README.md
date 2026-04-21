# Team12 Phase 2 – Database Comparison Project

## Overview
This project compares **CockroachDB** and **MySQL** using an e-commerce dataset.  
We evaluate how both systems perform on simple and complex queries.

---

## Dataset
E-commerce dataset with:

- customers (5,000 rows)
- products (1,000 rows)
- orders (20,000 rows)
- order_items (60,044 rows)

Located in `/dataset`

---

## CockroachDB Setup

### Start server

cockroach start-single-node --insecure --store=./data


### Open SQL shell

cockroach sql --insecure


### Create DB

CREATE DATABASE dataset;
USE dataset;


### Load schema

cockroach sql --insecure -d dataset < dataset/cockroach_schema.sql


### Load data (put CSVs in data/extern)

IMPORT INTO customers CSV DATA ('nodelocal://1/customers.csv') WITH skip = '1';
IMPORT INTO products CSV DATA ('nodelocal://1/products.csv') WITH skip = '1';
IMPORT INTO orders CSV DATA ('nodelocal://1/orders.csv') WITH skip = '1';
IMPORT INTO order_items CSV DATA ('nodelocal://1/order_items.csv') WITH skip = '1';


---

## MySQL Setup

### Create DB

CREATE DATABASE dataset;
USE dataset;


### Run schema
Run:

dataset/mysql_schema.sql


### Enable import

SET GLOBAL local_infile = 1;


### Move CSV files to:

C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/


### Load data

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


---

## Queries

### Query 1
Location:

queries/cockroach/query1.sql
queries/mysql/query1.sql


Calculates total orders and revenue per region.

---

### Query 2
Location:

queries/cockroach/query2.sql
queries/mysql/query2.sql


Calculates orders, items sold, and revenue per category using joins.

---

## Running Queries

### CockroachDB

USE dataset;
-- run query


### MySQL

USE dataset;
-- run query


---

## Performance Testing
- Each query executed 3 times
- Timing taken from system output

---

## Notes
- CockroachDB uses `IMPORT INTO`
- MySQL uses `LOAD DATA INFILE`
- Minor schema differences exist

---

## Team Members
- Leroy Lucero
- Aaron Escalera
- Isaiah Malcom
