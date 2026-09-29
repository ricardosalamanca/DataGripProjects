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

select *  from c5023000_nom  where NUM_POL1 = 1000100814503 and cod_secc = 10;
select *  from c5023000_nom  where NUM_POL1 = 1020112231603 and cod_secc = 10;
select *  from c5023000_nom  where NUM_POL1 = 1020113152501 and cod_secc = 4;
select *  from c5023000_nom  where NUM_POL1 = 1020113152601 and cod_secc = 4;

SELECT
  COALESCE(a.pol, b.pol2) as poliza,
  COALESCE(a.agente, b.agente2) as agente,
  NVL(a.total_701, 0) as total_facturado_701,
  NVL(b.total_nom, 0) as total_nomina,
  NVL(a.total_701, 0) - NVL(b.total_nom, 0) as diferencia_neta
FROM (
  SELECT num_pol1 as pol, cod_agente as agente, SUM(com_normal) as total_701
  FROM a2990701
  WHERE num_pol1 IN (1000100814503, 1020112231603, 1020113152501, 1020113152601)
  GROUP BY num_pol1, cod_agente
) a
FULL OUTER JOIN (
  SELECT num_pol1 as pol2, clave as agente2, SUM(valor_comis) as total_nom
  FROM c5023000_nom
  WHERE num_pol1 IN (1000100814503, 1020112231603, 1020113152501, 1020113152601)
  GROUP BY num_pol1, clave
) b ON a.pol = b.pol2 AND a.agente = b.agente2
ORDER BY COALESCE(a.pol, b.pol2), COALESCE(a.agente, b.agente2);


SELECT a.num_pol1, a.num_factura, a.num_end, a.cod_agente,
       a.com_normal as com_facturada_701,
       b.valor_nom as com_nomina,
       a.com_normal - b.valor_nom as diferencia,
       CASE WHEN a.com_normal - b.valor_nom < 0 THEN 'PAGO MAS'
            WHEN a.com_normal - b.valor_nom > 0 THEN 'PAGO MENOS'
            ELSE 'IGUAL' END as estado
FROM a2990701 a
JOIN (
  SELECT num_pol1, clave, num_factura, cod_secc, SUM(valor_comis) as valor_nom
  FROM c5023000_nom
  WHERE num_pol1 = 1000100814503 AND cod_secc = 10  -- << CAMBIAR POLIZA/SECCION
  GROUP BY num_pol1, clave, num_factura, cod_secc
) b ON a.num_pol1 = b.num_pol1
   AND a.cod_agente = b.clave
   AND a.num_factura = b.num_factura
   AND a.cod_secc = b.cod_secc
WHERE a.num_pol1 = 1000100814503 AND a.cod_secc = 10  -- << CAMBIAR POLIZA/SECCION
ORDER BY a.num_factura, a.cod_agente;

SELECT a.num_pol1, a.num_factura, a.num_end, a.cod_agente,
       a.com_normal as com_facturada_701,
       b.valor_nom as com_nomina,
       a.com_normal - b.valor_nom as diferencia,
       CASE WHEN a.com_normal - b.valor_nom < 0 THEN 'PAGO MAS'
            WHEN a.com_normal - b.valor_nom > 0 THEN 'PAGO MENOS'
            ELSE 'IGUAL' END as estado
FROM a2990701 a
JOIN (
  SELECT num_pol1, clave, num_factura, cod_secc, SUM(valor_comis) as valor_nom
  FROM c5023000_nom
  WHERE num_pol1 IN (1000100814503, 1020112231603, 1020113152501, 1020113152601)
  GROUP BY num_pol1, clave, num_factura, cod_secc
) b ON a.num_pol1 = b.num_pol1
   AND a.cod_agente = b.clave
   AND a.num_factura = b.num_factura
   AND a.cod_secc = b.cod_secc
WHERE a.num_pol1 IN (1000100814503, 1020112231603, 1020113152501, 1020113152601)
  AND a.com_normal != b.valor_nom
ORDER BY a.num_pol1, a.num_factura, a.cod_agente;

---prompt ====== VERIFICACIÓN a2000250 - COMISIONES ENDOSO 25 ======
SELECT num_end, nro_per, tipo_reg, cod_agente,
       com_normal, com_normal_end,
       pri_com, pri_com_end,
       porc_comi_end, porc_part,
       prima_com_anu, prima_com_anu_e
FROM a2000250
WHERE num_secu_pol = 29769553133 AND num_end = 25
ORDER BY tipo_reg, cod_agente;


-- 1. FACTURAS PENDIENTES DE COBRO (lo que el proceso nocturno va a tomar)
SELECT *
FROM a2990700
WHERE num_secu_pol = 29769553133 AND cod_situacion = 'EP'
ORDER BY num_factura;

SELECT *
FROM a2990701
WHERE num_pol1 = 1000100814503 and num_factura in (25,26)
ORDER BY num_factura;



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


-- Ver la configuración en A2000250 para el endoso 25
SELECT cod_agente, for_actuacion, tipo_reg
FROM a2000250
WHERE num_secu_pol = 29769553133 AND num_end = 25 AND tipo_reg = 'T';


-- 1. a2990701: Comisiones facturadas (F23 + F26 reversa + F27 nueva)
SELECT cod_agente, num_factura, com_normal
FROM a2990701
WHERE num_pol1 = 1000100814503 AND cod_secc = 10 AND num_factura IN (23, 25, 26, 27)
ORDER BY num_factura, cod_agente;

----comisiones por agente y agrupacion contable
SELECT a.num_factura, a.cod_agente, a.com_normal, a.pri_com, a.cod_cob, a.cod_agrup_cont, a.for_actuacion, a.*
FROM a2000252 a
WHERE a.num_secu_pol = 29769553133 AND a.num_factura IN (23, 25, 26, 27) and a.COD_AGRUP_CONT = '010010215'
ORDER BY a.num_factura, a.cod_agente, a.cod_agrup_cont;


select *  from c5023000_nom  where NUM_POL1 = 1000100814503 and cod_secc = 10 order by NUM_FACTURA desc;

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29769553133 AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';

select * from A5022999 where NUM_POL1 = 1000100814503 and NUM_FACTURA in (23,25,26,27);

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29769553133 and num_end in (25) AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';

-----REVISION CON RENE VIÑAS
select a.num_factura, a.imp_prima, a.* 
from a2000163 a
where a.num_secu_pol = 29769553133
order by a.num_factura;
select a.num_factura, a.imp_prima, a.cod_situacion, a.*
from a2990700 a
where a.num_secu_pol = 29769553133
order by a.num_factura;
UPDATE a2000163 a
set num_end_rev = null
where a.num_secu_pol = 29769553133;
commit;