# Sqlite

Quick overview:

```sh
# Open an interactive shell
$ sqlite3 path/to/data.db

# Execute a command/query
$ sqlite3 data.db "command within quotes"

# Set output modes (example)
$ sqlite3 -header -csv data.db "SELECT * FROM entry;"
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

