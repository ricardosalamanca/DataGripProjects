------POLIZA RC
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
where cod_ramo = 214
  and cod_secc = 10 and FECHA_EMI > to_date('2026-01-01', 'yyyy-mm-dd');

---DATOS VARIABLES RC
select *
from a2000020
where num_secu_pol IN (29841194020, 39745407786, 29840315600, 29840564220, 39745407506);

---COBERTURAS RC
select *
from a2000040
where num_secu_pol in (29841194020, 39745407786, 29840315600, 29840564220, 39745407506);

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

SELECT * FROM a2000020 WHERE num_secu_pol = 29798951523 AND NUM_END = 0 AND COD_RIES IS NULL;
SELECT * FROM a2000020 WHERE num_secu_pol = 29798951523 AND NUM_END = 0 AND COD_RIES = 1;

SELECT * FROM a2000040 WHERE num_secu_pol = 29798951523;

---DATOS VARIABLES PRINCIPAL
select *
from a2010020
where num_secu_pol IN (29798950645);

---coberturas PRINCIPAL
select *
from a2010040
where num_secu_pol IN (29798950645);

----TABLA RELACION DE POLIZA RC CON POLIZA DE CUMPLMIENTO PADRE
select * from sim_negocios_relacionados where NUM_SECU_POL_LIDER = 39745407784;

-----CODIGOS DE AGENTES/INTERMEDIARIOS
select * from intermediarios;

SELECT * FROM JURIDICOS WHERE NUMERO_DOCUMENTO = '860001449';


SELECT *
        FROM X2000253 A
       WHERE NUM_SECU_POL = 39745410015
         AND MCA_BASE = 'S';


SELECT COD_PROD
                FROM X2000030
               WHERE NUM_SECU_POL = 39745410015


------POLIZA RC
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
where cod_ramo = 214
  and cod_secc = 10 and NUM_SECU_POL in (39745410016);

---DATOS VARIABLES RC
select *
from a2000020
where num_secu_pol IN (39745410016);

---COBERTURAS RC
select *
from a2000040
where num_secu_pol in (39745410016);


select * from G2000020 WHERE COD_RAMO = 214;

select *
from G2000020
WHERE COD_RAMO = 214
  AND COD_CAMPO IN
      ('ACREED_PREND', 'ACT_REFERIDO', 'AFECTACION_CUM', 'BENEF_ONEROSO', 'CLASIFIC_CLIEN', 'COD_ASEG', 'DIAS_VIG',
       'DURAC_CONTRATO', 'FECHA_VENC_CAL', 'FINICIO_CONTRA', 'MCA_PRIMA_MIN', 'MODALIDAD_REA', 'NUM_CONTRATO',
       'NUM_GARANTIA', 'POLIZA_PRORROG', 'REQ_POLIZA_RC', 'TIPO_DOC_ASEG', 'TIPO_DOC_PREND', 'TIPO_EMP_ASEG',
       'TIPO_GARANTIA', 'VALOR_GARANTIA');


SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745410016;



-- Datos variables RC:
SELECT * FROM x2000020 WHERE num_secu_pol = 39745410084;

SELECT * FROM a2000020 WHERE num_secu_pol = 29798951523;

SELECT h.cod_campo, h.valor_campo, h.cod_ries, h.num_end
                FROM a2000020 h
               WHERE h.num_secu_pol = 29798951523
                 AND h.num_end = 0
                 AND NVL(h.cod_ries, 0) = 0
                 AND EXISTS (SELECT 1 FROM g2000020 g
                              WHERE g.cod_ramo = 214
                                AND g.cod_campo = h.cod_campo
                                AND g.cod_nivel = 1)


SELECT h.num_secu_pol, h.cod_cia,          h.fecha_emi,
             h.fecha_vig_pol,    h.fecha_venc_pol,   h.cod_prod,
             h.nro_documto,      h.tdoc_tercero,     h.sec_tercero,
             h.suc_tercero,      h.desc_pol,         h.for_cobro,
             h.cod_mon,          h.cod_duracion,     h.periodo_fact,
             h.cod_plan_pago,    h.cant_cuotas,      h.cod_ramo,
             h.cod_conv,         h.sistema_origen,   h.sim_canal,
             h.sim_usuario_creacion
        FROM a2000030 h
       WHERE h.num_pol_flot = 1522124081301
         AND h.cod_ramo = 450
         AND h.cod_secc = 4
         AND h.num_end = 0
         AND ROWNUM = 1;


SELECT job_name, status, error#, additional_info
  FROM USER_SCHEDULER_JOB_RUN_DETAILS
 WHERE job_name LIKE 'JOB_RC_ASYNC_39745410250%'
 ORDER BY log_date DESC;

=== VERIFICACION (despues de que termine el job) ===
-- Poliza RC:
SELECT * FROM a2000030 WHERE num_secu_pol = 39745410291;
-- Datos variables RC:
SELECT * FROM a2000020 WHERE num_secu_pol = 39745410250;
-- Coberturas RC:
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410250;
-- Relacion RC-CU:
SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745410250;
=== FIN TEST ASYNC ===

SELECT * FROM a2000030 WHERE num_secu_pol = 39745410251;

SELECT * FROM sim_negocios_relacionados WHERE NUM_SECU_POL_LIDER = 29798950645;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745410392;  ----mas de un año COD_DURACION --- MCA_PRORRATA ok
SELECT * FROM a2000020 WHERE num_secu_pol = 39745410392;  --revisar duplicados OK
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410392;
-----AGENTES----------
SELECT * FROM a2000250 WHERE num_secu_pol = 39745410392;
SELECT * FROM a2000252 WHERE num_secu_pol = 39745410392;
-----COASEGUROS-------
select * from A2000100 where num_secu_pol = 39745410392;
select * from sim_textos_polizas t where t.num_secu_pol = 39745410392;
SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745410392;

SELECT * FROM X2000030 WHERE num_secu_pol = 39745410394;
SELECT * FROM a2000030 WHERE num_secu_pol = 39745410394;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745410394;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410394;
-----AGENTES----------
SELECT * FROM a2000250 WHERE num_secu_pol = 39745410394;
SELECT * FROM a2000252 WHERE num_secu_pol = 39745410394;
-----COASEGUROS-------
select * from A2000100 where num_secu_pol = 39745410394;
select * from sim_textos_polizas t where t.num_secu_pol = 39745410394;
SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745410394;



SELECT * FROM a2000030 WHERE num_secu_pol = 39745410396;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745410396;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410396;
SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745410396;



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
where p.num_secu_pol = 39745410432
  and p.cod_secc = 4;
select *
from a2010020 p
where p.num_secu_pol = 39745410432;


SELECT * FROM a2010030 WHERE num_secu_pol = 39745410865;

SELECT *
  FROM a2000030 WHERE num_secu_pol = 39745410872;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745410881;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410881;

SELECT num_secu_pol, num_pol1, num_pol_flot, desc_pol, fecha_vig_pol, fecha_venc_pol
  FROM OPS$PUMA.a2000030 WHERE num_secu_pol = 39745410885;

SELECT * FROM a2000020 WHERE num_secu_pol = 39745410885;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745410885;

select owner,object_type,object_name,ao.status,ao.LAST_DDL_TIME
from all_objects ao
where ao.OBJECT_NAME='SIM_PCK_PROCESO_DML_EMISION';

select owner,object_type,object_name,ao.status,ao.LAST_DDL_TIME
from all_objects ao
where ao.OBJECT_NAME='PKG_AFTER_A2000030';

SELECT num_secu_pol, num_pol1, num_pol_flot, desc_pol, fecha_vig_pol, fecha_venc_pol
  FROM a2000030 WHERE num_secu_pol = 39745410893;

SELECT num_secu_pol, num_pol1, num_pol_flot, desc_pol, fecha_vig_pol, fecha_venc_pol
  FROM a2000030 WHERE num_secu_pol = 39745410898;



SELECT * FROM a2000030 WHERE num_secu_pol = 39745410898;


SELECT num_secu_pol, num_pol1, num_pol_flot, desc_pol, fecha_vig_pol, fecha_venc_pol
  FROM a2000030 WHERE num_secu_pol = 39745410913;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745410954;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745410973;



SELECT * FROM a2000030 WHERE num_secu_pol = 39745411086;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745411086;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745411086;
SELECT * FROM sim_negocios_relacionados WHERE num_secu_pol_rel = 39745411086;



SELECT *
FROM A2000040
WHERE num_secu_pol = 39745411087
  AND tipo_reg = 'E'   -- solo registros de expedición, no reaseguro
ORDER BY cod_cob;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411186;


SELECT * FROM a2000040 WHERE num_secu_pol = 39745411228;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411462;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411465;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411466;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745411466;

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
where p.num_pol1 = 1505002574901
  and p.cod_secc = 4;

SELECT * FROM a2000020 WHERE num_secu_pol = 39745411086;
SELECT * FROM a2010020 WHERE num_secu_pol = 39745411685;
SELECT max(num_secu_pol) FROM a2000030 WHERE NUM_POL_FLOT in (SELECT max(num_pol1) FROM a2010030 WHERE num_secu_pol = 39745411685 and num_pol1 is not null) and cod_secc = 4 and cod_ramo in(450, 455, 440) and num_pol1 is not null;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745411686;

SELECT * FROM X2000040 WHERE num_secu_pol = 39745411987;
SELECT * FROM a2010040 WHERE num_secu_pol = 39745411987;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745411987;

SELECT * FROM a2010040 WHERE num_secu_pol > 39745411875 and NUM_END = 0;

-----TABLAS DE COLOCACION REASEGURO
select * from a8000043
where num_secu_pol=39745411687;
select * from a8000040
where num_secu_pol=39745411687;
select * from a8000041
where num_secu_pol=39745411687;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411705;

-----TABLAS DE COLOCACION REASEGURO
select * from a8000043
where num_secu_pol=39745411705;
select * from a8000040
where num_secu_pol=39745411705;
select * from a8000041
where num_secu_pol=39745411705;


SELECT * FROM a2000040 WHERE num_secu_pol = 39745411686;
-----TABLAS DE COLOCACION REASEGURO
select * from a8000043
where num_secu_pol=39745411686;
select * from a8000040
where num_secu_pol=39745411686;
select * from a8000041
where num_secu_pol=39745411686;



SELECT * FROM A2000040 WHERE num_secu_pol = 39745411806;
SELECT * FROM X2000040 WHERE num_secu_pol = 39745411806;

SELECT * FROM x2000040 WHERE num_secu_pol = 39745411824;
SELECT * FROM A2000020 WHERE num_secu_pol = 39745411824;
SELECT * FROM X2000020 WHERE num_secu_pol = 39745411824;

--hija
SELECT * FROM a2000040 WHERE num_secu_pol = 39745411833;
SELECT * FROM x2000040 WHERE num_secu_pol = 39745411833;

---principal
SELECT * FROM a2010040 WHERE num_secu_pol = 39745411846;
SELECT * FROM x2010040 WHERE num_secu_pol = 39745411846;

SELECT * FROM a2000040 WHERE num_secu_pol = 39745411846;
SELECT * FROM x2000040 WHERE num_secu_pol = 39745411846;

-- Por tipo de emisión (más recientes primero)
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%'
 ORDER BY FECHA_INICIO DESC;
-- Por número de póliza
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE '%:POL:12345678'
 ORDER BY FECHA_INICIO DESC;
-- Solo las que fallaron
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%'
   --AND RESULTADO != 0
 ORDER BY FECHA_INICIO DESC;
-- Todas las emisiones digitales recientes
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%'
   AND FECHA_INICIO >= SYSDATE - 7
 ORDER BY FECHA_INICIO DESC;

SELECT * FROM a2010030 WHERE num_secu_pol = 39745411872;
SELECT * FROM a2010020 WHERE num_secu_pol = 39745411872;
SELECT * FROM x2000020 WHERE num_secu_pol = 39745411872;

SELECT * FROM a2010040 WHERE num_secu_pol = 39745411872;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745411872;

SELECT * FROM x2010040 WHERE num_secu_pol = 39745411872;
SELECT * FROM x2000040 WHERE num_secu_pol = 39745411872;

select * from G2000020 WHERE COD_RAMO = 450;
----CAMPOS VALIDOS PARA POLIZA PRINCIPAL CUUANDO ES CAANAL 3 ip_proceso.p_canal := 3;
SELECT COD_CAMPO, NUM_SECU, COD_NIVEL, MCA_PPAL, MCA_PPTO, OBLIGATORIO, VALOR_DEFECTO, MCA_BAJA
  FROM G2000020
 WHERE COD_RAMO = 450
   AND NVL(MCA_PPAL, 'N') = 'S'
   AND NVL(MCA_BAJA, 'N') != 'S'
   AND COD_NIVEL IN (1, 2)
 ORDER BY COD_NIVEL, NUM_SECU, COD_CAMPO;
----CAMPOS VALIDOS PARA POLIZA PRINCIPAL CUUANDO ES CANAL 5 ip_proceso.p_canal := 5;
SELECT COD_CAMPO, NUM_SECU, COD_NIVEL, MCA_PPAL, MCA_PPTO, OBLIGATORIO, VALOR_DEFECTO, MCA_BAJA
  FROM G2000020
 WHERE COD_RAMO = 450
   AND NVL(MCA_PPTO, 'N') = 'S'
 ORDER BY COD_NIVEL, NUM_SECU, COD_CAMPO;


SELECT * FROM a2010020 WHERE num_secu_pol = 39745411876;
SELECT * FROM x2000020 WHERE num_secu_pol = 39745411876;

SELECT * FROM a2010040 WHERE num_secu_pol = 39745411876;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745411876;
SELECT * FROM x2000040 WHERE num_secu_pol = 39745411876;

-----QUERYS DE REASEGURO
SELECT * FROM A8000040
WHERE NUM_SECU_POL in (39745411875,39745411877,39745411878);
SELECT * FROM A8000041
WHERE NUM_SECU_POL in (39745411875,39745411877,39745411878);
SELECT * FROM A8000043
WHERE NUM_SECU_POL in (39745411875,39745411877,39745411878);
select num_secu_pol,cod_cob,mca_gratuita,end_prima_cob,num_bloque_reas,regla_cap_reas,capital_reas,prima_reas,capital_calculo_reas
from a2000040
WHERE NUM_SECU_POL in (39745411875,39745411877,39745411879)
and tipo_reg='T';
----TABLA LOG DE ERRORES DE REASEGURO
select * from C8000010
WHERE NUM_SECU_POL in (39745411875,39745411877,39745411879);

-----QUERYS DE REASEGURO
SELECT * FROM a2010020 WHERE num_secu_pol = 39745411977;
SELECT * FROM X2000020 WHERE num_secu_pol = 39745411977;

SELECT * FROM A8000040
WHERE NUM_SECU_POL in (39745411977);

SELECT * FROM A8000041
WHERE NUM_SECU_POL in (39745411977);
SELECT * FROM A8000043
WHERE NUM_SECU_POL in (39745411977);
select num_secu_pol,cod_cob,mca_gratuita,end_prima_cob,num_bloque_reas,regla_cap_reas,capital_reas,prima_reas,capital_calculo_reas
from a2000040
WHERE NUM_SECU_POL in (39745411977)
and tipo_reg='T';
select num_secu_pol,cod_cob,mca_gratuita,end_prima_cob,num_bloque_reas,regla_cap_reas,capital_reas,prima_reas,capital_calculo_reas
from x2000040
WHERE NUM_SECU_POL in (39745411977)
and tipo_reg='T';

----TABLA LOG DE ERRORES DE REASEGURO
select * from C8000010
WHERE NUM_SECU_POL in (39745411977);

-----ver compilaciones de lo paquetes, ver si esta descompilado
select owner,object_type,object_name,ao.status,ao.LAST_DDL_TIME
from all_objects ao
where ao.OBJECT_NAME='Sim_Pck_Proceso_Datos_Emision2';

-----REASEGURO VALIDACION HIJA
SELECT * FROM A8000040
WHERE NUM_SECU_POL in (39745411966);
SELECT * FROM A8000041
WHERE NUM_SECU_POL in (39745411966);
SELECT * FROM A8000043
WHERE NUM_SECU_POL in (39745411966);
select num_secu_pol,cod_cob,mca_gratuita,end_prima_cob,num_bloque_reas,regla_cap_reas,capital_reas,prima_reas,capital_calculo_reas
from a2000040
WHERE NUM_SECU_POL in (39745411966)
and tipo_reg='T';

select num_secu_pol,cod_cob,mca_gratuita,end_prima_cob,num_bloque_reas,regla_cap_reas,capital_reas,prima_reas,capital_calculo_reas
from x2000040
WHERE NUM_SECU_POL in (39745411966)
and tipo_reg='T';
----TABLA LOG DE ERRORES DE REASEGURO
select * from C8000010
WHERE NUM_SECU_POL in (39745411966);

SELECT * from a2010030 WHERE NUM_POL1 = '1505003743001';


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
where p.num_pol1 = 1020112679401
  and p.cod_secc = 4;

SELECT * FROM sim_negocios_relacionados WHERE NUM_POL1_LIDER = 1020112679401;
SELECT * FROM a2000030 WHERE num_secu_pol = 39745412718;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412718;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412718;

SELECT * FROM a2000030 WHERE NUM_pol_FLOT = 1020112679401;
SELECT * FROM a2000040 WHERE num_secu_pol IN (39745412717,39745412716);
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob FROM a2010040 WHERE num_secu_pol IN (39745412717,39745412716);


select num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob
from a2010040
where num_secu_pol in (39745412813,39745412812) -- servicio nva plataforma
--where num_secu_pol in (39745412779,39745412780)-- caso simon

select num_secu_pol,cod_cob,mca_tipo_cob,prima_cob,mca_capital
from a2000040
--where num_secu_pol in (39745412813,39745412812)
where num_secu_pol in (39745412779,39745412780) --caso simon

SELECT * FROM a2000030 WHERE num_secu_pol = 39745412928;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412928;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412928;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745412933;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412933;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412933;

SELECT * FROM a2000020 WHERE num_secu_pol = 29818215609;
SELECT * FROM a2000030 WHERE num_secu_pol = 29818215609;
SELECT * FROM X2000020 WHERE num_secu_pol = 29818215609;

-- Por tipo de emisión (más recientes primero)
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%' and OBJETO_SALIDA like '%1000000211101%'
 ORDER BY FECHA_INICIO DESC;


SELECT * FROM sim_negocios_relacionados WHERE NUM_SECU_POL_REL = 29818215609;


SELECT * FROM a2000030 WHERE num_secu_pol = 29818215992;
SELECT * FROM X2000020 WHERE num_secu_pol = 29818215992;
SELECT * FROM a2000040 WHERE num_secu_pol = 29818215992;


SELECT * FROM X2000020 WHERE num_secu_pol = 29818216048;

SELECT *
FROM g2000020 g
WHERE g.cod_ramo = 214 and
      g.COD_CAMPO = 'ACREED_PREND'
  AND g.cod_nivel = 2;


UPDATE G2000020
SET MCA_BAJA = 'N'
WHERE COD_RAMO = 214
  AND COD_CAMPO = 'ACREED_PREND'
  AND NUM_SECU = 2;


SELECT *
  FROM sim_Log_Webservices t
 WHERE CODIGOWS LIKE 'emisionPrincipal%'
 and t.objeto_salida like '%1505003744001%'
 ORDER BY FECHA_INICIO DESC;

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
where p.num_pol1 = 1505003744001
  and p.cod_secc = 4;

SELECT * FROM a2010040 WHERE num_secu_pol = 29818216340;
SELECT * FROM a2000040 WHERE num_secu_pol = 29818216340;


SELECT A.NUM_SECU_POL, a.cod_ramo, A.SIM_SISTEMA_ORIGEN, A.* FROM a2000030 A WHERE COD_SECC = 10 AND NUM_POL1 = 1505116871301;
SELECT * FROM X2000040 WHERE num_secu_pol IN (29818215992,29818219260);
SELECT * FROM a2000040 WHERE num_secu_pol = 29818219167;


SELECT A.NUM_SECU_POL, a.cod_ramo, A.*
FROM a2000030 A
WHERE COD_SECC = 10
  AND COD_RAMO = 214
  AND COD_CIA = 3
ORDER BY FECHA_EMI DESC;

SELECT * FROM a2000040 WHERE num_secu_pol = 29818219164;

-- Por número de póliza
SELECT * FROM sim_Log_Webservices
 WHERE OBJETO_SALIDA LIKE '%1505116871301%' AND FECHA_INICIO >= TO_DATE('2026-03-01', 'YYYY-MM-DD')
 ORDER BY FECHA_INICIO DESC;

-- Por tipo de emisión (más recientes primero)
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emisionRC%' AND FECHA_INICIO >= TO_DATE('2026-04-01', 'YYYY-MM-DD')
 ORDER BY FECHA_INICIO DESC;

-- Solo las que fallaron
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%'
   --AND RESULTADO != 0
 ORDER BY FECHA_INICIO DESC;
-- Todas las emisiones digitales recientes
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emision%'
   AND FECHA_INICIO >= SYSDATE - 50
 ORDER BY FECHA_INICIO DESC;


-----verificar paquetes invalidos
SELECT owner, object_name, object_type, status, last_ddl_time
FROM all_objects
WHERE object_name = 'SIM_PCK_PROCESO_DML_EMISION'
ORDER BY object_type, owner;
SELECT owner, object_type, status, last_ddl_time
FROM all_objects
WHERE object_name = 'SIM_PCK_PROCESO_DML_EMISION'
  AND object_type = 'PACKAGE BODY'
ORDER BY owner;

----sacar cliente enfoque o ocacional
SELECT NIT_CLIENTE,TIPO_CLI,J.NAZ_CODIGO
FROM SIM_CU_COND_CLIENTE_ENC CE, JURIDICOS J
WHERE NIT_CLIENTE=800230729
--WHERE CE.TIPO_CLI='O' --ENFOQUE
AND PERIODO=(SELECT MAX(PERIODO) FROM SIM_CU_COND_CLIENTE_ENC CE1
WHERE CE1.NIT_CLIENTE=CE.NIT_CLIENTE)
AND CE.SEQ_TERCERO=J.SECUENCIA
ORDER BY PERIODO
--OMAR FERNANDO OTAVO GARCIA, 20 min
--900354052
--MARIA CRISTINA GONZALEZ ARDILA, 6 min
--Estos son los nits con naturaleza publica
SELECT NAZ_CODIGO,NUMERO_DOCUMENTO,RAZON_SOCIAL FROM JURIDICOS
WHERE NUMERO_DOCUMENTO IN (900354052,800230729,800033135)
--MARIA CRISTINA GONZALEZ ARDILA, 2 min
--Cuando nos salga un juridico cuyo sarlaft ya este vencido se debe ingresar a test /terceros y actualizar el campo fecha_periodo a una fecha posterior a la del sysdate
SELECT * FROM ESTADOS_FINANCIEROS E
WHERE JUR_SECUENCIA=2581
ORDER BY FECHA_PERIODO DESC
FOR UPDATE

SELECT * FROM OPS$PUMA.SIM_CU_GRAN_BENEF_TASAS_RC;

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
where p.num_pol1 = 1070000976201
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
where num_pol_flot = 1070000976201
  and cod_secc = 4;

select * from INTERMEDIARIOS where clave = 54172;

--Programas grandes beneficiarios
select t.*, rowid
  from sim_cu_gran_benef_enc t
 where t.seq_programa_gb = 3525;
select * from sim_cu_gran_benef_intgtes t where t.seq_programa_gb in (3525);
select * from sim_cu_gran_benef_claves t where t.seq_programa_gb = 3525;
select *
  from ops$puma.sim_cu_gran_benef_primin_cu t
 where t.seq_programa_gb = 3525;
select *
  from ops$puma.sim_cu_gran_benef_tasas_cu t
 where t.seq_programa_gb = 3525;
select *
  from ops$puma.sim_cu_gran_benef_tasas_rc t
 where t.seq_programa_gb = 3525;


SELECT a.num_pol1,
       a.cod_ramo,
       a.num_secu_pol,
       a.num_end,
       a.fecha_vig_pol,
       a.fecha_venc_pol,
       a.mca_provisorio,
       a.cod_prod,
       a.sim_sistema_origen
  FROM a2000030 a
 WHERE a.cod_secc = 4
   AND a.num_end < 2
   AND a.sim_sistema_origen = 102
   AND a.mca_provisorio = 'N'
   AND a.fecha_vig_pol >= TO_DATE('2026-01-01','YYYY-MM-DD')
   AND ROWNUM <= 20
 ORDER BY a.fecha_vig_pol DESC;

SELECT nr.num_pol1_lider     AS cu_ppal_num_pol1,
       nr.num_secu_pol_lider AS cu_ppal_nsp,
       nr.num_pol1_rel       AS rc_num_pol1,
       nr.num_secu_pol_rel   AS rc_nsp,
       ppal.fecha_vig_pol    AS cu_ppal_fecha_vig,
       ppal.sim_sistema_origen AS cu_ppal_sist_origen,
       rc.fecha_vig_pol      AS rc_fecha_vig,
       rc.fecha_venc_pol     AS rc_fecha_venc,
       rc.cod_prod           AS rc_cod_prod,
       rc.sim_sistema_origen AS rc_sist_origen
  FROM SIM_NEGOCIOS_RELACIONADOS nr
  JOIN a2010030 ppal ON ppal.num_secu_pol = nr.num_secu_pol_lider
  JOIN a2000030 rc   ON rc.num_secu_pol = nr.num_secu_pol_rel
 WHERE nr.cod_secc_lider = 4
   AND nr.cod_secc_rel = 10
   AND ppal.sim_sistema_origen = 102
   AND ppal.mca_provisorio = 'N'
   AND rc.mca_provisorio = 'N'
   AND rc.num_end < 2
   AND rc.num_pol1 IS NOT NULL
   AND ppal.fecha_vig_pol >= TO_DATE('2026-01-01','YYYY-MM-DD')
   AND ROWNUM <= 15
 ORDER BY ppal.fecha_vig_pol DESC;

select * from a2000030 t where t.num_pol_cotiz = 1010133657401;

select * from SIM_NEGOCIOS_RELACIONADOS where NUM_SECU_POL_REL = 29846535328;

select * from a2010030 where NUM_SECU_POL = 29846535324;

select * from a2000030 t where t.num_pol_flot = 1010115658801;


  -- Verificar la póliza en a2000030 (tabla general que sí aplica para RC)
  SELECT MCA_PROVISORIO
  FROM a2000030 a
  WHERE num_secu_pol = 29846653475;

  -- Verificar la póliza en a2000030 (tabla general que sí aplica para RC)
  SELECT *
  FROM a2000030
  WHERE COD_SECC = 10 AND NUM_POL1 = 1020112615201;

select * from A2000040 where num_secu_pol = 29846653561;

  -- Ver todos los endosos de esa póliza
  SELECT num_pol1, num_end,
         fecha_vig_pol, fecha_venc_pol,
         fecha_vig_end, fecha_venc_end,
         mca_cotizacion, mca_term_ok
  FROM a2000030
  WHERE cod_cia = 3
    AND cod_secc = 10
    AND num_pol1 = 1020112615101
  ORDER BY num_end;

select * from a2000220 where num_secu_pol = 29846653561;

select * from g2000210 where COD_ERROR = 924;