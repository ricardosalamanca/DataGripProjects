-----IP PROCESOS ENDOSOS CUMPLIMIENTO-----
SELECT * FROM SIM_PROCESOS SP
WHERE ID_PROCESO IN (280,293,282,287);

select *
  from a2010030 t
 where t.cod_secc = 4
   and t.num_pol1 = 1000171669801;

select * from a2010030 where NUM_POL1 = 1000171669801;
select * from a2000030 where NUM_POL_FLOT = 1000171669801;

select * from a2010020 where NUM_SECU_POL = 39745427065 and NUM_END = 0;
select * from a2000020 where NUM_SECU_POL = 39745427066 and NUM_END = 0;
select * from x2000020 where NUM_SECU_POL = 39745427066;

SELECT l.id_simlogws,
       TO_CHAR(l.fecha_inicio, 'YYYY-MM-DD HH24:MI:SS') fecha_inicio,
       l.resultado,
       JSON_VALUE(l.objeto_salida, '$.num_poliza') num_poliza_rc,
       (SELECT MAX(p.num_secu_pol)
          FROM a2000030 p
         WHERE p.num_pol1 = JSON_VALUE(l.objeto_salida, '$.num_poliza')
           AND p.cod_secc = 10
           AND p.num_end  = 0) nsp_rc,
       JSON_VALUE(l.objeto_entrada, '$.d_basicos.FECHA_VIG_POL')  vig_pol,
       JSON_VALUE(l.objeto_entrada, '$.d_basicos.FECHA_VENC_POL') venc_pol,
       (SELECT COUNT(*)
          FROM JSON_TABLE(l.objeto_entrada, '$.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (cob NUMBER PATH '$.COD_COB'))) coberturas,
       (SELECT COUNT(inc)
          FROM JSON_TABLE(l.objeto_entrada, '$.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (inc VARCHAR2(40) PATH '$.SIM_FECHA_INCLUSION'))) con_fecha
  FROM sim_log_webservices l
 WHERE TO_CHAR(l.tipo_proceso) = 'emisionRC'
   AND l.objeto_entrada IS JSON
 ORDER BY l.fecha_inicio DESC;

SELECT id_simlogws, codigows, tipo_proceso,
       TO_CHAR(fecha_inicio,'YYYY-MM-DD HH24:MI:SS') inicio,
       TO_CHAR(fecha_final,'HH24:MI:SS') fin,
       resultado,
       DBMS_LOB.SUBSTR(objeto_entrada, 2000, 1) entrada,
       DBMS_LOB.SUBSTR(objeto_salida, 1000, 1) salida,
       DBMS_LOB.SUBSTR(arreglo_errores, 2000, 1) errores
  FROM ops$puma.sim_log_webservices
 WHERE fecha_inicio >= TRUNC(SYSDATE)
   AND codigows LIKE 'convertirCotizacion%'
   -- AND codigows LIKE '%:POL:1020112681401:%'   -- para una cotizacion
 ORDER BY id_simlogws DESC;


-- ============================================================
-- QUE SE ENVIO Y COMO TERMINO  (traza de sim_log_webservices)
-- ============================================================
   select * from SIM_CU_ASYNC_PAYLOAD where ID_PAYLOAD = 141 order by ID_PAYLOAD desc;
    SELECT *
  FROM sim_log_webservices where ID_SIMLOGWS in (36713141,36713142,36713144);

SELECT TO_CHAR(fecha,'YYYY-MM-DD HH24:MI:SS') AS fecha,
       paso, lerror, nsp_ppal, nsp_hija, cod_ramo, mensaje
  FROM sim_cu_logexpedicion
 WHERE fecha >= SYSDATE - 2/24          -- últimas 2 horas
  -- AND lerror IN ('CT_REGLA','CT_RESUMEN','ENTRA_REALES',
                --  'PASO_A_REALES','FALLA_GRABA_PPAL',
                --  'FALLA_GRABA_HIJA','EXCEPCION')
 ORDER BY fecha DESC;

SELECT TRUNC(fecha) AS dia,
       nsp_hija,
       COUNT(*)     AS duplicados
  FROM sim_cu_logexpedicion
 WHERE lerror = 'DUPLICADO_ASYNC'
   AND fecha >= SYSDATE - 7
 GROUP BY TRUNC(fecha), nsp_hija
 ORDER BY dia DESC, duplicados DESC;

select *
from SIM_CU_ASYNC_PAYLOAD
order by ID_PAYLOAD desc FETCH FIRST 20 ROWS ONLY;

SELECT *
FROM SIM_CU_ASYNC_ESTADO
order by ID_PROCESO desc FETCH FIRST 20 ROWS ONLY;
-- A. Las ultimas corridas del endoso
--    FECHA_FINAL en NULL = la corrida nunca termino (sesion muerta)
SELECT *
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) in ('endosoCU','endosoRC','emisionCumplimiento', 'emisionPrincipal','emisionRC','convertirCotizacionPpal','convertirCotizacionRC')
 ORDER BY fecha_inicio DESC
 FETCH FIRST 20 ROWS ONLY;

-- B. El JSON completo de UNA corrida
SELECT objeto_entrada
  FROM sim_log_webservices
 WHERE id_simlogws = 36709692;

-- C. El JSON de la ULTIMA corrida, sin tener que buscar el id
SELECT objeto_entrada
  FROM sim_log_webservices
 WHERE id_simlogws = (SELECT MAX(id_simlogws) FROM sim_log_webservices
                       WHERE TO_CHAR(tipo_proceso) = 'endosoCU');

-- D. El JSON de una POLIZA concreta
SELECT id_simlogws, TO_CHAR(fecha_inicio,'HH24:MI:SS') ini,
       resultado, objeto_entrada
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) = 'endosoCU'
   AND codigows LIKE 'endosoCU:POL:1000171653401:%'
 ORDER BY fecha_inicio DESC;

-- E. Las que FALLARON o quedaron colgadas
SELECT id_simlogws,
       TO_CHAR(fecha_inicio,'YYYY-MM-DD HH24:MI:SS') inicio,
       CASE WHEN fecha_final IS NULL THEN 'NUNCA TERMINO'
            ELSE TO_CHAR(resultado) END estado,
       codigows, arreglo_errores, objeto_entrada
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) = 'endosoCU'
   AND (fecha_final IS NULL OR resultado = -1)
 ORDER BY fecha_inicio DESC;

-- F. Endoso y EMISION juntos, que comparten tabla
SELECT id_simlogws, TO_CHAR(tipo_proceso) servicio,
       TO_CHAR(fecha_inicio,'MM-DD HH24:MI:SS') inicio,
       resultado, codigows
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) IN ('endosoCU','emisionRC',
                                 'emisionPrincipal','emisionCumplimiento')
 ORDER BY fecha_inicio DESC
 FETCH FIRST 30 ROWS ONLY;

SELECT a.num_secu_pol ppal, b.num_secu_pol hija, a.num_pol1, a.cod_ramo,
       TO_CHAR(a.fecha_venc_pol,'YYYY-MM-DD') vence,
       (SELECT COUNT(*) FROM A2000040 c
         WHERE c.num_secu_pol = b.num_secu_pol AND c.num_end = 0
           AND c.tipo_reg = 'T' AND c.suma_aseg > 0)          cobs,
       (SELECT MAX(ROUND(MONTHS_BETWEEN(c.sim_fecha_venc_end, TRUNC(SYSDATE))/12, 4))
          FROM A2000040 c
         WHERE c.num_secu_pol = b.num_secu_pol AND c.num_end = 0
           AND c.tipo_reg = 'T' AND c.suma_aseg > 0)          coef_max
  FROM A2010030 a
  JOIN A2000030 b ON b.num_pol_flot = a.num_pol1 AND b.cod_secc = 4
 WHERE a.cod_secc = 4
   AND a.cod_ramo IN (450, 440, 455)
   AND a.sim_sistema_origen = 196
   AND b.num_pol1 IS NOT NULL
   AND NVL(a.mca_cotizacion,'N') = 'N'
   AND a.fecha_venc_pol > TRUNC(SYSDATE) + 31
   AND a.num_end = (SELECT MAX(num_end) FROM A2010030 WHERE num_secu_pol = a.num_secu_pol)
   AND b.num_end = (SELECT MAX(num_end) FROM A2000030 WHERE num_secu_pol = b.num_secu_pol)
   AND NOT EXISTS (SELECT 1 FROM A2010030 p2
                    WHERE p2.num_secu_pol = a.num_secu_pol AND p2.num_end > 0)
   AND NOT EXISTS (SELECT 1 FROM A2000030 h2
                    WHERE h2.num_secu_pol = b.num_secu_pol AND h2.num_end > 0)
   AND NOT EXISTS (SELECT 1 FROM A2000040 co
                    WHERE co.num_secu_pol = b.num_secu_pol AND co.tipo_reg = 'P')
   AND EXISTS (SELECT 1 FROM A2000190 im
                WHERE im.num_secu_pol = b.num_secu_pol
                  AND im.num_end = 0 AND im.tipo_reg = 'T')
 ORDER BY coef_max DESC NULLS LAST, b.num_secu_pol;

SELECT TO_CHAR(fecha,'YYYY-MM-DD HH24:MI:SS') AS fecha,
       paso, lerror, nsp_ppal, nsp_hija, cod_ramo, mensaje
  FROM sim_cu_logexpedicion
 WHERE fecha >= SYSDATE - 2/24          -- últimas 2 horas
  -- AND lerror IN ('CT_REGLA','CT_RESUMEN','ENTRA_REALES',
                --  'PASO_A_REALES','FALLA_GRABA_PPAL',
                --  'FALLA_GRABA_HIJA','EXCEPCION')
 ORDER BY fecha DESC;

select *
from SIM_CU_ASYNC_PAYLOAD
order by ID_PAYLOAD desc FETCH FIRST 20 ROWS ONLY;

SELECT *
FROM SIM_CU_ASYNC_ESTADO
order by ID_PROCESO desc FETCH FIRST 20 ROWS ONLY;


-- ver si el job corrió y cómo terminó
  SELECT *
    FROM dba_scheduler_job_run_details
   WHERE job_name LIKE 'JOB_END_ASYNC%'
   ORDER BY log_date DESC FETCH FIRST 5 ROWS ONLY;

select * from a2010030 where NUM_POL1 = 1001106779701;
select * from a2000030 where NUM_POL_FLOT = 1020112680401;
select * from a2000030 where NUM_POL1 = 1020112680401;

select * from a2010030 where NUM_SECU_POL = 29850054704;
select * from a2000030 where NUM_SECU_POL = 29835855667;

select * from a2010020 where NUM_SECU_POL = 39745423320;
select * from a2000020 where NUM_SECU_POL = 29850054704;
select * from x2000020 where NUM_SECU_POL = 39745423321;
select * from SIM_TEXTOS_POLIZAS where num_secu_pol in (39745423613, 39745423614);

select * from a2010040 where NUM_SECU_POL = 39745423579;
select * from a2000040 where NUM_SECU_POL = 29850054704;
select * from a2000040 where NUM_SECU_POL = 39745423579;

select * from A2000160 where NUM_SECU_POL = 29850054704;

select * from sim_riesgo_poliza where NUM_SECU_POL = 39745411898;
    ---1.colocar los datos varible enel archivo de shei ok
    ----2.verificar sim_riesgo_poliza ok
    -----crear test provoque control tecnico para verificar la consulta de estado ok
    -----pendiente arreglas lo de los controles tecnicos

-- 1. COBERTURAS HIJA  (la nueva: SUMA_ASEG = END_SUMA_ASEG, PRIMA_COB = END_PRIMA_COB)
SELECT * FROM A2000040
 WHERE num_secu_pol = 39745411963 AND tipo_reg = 'T'
 ORDER BY num_end, cod_ries, cod_cob;

-- 2. COBERTURAS PRINCIPAL  (revisar SIEMPRE en pareja con la 1)
SELECT * FROM A2010040
 WHERE num_secu_pol = 39745411962
 ORDER BY num_end, cod_cob;

-- 3. LIQUIDACION
SELECT * FROM A2000160
 WHERE num_secu_pol = 29835855667
 ORDER BY num_end, tipo_reg;

-- 4. IMPUESTOS
SELECT * FROM A2000190
 WHERE num_secu_pol = 39745411963
 ORDER BY num_end, tipo_reg, cod_impuesto;

-- 5. COMISIONES
SELECT * FROM A2000250
 WHERE num_secu_pol = 39745411963
 ORDER BY num_end, cod_agente;

-- 6. FACTURA
SELECT * FROM A2000163
 WHERE num_secu_pol = 29835855667
 ORDER BY num_end, num_factura;

-- 7. ENCABEZADO HIJA  (MCA_EXCLUSIVO y MCA_PROVISORIO deben quedar en 'N')
SELECT * FROM A2000030
 WHERE num_secu_pol = 39745411963
 ORDER BY num_end;

-- 8. ENCABEZADO PRINCIPAL  (los dos num_end en 'N')
SELECT * FROM A2010030
 WHERE num_secu_pol = 39745411962
 ORDER BY num_end;

-- 9. DATOS VARIABLES DE LA HIJA  (los COB_* deben cuadrar con SUMA_ASEG)
SELECT * FROM A2000020
 WHERE num_secu_pol = 39745411881
 ORDER BY num_end, cod_campo;

select * from a2000020 where NUM_SECU_POL = 39745411963;

SELECT * FROM SIM_RIESGO_POLIZA
 WHERE num_secu_pol = 39745411881
 ORDER BY num_end, cod_ries;



SELECT p.num_secu_pol   AS nsp_ppal,
       h.num_secu_pol   AS nsp_hija,
       p.num_pol1       AS num_pol1,        -- <== ESTE va en el JSON
       h.num_pol1       AS num_pol1_hija,   -- (solo para verlo; NO se manda)
       p.cod_ramo       AS cod_ramo,
       TO_CHAR(h.fecha_vig_pol,  'YYYY-MM-DD') AS vig_desde,
       TO_CHAR(h.fecha_venc_pol, 'YYYY-MM-DD') AS vig_hasta
  FROM A2010030 p
  JOIN A2000030 h ON h.num_pol_flot = p.num_pol1
                 AND h.cod_secc     = 4
 WHERE p.cod_secc = 4
   AND p.cod_ramo IN (450, 440, 455)
   AND p.sim_sistema_origen = 196
   AND h.num_pol1 IS NOT NULL
   AND NVL(p.mca_cotizacion, 'N') = 'N'
   AND NVL(p.mca_provisorio, 'N') = 'N'
   AND p.num_end = (SELECT MAX(num_end) FROM A2010030 WHERE num_secu_pol = p.num_secu_pol)
   AND h.num_end = (SELECT MAX(num_end) FROM A2000030 WHERE num_secu_pol = h.num_secu_pol)
   AND NOT EXISTS (SELECT 1 FROM A2010030 p2
                    WHERE p2.num_secu_pol = p.num_secu_pol AND p2.num_end > 0)
   AND NOT EXISTS (SELECT 1 FROM A2000030 h2
                    WHERE h2.num_secu_pol = h.num_secu_pol AND h2.num_end > 0)
   AND NOT EXISTS (SELECT 1 FROM A2000040 co
                    WHERE co.num_secu_pol = h.num_secu_pol AND co.tipo_reg = 'P')
   AND EXISTS     (SELECT 1 FROM A2000190 im
                    WHERE im.num_secu_pol = h.num_secu_pol
                      AND im.num_end = 0 AND im.tipo_reg = 'T')
 ORDER BY p.num_secu_pol DESC
 FETCH FIRST 20 ROWS ONLY;

SELECT cod_texto, sub_cod_texto, txt_red
  FROM ops$puma.a1001800
 WHERE cod_cia       = 3
   AND cod_secc      = 4
   AND cod_proceso   = '2'
   AND cod_texto     IS NOT NULL
   AND tipo_end      IS NULL        -- <<< separa TEXTOS de CÓDIGOS DE ENDOSO
   AND sub_cod_texto IS NOT NULL    -- <<< descarta los de nivel ramo
   AND NVL(mca_baja,'N') = 'N'
 ORDER BY cod_texto, sub_cod_texto;


SELECT object_name, status FROM all_objects
 WHERE owner='OPS$PUMA' AND status='INVALID'
   AND object_name IN ('SIM_PCK_PROCESO_DML_EMISION','SIM_PCK_PROCESO_DML_EMISION_F2',
                       'PKG299_DATOS_GEN_MC','SIM_CUD_PCK_MOD_EMISION','SIM_CUD_PCK_EMISION');

----LOG_DELEGACION_KIRO
select ROUND(SEGUNDOS/60,2) MINUTOS,D.*
from LOG_DELEGACION_KIRO D
ORDER BY ID DESC
    FETCH FIRST 20 ROWS ONLY;


SELECT p.id_payload, p.fecha_carga, p.tipo_proceso, p.id_externo,
       p.p_canal                                         AS canal_recibido,
       JSON_VALUE(p.json_entrada, '$.cumplimiento.d_basicos.SIM_CANAL') AS canal_json,
       p.p_proceso || '/' || p.p_subproceso              AS proceso,
       e.estado, e.num_pol1_ppal, e.num_pol1_hija, e.num_pol1_rc,
       (SELECT COUNT(*) FROM a2010020 d
         WHERE d.num_secu_pol = e.num_secu_pol_ppal AND d.num_end = 0) AS dv_ppal,
       (SELECT COUNT(*) FROM a2000020 d
         WHERE d.num_secu_pol = e.num_secu_pol_hija AND d.num_end = 0) AS dv_hija
  FROM sim_cu_async_payload p
  LEFT JOIN sim_cu_async_estado e ON e.id_proceso = p.id_payload
 WHERE p.tipo_proceso = 'emisionCU'
 ORDER BY p.id_payload DESC;

SELECT *
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) in ('endosoCU','emisionCumplimiento', 'emisionPrincipal','emisionRC')
 ORDER BY fecha_inicio DESC
 FETCH FIRST 20 ROWS ONLY;

SELECT p.id_payload, p.fecha_carga, p.tipo_proceso, p.id_externo,
       p.p_canal                                         AS canal_recibido,
       JSON_VALUE(p.json_entrada, '$.cumplimiento.d_basicos.SIM_CANAL') AS canal_json,
       p.p_proceso || '/' || p.p_subproceso              AS proceso,
       e.estado, e.num_pol1_ppal, e.num_pol1_hija, e.num_pol1_rc,
       (SELECT COUNT(*) FROM a2010020 d
         WHERE d.num_secu_pol = e.num_secu_pol_ppal AND d.num_end = 0) AS dv_ppal,
       (SELECT COUNT(*) FROM a2000020 d
         WHERE d.num_secu_pol = e.num_secu_pol_hija AND d.num_end = 0) AS dv_hija
  FROM sim_cu_async_payload p
  LEFT JOIN sim_cu_async_estado e ON e.id_proceso = p.id_payload
 WHERE p.tipo_proceso in ('endosoCU','emisionCumplimiento', 'emisionPrincipal','emisionRC','emisionCU')
 ORDER BY p.id_payload DESC;





SELECT p.id_payload,
       p.id_externo,
       p.p_cod_usr,
       p.p_canal,
       TO_CHAR(p.fecha_carga, 'YYYY-MM-DD HH24:MI') fecha_carga,
       p.estado,
       (SELECT COUNT(*)
          FROM JSON_TABLE(p.json_entrada, '$.rc.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (cob NUMBER PATH '$.COD_COB'))) cob_rc,
       (SELECT COUNT(inc)
          FROM JSON_TABLE(p.json_entrada, '$.rc.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (inc VARCHAR2(40) PATH '$.SIM_FECHA_INCLUSION'))) cob_rc_con_fecha,
       (SELECT COUNT(*)
          FROM JSON_TABLE(p.json_entrada, '$.cumplimiento.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (cob NUMBER PATH '$.COD_COB'))) cob_cu,
       (SELECT COUNT(inc)
          FROM JSON_TABLE(p.json_entrada, '$.cumplimiento.DatosRiesgos[*].DatosCoberturas[*]'
                          COLUMNS (inc VARCHAR2(40) PATH '$.SIM_FECHA_INCLUSION'))) cob_cu_con_fecha
  FROM sim_cu_async_payload p
 WHERE JSON_EXISTS(p.json_entrada, '$.rc.DatosRiesgos')
 ORDER BY p.id_payload DESC;


-- ---------------------------------------------------------------------
-- Q2. Coberturas de la RC, una fila por cobertura, de todos los payloads
--     (FECHA_INCLUSION / FECHA_EXCLUSION vacias = no vinieron en el JSON)
-- ---------------------------------------------------------------------
SELECT p.id_payload,
       p.id_externo,
       j.cod_ries,
       j.cod_cob,
       j.suma_aseg,
       j.tasa_cob,
       j.prima_cob,
       j.mca_gratuita,
       j.fecha_inclusion,
       j.fecha_exclusion,
       j.cobertura_json
  FROM sim_cu_async_payload p,
       JSON_TABLE(p.json_entrada, '$.rc.DatosRiesgos[*].DatosCoberturas[*]'
         COLUMNS (cod_ries        NUMBER         PATH '$.COD_RIES',
                  cod_cob         NUMBER         PATH '$.COD_COB',
                  suma_aseg       NUMBER         PATH '$.SUMA_ASEG',
                  tasa_cob        NUMBER         PATH '$.TASA_COB',
                  prima_cob       NUMBER         PATH '$.PRIMA_COB',
                  mca_gratuita    VARCHAR2(1)    PATH '$.MCA_GRATUITA',
                  fecha_inclusion VARCHAR2(40)   PATH '$.SIM_FECHA_INCLUSION',
                  fecha_exclusion VARCHAR2(40)   PATH '$.SIM_FECHA_EXCLUSION',
                  cobertura_json  VARCHAR2(2000) FORMAT JSON PATH '$')) j
 ORDER BY p.id_payload DESC, j.cod_ries, j.cod_cob;


-- ---------------------------------------------------------------------
-- Q3. El nodo "rc" completo de un payload, legible (cambiar el id)
-- ---------------------------------------------------------------------
SELECT p.id_payload,
       p.id_externo,
       JSON_QUERY(p.json_entrada, '$.rc' RETURNING CLOB PRETTY) json_rc
  FROM sim_cu_async_payload p
 WHERE p.id_payload = 93;


-- ---------------------------------------------------------------------
-- Q4. Lado a lado: la primera cobertura de "rc" y la de "cumplimiento" del
--     mismo payload (la de CU si trae las fechas)
-- ---------------------------------------------------------------------
SELECT p.id_payload,
       JSON_QUERY(p.json_entrada, '$.rc.DatosRiesgos[0].DatosCoberturas'
                  RETURNING VARCHAR2(4000)) coberturas_rc,
       JSON_QUERY(p.json_entrada, '$.cumplimiento.DatosRiesgos[0].DatosCoberturas'
                  RETURNING VARCHAR2(4000)) coberturas_cu
  FROM sim_cu_async_payload p
 WHERE p.id_payload = 93;
