select count(1) from PAQ_PAQUETE
;-- -. . -..- - / . -. - .-. -.--
select count(1) from PAQUETE
;-- -. . -..- - / . -. - .-. -.--
SELECT
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB,
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
WHERE
        t.NAME NOT LIKE 'dt%'
  AND t.is_ms_shipped = 0
  AND i.OBJECT_ID > 255
GROUP BY
    t.Name, s.Name, p.Rows
ORDER BY
    SUM(a.total_pages) DESC
;-- -. . -..- - / . -. - .-. -.--
SELECT
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) ,
    SUM(a.used_pages) ,
    (SUM(a.total_pages) - SUM(a.used_pages))
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
WHERE
        t.NAME NOT LIKE 'dt%'
  AND t.is_ms_shipped = 0
  AND i.OBJECT_ID > 255
GROUP BY
    t.Name, s.Name, p.Rows
ORDER BY
    SUM(a.total_pages) DESC
;-- -. . -..- - / . -. - .-. -.--
SELECT
    name AS NombreBaseDeDatos,
    size * 8 / 1024 AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('TuBaseDeDatos')
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DB_NAME() AS NombreBaseDeDatos,
    SUM(size )
FROM sys.master_files
WHERE database_id = DB_ID()
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DB_NAME() AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID()
;-- -. . -..- - / . -. - .-. -.--
SELECT

    SUM(a.used_pages) * 8 AS UsedSpaceKB,
    --(SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
;-- -. . -..- - / . -. - .-. -.--
SELECT

    SUM(a.used_pages) * 8 AS UsedSpaceKB
    --(SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
;-- -. . -..- - / . -. - .-. -.--
SELECT

    SUM(a.used_pages) * 8 / 1024.0 AS UsedSpaceKB
    --(SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
;-- -. . -..- - / . -. - .-. -.--
SELECT

            SUM(a.total_pages) * 8 / 1024.0 AS UsedSpaceKB
            --(SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
        INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
        INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
        INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
        LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
;-- -. . -..- - / . -. - .-. -.--
USE AMEXPRUEBASUAT_2;

SELECT
    DB_NAME() AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('AMEXPRUEBASUAT_2');
;-- -. . -..- - / . -. - .-. -.--
SELECT
   *
FROM sys.master_files
WHERE database_id = DB_ID('AMEXPRUEBASUAT_2')
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DB_NAME() AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('SISTEMA')
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DB_NAME() AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('AMEXPRUEBASUAT_2')
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DB_NAME('AMEXPRUEBASUAT_2') AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('AMEXPRUEBASUAT_2')
;-- -. . -..- - / . -. - .-. -.--
SELECT
    'AMEXPRUEBASUAT_2' AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('AMEXPRUEBASUAT_2');

SELECT
    'SISTEMA' AS NombreBaseDeDatos,
    SUM(size * 8 / 1024) AS TamañoMB
FROM sys.master_files
WHERE database_id = DB_ID('SISTEMA');