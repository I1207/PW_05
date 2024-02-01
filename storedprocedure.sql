create procedure [dwh].[sp_mergetable]
as
DECLARE @table1 VARCHAR(255)
DECLARE @table2 VARCHAR(255)
DECLARE @view_name VARCHAR(255)

DECLARE @sql NVARCHAR(MAX)
DECLARE @sql_drop_view NVARCHAR(MAX)

-- cursor to iterate over the tables to UNION
DECLARE tables_cursor CURSOR FOR
WITH CTE_a AS (
SELECT
    LEFT([TABLE_NAME], LEN([TABLE_NAME]) - 1) AS [left_TABLE_NAME]
    , COUNT(*) AS [n_tables]
FROM
    (
    SELECT *
    FROM
        [INFORMATION_SCHEMA].[TABLES]
    WHERE
        [TABLE_SCHEMA] = 'stg'
    ) AS a
GROUP BY
    LEFT([TABLE_NAME], LEN([TABLE_NAME]) - 1)
),
CTE_b AS (
SELECT *
FROM
    [INFORMATION_SCHEMA].[TABLES] AS a
        LEFT OUTER JOIN CTE_a AS b
        ON LEFT(a.[TABLE_NAME], LEN(a.[TABLE_NAME]) - 1) = b.[left_TABLE_NAME]
WHERE 
    a.[TABLE_SCHEMA] = 'stg'
    AND [n_tables] >= 2
)
SELECT
    [TABLE_NAME]
FROM
    CTE_b
ORDER BY
    [TABLE_NAME]


OPEN tables_cursor
FETCH NEXT FROM tables_cursor INTO @table1
FETCH NEXT FROM tables_cursor INTO @table2


WHILE @@FETCH_STATUS = 0
BEGIN
    SET @view_name = 'v' + LEFT(@table1, LEN(@table1) - 1) + '_NEW'

    SET @sql_drop_view = 'DROP VIEW IF EXISTS [dwh].'+ @view_name + ' ;'

    SET @sql = 
        'CREATE VIEW [dwh].' + @view_name +
        ' AS SELECT * FROM [stg].' + @table1 +
        ' UNION ALL' +
        ' SELECT * FROM [stg].' + @table2 + ' ;'

        --SELECT @sql_drop_view
        --SELECT @sql

        EXEC sp_executesql @sql_drop_view
        EXEC sp_executesql @sql

    FETCH NEXT FROM tables_cursor INTO @table1
    FETCH NEXT FROM tables_cursor INTO @table2
END


-- IF CURSOR_STATUS('global','tables_cursor') <> 0
IF @@FETCH_STATUS <> 0
BEGIN
    CLOSE tables_cursor;
    DEALLOCATE tables_cursor;
END
;
GO

