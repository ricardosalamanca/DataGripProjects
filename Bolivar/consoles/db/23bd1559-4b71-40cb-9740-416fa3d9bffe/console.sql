SELECT DISTINCT
    '"'||d.object_id||'"' AS object_id,
    '"'||FN_PROCESOSAPP.FNC_RETURN_FN_ID_ARCHIVO(d.object_id)||'"' AS archivo_id,
    d.u1708_documenttitle,
    d.U8D48_NOCASO,
    d.create_date,
    d.content_size
FROM CPE_OS.DocVersion d
WHERE d.u1708_documenttitle LIKE '%SABRINA%'
  AND d.recovery_item_id IS NULL
ORDER BY d.create_date DESC, d.U8D48_NOCASO, d.u1708_documenttitle;


SELECT DISTINCT
    '"'||d.object_id||'"' AS object_id,
    '"'||FN_PROCESOSAPP.FNC_RETURN_FN_ID_ARCHIVO(d.object_id)||'"' AS archivo_id,
    d.u1708_documenttitle,
    d.U8D48_NOCASO,
    d.create_date,
    d.content_size
FROM CPE_OS.DocVersion d
WHERE d.u1708_documenttitle LIKE '%MURILLO CORDABA CARMEN%'
  AND d.recovery_item_id IS NULL
ORDER BY d.create_date DESC, d.U8D48_NOCASO, d.u1708_documenttitle;

select d.u1708_documenttitle, d.* from CPE_OS.DocVersion d where security_id = '401877920000CE2AB435E3D5F83FE639';

SELECT DISTINCT
    '"'||d.object_id||'"' AS object_id,
    '"'||FN_PROCESOSAPP.FNC_RETURN_FN_ID_ARCHIVO(d.object_id)||'"' AS archivo_id,
    d.u1708_documenttitle,
    d.U8D48_NOCASO,
    d.create_date,
    d.content_size
FROM CPE_OS.DocVersion d
WHERE d.u1708_documenttitle LIKE '%comercializadora%'
  AND d.recovery_item_id IS NULL
  AND d.CREATE_DATE > TO_DATE('03/07/2025', 'dd/mm/yyyy')
ORDER BY d.create_date DESC, d.U8D48_NOCASO, d.u1708_documenttitle;

SELECT *
FROM CPE_OS.DocVersion
WHERE CREATE_DATE > TO_DATE('07/07/2025', 'dd/mm/yyyy')
  AND u1708_documenttitle LIKE '%5342909%';
