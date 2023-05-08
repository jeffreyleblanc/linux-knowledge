# Sqlite

Quick overview:

```sh
# Open an interactive shell
$ sqlite3 path/to/data.db

# Execute a command/query
$ sqlite3 data.db "command within quotes"

# Set output modes (example)
$ sqlite3 -header -csv data.db "SELECT * FROM entry;"

# Open in readonly mode for queries
$ sqlite3 -readonly data.db "SELECT * FROM entry;"
```

Examples within shell

```sh
sqlite> .tables
#> entry

sqlite> .schema entry
#> CREATE TABLE entry (
#>         uuid VARCHAR(32) NOT NULL,
#>         title VARCHAR,
#>         url VARCHAR,
#>         tags VARCHAR,
#>         created DATETIME,
#>         modified DATETIME,
#>         PRIMARY KEY (uuid)
#> );

sqlite> .mode table
sqlite> PRAGMA table_info(entry);
#> +-----+----------+-------------+---------+------------+----+
#> | cid |   name   |    type     | notnull | dflt_value | pk |
#> +-----+----------+-------------+---------+------------+----+
#> | 0   | uuid     | VARCHAR(32) | 1       |            | 1  |
#> | 1   | title    | VARCHAR     | 0       |            | 0  |
#> | 2   | url      | VARCHAR     | 0       |            | 0  |
#> | 3   | tags     | VARCHAR     | 0       |            | 0  |
#> | 4   | created  | DATETIME    | 0       |            | 0  |
#> | 5   | modified | DATETIME    | 0       |            | 0  |
#> +-----+----------+-------------+---------+------------+----+
```

Example queries:

```sql
# Select all
SELECT * FROM entry;

# Order by a column. Note 'ASC' is default
SELECT * FROM entry ORDER BY date;

# Order by a column in opposite order
SELECT * FROM entry ORDER BY modified DESC;

# Same as above, but limit number of returns
SELECT * FROM entry ORDER BY modified DESC LIMIT 5;

# More
SELECT * FROM entry WHERE date(created) BETWEEN date('2023-01-01') AND date('2023-01-10') ORDER BY modified DESC LIMIT 5;
SELECT * FROM entry WHERE date(created) BETWEEN date('2023-01-01') AND date('2023-01-10') ORDER BY modified DESC;
SELECT COUNT(*) FROM entry WHERE date(created) BETWEEN date('2023-01-01') AND date('2023-01-10') ORDER BY modified DESC;
SELECT COUNT(*) FROM entry WHERE date(created) BETWEEN date('2022-01-01') AND date('2022-12-31') ORDER BY modified DESC;
```

## More details



```sql
# Note the schema
sqlite> .schema entry
CREATE TABLE entry (
    uuid VARCHAR(32) NOT NULL, 
    title VARCHAR, 
    url VARCHAR, 
    tags VARCHAR, 
    created DATETIME, 
    modified DATETIME, 
    PRIMARY KEY (uuid)
);

# Finding entries that match a pattern
SELECT title,url from entry WHERE url LIKE '%ycombinator.com%';

# Finding all entries with only one instance
SELECT count(*),created,title,url FROM entry GROUP BY title,url HAVING COUNT(*) == 1 ORDER BY created;

# Find all entries that are duplicates
SELECT count(*),created,title,url FROM entry GROUP BY title,url HAVING COUNT(*) > 1 ORDER BY created;

# Find all the entries with a specific url
SELECT uuid,created,title FROM entry WHERE url="https://news.ycombinator.com/" ORDER BY created;

# Examples of finding the number of results matching a HAVING critera
SELECT COUNT(*) FROM ( SELECT count(*),title FROM entry GROUP BY title,url HAVING COUNT(*) > 5 );
#=> 14
SELECT COUNT(*) FROM ( SELECT count(*),title FROM entry GROUP BY title,url HAVING COUNT(*) > 1 );
#=> 1046
SELECT COUNT(*) FROM ( SELECT count(*),title FROM entry GROUP BY title,url HAVING COUNT(*) == 1 );
#=> 4682

# Using LIMIT AND OFFSET
sqlite> SELECT uuid from entry WHERE url LIKE '%ycomb%' ORDER BY created LIMIT 6;
-- 95546f02077a4c46a4e5d939538330a1
-- 7850ad4395c549f0b543858a3672a06c
-- f7ef153e899b413394327d5ff80c400c
-- 2a80116a44384687808e00df4cdb5dd1
-- 43096d916b2a408fa92e58d7c670c7a9
-- e7578cc1649746119df50f033e9d012b
sqlite> SELECT uuid from entry WHERE url LIKE '%ycomb%' ORDER BY created LIMIT 3;
-- 95546f02077a4c46a4e5d939538330a1
-- 7850ad4395c549f0b543858a3672a06c
-- f7ef153e899b413394327d5ff80c400c
sqlite> SELECT uuid from entry WHERE url LIKE '%ycomb%' ORDER BY created LIMIT 3 OFFSET 3;
-- 2a80116a44384687808e00df4cdb5dd1
-- 43096d916b2a408fa92e58d7c670c7a9
-- e7578cc1649746119df50f033e9d012b
sqlite> SELECT COUNT(uuid) from entry WHERE url LIKE '%ycomb%';
-- 26492649
```

