-----IP PROCESOS ENDOSOS CUMPLIMIENTO-----
SELECT * FROM SIM_PROCESOS SP
WHERE ID_PROCESO IN (280,293,282,287);

--Póliza principal
select *
  from a2010030 t
 where t.cod_secc = 4
   and t.num_pol1 = 1000171669801;

--Datos variables póliza principal
select * from a2010020 t where t.num_secu_pol = 29822294369;

--Datos variables póliza hija
select *
  from a2000020 t2
 where t2.num_secu_pol in
       (select t.num_secu_pol
          from a2000030 t
         where t.cod_secc = 4
           and t.num_pol_flot = 1000171669801);


-- ============================================================
-- QUE SE ENVIO Y COMO TERMINO  (traza de sim_log_webservices)
-- ============================================================

-- A. Las ultimas corridas del endoso
--    FECHA_FINAL en NULL = la corrida nunca termino (sesion muerta)

SELECT *
  FROM sim_log_webservices where ID_SIMLOGWS = 36713141;

select *
from SIM_CU_ASYNC_PAYLOAD
order by ID_PAYLOAD desc FETCH FIRST 20 ROWS ONLY;

SELECT *
FROM SIM_CU_ASYNC_ESTADO
order by ID_PROCESO desc FETCH FIRST 20 ROWS ONLY;

SELECT *
  FROM sim_log_webservices
  --WHERE TO_CHAR(tipo_proceso) like '%emisi%'
WHERE TO_CHAR(tipo_proceso) in ('endosoCU','endosoRC','emisionCumplimiento', 'emisionPrincipal','emisionRC','convertirCotizacionPpal','convertirCotizacionRC')
 ORDER BY fecha_inicio DESC
 FETCH FIRST 20 ROWS ONLY;

SELECT *
  FROM sim_log_webservices
  --WHERE TO_CHAR(tipo_proceso) like '%emisi%'
WHERE TO_CHAR(tipo_proceso) in ('convertirCotizacionPpal','convertirCotizacionRC')
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
SELECT *
  FROM sim_log_webservices
 WHERE TO_CHAR(tipo_proceso) = 'endosoCU'
   AND codigows LIKE 'endosoCU:POL:2000134528201:%'
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

select * from A2000260 where NUM_SECU_POL = 29846718151;
select * from A2000260 where NUM_SECU_POL = 29846718155;

select * from SIM_TEXTOS_POLIZAS where NUM_SECU_POL = 29846718151;
select * from SIM_TEXTOS_POLIZAS where NUM_SECU_POL = 29846718155;

select * from a2010030 where NUM_POL1 = 2000134528201;
select * from a2000030 where NUM_POL1 = 1001106779701;
select * from a2000030 where NUM_POL1 = 1000172772601;
select * from a2000030 where NUM_POL1 = 10001017;
select * from a2000030 where NUM_POL_FLOT = 2000134528201;
select * from a2000030 where NUM_POL_COTIZ = 1000172812101;
select * from a2000030 where NUM_POL_COTIZ = 1563136562301;
select * from a2000030 where NUM_POL_COTIZ = 1000172772601;

select * from a2010030 where NUM_SECU_POL = 29846702480;
select * from a2000030 where NUM_SECU_POL = 29846718151;

select * from a2010020 where NUM_SECU_POL = 29789349319;
select * from a2000020 where NUM_SECU_POL = 29789349320;

SELECT * FROM SIM_RIESGO_POLIZA
 WHERE num_secu_pol = 29846583127
 ORDER BY num_end, cod_ries;


select * from a2010040 where NUM_SECU_POL = 29789349319;
select * from a2000040 where NUM_SECU_POL = 29789349320;

select * from A2000160 where NUM_SECU_POL = 29846725745;

select * from A2990700 where NUM_SECU_POL = 29846725745;


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
 WHERE num_secu_pol = 39745411963
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
 WHERE num_secu_pol = 39745411963
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
 WHERE num_secu_pol = 39745411963
 ORDER BY num_end, cod_campo;

select * from a2000020 where NUM_SECU_POL = 39745411963;



-- 1. ENCABEZADO  (esperado: num_end 0 y 1; MCA_EXCLUSIVO='N' en los dos)
--    hija -> COD_END=400, SUB_COD_END=0, TIPO_END='AP', MCA_FACTURA='S'
SELECT * FROM A2010030 WHERE num_secu_pol = 39745413399 ORDER BY num_end;
SELECT * FROM A2000030 WHERE num_secu_pol = 39745413400 ORDER BY num_end;


-- 2. COBERTURAS  (el corazon de la prueba)
--    hija, num_end=1, cod_cob=404:
--       MCA_BAJA_COB  = 'S'
--       SUMA_ASEG     = 0            END_SUMA_ASEG = -200.000.000
--       PRIMA_COB     = 196.344      END_PRIMA_COB = -1.470.215
--       PRIMA_ANU     = 0            END_PRIMA_ANU =   -439.999,99
--       TASA_COB      = 0,22         END_TASA_COB  =        -0,22
--       FECHAS SIN CAMBIAR: 2026-03-17 / 2029-12-31
--    las otras tres (403, 406, 411): MCA_BAJA_COB='N' y TODOS los END_* en 0
--    principal, num_end=1, cod_cob=404: SUMA_ASEG=0 y PRIMA_COB=196.344
--       (A2010040 no tiene columnas END_* ni MCA_BAJA_COB)
SELECT * FROM A2010040
 WHERE num_secu_pol = 39745413399
 ORDER BY num_end, cod_cob;

SELECT * FROM A2000040
 WHERE num_secu_pol = 39745413400 AND tipo_reg = 'T'
 ORDER BY num_end, cod_ries, cod_cob;



-- 3. DATOS VARIABLES  (el COB_* de la cobertura excluida debe quedar en 0)
--    hija, num_end=1: UNA sola fila, COB_SALARIOS = 0
SELECT * FROM A2010020
 WHERE num_secu_pol = 39745413399
 ORDER BY num_end, cod_campo;

SELECT * FROM A2000020
 WHERE num_secu_pol = 39745413400
 ORDER BY num_end, cod_campo;


-- 4. LIQUIDACION  (num_end=1 con los END_* NEGATIVOS)
--    IMP_PRIMA=893.758   IMP_PRIMA_END=-1.470.215
--    IMP_IMPUESTO=169.814,15   IMP_IMPUESTO_E=-279.340,85
--    PREMIO=1.063.572,15       PREMIO_END=-1.749.555,85
--    PRIMA_ANU=737.040,01      END_PRIMA_ANU=-439.999,99
SELECT * FROM A2000160
 WHERE num_secu_pol = 39745413400
 ORDER BY num_end, tipo_reg;


-- 5. IMPUESTOS  (PRIMA_PROV_E=-1.470.215  IMP_IMPUESTO_E=-279.340,85  tasa 19)
SELECT * FROM A2000190
 WHERE num_secu_pol = 39745413400
 ORDER BY num_end, tipo_reg, cod_impuesto;


-- 6. COMISIONES  (PRIMA_COM_ANU_E = -439.999,99)
SELECT * FROM A2000250
 WHERE num_secu_pol = 39745413400
 ORDER BY num_end, cod_agente;


---1. Qué mandó el front, por número de póliza
--Es el principal. Devuelve los nodos que importan de los tres servicios.

SELECT l.id_simlogws,
       REGEXP_SUBSTR(l.codigows, '^[^:]+')                    AS servicio,
       l.fecha_inicio,
       l.resultado,
       DBMS_LOB.SUBSTR(l.objeto_salida, 100, 1)               AS respuesta,
       DBMS_LOB.SUBSTR(l.objeto_entrada,  60,
         NULLIF(DBMS_LOB.INSTR(l.objeto_entrada, '"COD_COA"'), 0))        AS cod_coa,
       DBMS_LOB.SUBSTR(l.objeto_entrada, 130,
         NULLIF(DBMS_LOB.INSTR(l.objeto_entrada, '"COD_CIACOA"'), 0))     AS coaseg_aceptado,
       DBMS_LOB.SUBSTR(l.objeto_entrada, 400,
         NULLIF(DBMS_LOB.INSTR(l.objeto_entrada, '"Coaseguradoras"'), 0)) AS coaseg_cedido,
       DBMS_LOB.SUBSTR(l.objeto_entrada, 200,
         NULLIF(DBMS_LOB.INSTR(l.objeto_entrada, '"Agentes"'), 0))        AS agentes
  FROM sim_log_webservices l
 WHERE l.fecha_inicio >= DATE '2026-09-11'          -- << acotar SIEMPRE por fecha
   AND l.codigows LIKE 'emision%'
   AND DBMS_LOB.INSTR(l.objeto_salida, TO_CHAR(1505004322101)) > 0   -- << la póliza
 ORDER BY l.id_simlogws;

--Importante para el rendimiento: el filtro de fecha no es opcional. Sin él, el DBMS_LOB.INSTR recorre los CLOB de toda la tabla y la consulta se cuelga. Yo acabo de comprobarlo.

---Ese filtro por póliza solo encuentra el servicio cuya respuesta trae ese número. Para ver los tres de una misma emisión (emisionPrincipal, emisionCumplimiento, emisionRC), se cambia la última condición por la ventana de tiempo, que además es más rápida:
SELECT *
  FROM sim_log_webservices l
 WHERE TO_CHAR(tipo_proceso) in ('endosoCU','emisionCumplimiento', 'emisionPrincipal') AND l.fecha_inicio BETWEEN TO_DATE('2026-09-11 16:00', 'YYYY-MM-DD HH24:MI')
                          AND TO_DATE('2026-09-11 19:22', 'YYYY-MM-DD HH24:MI');

--2. El JSON completo de un envío

SELECT l.objeto_entrada   -- lo que mandó el front
     , l.objeto_salida    -- lo que respondió el core
     , l.arreglo_errores  -- el detalle si falló
  FROM sim_log_webservices l
 WHERE l.id_simlogws = 309955016;


SELECT l.objeto_entrada   -- lo que mandó el front
     , l.objeto_salida    -- lo que respondió el core
     , l.arreglo_errores  -- el detalle si falló
  FROM sim_log_webservices l
 WHERE l.id_simlogws = 309955012;

---3. Qué quedó grabado, para comparar

-- Agentes: principal, hija y RC
SELECT 'PPAL' origen, cod_agente, porc_part, porc_comi
  FROM a2010253 WHERE num_secu_pol = 29846702893
UNION ALL
SELECT 'HIJA', cod_agente, porc_part, porc_comi
  FROM a2000250 WHERE num_secu_pol = 29846702894 AND tipo_reg = 'T'
UNION ALL
SELECT 'RC',   cod_agente, porc_part, porc_comi
  FROM a2000250 WHERE num_secu_pol = 29846702895 AND tipo_reg = 'T';

-- Coaseguro: cedido en la tabla, aceptado en la cabecera
SELECT p.num_pol1, p.cod_coa, p.cod_ciacoa, p.num_pol_coa, p.num_endoso_coa, p.porc_partcoa
  FROM a2010030 p WHERE p.num_pol1 = 1505004322101 AND p.num_end = 0 AND p.cod_secc = 4;

SELECT cod_ciacoa, por_partcoa, num_pol_coa
  FROM a2010100 WHERE num_secu_pol = 29846702893 AND num_end = 0;

-- Coberturas: la fila T es el total; las P son el reparto del coaseguro
SELECT cod_cob, tipo_reg, cod_ciacoa, suma_aseg, prima_cob
  FROM a2000040 WHERE num_secu_pol = 29846702894 AND num_end = 0
 ORDER BY cod_cob, tipo_reg;