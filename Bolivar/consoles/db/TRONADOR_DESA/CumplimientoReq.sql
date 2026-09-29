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

SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob FROM a2010040 WHERE num_secu_pol IN (39745412779,39745412780);
----SOLO ES SERIEDAD DE OFERTA CUANDO VIENE LA COBERTURA 401 EN LA PADRE CODICION PRINCIPAL
    "MCA_AHORRO": "N" -> 2 ->mca_tipo_cob
    "MCA_AHORRO": "S" -> 8 ->mca_tipo_cob
    letra_cob-> 1 SIEMPRE PARA COBERTURA 401 EN LA a2010040
    letra_cob-> 2 PARA LAS DEMAS COBERTURAS EN LA a2010040
----EN LA a2000040 O X2000040 DE LA PADRE OSEA num_secu_pol=39745412779  SOLO DEBE IR LA COBERTURA 401 LAS OTRAS NO SE MAPEAN
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob FROM a2000040 WHERE num_secu_pol IN (39745412779);

SELECT * FROM a2010030 WHERE NUM_SECU_POL = 39745412779;
SELECT * FROM a2000030 WHERE NUM_SECU_POL = 39745412780;
-----PARA la CREACION DE LA POLIZA HIJA SE TIENE QUE IDENTIFICAR SI LA PADRES ES SERIEDAD DE OFERTA CUANDO VIENE LA COBERTURA 401 EN LA PADRE CODICION PRINCIPAL
----SI ESTA CONDICION SE CUMPLE PARA LA EMISION DE LA HIJA ENTONCES SOLO SE DEBE DEJAR LA COBERTURA 401 EN LA a2000040
select num_secu_pol,cod_cob,mca_tipo_cob,prima_cob,mca_capital
from a2000040
where num_secu_pol in (39745412780);

SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob FROM X2010040 WHERE num_secu_pol IN (39745413022);
=== VERIFICACION ===
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob FROM a2010040 WHERE num_secu_pol IN (39745413022);
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob FROM a2000040 WHERE num_secu_pol IN (39745413022);
SELECT * FROM a2010030 WHERE num_secu_pol = 39745413022;
SELECT * FROM a2010020 WHERE num_secu_pol = 39745413022 AND num_end = 0;
SELECT * FROM a2010040 WHERE num_secu_pol = 39745413022 AND num_end = 0;
SELECT * FROM x2000253 WHERE num_secu_pol = 39745413022;
=== FIN TEST JSON ===
=== VERIFICACION ===
SELECT * FROM a2010030 WHERE num_secu_pol = 39745413041;
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob,letra_cob FROM a2010040 WHERE num_secu_pol IN (39745413041);
SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob FROM a2000040 WHERE num_secu_pol IN (39745413041);
SELECT * FROM a2010040 WHERE num_secu_pol = 39745413041 AND num_end = 0;
SELECT * FROM x2000253 WHERE num_secu_pol = 39745413041;
=== FIN TEST JSON ===

SELECT  num_secu_pol,cod_cob,mca_tipo_cob mca_ahorro,prima_cob FROM a2010040 WHERE num_secu_pol IN (39745413082);
SELECT  * FROM a2000040 WHERE num_secu_pol IN (39745413089);
SELECT * FROM a2000040 WHERE num_secu_pol = 39745413089

SELECT * FROM a2000030 WHERE num_secu_pol = 39745412928;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412928;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412928;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745412933;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412933;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412933;

SELECT * FROM a2000020 WHERE num_secu_pol = 39745412935;

SELECT * FROM A2000020 WHERE num_secu_pol = 39745412936;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745412943;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412943;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745412943;


SELECT *
FROM g2000020 g
WHERE g.cod_ramo = 214 and
      g.COD_CAMPO = 'ACREED_PREND'
  AND g.cod_nivel = 2;
/*
UPDATE G2000020
SET MCA_BAJA = 'N'
WHERE COD_RAMO = 214
  AND COD_CAMPO = 'ACREED_PREND'
  AND NUM_SECU = 16;
*/
SELECT * FROM a2000020 WHERE num_secu_pol = 39745412968;

SELECT * FROM a2000020 WHERE num_secu_pol = 39745412969;

=== RESULTADO ===
Tiempo          : 46,98053 segundos
Op_Resultado    : 0
Op_NumPol1      : 1000171656901
Op_Numsecupol   : 39745413147
Op_NumEnd       : 0
=== VERIFICACION ===
SELECT * FROM a2010030 WHERE num_secu_pol = 39745413219;
SELECT * FROM a2010020 WHERE num_secu_pol = 39745413147 AND num_end = 0;
SELECT * FROM a2010040 WHERE num_secu_pol = 39745413147 AND num_end = 0;
SELECT * FROM x2000253 WHERE num_secu_pol = 39745413147;
=== FIN TEST JSON ===

SELECT * FROM a2010040 WHERE num_secu_pol = 39745413219;
SELECT * FROM a2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 39745413219;
SELECT * FROM x2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 39745413219;
SELECT * FROM a2010030 where cod_cia = 3 and COD_SECC = 4 and COD_RAMO = 450 order by FECHA_EMI desc;
SELECT * FROM a2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 29773564858;

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
where p.num_pol1 = 1020112679901
  and p.cod_secc = 4;

SELECT p.MCA_TIPO_COB, p.LETRA_COB, p.* FROM a2010040 p WHERE num_secu_pol = 39745413327;
---update a2010040 set LETRA_COB = 2 where num_secu_pol = 39745413020;

SELECT * FROM a2000040 WHERE SIM_FECHA_VIG_END is not null and  num_secu_pol = 39745413020;

SELECT cod_cob, sim_suma_aseg, sim_mca_capital
FROM a2000040
WHERE num_secu_pol = 39745413020;


select p.SIM_SISTEMA_ORIGEN, p.*
from a2010030 p
where COD_SECC = 4
  and COD_RAMO = 450
  --and SIM_SISTEMA_ORIGEN != 196
order by FECHA_EMI desc;

-----tabla de COTIZACIONES PRODUCTOS POLIZAS INDIVIDUALES
select * from c2990003;


SELECT * FROM a2000030 WHERE num_secu_pol = 39745413406;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745413406;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745413406;


SELECT * FROM a2000030 WHERE num_secu_pol in (39745413408);
SELECT * FROM a2000020 WHERE num_secu_pol = 39745413408;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745413408;

SELECT * FROM a2000030 WHERE num_secu_pol = 39745413409;
SELECT * FROM a2000020 WHERE num_secu_pol = 39745413409;
SELECT * FROM a2000040 WHERE num_secu_pol = 39745413409;

-- Por tipo de emisión (más recientes primero)
SELECT * FROM sim_Log_Webservices
 WHERE CODIGOWS LIKE 'emisionRC%' AND FECHA_INICIO >= TO_DATE('2026-04-01', 'YYYY-MM-DD')
 ORDER BY FECHA_INICIO DESC;
----mesajes logs sim_pck_errores.grabarLog
SELECT *
  FROM sim_log
 WHERE VARIABLE = 'log_cumplimiento_digital'
 ORDER BY fecha DESC
 FETCH FIRST 100 ROWS ONLY;
----IDENTIFICAR HORA BUSCAR LOGS
SELECT *
  FROM sim_log
 WHERE COLUMNA LIKE '%1000171659601%'
 ORDER BY fecha DESC
 FETCH FIRST 1000 ROWS ONLY;
----BUSCARLOGS EN ESE RANGO DE MINUTOS
SELECT *
  FROM sim_log
 WHERE VARIABLE = 'log_cumplimiento_digital'
 AND fecha >= TO_DATE('2026-04-01 17:13:00', 'YYYY-MM-DD HH24:MI:SS')
 AND fecha <= TO_DATE('2026-04-01 17:15:00', 'YYYY-MM-DD HH24:MI:SS')
 ORDER BY fecha DESC;

----IDENTIFICAR HORA BUSCAR LOGS
SELECT *
  FROM sim_log
 WHERE LLAVE LIKE '%39745414300%'
 ORDER BY fecha DESC
 FETCH FIRST 1000 ROWS ONLY;

SELECT ID_SIMLOGWS, CODIGOWS, TIPO_PROCESO, FECHA_INICIO, FECHA_FINAL,
       RESULTADO, ARREGLO_ERRORES, OBJETO_ENTRADA, OBJETO_SALIDA
  FROM sim_Log_Webservices
 WHERE ID_SIMLOGWS IN (36687575,36687576,36687577, 36687578)
 ORDER BY FECHA_INICIO ASC;


SELECT * FROM a2000030 WHERE NUM_POL_FLOT = 1000171659601;

SELECT * FROM a2000030 WHERE NUM_SECU_POL = 39745414300;

SELECT * FROM a2000020 WHERE NUM_SECU_POL = 39745412780;

SELECT e.cod_end,
             e.sub_cod_end,
             e.tipo_end,
             e.descripcion,
             e.aplica_pol_ppal,
             e.mca_vig_endoso,
             e.mca_mod_ries,
             e.mca_inc_cob
        FROM sim_codigos_endoso_seccion e
       WHERE e.cod_cia  = 3
         AND e.cod_secc = 4
         AND NVL(e.mca_baja, 'N') = 'N'
         -- Excluir endosos exentos para el ramo
         AND NOT EXISTS (
               SELECT 1
                 FROM sim_endosos_exentosxprodto x
                WHERE x.cod_cia      = e.cod_cia
                  AND x.cod_secc     = e.cod_secc
                  AND x.cod_end      = e.cod_end
                  AND x.sub_cod_end  = e.sub_cod_end
                  AND x.cod_ramo     = 450
                  AND NVL(x.mca_baja, 'N') = 'N'
         )

       ORDER BY e.cod_end, e.sub_cod_end;

select *
from sim_endosos_seccion_usu
where COD_CIA = 3
  and COD_SECC = 4;
  --and COD_END = 445;

  SELECT * FROM a2000030 WHERE NUM_pol_FLOT = 1020112679401;
  SELECT * FROM a2000020 WHERE NUM_SECU_POL = 39745412717;


select r.REGLA_COMPLETA, r.* from creglas r where CDREG IN ('204PTV413','204GCU010');


SELECT * FROM SIM_CU_GRAN_BENEF_TASAS_RC;

----SINONIMOS QUE FALTABAN EN DESA
-- auto-generated definition
--create public synonym SIM_CU_GRAN_BENEF_TASAS_RC for OPS$PUMA.SIM_CU_GRAN_BENEF_TASAS_RC
--/
-- auto-generated definition
--create public synonym SIM_CU_PCK_GRAN_BENEF_EMIS for OPS$PUMA.SIM_CU_PCK_GRAN_BENEF_EMIS
---/

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


