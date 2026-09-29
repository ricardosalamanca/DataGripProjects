----polizas de cumplimiento
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004100091801';
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004104058101';
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004104773501';

---Tablas de facturación con num_secu_pol de poliza hija
select num_secu_pol,num_end,num_factura,cod_situacion,fec_situ,imp_prima
from a2990700
where num_secu_pol=29761028592
and num_end in (11,12,13,14);
select num_secu_pol,num_end,num_factura,num_end_rev
from a2000163
where num_secu_pol=29761028592
and num_end in (11,12,13,14);

-----Codigos de ramo Cumplimiento
----particulares 450
----estatales 455
----grandes beneficiarios 440
----importacion disposicion legal 470 --- casi no se usa tiene una unica cobertura

------POLIZA PRINCIPAL
select num_secu_pol,cod_prod,num_end,cod_end,sub_cod_end,fecha_emi,desc_pol,fecha_vig_pol,fecha_vig_end,fecha_vig_pol,fecha_venc_pol,cod_mon_per
from a2010030
where num_pol1=1000171335201 and cod_secc=4;

------POLIZA HIJA
select num_secu_pol,num_pol1,num_end,mca_provisorio,cod_end,sub_cod_end,tipo_end,fecha_emi_end,desc_pol
--mca_autoriza,p.cod_user_resp,fec_autoriza
from a2000030 p
where num_pol_flot=1000171335201 and cod_secc=4;


select * from a2000030 where COD_SECC = 4 and num_pol1 = '1000171371001';


 SELECT TRIGGER_NAME,
       TRIGGER_TYPE,
       TRIGGERING_EVENT,
       STATUS,
       OWNER
  FROM ALL_TRIGGERS
 WHERE TABLE_NAME = 'A2000040'
   AND TABLE_OWNER = 'OPS$PUMA' -- ajusta el owner si es diferente
 ORDER BY TRIGGER_TYPE;


----Acceso a datos de Simon Web:
select *
  from sim_accesos_datos t, sim_productos p, sim_procesos c
 where t.id_producto = p.id_producto
   and t.id_proceso = c.id_proceso
   and t.codigo_usuario = '890301584'
   and p.cod_producto in (440, 450, 455);

------------------------CASO DE COMISIONES GD941-1470
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
where p.num_pol1 = 1510100059901
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol_flot,
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
where num_pol1 = 1510173073501
  and cod_secc = 4;

------------------------CASO devolución de la prima al cliente GD941-1471
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
where p.num_pol1 = 1000170843501
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol_flot,
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
where num_pol_flot = 1000170843501
  and cod_secc = 4;


SELECT a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.PRIMA_ANU,
       a.END_PRIMA_ANU,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.*
FROM A2000040 a
WHERE a.Num_secu_pol = 29785225093
order by a.num_end asc;

SELECT a.num_end,
       a.suma_aseg,
       a.PRIMA_COB,
       a.SIM_FECHA_INCLUSION,
       a.sim_fecha_inclusion_end,
       a.sim_fecha_venc_end,
       a.SIM_FECHA_EXCLUSION,
       a.*
FROM a2010040 a
WHERE a.Num_secu_pol = 29785225092
order by a.num_end asc;

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29785225093 and num_end in (4,5,6,7,8) AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';

/*
   --Poliza Principal
         update a2010040
            set
                sim_fecha_inclusion_end=to_date('1/07/2025','DD/MM/YYYY'),
                sim_fecha_venc_end     =to_date('30/06/2026','DD/MM/YYYY'),
                sim_fecha_exclusion    =to_date('30/06/2026','DD/MM/YYYY')
         where num_secu_pol=29781596931 and num_end=8
            and cod_cob=403;

         update a2010040
            set
                sim_fecha_inclusion_end=to_date('31/12/2027','DD/MM/YYYY'),
                sim_fecha_venc_end     =to_date('31/12/2028','DD/MM/YYYY'),
                sim_fecha_exclusion    =to_date('31/12/2028','DD/MM/YYYY')
         where num_secu_pol=29781596931 and num_end=8
            and cod_cob=404;
*/

------CASO YESICA PUENTES
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
where p.num_pol1 = 1500157991201
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol_flot,
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
where num_pol_flot = 1500157991201
  and cod_secc = 4;


-------------El producto 76 es incendio
select h.num_secu_pol,
       h.num_pol_flot,
       h.cod_secc,
       h.cod_ramo,
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
where num_pol1 = 1500157991201
  and cod_secc = 5;

SELECT a.cod_ries,
       a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.PRIMA_ANU,
       a.END_PRIMA_ANU,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.*
FROM A2000040 a
WHERE a.Num_secu_pol = 29823456453
order by a.num_end asc;

select * from a2000020 where Num_secu_pol = 29823456453;

-----


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
where p.num_pol1 = 1500157991201
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol_flot,
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
where num_pol_flot = 1500157991201
  and cod_secc = 4;


SELECT num_secu_pol, codigo_texto, subcodigo_texto, orden, proceso, modificable
FROM SIM_X_TEXTOS_POLIZAS
WHERE num_secu_pol in (29801726531,29801726533)
ORDER BY orden;


SELECT t.num_secu_pol, t.codigo_texto, t.subcodigo_texto, t.orden, t.proceso
FROM SIM_X_TEXTOS_POLIZAS t
WHERE t.num_secu_pol = <num_secu_pol_en_test>
ORDER BY t.orden;

SELECT *
FROM SIM_X_TEXTOS_POLIZAS
WHERE num_secu_pol in (29801726531,29801726533)
ORDER BY orden;

select * from OPS$PUMA.SIM_TEXTOS_POLIZAS where num_secu_pol in (29801726531,29801726533);


-- Parche puntual para desbloquear en stage/prod
UPDATE SIM_TEXTOS_POLIZAS
SET ORDEN = 0
WHERE num_secu_pol = 29801726531
AND ORDEN = 1;

-- También actualizar la tabla temporal si ya se copió
UPDATE SIM_X_TEXTOS_POLIZAS
SET ORDEN = 0
WHERE num_secu_pol = 29801726531
AND ORDEN = 1;

COMMIT;

select * from X1150190;


SELECT column_name FROM all_tab_columns
WHERE table_name = 'X1150190'
AND column_name IN (
  'URBANO_VLR','URBANO_LMT',
  'CONTENEDOR','CONTENEDOR_VLR','CONTENEDOR_LMT',
  'NACIONAL','NACIONAL_VLR','NACIONAL_LMT',
  'NACIONAL_URB','NACIONAL_URB_VLR','NACIONAL_URB_LMT'
);

   ------POLIZA PRINCIPAL Prorroga
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
where p.num_pol1 = 1557000312001
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_pol_flot,
       h.num_secu_pol,
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
where num_pol_flot = 1557000312001
  and cod_secc = 4;


SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END,
       a.*
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29826195726;

SELECT a.cod_ries,
       a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.END_PRIMA_ANU,
       a.cod_cob,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_VIG_END,
       a.sim_fecha_venc_end,
       a.mca_vigente,
       a.*
FROM A2000040 a
WHERE a.NUM_SECU_POL = 29826195835;

update A2000040 set END_PRIMA_COB = 8399 where NUM_SECU_POL = 29826195835 and NUM_END = 4 and COD_COB = 403;

---------------------
 -- 1. A2000040 - Coberturas
  SELECT COD_COB, END_PRIMA_COB
  FROM A2000040
  WHERE NUM_SECU_POL = 29826195835 AND NUM_END IN (5,4) AND TIPO_REG = 'T' AND COD_COB IN (403,404,406)
  ORDER BY COD_COB;

  -- 2. A2000160 - Prima total + impuesto
  SELECT IMP_PRIMA_END, IMP_IMPUESTO_E, PREMIO_END, END_PRIMA_ANU
  FROM A2000160
  WHERE NUM_SECU_POL = 29826195835 AND NUM_END IN (5,4) AND TIPO_REG = 'T';

  -- 3. A2000190 - Impuesto provisional
  SELECT PRIMA_PROV_E, IMP_IMPUESTO_E, PRIMA_PROV_ANU_E
  FROM A2000190
  WHERE NUM_SECU_POL = 29826195835 AND NUM_END IN (5,4) AND TIPO_REG = 'T';

  -- 4. A2000250 - Comisiones
  SELECT PRI_COM_END, COM_NORMAL_END, PORC_COMI_END, PRIMA_COM_ANU_E
  FROM A2000250
  WHERE NUM_SECU_POL = 29826195835 AND NUM_END IN (5,4) AND TIPO_REG = 'T';

  -- 5. Facturas
  SELECT NUM_FACTURA, IMP_PRIMA, IMP_IMPUESTO, COD_AGRUP_CONT
  FROM A2000163
  WHERE NUM_SECU_POL = 29826195835 AND NUM_END IN (5,4) AND TIPO_REG = 'T'
  ORDER BY NUM_FACTURA DESC, COD_AGRUP_CONT;

 SELECT NUM_FACTURA, NUM_END, FECHA_CREACION, COD_AGRUP_CONT, IMP_PRIMA, IMP_IMPUESTO
  FROM A2000163
  WHERE NUM_SECU_POL = 29826195835
  AND TIPO_REG = 'T'
  AND NUM_END IN (4, 5)
  ORDER BY NUM_END, NUM_FACTURA, COD_AGRUP_CONT;


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
where p.num_pol1 = 1006001248801
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_secu_pol,
       h.num_pol_flot,
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
where num_pol_flot = 1006001248801
  and cod_secc = 4;


SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END,
       a.*
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29816792403;

SELECT a.cod_ries,
       a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.END_PRIMA_ANU,
       a.cod_cob,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_VIG_END,
       a.sim_fecha_venc_end,
       a.mca_vigente,
       a.*
FROM A2000040 a
WHERE a.NUM_SECU_POL = 29816792404;

----------------------VIGENCIAS FUTURAS-------------------
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
where p.num_pol1 = 1505004291701
  and p.cod_secc = 4;

------POLIZA HIJA
select h.num_pol_flot,
       h.num_secu_pol,
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
where num_pol_flot = 1505004291701
  and cod_secc = 4;

SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29846633949;

SELECT a.cod_ries,
       a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.PRIMA_ANU,
       a.END_PRIMA_ANU,
       a.cod_cob,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_VIG_END,
       a.sim_fecha_venc_end,
       a.mca_vigente
FROM A2000040 a
WHERE a.NUM_SECU_POL = 29846633950;
---------------------------------------------------------



-- ============================================================
-- DIAGNÓSTICO MDSB-1029393 - Póliza 1510173073501
-- Problema: Cruce de facturas falla por cambio de intermediario
-- ============================================================

-- 1. FACTURACIÓN COMPLETA (A2990700) - Ver las 3 facturas y sus COD_PROD
select num_pol1,
       num_factura,
       num_end,
       cod_situacion,
       imp_moneda_local,
       imp_imptos_mon_local,
       imp_comision_local,
       cod_prod,        -- << CLAVE DEL INTERMEDIARIO (aquí está el problema)
       fecha_equipo,
       mca_liq_comisiones,
       mca_transmit
  from a2990700
 where num_secu_pol = 29845059287
 order by num_factura;

-- RESULTADO ESPERADO:
-- Factura 1 | End 0 | CT | +3,252,514 | COD_PROD=68217 | Comisión=NULL  (emisión original, 0% comisión)
-- Factura 2 | End 1 | CT | -3,252,514 | COD_PROD=68217 | Comisión=0     (reverso por cambio clave)
-- Factura 3 | End 2 | CT | +3,252,514 | COD_PROD=47873 | Comisión=750,177 (nueva emisión con nueva clave)
--
-- >> PROBLEMA: Factura 2 (negativa) tiene COD_PROD=68217
--              Factura 3 (positiva) tiene COD_PROD=47873
--              El proceso CB502307 NO puede cruzarlas porque son de intermediarios distintos


-- 2. COMISIÓN LIQUIDADA (A2990701) - Confirmar que SÍ se generó comisión
select num_pol1,
       num_factura,
       num_end,
       cod_agente,      -- << Intermediario al que se le debe pagar
       com_normal,      -- << Valor de la comisión
       for_actuacion,
       mca_transmit     -- << 'S' = ya fue marcada como transmitida
  from a2990701
 where num_pol1 = 1510173073501
 order by num_factura, cod_agente;

-- RESULTADO ESPERADO:
-- Solo 1 registro: Factura 3 | End 2 | Agente 47873 | Comisión 750,177 | MCA_TRANSMIT='S'
-- >> La comisión existe y está marcada como transmitida, pero nunca llegó a SAGHI


-- 3. INTERFACE A SAGHI (C5023000_NOM) - Confirmar que NO se envió
select num_pol1,
       num_factura,
       clave,
       concepto,
       fecha_envio,
       valor_comis,
       valor_prima,
       valor_recaudo,
       fecha_recaudo
  from c5023000_nom
 where num_pol1 = 1510173073501;

-- RESULTADO ESPERADO: 0 registros
-- >> Confirma que la comisión NUNCA fue enviada a SAGHI para preliquidación


-- 4. COMPARACIÓN: Otras pólizas de la misma clave 47873 SÍ fueron enviadas
select num_pol1,
       num_factura,
       clave,
       concepto,
       fecha_envio,
       valor_comis,
       valor_prima,
       fecha_recaudo
  from c5023000_nom
 where clave = 47873
   and fecha_envio >= TO_DATE('2026-04-09', 'YYYY-MM-DD')
 order by fecha_envio, num_pol1;

-- >> Demuestra que el proceso SÍ corrió para otras pólizas de la misma clave


-- 5. EJECUCIÓN DEL PROCESO CB502307 - Confirmar que corrió el 09/04
select secuencia,
       cod_usr,
       cod_cia,
       fecha_desde,
       fecha_hasta,
       cantidad_facturas_pos_ok,
       cantidad_facturas_neg_ok,
       fecha_ini_ejecucion,
       fecha_fin_ejecucion
  from sim_cb502307_ejecuciones
 where fecha_desde = TO_DATE('2026-04-09', 'YYYY-MM-DD')
   and cod_cia = 3;

-- RESULTADO ESPERADO: 48 facturas positivas, 47 negativas
-- >> La diferencia (48 vs 47) sugiere que 1 factura positiva quedó sin cruzar (la nuestra)

-- A2000250: Comisiones por endoso - Porcentaje de comisión por intermediario
select m.num_secu_pol,
       m.num_end,
       m.cod_agente,       -- Clave del intermediario
       m.porc_comi,        -- % comisión acumulado de la póliza
       m.porc_comi_end,    -- % comisión del endoso específico
       m.porc_part,        -- % participación del agente
       m.com_normal,       -- Comisión total acumulada
       m.com_normal_end,   -- Comisión generada en el endoso
       m.pri_com_end,      -- Prima sobre la que se calcula la comisión
       m.cod_conv,         -- Convenio de comisión
       m.tipo_reg
  from a2000250 m
 where m.num_secu_pol = 29845059287
   and m.tipo_reg = 'T'
 order by m.num_end, m.cod_agente;

----comisiones por agente y agrupacion contable
SELECT a.num_factura, a.cod_agente, a.com_normal, a.pri_com, a.cod_cob, a.cod_agrup_cont, a.for_actuacion, a.*
FROM a2000252 a
WHERE a.num_secu_pol = 29845059287;
select * from a5022999 where num_pol1 = 1510173073501;




------parametrizacion siniestros cumplimiento
-- ============================================================
-- QUERY 1: Verificar tipos de expediente disponibles para el siniestro
-- (Replica la lógica de SIM_PCK_CONSULTA_SINIESTRO2.Proc_Cons_TipoExpediente)
-- ============================================================
SELECT DISTINCT x.tipo_exped, x.cod_cob, x.cod_concep_rva
FROM a7000100 x,  -- Parametrización GENÉRICA (cod_secc=999)
     a7000100 y,  -- Parametrización ESPECÍFICA (cod_secc=4)
     a7001210 z   -- Coberturas del siniestro
WHERE x.cod_cia = 3
  AND x.cod_secc = 999           -- Genérica
  AND x.tipo_exped IS NOT NULL   -- Solo registros con tipo expediente definido
  AND x.cod_causa = 89           -- Causa del siniestro (INCUMPLIMIENTO)
  AND x.estado = 'A'
  AND y.cod_cia = 3
  AND y.cod_secc = 4             -- Específica para Cumplimiento
  AND y.tipo_exped IS NULL       -- DEBE ser NULL en tabla específica
  AND y.cod_causa = 89           -- Misma causa
  AND y.estado = 'A'
  AND z.num_secu_sini = 27424485940  -- NUM_SECU_SINI del siniestro 10060400237
  AND x.cod_cob = z.cod_cob     -- Cruce por cobertura
  AND x.cod_cob = y.cod_cob     -- Cruce por cobertura
ORDER BY x.tipo_exped;

-- ============================================================
-- QUERY 2: Coberturas del siniestro (a7001210)
-- ============================================================
SELECT cod_cob, suma_aseg, mca_val_sini
FROM a7001210
WHERE num_secu_sini = 27424485940;

-- ============================================================
-- QUERY 3: Parametrización específica sección 4 para causa 89
-- ============================================================
SELECT cod_secc, tipo_exped, cod_concep_rva, cod_cob, cod_causa, cod_cons, estado
FROM a7000100
WHERE cod_secc = 4 AND cod_causa = 89 AND estado = 'A';

-- ============================================================
-- QUERY 4: Parametrización genérica (999) para CUM + causa 89
-- ============================================================
SELECT cod_secc, tipo_exped, cod_concep_rva, cod_cob, cod_causa, cod_cons, estado
FROM a7000100
WHERE cod_secc = 999 AND tipo_exped = 'CUM' AND cod_causa = 89 AND estado = 'A';

-- ============================================================
-- QUERY 5: Datos del siniestro
-- ============================================================
SELECT num_sini, nro_orden_sini, cod_causa_sini, cod_cons_sini, mca_est_sini
FROM a7000900
WHERE num_sini = 10060400237;

select  * from a2000040 where NUM_SECU_POL = 29816792404;



-- 1. Verificar qué devuelve el cursor
    SELECT DISTINCT A.TIPO_EXPED, B.DESC_EXPED, B.CLASE_EXPED
    FROM A7000100 A, G7000110 B
    WHERE B.COD_CIA = A.COD_CIA AND B.TIPO_EXPED = A.TIPO_EXPED
    AND A.COD_CIA = 3 AND A.COD_CAUSA IN (89, 98)
    AND A.COD_SECC IN (4, 999)
    AND A.COD_COB IN (SELECT C.COD_COB FROM A7001210 C WHERE C.NUM_SECU_SINI = 27424485940);

-- 2. Verificar SIM_EXPED_PROCESO para la clase PI y el proceso de expedientes
SELECT * FROM SIM_EXPED_PROCESO WHERE CLASE_EXPED = 'PI';

SELECT * FROM SIM_EXPED_PROCESO WHERE CLASE_EXPED IN ('GJ', 'GS', 'PJ');

SELECT * FROM SIM_PROCESOS WHERE ID_PROCESO IN (771, 772, 773, 774);

select * from a7001210 where NUM_SECU_SINI = 27424485940;

select * from a7000900 where NUM_SECU_SINI = 27424485940;

SELECT a.num_end,
       a.suma_aseg,
       a.end_suma_aseg,
       a.PRIMA_COB,
       a.END_PRIMA_COB,
       a.PRIMA_ANU,
       a.END_PRIMA_ANU,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_VIG_END,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_VENC_END,
       a.*
FROM A2000040 a
WHERE a.Num_secu_pol = 29816792404
order by a.num_end asc;

select * from creglas where cdreg='204PCC415';

SELECT FUN_DATO_TERCERO('NOMCOMPLETO', 'NT', '901125536') AS NOMBRE_COMPLETO FROM DUAL;

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
where num_pol1 = 1510100117701
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
where p.num_pol1 = 1510100079001
  and p.cod_secc = 4;

-------
