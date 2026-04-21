Team 13 Phase 2 Dataset

Files
- customers.csv
- products.csv
- orders.csv
- order_items.csv
- mysql_schema.sql
- cockroach_schema.sql
- example_queries.sql

Dataset summary
- customers: 5000
- products: 1000
- orders: 20000
- order_items: 60044

Schema theme
Synthetic e-commerce / order-management workload.

Recommended experiment focus
1. Index / feature-focused query:
   filter orders by region and date range, then order by date.
2. Join + aggregation workload query:
   aggregate revenue and units sold by category over a broad date range.

MySQL load outline
1. Create a database.
2. Run mysql_schema.sql.
3. Load CSV files with LOAD DATA LOCAL INFILE, for example:
   LOAD DATA LOCAL INFILE 'customers.csv'
   INTO TABLE customers
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS;

CockroachDB load outline
1. Create a database and run cockroach_schema.sql.
2. Import CSV files using IMPORT INTO ... CSV DATA, or use cockroach sql with \copy if preferred.

Notes
- The same logical schema is used in both systems.
- Type names differ slightly: MySQL uses VARCHAR/DATETIME, CockroachDB uses STRING/TIMESTAMP.
- The CSV files are identical for both systems.
