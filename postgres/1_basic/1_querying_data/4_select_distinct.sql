CREATE TABLE distinct_demo
(
    id serial NOT NULL PRIMARY KEY,
    bcolor VARCHAR,
    fcolor VARCHAR
)

INSERT INTO distinct_demo
    (bcolor, fcolor)
VALUES
    ('red', 'red'),
    ('red', 'red'),
    ('red', NULL),
    (NULL, 'red'),
    ('red', 'green'),
    ('red', 'blue'),
    ('green', 'red'),
    ('green', 'blue'),
    ('green', 'green'),
    ('blue', 'red'),
    ('blue', 'green'),
    ('blue', 'blue');

SELECT *
FROM distinct_demo

SELECT DISTINCT bcolor
FROM distinct_demo
ORDER BY bcolor

-- result is 11 rows, if we select * is 12 row, there are two row red red
SELECT DISTINCT bcolor, fcolor
FROM distinct_demo
ORDER BY bcolor, fcolor

SELECT DISTINCT ON
(bcolor) bcolor, fcolor FROM distinct_demo ORDER BY bcolor, fcolor