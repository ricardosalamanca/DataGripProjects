------POLIZA DE RC-------
select h.num_secu_pol,
       h.num_pol1,
       h.num_end,
       h.mca_provisorio,
       h.cod_end,
       h.sub_cod_end,
       h.tipo_end,
       h.fecha_emi_end,
       h.desc_pol,
       h.*
from a2000030 h
where num_pol1 = 1000100814503
  and cod_secc = 10;

------POLIZA DE RC-------
select h.num_secu_pol,
       h.num_pol1,
       h.num_end,
       h.mca_provisorio,
       h.cod_end,
       h.sub_cod_end,
       h.tipo_end,
       h.fecha_emi_end,
       h.desc_pol,
       h.*
from a2000030 h
where num_pol1 = 1020112231603
  and cod_secc = 10;

------POLIZA PRINCIPAL
select p.num_secu_pol,
       p.cod_prod,
       p.num_end,
       p.cod_end,
       p.sub_cod_end,
       p.fecha_emi,
       p.desc_pol,
       p.fecha_vig_pol,
       p.fecha_vig_end,
       p.fecha_vig_pol,
       p.fecha_venc_pol,
       p.cod_mon_per,
       p.*
from a2010030 p
where p.num_pol1 = 1020112891501
  and p.cod_secc = 4;
------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol1,
       h.num_end,
       h.mca_provisorio,
       h.cod_end,
       h.sub_cod_end,
       h.tipo_end,
       h.fecha_emi_end,
       h.desc_pol,
       h.*
from a2000030 h
where num_pol1 = 1020113152501
  and cod_secc = 4;


------POLIZA PRINCIPAL
select p.num_secu_pol,
       p.cod_prod,
       p.num_end,
       p.cod_end,
       p.sub_cod_end,
       p.fecha_emi,
       p.desc_pol,
       p.fecha_vig_pol,
       p.fecha_vig_end,
       p.fecha_vig_pol,
       p.fecha_venc_pol,
       p.cod_mon_per,
       p.*
from a2010030 p
where p.num_pol1 = 1020112891601
  and p.cod_secc = 4;
------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol1,
       h.num_end,
       h.mca_provisorio,
       h.cod_end,
       h.sub_cod_end,
       h.tipo_end,
       h.fecha_emi_end,
       h.desc_pol,
       h.*
from a2000030 h
where num_pol1 = 1020113152601
  and cod_secc = 4;

select *  from A2990701  where NUM_POL1 = 1020113152501 and cod_secc = 4;

select *  from c5023000_nom  where NUM_POL1 = 1020113152501 and cod_secc = 4 and clave= 82105;

---select *  from c5023000  where NUM_POL1 = 1020113152601 and cod_secc = 4;

select count(*) from c5023000_nom;

select a.num_secu_pol,a.num_end,a.num_factura,a.num_end_rev, a.IMP_PRIMA, a.*
from a2000163 a
where num_secu_pol=29769553133 AND num_end = 25 AND cod_agrup_cont = 'GENERICOS' AND tipo_reg = 'T';


----prompt ====== VERIFICACIÓN a2000040 - COBERTURAS ENDOSO 25 ======
SELECT num_end, cod_cob, prima_cob, end_prima_cob, prima_anu, end_prima_anu
FROM a2000040
WHERE num_secu_pol = 29769553133 AND num_end = 25 AND (end_prima_cob != 0 OR prima_cob != 0)
ORDER BY cod_cob;

---prompt ====== VERIFICACIÓN a2000160 - PRIMAS ENDOSO 25 ======
SELECT num_end, nro_per, tipo_reg, imp_prima, imp_prima_end, imp_impuesto_e, premio_end, prima_anu, end_prima_anu
FROM a2000160
WHERE num_secu_pol = 29769553133 AND num_end = 25
ORDER BY tipo_reg, nro_per;

---prompt ====== VERIFICACIÓN a2000190 - IMPUESTOS ENDOSO 25 ======
SELECT num_end, nro_per, tipo_reg, imp_impuesto_e, prima_prov_e, tasa_impuesto, prima_prov_anu_e
FROM a2000190
WHERE num_secu_pol = 29769553133 AND num_end = 25
ORDER BY tipo_reg, nro_per;

---prompt ====== VERIFICACIÓN a2000250 - COMISIONES ENDOSO 25 ======
SELECT num_end, nro_per, tipo_reg, cod_agente,
       com_normal, com_normal_end,
       pri_com, pri_com_end,
       porc_comi_end, porc_part,
       prima_com_anu, prima_com_anu_e
FROM a2000250
WHERE num_secu_pol = 29769553133 AND num_end = 25
ORDER BY tipo_reg, cod_agente;

select *  from c5023000_nom  where NUM_POL1 = 1000100814503 and cod_secc = 10;

SELECT *
FROM a2990700 where NUM_SECU_POL = 29769553133;

select * from a5022999 where NUM_POL1 = 1000100814503 AND COD_RAMO = 215;
select * from a5023000 where NUM_POL1 = 1000100814503 AND COD_RAMO = 215;

select * from A5023000 WHERE num_secu_pol = 29769553133;


-- Buscar sesiones que bloquean
SELECT s.sid, s.serial#, s.username, s.program, l.type, o.object_name
FROM v$lock l
JOIN v$session s ON l.sid = s.sid
JOIN dba_objects o ON l.id1 = o.object_id
WHERE o.object_name = 'A2000030'
AND l.type = 'TM';

select * from a2000030 where num_secu_pol = 29769553133;


select *  from c5023000_nom  where NUM_POL1 = 1000100814503 and cod_secc = 10 order by NUM_FACTURA desc;

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29769553133 AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29769553133 and num_end in (25) AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';

----comisiones por agente y agrupacion contable
SELECT a.num_factura, a.cod_agente, a.com_normal, a.pri_com, a.cod_cob, a.cod_agrup_cont, a.for_actuacion, a.*
FROM a2000252 a
WHERE a.num_secu_pol = 29769553133 AND a.num_factura IN (23, 26, 27) and a.COD_AGRUP_CONT = '010010215'
ORDER BY a.num_factura, a.cod_agente, a.cod_agrup_cont;

----intermedia antes de comisiones
SELECT cod_agente, tipo_mvto, valor_mvto, valor_prima, num_factura, num_end, mca_estado, mca_transmit, desc_mvto
FROM a5022999
WHERE num_pol1 = 1000100814503 AND num_factura IN (22, 23, 26, 27)
ORDER BY num_factura, cod_agente, tipo_mvto;

select *  from c5023000_nom  where NUM_POL1 = 1000100814503 and cod_secc = 10 and NUM_FACTURA in (22,23) order by NUM_FACTURA desc;

--select * from C5023000;

-- 1. a2990701: Comisiones facturadas (F23 + F26 reversa + F27 nueva)
SELECT cod_agente, num_factura, com_normal
FROM a2990701
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura IN (23, 26, 27)
ORDER BY num_factura, cod_agente;


-- 2. c5023000_nom: Nómina - lo que YA se pagó (inflado)
SELECT clave, num_factura, concepto, valor_comis
FROM c5023000_nom
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura IN (23, 26, 27)
ORDER BY clave, concepto;

-- 3. Neto endoso 25 en a2990701
SELECT cod_agente, SUM(com_normal) as neto_endoso_25
FROM a2990701
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura IN (23, 26, 27)
GROUP BY cod_agente
ORDER BY cod_agente;

-- 4. Total global por agente en 701 vs nómina
SELECT cod_agente, SUM(com_normal) as total_701
FROM a2990701
WHERE num_pol1 = 1000100814503 AND cod_secc = 10
GROUP BY cod_agente
ORDER BY cod_agente;

SELECT clave, SUM(valor_comis) as total_nom
FROM c5023000_nom
WHERE num_pol1 = 1000100814503 AND cod_secc = 10
GROUP BY clave
ORDER BY clave;


SELECT *
FROM a2990700
WHERE num_secu_pol = 29769553133;
-- Simular proceso nocturno: cambiar F25 de EP a CT
/*
UPDATE a2990700
SET cod_situacion = 'CT', mca_liq_comisiones = 'S'
SET cod_situacion = 'CT', mca_liq_comisiones = 'S'
WHERE num_secu_pol = 29769553133 AND num_factura = 25;
COMMIT;
*/
-- ============================================================================
-- MONITOREO PRE/POST REVERSA - Póliza 1000100814503 (RC Sección 10)
-- num_secu_pol: 29769553133
-- ============================================================================

-- 1. FACTURAS PENDIENTES DE COBRO (lo que el proceso nocturno va a tomar)
SELECT num_factura, num_end, cod_situacion, imp_prima, imp_comision_local,
       mca_liq_comisiones, cod_cobro,
FROM a2990700
WHERE num_secu_pol = 29769553133 AND cod_situacion = 'EP'
ORDER BY num_factura;

-- 2. DETALLE POR AGENTE de esas facturas EP (cuánto le toca a cada uno)
SELECT j.num_factura, j.num_end, j.cod_agente, j.com_normal
FROM a2990701 j
JOIN a2990700 v ON j.num_pol1 = v.num_pol1 AND j.num_factura = v.num_factura
  AND j.cod_secc = v.cod_secc
WHERE j.num_pol1 = 1000100814503 AND j.cod_secc = 10 AND v.cod_situacion = 'EP'
ORDER BY j.num_factura, j.cod_agente;

-- 3. RECAUDOS GENERADOS (después del proceso nocturno)
SELECT num_factura, num_end, tipo_actu, fec_actu, imp_moneda_local, imp_prima
FROM a5020301
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura >= 23
ORDER BY num_factura;

-- 4. CUENTA CORRIENTE (valores correctos o inflados?)
SELECT cod_agente, num_factura, valor_mvto, valor_prima, mca_estado
FROM a5022999
WHERE num_pol1 = 1000100814503 AND num_factura >= 23
  AND tipo_mvto = 2 AND cod_agente IS NOT NULL
ORDER BY num_factura, cod_agente;

-- 5. PRE-SAGHI (tabla transitoria, aquí se infló antes)
SELECT cod_agente, num_factura, valor_mvto, valor_prima, mca_estado, fecha_creacion
FROM a5023000
WHERE num_pol1 = 1000100814503 AND num_factura >= 23
ORDER BY num_factura, cod_agente;

-- 6. NÓMINA FINAL (lo que se pagó/cobró al intermediario)
SELECT clave, num_factura, concepto, valor_comis, valor_prima, fecha_envio
FROM c5023000_nom
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura >= 23
ORDER BY num_factura, clave, concepto;

-- 7. CONSOLIDADO TOTAL (cuadre final)
SELECT
  COALESCE(a.agente, b.agente2) as agente,
  NVL(a.total_701, 0) as facturado,
  NVL(b.total_nom, 0) as nomina,
  NVL(a.total_701, 0) - NVL(b.total_nom, 0) as diferencia
FROM (
  SELECT cod_agente as agente, SUM(com_normal) as total_701
  FROM a2990701 WHERE num_pol1 = 1000100814503 AND cod_secc = 10
  GROUP BY cod_agente
) a
FULL OUTER JOIN (
  SELECT clave as agente2, SUM(valor_comis) as total_nom
  FROM c5023000_nom WHERE num_pol1 = 1000100814503 AND cod_secc = 10
  GROUP BY clave
) b ON a.agente = b.agente2
ORDER BY 1;



SELECT
  r.num_factura,
  r.num_end,
  r.cod_agente,
  r.com_normal as com_facturada_701,
  n.total_nom as com_nomina,
  r.com_normal - n.total_nom as diferencia,
  CASE WHEN r.com_normal = n.total_nom THEN 'IGUAL' ELSE 'DIFERENCIA' END as estado
FROM a2990701 r
JOIN (
  SELECT num_pol1, clave, num_factura, SUM(valor_comis) as total_nom
  FROM c5023000_nom
  WHERE num_pol1 = 1000100814503 AND cod_secc = 10
  GROUP BY num_pol1, clave, num_factura
) n ON r.num_pol1 = n.num_pol1 AND r.cod_agente = n.clave AND r.num_factura = n.num_factura
WHERE r.num_pol1 = 1000100814503 AND r.cod_secc = 10
  AND r.com_normal != n.total_nom
ORDER BY r.num_factura, r.cod_agente;


-- Ver tipo de actuación de los agentes de esta póliza
SELECT i.clave,  i.*
FROM intermediarios i
WHERE i.clave IN (35567, 82105);

-- Ver la configuración en A2000250 para el endoso 25
SELECT cod_agente, for_actuacion, tipo_reg
FROM a2000250
WHERE num_secu_pol = 29769553133 AND num_end = 25 AND tipo_reg = 'T';

-- Comparar con el caso MDSB-982865 que SÍ funciona
SELECT cod_agente, for_actuacion, tipo_reg
FROM a2000250
WHERE num_secu_pol = 29833289934 AND tipo_reg = 'T'
AND num_end = (SELECT MAX(num_end) FROM a2000250 WHERE num_secu_pol = 29833289934);