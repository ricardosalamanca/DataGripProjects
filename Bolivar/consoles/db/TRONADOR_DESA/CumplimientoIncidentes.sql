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

    SELECT A.object_name, A.object_type, A.status, A.*
FROM all_objects A
WHERE owner = 'OPS$PUMA'
  AND status = 'INVALID'
  AND (object_name LIKE '%SIM%REGLA%'
    OR object_name LIKE '%SIM_TYP%MOTOR%'
    OR object_name LIKE '%SIM_CU_PCK%');

-- 1. Última modificación de los objetos (DDL)
SELECT object_name, object_type, status,
       last_ddl_time, created,
       ROUND((SYSDATE - last_ddl_time) * 24, 1) as horas_desde_cambio
FROM all_objects
WHERE owner = 'OPS$PUMA'
  AND object_name IN (
    'SIM_CU_PCK_CTRLES_Y_VALID',
    'SIM_PCK_CONTEXTO_EMISION',
    'SIM_PCK_CONSULTA_EMISION',
    'SIM_PCK_REGLAS',
    'SIM_CU_PCK_GRAN_BENEF_EMIS',
    'SIM_CU_PCK_ACCESO_DATOS_EMI',
    'SIM_CU_PCK_ACCESO_BENEFICIARIO'
  )
ORDER BY last_ddl_time DESC;

-- 2. Auditoría DDL (si existe tabla de auditoría)
-- Buscar en DBA_AUDIT_TRAIL o tabla custom de auditoría
SELECT username, action_name, obj_name, timestamp, sql_text
FROM dba_audit_trail
WHERE obj_name IN (
    'SIM_CU_PCK_CTRLES_Y_VALID',
    'SIM_PCK_CONTEXTO_EMISION',
    'SIM_PCK_CONSULTA_EMISION',
    'SIM_PCK_REGLAS',
    'SIM_CU_PCK_GRAN_BENEF_EMIS'
  )
  AND timestamp > SYSDATE - 30
ORDER BY timestamp DESC;

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

-- Temporal de la PRINCIPAL (endoso 5 que nunca se confirmó)
DELETE FROM x2010040 WHERE num_secu_pol = 29826195726 AND num_end = 5;
DELETE FROM x2010030 WHERE num_secu_pol = 29826195726 AND num_end = 5;
-- Temporal de la HIJA (tu endoso que falló)
DELETE FROM x2000030 WHERE num_secu_pol = 29826195835 AND num_end = 5;
-- Si hay registros en x2000040 también:
DELETE FROM x2000040 WHERE num_secu_pol = 29826195835 AND num_end = 5;

-- Temporal de la PRINCIPAL (endoso 5 que nunca se confirmó)
select * FROM x2010040 WHERE num_secu_pol = 29826195726 ;
select * FROM x2010030 WHERE num_secu_pol = 29826195726 ;
-- Temporal de la HIJA (tu endoso que falló)
select * FROM x2000030 WHERE num_secu_pol = 29826195835 ;
-- Si hay registros en x2000040 también:
select * FROM x2000040 WHERE num_secu_pol = 29826195835 ;


UPDATE A2000040 SET MCA_PRIMA_INF = 'N' WHERE COD_RIES = 1 AND  NUM_END = 4 AND NUM_SECU_POL = 29826195835;

UPDATE A2000040
SET MCA_PRIMA_INF = 'N',
    END_PRIMA_COB = -1 * END_PRIMA_COB,
    END_TASA_COB = 0
WHERE NUM_SECU_POL = 29826195835
AND MCA_VIGENTE = 'S'
AND TIPO_REG = 'T';

---------------------
    --Póliza principal
select *
  from a2010030 t
 where t.cod_secc = 4
   and t.cod_ramo = 450
      -- and t.fecha_venc_pol > trunc(sysdate + 180)
   and t.num_pol1 = 2000134528201;

--Datos variables
select * from a2010020 t where t.num_secu_pol = 29789349319;
--Coberturas
select * from a2010040 t where t.num_secu_pol = 29789349319;

--Póliza Hija
select t.*, t.num_pol_cotiz, t.num_pol1
  from a2000030 t
 where t.num_pol_flot = 2000134528201;

--Datos variables
select * from a2000020 t where t.num_secu_pol = 29789349320;
--Coberturas
select * from a2000040 t where t.num_secu_pol = 29789349320;
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

select * FROM C9999909 T
WHERE T.COD_TAB='PRORROGA_INF'
AND  T.COD_SECC = 4;

SELECT line, text
  FROM all_source
  WHERE name = 'SIM_PCK_CONTEXTO_EMISION'
    AND type = 'PACKAGE BODY'
    AND UPPER(text) LIKE '%MCA_PRIMA_INF%'
  ORDER BY line;

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
where p.num_pol1 = 1001106265301
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
where num_pol_flot = 1001106265301
  and cod_secc = 4;


SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29845722105;

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
WHERE a.NUM_SECU_POL = 29846198041;

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
where p.num_pol1 = 1010115020601
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
where num_pol_flot = 1010115020601
  and cod_secc = 4;

SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 39745421529;

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
WHERE a.NUM_SECU_POL = 39745421530;

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
where p.num_pol1 = 1000171665801
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
where num_pol_flot = 1000171665801
  and cod_secc = 4;

SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 39745425366;

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
WHERE a.NUM_SECU_POL = 39745425367;
---------------------------------------------------------
----PRIORITARIO NUEVA EXPERIENCIA
--------PRORROGA --- CAMBIO DE VALOR ASEGURADO, PARA ARRIBA Y PARA ABAJO


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
where p.num_pol1 = 1010112418201
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
where num_pol1 = 1010108550701
  and cod_secc = 4;

SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29829136488;

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
       a.*
FROM A2000040 a
WHERE a.NUM_SECU_POL = 29829136489;

SELECT s.num_secu_sini,
       s.num_sini,
       s.fecha_sini,
       s.fec_denu_sini,
       s.num_secu_pol,
       s.cod_ries,
       s.cod_ramo,
       s.mca_est_sini,
       s.cod_causa_sini,
       s.*
FROM a7000900 s
WHERE s.num_sini = 10100400571
  AND s.cod_cia = 3;
/*
INSERT INTO A7001210 (NUM_SECU_SINI, COD_COB, SUMA_ASEG, END_SUMA_ASEG, MCA_VAL_SINI, PORC_PPAGO, NOMINA)
VALUES (27443484430, 405, 2095249694, 2095249694, 'ASEG', NULL, NULL);
*/

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
where p.num_pol1 = 1000603362101
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
where num_pol1 = 1000603362101
  and cod_secc = 4;

SELECT a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29779710040;

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
       a.sim_fecha_venc_end
FROM A2000040 a
WHERE a.NUM_SECU_POL = 29779710041;


select a.*
from a2000163 a
where num_secu_pol in (29809294193);

---HIJA
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1000603090301';

---COBERTURAS PRINCIPAL
SELECT A.NUM_END,A.COD_COB,A.PRIMA_COB, A.END_PRIMA_COB, A.SUMA_ASEG, A.END_SUMA_ASEG,A.SIM_FECHA_VIG_END,A.SIM_FECHA_VENC_END,A.SIM_COEFCOB, A.* FROM A2000040 A WHERE NUM_SECU_POL = 29809294190
ORDER BY A.COD_COB,A.NUM_END;
---COBERTURAS HIJA
SELECT A.NUM_END,A.COD_COB,A.PRIMA_COB, A.END_PRIMA_COB, A.SUMA_ASEG, A.END_SUMA_ASEG,A.SIM_FECHA_VIG_END,A.SIM_FECHA_VENC_END,A.SIM_COEFCOB, A.* FROM A2000040 A WHERE NUM_SECU_POL = 29809294193
ORDER BY A.COD_COB,A.NUM_END;

--- NOTA !JULIO DEL 2025 TIENE BIEN CUADRTADO LAS FECHAS VIG PARA PRORROGAS!

select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004100091801';
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004104058101';
select * from a2000030 where COD_SECC = 4 and num_pol1 = '1004104773501';

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
where p.num_pol1 in (1004103026601, 1004103741801)
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
where num_pol1 in ('1004104058101','1004104773501')
  and cod_secc = 4;



---Tablas de facturación con num_secu_pol de poliza hija
select num_secu_pol,num_end,num_factura,cod_situacion,fec_situ,imp_prima
from a2990700
where num_secu_pol in (29816234363, 29832559388)
and num_end in (11,12,13,14);
select num_secu_pol,num_end,num_factura,num_end_rev
from a2000163
where num_secu_pol in (29816234363, 29832559388)
and num_end in (11,12,13,14);

-- Ver las fechas del Endoso 7 (de donde viene la fecha precargada)
SELECT num_end,
       cod_cob,
       sim_fecha_inclusion AS "Origen Fecha Inicio End 8",
       sim_fecha_venc_end AS "Fecha Venc End 7",
       mca_tipo_cob
FROM a2000040
WHERE num_secu_pol = 29809294193
  AND num_end = 7
ORDER BY cod_cob;

----COMISION POLIZAS HIJAS
select * from a2000252 --comision endoso poliza hija
where num_secu_pol=29809294193 and num_end=7;


---1010115363301 -> 29836043785

---29836097911 ->mal talvez de la hihja

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
where p.num_pol1 in (1010115363301)
  and p.cod_secc = 4;

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
where p.num_pol1 = 1010114993701
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
where num_pol_flot = 1010114993701
  and cod_secc = 4;

---coberturas padre
select a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.PRIMA_COB,
       A.*
from a2010040 a
where a.num_secu_pol = 29822321772;
--and a.num_end in (1,2,3,4,5,6);
---coberturas hija
select a.SIM_FECHA_VIG_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.END_SUMA_ASEG,
       A.PRIMA_COB,
       A.END_PRIMA_COB,
       A.*
from a2000040 a
where a.num_secu_pol = 29822321774;
--and a.num_end in (1,2,3,4,5,6);
select a.num_secu_pol,a.num_end,a.num_factura,a.num_end_rev, a.*
from a2000163 a
where num_secu_pol=29822321774;


---CLAVES PARA GRANDES BENEFICIARIOS PROGRAMAS
select ge.clave_lider,ge.porc_partic_lider
from sim_cu_gran_benef_enc ge
where ge.seq_programa_gb=2746 and ge.fecha_venc_vig is null
select gc.clave,gc.porc_participacion
from sim_cu_gran_benef_claves gc
where gc.seq_programa_gb=2746
--3 claves
--62624
--75251
--42274

----NITS Y GRUPOS EMPRESARIALES
----estos son las consultas para temas de grupos empresariales y sociedades plurales en tablas de terceros
select secuencia,numero_documento,razon_social
from juridicos j;
--WHERE SECUENCIA=29013
--where numero_documento in (800051319,830007691)
select * from miembro_grupos
where jur_secuencia in (65143,29013);
select * from grupos_empresas ge
where tipo_grupo='G'
ORDER BY SECUENCIA;

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
where p.num_pol1 = 1000171544801
  and p.cod_secc = 4;
  --and p.NUM_END  = 1;

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
where num_pol_flot = 1000171544801
  and cod_secc = 4;

---coberturas padre
select  a.SIM_FECHA_INCLUSION_END, a.SIM_FECHA_VENC_END, a.SIM_FECHA_INCLUSION, a.SIM_FECHA_EXCLUSION, A.*
from a2010040 a
where a.num_secu_pol = 29817367641
  and a.num_end in (1,2,3,4,5,6);
---coberturas hija
select a.SIM_FECHA_VIG_END, a.SIM_FECHA_VENC_END, a.SIM_FECHA_INCLUSION, a.SIM_FECHA_EXCLUSION, A.*
from a2000040 a
where a.num_secu_pol = 29817367712
  and a.num_end in (1,2,3,4,5,6);

/*
UPDATE a2000040 h
SET (h.SIM_FECHA_VIG_END,
     h.SIM_FECHA_VENC_END,
     h.SIM_FECHA_INCLUSION,
     h.SIM_FECHA_EXCLUSION) = (
    SELECT p.SIM_FECHA_INCLUSION_END,
           p.SIM_FECHA_VENC_END,
           p.SIM_FECHA_INCLUSION,
           p.SIM_FECHA_EXCLUSION
    FROM   a2010040 p
    WHERE  p.num_secu_pol = 29817367641
    AND    p.num_end      = 2
    AND    p.cod_cob      = h.cod_cob
)
WHERE h.num_secu_pol = 29817367712
AND   h.num_end      = 3
AND   h.SIM_FECHA_INCLUSION IS NULL;
*/



<    select p.num_secu_pol,
           p.num_pol1,
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
       p.num_pol1,
       p.*
from a2010030 p
where p.COD_RAMO = 440
  and p.cod_secc = 4
    order by p.FECHA_EMI desc;>

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
where p.num_pol1 = 1000171544801
  and p.cod_secc = 4;
  --and p.NUM_END  = 1;

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
where num_pol_flot = 1000171544801
  and cod_secc = 4;

---coberturas padre
select  a.SIM_FECHA_INCLUSION_END, a.SIM_FECHA_VENC_END, a.SIM_FECHA_INCLUSION, a.SIM_FECHA_EXCLUSION, A.*
from a2010040 a
where a.num_secu_pol = 29817367641
  and a.num_end in (1,2,3,4,5,6);
---coberturas hija
select a.SIM_FECHA_VIG_END, a.SIM_FECHA_VENC_END, a.SIM_FECHA_INCLUSION, a.SIM_FECHA_EXCLUSION, A.*
from a2000040 a
where a.num_secu_pol = 29817367712
  and a.num_end in (1,2,3,4,5,6);


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
where p.num_pol1 = 1000172059801
  and p.cod_secc = 4;
  --and p.NUM_END  = 1;
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
where num_pol_flot = 1000172059801
  and cod_secc = 4;
---coberturas padre
select a.SIM_FECHA_INCLUSION_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.PRIMA_COB,
       A.*
from a2010040 a
where a.num_secu_pol = 29833289933;
  --and a.num_end in (0,1, 2, 3, 4, 5, 6);
---coberturas hija
select a.SIM_FECHA_VIG_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.END_SUMA_ASEG,
       A.PRIMA_COB,
       A.END_PRIMA_COB,
       A.*
from a2000040 a
where a.num_secu_pol = 29833289934;

select A.PREMIO, A.IMP_PRIMA, a.num_secu_pol,a.num_end,a.num_factura,a.num_end_rev, a.*
from a2000163 a
where num_secu_pol=29833289934 ORDER BY A.NUM_END, A.NUM_FACTURA;

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
where num_pol1 = 1000101530601
  and cod_secc = 10;
---coberturas RC
select a.SIM_FECHA_VIG_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.END_SUMA_ASEG,
       A.PRIMA_COB,
       A.END_PRIMA_COB,
       A.PRIMA_ANU,
       A.END_PRIMA_ANU,
       A.*
from a2000040 a
where a.num_secu_pol = 29833290233;
----facturas rc
select a.num_secu_pol,a.num_end,a.num_factura,a.num_end_rev, a.*
from a2000163 a
where num_secu_pol=29833290233;


---simon cumplimiento SIM_SISTEMA_ORIGEN 102
---tronador  SIM_SISTEMA_ORIGEN es null Y SISTEMA_ORIGEN LLENO
--- SIMON TRANVERSAL SIM_SISTEMA_ORIGEN 100
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
where p.num_pol1 = 1522124081301
  and p.cod_secc = 4;
  --and p.NUM_END  = 1;
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
where num_pol_flot = 1522124081301
  and cod_secc = 4;


select * from OPS$PUMA.SIM_TEXTOS_POLIZAS where NUM_SECU_POL = 29798951523;
select * from OPS$PUMA.SIM_TEXTOS_POLIZAS where NUM_SECU_POL = 29798950645;
--select * from OPS$PUMA.SIM_TEXTOS_POLIZAS where NUM_SECU_POL = 29833289934;

select * from   a2010260
where num_secu_pol = 29798950645;
select * from   a2000260
where num_secu_pol = 29798951523;

select * from   a2000260
where num_secu_pol = 29833289934;
select * from   a2010260
where num_secu_pol = 29833289933;

----------------------------------------------------------------------------------------------------------------------------

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
where p.num_pol1 = 6500000012601
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
where num_pol_flot = 6500000012601
  and cod_secc = 4;


-------validacion factura cumplimiento-----
SELECT *
FROM a2990700 A
WHERE A.NUM_SECU_POL IN
      (select A.NUM_SECU_POL
       from A2000030 a
       where a.num_pol1 = 1505117016501
         and a.cod_ramo = 214
         and a.num_end = 0);
SELECT *
FROM a2000163 A
WHERE A.NUM_SECU_POL IN
      (select A.NUM_SECU_POL
       from A2000030 a
       where a.num_pol1 = 1505117016501
         and a.cod_ramo = 214
         and a.num_end = 0);

select A.NUM_END,A.*
       from A2000030 a
       where a.num_pol1 = 1010108379301
         and a.cod_ramo = 215;
select A.NUM_END,A.*
       from A2000030 a
       where a.num_pol1 = 1505117016501
         and a.cod_ramo = 214;

SELECT *
FROM a2990700 A
WHERE A.NUM_SECU_POL IN
      (select A.NUM_SECU_POL
       from A2000030 a
       where a.num_pol1 = 1010108379301
         and a.cod_ramo = 215
         and a.num_end = 0);
SELECT *
FROM a2000163 A
WHERE A.NUM_SECU_POL IN
      (select A.NUM_SECU_POL
       from A2000030 a
       where a.num_pol1 = 1010108379301
         and a.cod_ramo = 215
         and a.num_end = 0);

-----verificacion tablas que tiene en cuantga la generacion de factura
select * from a2000040 where num_secu_pol = 29839308480;
select * from a2000040 where num_secu_pol = 29834460164;
select * from a2000060 where num_secu_pol = 29834460164;
select * from a2000160 where num_secu_pol = 29834460164;
select * from a2000190;
select * from a2000250 where num_secu_pol = 29839308480;
select * from a2000252 where num_secu_pol = 29834460164;
select * from a2000191 where num_secu_pol = 29834460164;
select * from a2990700 where num_secu_pol = 29834460164;
select * from a2990701 where NUM_POL1 = 1010108379301 and cod_secc = 10;

------sim_codigos_endosos_seccion pero debes fijarte en el tipo_end si es SM es que quedó nominativo pero si es cualquier otro cobra prima
select * from sim_codigos_endoso_seccion where cod_secc in (10,4) ;

-----verificacion de porcentaje de comisiones
SELECT PORC_COMI_END, COD_CONV, COMI_PACTADA
FROM a2000250
WHERE num_secu_pol = 29833290233
  AND num_end = 2;

 SELECT *
     FROM fact_especial a
    WHERE a.cod_tab  = 'FACTENDOSO_PRORROGA'
      --AND a.cod_ramo = 214
      AND a.cod_cia  = 3
      AND a.fecha_baja IS NULL;

   SELECT *
      FROM A2000250 a
     WHERE a.NUM_SECU_POL = 29833290233

   SELECT *
      FROM A2000250 a
     WHERE a.NUM_SECU_POL = 29834460164
       AND a.NUM_END =
           (SELECT MAX(b.NUM_END)
              FROM A2000250 b
             WHERE b.NUM_SECU_POL = 29834460164
               AND b.NUM_END <= 1 and b.COD_AGENTE > 99000
               AND (b.FOR_ACTUACION = 'PR' Or -- SIMON API
                   (b.COD_AGENTE > 99000 And
                   0 < (Select Count(1)
                            From a1000702 f
                           Where f.cod_agencia =
                                 (Select a1702_cod_agencia
                                    From intermediarios
                                   Where clave = b.COD_AGENTE)
                             and f.cod_div_dreg = 25))));

-----PROBLE DE FACTURAS NO SE CREAN
/*
insert into C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, SECUENCIA, PROCESO)
values ('EXCL_VARIAS_FACTS', null, null, null, null, 'S', null, null, 999, 4, 3, to_date('27-02-2026', 'dd-mm-yyyy'),
        null, null, null, null, null, null, null, null, null, null, null, null, null, null);

insert into C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, SECUENCIA, PROCESO)
values ('EXCL_VARIAS_FACTS', null, null, null, null, 'S', null, null, 999, 10, 3, to_date('27-02-2026', 'dd-mm-yyyy'),
        null, null, null, null, null, null, null, null, null, null, null, null, null, null);
*/

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
where p.num_pol1 = 1000172059801
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
where num_pol_flot = 1000172059801
  and cod_secc = 4;

select * from A2000030 where NUM_POL1 = 1522123889101;

SELECT * FROM A2000020 WHERE NUM_SECU_POL = 39745410583;


select * from a2010040 where num_secu_pol = 29833289933;

select * from a2000040 where num_secu_pol = 29833289934;

SELECT A.NUM_END, A.NUM_END_REV,A.IMP_PRIMA ,A.PREMIO, A.*
FROM a2000163 A
WHERE A.NUM_SECU_POL IN
      (29833289934) ORDER BY A.NUM_END, A.NUM_FACTURA;

----tabla visualizacion endosos eliminados por usuario;
select * from b_a2010030 where num_secu_pol = '29833289933';


--------------------------------------

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
where p.num_pol1 = 1070000772001
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
where num_pol1 = 1070000772001
  and cod_secc = 4;

select * from a2000020 where num_secu_pol = 29723212892;

select * from a2000040 where num_secu_pol = 29723212892;


SELECT A.PREMIO, A.IMP_PRIMA, A.*
FROM a2000163 A
WHERE A.NUM_SECU_POL IN
      (29756783983);


select num_secu_pol,num_end,cod_end,sub_cod_end from a2010030
where num_pol1=1000171657301

SELECT p.MCA_TIPO_COB, p.LETRA_COB, p.* FROM a2010040 p WHERE num_secu_pol = 39745413333;
---update a2010040 set LETRA_COB = 2 where num_secu_pol = 39745413020;
SELECT * FROM a2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 39745413333;

SELECT * FROM x2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 39745413333;


SELECT * FROM A2000040 WHERE Num_secu_pol = 39745413333;


SELECT COUNT(*)
  FROM X2000040
 WHERE Num_secu_pol = 39745413333
   AND Mca_tipo_cob != '1'
   AND NVL(Mca_reaseguro, 'N') = 'S'
   AND NVL(Cod_selecc, 'N') = 'S'
   AND (NVL(Suma_aseg, 0) != 0 OR NVL(Val_asegurable, 0) != 0);

-----accesos listas desplegables en Simon WEB
SELECT DISTINCT p.COD_PRODUCTO, p.NOM_PRODUCTO, pr.DESCRIPCION
FROM SIM_ACCESOS_DATOS ad
JOIN SIM_PRODUCTOS p ON ad.ID_PRODUCTO = p.ID_PRODUCTO
JOIN SIM_PROCESOS pr ON ad.ID_PROCESO = pr.ID_PROCESO
WHERE ad.CODIGO_USUARIO = '51938035'  -- cédula del usuario
  AND ad.ESTADO = 'A'
  --AND p.NOM_PRODUCTO like '%CUMP%'
AND p.NOM_PRODUCTO like '%RESPON%'
AND pr.DESCRIPCION LIKE '%MOD%'
ORDER BY pr.DESCRIPCION, p.COD_PRODUCTO;
SELECT ad.CODIGO_USUARIO, p.COD_PRODUCTO, p.NOM_PRODUCTO, pr.DESCRIPCION, ad.ESTADO, pr.ID_PROCESO
FROM SIM_ACCESOS_DATOS ad
JOIN SIM_PRODUCTOS p ON ad.ID_PRODUCTO = p.ID_PRODUCTO
JOIN SIM_PROCESOS pr ON ad.ID_PROCESO = pr.ID_PROCESO
WHERE ad.CODIGO_USUARIO = '51938035'
  AND ad.ESTADO = 'A'
  and pr.DESCRIPCION LIKE '%MOD%'
  --AND pr.ID_PROCESO = 280
  AND p.COD_PRODUCTO = 214;


SELECT TRIGGER_NAME,
       TRIGGER_TYPE,
       TRIGGERING_EVENT,
       STATUS,
       OWNER
  FROM ALL_TRIGGERS
 WHERE TABLE_NAME = 'A2000040'
   AND TABLE_OWNER = 'OPS$PUMA' -- ajusta el owner si es diferente
 ORDER BY TRIGGER_TYPE;

-----tabla de COTIZACIONES PRODUCTOS POLIZAS INDIVIDUALES
select * from c2990003;

SELECT a.num_factura
      FROM a2990700 a, a2000163 b
     WHERE a.num_pol1 = 1000602603101
       --AND a.num_end = 5
       AND a.cod_secc = 4
       AND a.num_secu_pol = b.num_secu_pol
       AND a.num_factura = b.num_factura
       AND b.cod_agrup_cont = 'GENERICOS'
       AND tipo_reg = 'T'
       AND b.num_end_rev IS Null;

select a.NUM_END, a.NUM_END_FLOT, a.DESC_POL, a.num_pol_flot, a.num_end_flot , a.* from a2000030 a where num_secu_pol = 29785225093; ----29785225093

---delete a2000030 where num_secu_pol = 29785225093 and NUM_END = 5;
--delete a2000040 where num_secu_pol = 29785225093 and NUM_END = 5;

------QUERY DE DONDE SACA LA PRIMA TOTAL IMPRESION DE POLIZA PADRE
SELECT MAX(LPAD(a.num_factura, 3, '0')) num_factura,
           MAX(a.cod_agrup_cont) cod_agrup_cont,
           MAX(TO_CHAR(a.fecha_vig_fact, 'ddmmrrrr')) fecha_vig_fact,
           MAX(TO_CHAR(a.fecha_vto_fact, 'ddmmrrrr')) fecha_vto_fact,
           SUM(ROUND(a.imp_prima, 0)) prima,
           SUM(ROUND(NVL(a.imp_impuesto, 0), 0)) iva,
           SUM(ROUND(a.imp_prima, 0) + ROUND(a.imp_impuesto, 0)) total,
           SUM(NVL(a.imp_der_emi, 0)) gastos_expedicion
      FROM a2000163 a
     WHERE (a.num_secu_pol, a.num_end) in
           (select a3.num_secu_pol, a3.num_end
              from a2000030 a3
             where a3.num_pol_flot = 1000170843501
               and a3.num_end_flot = 3
               and a3.cod_secc = 4)
       AND a.cod_agrup_cont = 'GENERICOS'
       AND a.tipo_reg = 'T'
     ORDER BY 1;

------QUERY DE DONDE SACA LA PRIMA TOTAL IMPRESION DE POLIZA HIJA
 SELECT MAX(LPAD(a.num_factura, 3, '0')) num_factura,
           MAX(a.cod_agrup_cont) cod_agrup_cont,
           MAX(TO_CHAR(a.fecha_vig_fact, 'ddmmrrrr')) fecha_vig_fact,
           MAX(TO_CHAR(a.fecha_vto_fact, 'ddmmrrrr')) fecha_vto_fact,
           SUM(ROUND(a.imp_prima, 0)) prima,
           SUM(ROUND(NVL(a.imp_impuesto, 0), 0)) iva,
           SUM(ROUND(a.imp_prima, 0) + ROUND(a.imp_impuesto, 0)) total,
           SUM(NVL(a.imp_der_emi, 0)) gastos_expedicion

      FROM a2000163 a
     WHERE a.num_secu_pol = 29785225093
       AND a.num_end = 2
       AND a.cod_agrup_cont = 'GENERICOS'
       AND a.tipo_reg = 'T'
     ORDER BY 1;
    select * from a2000040 where num_secu_pol = 29785225093;

  SELECT *
        FROM A2000163
       WHERE NUM_SECU_POL = 29785225093
        AND cod_agrup_cont = 'GENERICOS'
       AND tipo_reg = 'T';

SELECT *
FROM a2990700 A
WHERE A.NUM_SECU_POL IN
      (select A.NUM_SECU_POL
       from A2000030 a
       where a.num_pol1 = 1000602603101
         and a.cod_ramo = 455
         and a.num_end = 5);



 SELECT LPAD(a.num_factura, 3, '0') factura, cod_situacion estado_fact
      FROM a2990700 a
     WHERE A.COD_COBRO NOT IN ('DB', 'RE', 'FP') AND
     a.cod_cia = 3
     AND a.cod_secc = 4
     AND a.cod_ramo = 455
     AND a.num_pol1 = 1000602603101
     AND a.num_end = 5
     AND a.num_factura > 0;

   SELECT *
        FROM A2000160
       WHERE NUM_SECU_POL = 29785225093
         AND NUM_END = 5
         AND TIPO_REG = 'T';

   SELECT *
        FROM A2000190
       WHERE NUM_SECU_POL = 29785225093;

   SELECT *
        FROM A2000250
       WHERE NUM_SECU_POL = 29785225093;
-----LOG DE EERORES PROCESO DE FACTURACION EN GERACION DE FACTURA PAQUETE ---SIM_PCK299_AB100277
SELECT *
FROM fact_log_errores
WHERE
    NUMSECUPOL = 29785225093
    --AND programa LIKE '%sim_pck299_AB100277 - prc_LeePremio%'
ORDER BY fecha DESC
    FETCH FIRST 100 ROWS ONLY;


--------- VALIDACION PARA CLIENTES RESTRINGIDOS
select * from A2000030 WHERE NUM_POL1 = 1505005073901;
SELECT * FROM A2000020 WHERE NUM_SECU_POL = 29842911408;
SELECT * FROM Clientes_Restringidos   where numero_documento = 830129289 ;
SELECT * FROM Clientes_Restringidos_traza where numero_documento = 830129289 ;
select * from historicos_restringidos where clires_numero_documento = 830129289 ;

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
where num_pol1 = 1000101530601
  and cod_secc = 10;

SELECT * FROM A2000040 WHERE NUM_SECU_POL = 29833290233;

select * from creglas where cdreg='204PCC415';

SELECT * FROM G2000020 WHERE REG_PRE_FIELD = '204PCC415';

SELECT *
FROM C2040200
WHERE COD_CIA = 3
  AND COD_TAB = 403
  AND DIAS_TAB = 1 ORDER BY FECHA_VIG;

SELECT TASA_TAB, FECHA_VIG
FROM C2040200
WHERE COD_CIA = 3
  AND COD_TAB = 403
  AND DIAS_TAB = 1
  AND NVL(PORC_ANT_TAB, 0) =
      (SELECT MIN(NVL(PORC_ANT_TAB, 0))
       FROM C2040200
       WHERE COD_CIA = 3
         AND COD_TAB = 403
         AND DIAS_TAB = 1
         AND FECHA_VIG < =
             TO_DATE('30-09-2027', 'DD-MM-YYYY'))
  AND FECHA_VIG = (SELECT MAX(FECHA_VIG)
                   FROM C2040200
                   WHERE COD_CIA = 3
                     AND COD_TAB = 403
                     AND DIAS_TAB = 1
                     AND NVL(PORC_ANT_TAB, 0) =
                         (SELECT MIN(NVL(PORC_ANT_TAB, 0))
                          FROM C2040200
                          WHERE COD_CIA = 3
                            AND COD_TAB = 403
                            AND DIAS_TAB = 1
                            AND FECHA_VIG < =
                                TO_DATE('30-09-2027', 'DD-MM-YYYY')));

-----URL DONDE QUEDAN GUARDADAS IMPRESIONES RECIENTE PARA SABER SI LA IMPRESION NO ES RECIENTE
----UPDATE A NULL URL TRASFIRIENDO
Select * from DOC1.solicitudes_transfiriendo s


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

select A.num_secu_pol, A.num_end, A.num_factura, A.num_end_rev, A.IMP_PRIMA, A.*
from a2000163 A
where num_secu_pol = 29785225093 and num_end in (4,5,6,7) AND COD_AGRUP_CONT = 'GENERICOS' AND tipo_reg = 'T';


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
       a.SIM_FECHA_VIG_END,
       a.sim_fecha_venc_end,
       a.*
FROM A2000040 a
WHERE a.Num_secu_pol = 29785225093
order by a.num_end asc;

SELECT
       a.num_end,
       a.suma_aseg,
       a.PRIMA_COB,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       a.*
FROM A2010040 a
WHERE a.Num_secu_pol = 29785225092
order by a.num_end asc;



-------------El producto 76 es incendio
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
where num_pol1 = 1070307909201
  and cod_secc = 5;


-- Parametrización PRORROGA_INF en C9999909
-- Si existe registro para tu sección, el campo "Prima Informada" aparece (no obligatorio)
SELECT cod_secc, cod_ramo, cod_tab, dat_car, fecha_alta, fecha_baja, usuario
FROM C9999909
WHERE COD_TAB = 'PRORROGA_INF'
ORDER BY cod_secc;
---Y este para la segunda condición (aplica solo a secciones 4, 14, 10 — hace el campo obligatorio si la póliza tiene coberturas con prima informada o prima mínima aplicada):

-- Parametrización PRI_INF_X_PRI_MIN (segunda condición, campo obligatorio)
SELECT cod_secc, cod_ramo, cod_tab, dat_car, fecha_alta, fecha_baja, usuario
FROM C9999909
WHERE COD_TAB = 'PRI_INF_X_PRI_MIN'
ORDER BY cod_secc;


SELECT *
FROM C9999909
WHERE COD_TAB = 'PRORROGA_INF';

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
where num_pol1 = 1006001248801
  and cod_secc = 4;

SELECT num_secu_pol, codigo_texto, subcodigo_texto, orden, proceso, modificable
FROM SIM_X_TEXTOS_POLIZAS
WHERE num_secu_pol in (29801726531,29801726533)
ORDER BY orden;

select * from OPS$PUMA.SIM_TEXTOS_POLIZAS where num_secu_pol in (29801726531,29801726533);

select * from X1150190;

SELECT column_name FROM all_tab_columns
WHERE table_name = 'X1150190'
AND column_name IN (
  'URBANO_VLR','URBANO_LMT',
  'CONTENEDOR','CONTENEDOR_VLR','CONTENEDOR_LMT',
  'NACIONAL','NACIONAL_VLR','NACIONAL_LMT',
  'NACIONAL_URB','NACIONAL_URB_VLR','NACIONAL_URB_LMT'
);

SELECT a.num_factura, a.cod_agente, a.com_normal, a.pri_com, a.cod_cob, a.cod_agrup_cont, a.for_actuacion, a.*
FROM a2000252 a
WHERE a.num_secu_pol = 29845059287;
select * from a5022999 where num_pol1 = 1510173073501;

----comisiones por agente y agrupacion contable
SELECT a.num_factura, a.cod_agente, a.com_normal, a.pri_com, a.cod_cob, a.cod_agrup_cont, a.for_actuacion, a.*
FROM a2000252 a
WHERE a.num_secu_pol = 29845059287;
select * from a5022999 where num_pol1 = 1510173073501;

-- 2. Verificar SIM_EXPED_PROCESO para la clase PI y el proceso de expedientes
SELECT * FROM SIM_EXPED_PROCESO WHERE CLASE_EXPED = 'PI';

SELECT * FROM SIM_EXPED_PROCESO WHERE CLASE_EXPED IN ('GJ', 'GS', 'PJ');

SELECT * FROM SIM_PROCESOS WHERE ID_PROCESO IN (771, 772, 773, 774);


-- Nombre completo
SELECT FUN_DATO_TERCERO('NOMCOMPLETO', 'NT', '901125536') AS NOMBRE_COMPLETO FROM DUAL;
select * from juridicos
where numero_documento=901125536;
--4090311
select * from direcciones
where jur_secuencia=4090311;
select * from medios_comunicacion
where jur_secuencia=4090311;



SELECT LINE, TEXT
FROM ALL_SOURCE
WHERE NAME = 'SIM_PCK_ACCESO_DATOS_EMIS_F2'
AND TYPE = 'PACKAGE BODY'
AND UPPER(TEXT) LIKE '%PROC_TRANSITORIAS_ENDOSOPPAL%'
ORDER BY LINE;


-- Verificar si existen los registros paramétricos
SELECT A.COD_TAB, A.CODIGO1, A.CODIGO2, A.FECHA_BAJA
FROM C9999909 A
WHERE A.COD_TAB = 'PARAM_AUTOS'
AND A.CODIGO1 IN (1, 2);

UPDATE C9999909
SET FECHA_BAJA = NULL
WHERE COD_TAB = 'PARAM_AUTOS'
AND CODIGO1 IN (1, 2)
AND FECHA_BAJA = TO_DATE('2026-05-31','YYYY-MM-DD');


-- 1. Encabezado del programa 905 (ver clave líder actual)
SELECT SEQ_PROGRAMA_GB, NOMBRE_PROGRAMA_GB, CLAVE_LIDER, PORC_PARTIC_LIDER,
       FECHA_INICIO_VIG, FECHA_VENC_VIG, ESTADO_PROGRAMA_GB
FROM SIM_CU_GRAN_BENEF_ENC
WHERE SEQ_PROGRAMA_GB = 905
ORDER BY FECHA_INICIO_VIG DESC;

-- 2. Buscar la póliza (puede que el formato del número sea diferente)
SELECT NUM_SECU_POL, NUM_POL1, COD_SECC, COD_PROG, MCA_ANU_POL
FROM A2000030
WHERE NUM_POL1 LIKE '%1000171798%'
AND ROWNUM <= 10;

-- 3. Si no encuentra, intentar buscando por la flotante
SELECT NUM_SECU_POL, NUM_POL1, COD_SECC, NUM_POL_FLOT, COD_PROG
FROM A2000030
WHERE NUM_POL_FLOT = 1000171798101
AND ROWNUM <= 10;

SELECT * FROM NATURALES;
SELECT * FROM JURIDICOS;

SELECT h.cod_prod,
       i.jur_secuencia,
       i.nat_secuencia,
       i.suc_jur_secuencia,
       COALESCE(j.numero_documento, js.numero_documento, n.numero_documento) AS nit_cedula,
       COALESCE(j.razon_social, js.razon_social,
                n.primer_nombre||' '||n.primer_apellido) AS nombre_agente
  FROM a2000030 h
  JOIN intermediarios i ON i.clave = h.cod_prod
  LEFT JOIN juridicos j  ON j.secuencia = i.jur_secuencia
  LEFT JOIN juridicos js ON js.secuencia = i.suc_jur_secuencia
  LEFT JOIN naturales n  ON n.secuencia = i.nat_secuencia
 WHERE h.num_pol_flot = 1000171798101
   AND h.cod_secc = 4
   AND h.num_end = 0;


SELECT a.NUM_END, a.NUM_SECU_POL, b.IMP_PRIMA_END, b.IMP_IMPUESTO_E, b.PREMIO_END, c.NUM_FACTURA, c.PREMIO
FROM ops$puma.A2000030 a
JOIN ops$puma.A2000160 b ON a.NUM_SECU_POL = b.NUM_SECU_POL
JOIN ops$puma.A2000163 c ON a.NUM_SECU_POL = c.NUM_SECU_POL
WHERE a.NUM_POL1 = 1010115110401 AND a.NUM_END IN (2, 3);


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
where p.num_pol1 = 1010115110401
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
where num_pol_flot = 1010115110401
  and cod_secc = 4;

SELECT a.*
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29824968550;

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
WHERE a.NUM_SECU_POL = 29825046154;


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
where p.num_pol1 = 1010115747701
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
where num_pol1 = 1020112891601
  and cod_secc = 4;

SELECT a.*
FROM A2010040 a
WHERE a.NUM_SECU_POL = 29801726531;

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
WHERE a.NUM_SECU_POL = 29801726533;

------COMISIONES DE CUMPLIMIENTO PARAMETRIZADAS
SELECT *
FROM C1001801
WHERE COD_SECC = 4
  AND FECHA_BAJA IS NULL
  AND FECHA_VIG = (
    SELECT MAX(FECHA_VIG)
    FROM C1001801
    WHERE COD_SECC = 4
      AND FECHA_BAJA IS NULL
  );
SELECT *
FROM C1001801
WHERE COD_SECC = 10 AND COD_RAMO = 214
  AND FECHA_BAJA IS NULL
  AND FECHA_VIG = (
    SELECT MAX(FECHA_VIG)
    FROM C1001801
    WHERE COD_SECC = 10 AND COD_RAMO = 214
      AND FECHA_BAJA IS NULL
  );

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

select r.num_pol1_lider      pol_cu,
       r.num_secu_pol_lider  nsp_cu,
       r.num_pol1_rel        pol_rc,
       a.num_secu_pol        nsp_rc,
       p.num_pol1  polizarc,
       P.cod_ramo,
       p.cod_secc,
       a.num_end,
       a.cod_cob,
       a.SIM_FECHA_VIG_END,
       a.SIM_FECHA_VENC_END,
       a.SIM_FECHA_INCLUSION,
       a.SIM_FECHA_EXCLUSION,
       A.SUMA_ASEG,
       A.END_SUMA_ASEG,
       A.PRIMA_COB,
       A.END_PRIMA_COB,
       A.PRIMA_ANU,
       A.END_PRIMA_ANU,
       P.coefcob,
       A.END_PRIMA_COB/P.coefcob PRIMA_ANUAL,
       A.*
from sim_negocios_relacionados r
join a2000030 p on p.num_secu_pol = r.num_secu_pol_rel
               and p.num_end = 0
join a2000040 a on a.num_secu_pol = r.num_secu_pol_rel
where r.cod_secc_lider = 4        -- Cumplimiento
  and r.cod_secc_rel   = 10       -- RC
  and r.cod_ramo_rel   = 214      -- RC atada a Cumplimiento
  and p.MCA_COTIZACION = 'N'
  and p.sim_sistema_origen = 196
order by r.num_pol1_lider, a.num_secu_pol, a.num_end, a.cod_cob;


select * from A2000030 where NUM_SECU_POL = 39745411687;