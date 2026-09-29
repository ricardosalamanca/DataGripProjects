SELECT * FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010001443301, 5010001443302);


SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL)
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 10220059
  AND TRUNC(SNA_FCHA_SNSTRO) = TO_DATE('01/10/2023', 'DD/MM/YYYY') --P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;


-------SINESTROS SAI-----
select * from ADMSISA.AVSOS_SNSTROS where SNA_NMRO_ITEM = 7576519

select *
from avsos_snstros a
where a.sna_nmro_item = 10038181;

select * from estdos_snstros e
where e.esn_nmro_slctud = 7678063
  and e.esn_fcha_snstro = to_date('01/11/2023','dd/mm/yyyy');

select *
from dscpcnes_efctdas d
where d.dse_nmro_snstro in ( 2023084533, 2023105493,2023105727) ;


select *
from ddas_vgntes_arrndmntos d
where d.dva_nmro_slctud = 7678063
  and d.dva_fcha_mra =   to_date('01/09/2023','dd/mm/yyyy');

-----Para buscar siniestros terminados que tienen fecha de desocupación y están vigentes en el seguro:
select *
from avsos_snstros a, ddas_vgntes_arrndmntos d
where a.sna_estdo_snstro = '03'
  and a.sna_estdo_pgo='02'
  and a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  and d.dva_fcha_dscpcion is not null
  and a.sna_nmro_plza <999
  and a.sna_fcha_snstro >= to_date('01/01/2023','dd/mm/yyyy')
  and exists (select *
              from rsgos_vgntes r
              where r.rvi_nmro_item =a.sna_nmro_item);


SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL),SNA_FCHA_SNSTRO
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 10220059
  --AND SNA_FCHA_SNSTRO = P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;

julio/10/2023

-----PATRIMONN3-309 ----------------
SELECT *
FROM POLIZAS_SIMON
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_RAMO = 486
  AND POLIZA_SIMON in (5010001443301,5010001443302)
  AND ESTADO_CARGUE_SIMON = 'C' -- LISTO PARA PASAR A SAI
  AND ESTADO_CARGUE_SAI IS NULL;

update POLIZAS_SIMON
set ESTADO_CARGUE_SAI = NULL
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_RAMO = 486
  AND POLIZA_SIMON in (5010001443301, 5010001443302)
  AND SECUENCIA IN (19745)
  AND ESTADO_CARGUE_SIMON = 'C'


select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010001443302%';

select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010001443301%';

SELECT P.SECUENCIA,
       P.ESTADO_CARGUE_SAI
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON IN ('C','A')
  AND P.ESTADO_CARGUE_SAI IS NOT NULL
  AND P.POLIZA_SIMON LIKE SUBSTR('5010001443301', 1, LENGTH(TO_CHAR('5010001443301')) - 2) || '%'
  AND P.FECHA_CREACION IN ( SELECT MAX(A.FECHA_CREACION)
                            FROM POLIZAS_SIMON A
                            WHERE A.COD_CIA = 3
                              AND A.COD_SECC = 37
                              AND A.COD_RAMO = 486
                              AND A.ESTADO_CARGUE_SIMON IN ('C','A')
                              AND A.ESTADO_CARGUE_SAI IS NOT NULL
                              AND A.POLIZA_SIMON LIKE SUBSTR('5010001443301', 1, LENGTH(TO_CHAR('5010001443301')) - 2) || '%');

-----------------PATRIMONN3-309 fin -------------------
-----------------ESTCORE-10066-------------------------
--AJQSAI CB700005
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE COD_RAMO = 486 AND NUM_POL1 = 5010000536206;
select *
from avsos_snstros a
where a.SNA_NMRO_SNSTRO = 10038181;

select * from SIM_CARGA_ERRORES where secuencia_origen = 108517;


SELECT * FROM SINIESTROS_CARGUE_SIMON;

-------SIM_CARGA_SINIESTROS--------------------------------------------------------
SELECT *
FROM SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN ( 5010001410602, 5010001586302);
-----PRC_CARGUE_SINIESTROS_SIMON.PKG_INDEMNIZACION
-------------SIM_CARGA_ERRORES SIM_CARGA_SINIESTROS--------------------------------------------------------------------------
select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SECUENCIA
                           FROM SIM_CARGA_SINIESTROS
                           WHERE NUM_POL1 IN ( 5010001410602, 5010001586302));
select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SEC_CONTROL
                           FROM SIM_CARGA_LIQUIDACIONES
                           WHERE NUM_POL1 IN ( 5010001410602, 5010001586302));
------------SIM_CARGA_ERRORES SIM_CARGA_SINIESTROS---------------------------------------------------------------------------
------ FIN SIM_CARGA_SINIESTROS------------------------------------------------------------
---------------------------------------------------------------------
------SIM_CARGA_VAR_SINIESTROS------------------------------------------------------------
SELECT *
FROM SIM_CARGA_VAR_SINIESTROS
WHERE NUM_POL1 IN (5010001410602, 5010001586302);
-------------SIM_CARGA_ERRORES SIM_CARGA_VAR_SINIESTROS--------------------------------------------------------------------------
select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SECUENCIA_CAR_SINI
                           FROM SIM_CARGA_VAR_SINIESTROS
                           WHERE NUM_POL1 IN ( 5010001410602, 5010001586302));
------------SIM_CARGA_ERRORES SIM_CARGA_VAR_SINIESTROS---------------------------------------------------------------------------
------ FIN SIM_CARGA_VAR_SINIESTROS------------------------------------------------------------

SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE NUM_POL1 IN (5010000536206, 5010001097503, 5010001410602, 5010001586302);

SELECT *
FROM SIM_CARGA_LIQUIDACIONES_HI
WHERE NUM_POL1 IN (5010001410602, 5010001586302);

SELECT * FROM SIM_CARGA_SINIESTROS_HI;

select *
from SIM_CARGA_ERRORES_HI
where secuencia_origen IN (1910795);

/*
1.SINIESTROS_CARGUE_SIMON
2.SIM_CARGA_SINIESTROS
3.SIM_CARGA_VAR_SINIESTROS
4.SIM_CARGA_EXPEDIENTES
5.SIM_CARGA_LIQUIDACIONES
6.SIM_CARGA_RESERVAS
7.PGOS_EFCTDOS_SNSTROS
*/

select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SECUENCIA
                           FROM SIM_CARGA_LIQUIDACIONES
                           WHERE NUM_POL1 IN (5010000536206, 5010001097503, 5010001410602, 5010001586302));

select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SECUENCIA_CAR_SINI
                           FROM SIM_CARGA_LIQUIDACIONES
                           WHERE NUM_POL1 IN (5010000536206, 5010001097503, 5010001410602, 5010001586302));
select * from LQDCNES;
select * from LQDCNES_DTLLE;
select * from VLRES_LQDCION;

select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (SELECT SECUENCIA_CAR_EXPE
                           FROM SIM_CARGA_LIQUIDACIONES
                           WHERE NUM_POL1 IN (5010000536206, 5010001097503, 5010001410602, 5010001586302));


SELECT (V.VLQ_VLOR * D.LQT_NMRO_DIAS) TOTAL,
       L.*, D.*, V.*
       --VLQ_ORGEN,LQD_NMRO_SLCTUD, LQD_TPO_LQDCION, LQD_PRDO, LQD_FCHA_PGO, LQD_FCHA_MDFCCION, LQT_FCHA_DSDE, LQT_FCHA_HSTA, LQT_NMRO_DIAS, VLQ_VLOR, LQT_ESTDO_LQDCION, LQT_FCHA_MRA, LQT_NMRO_SNSTRO, VLQ_ORGEN, VLQ_DSCRPCION
FROM    LQDCNES       L
   ,LQDCNES_DTLLE D
   ,VLRES_LQDCION V
WHERE   L.LQD_NMRO_SLCTUD = D.LQT_NMRO_SLCTUD
  AND L.LQD_TPO_LQDCION = D.LQT_TPO_LQDCION
  --AND L.LQD_PRDO IN ('032024')
  AND L.LQD_PRDO = D.LQT_PRDO
  AND D.LQT_NMRO_SLCTUD = V.VLQ_NMRO_SLCTUD
  AND D.LQT_TPO_LQDCION = V.VLQ_TPO_LQDCION
  AND D.LQT_PRDO = V.VLQ_PRDO
  AND D.LQT_SERIE = V.VLQ_SERIE
  AND D.LQT_NMRO_SNSTRO = 2023114969
  AND L.LQD_NMRO_SLCTUD IN (
    7298133
    )
ORDER BY LQD_FCHA_PGO, LQT_NMRO_SNSTRO ASC;

SELECT * FROM PLZAS WHERE POL_NMRO_PLZA = 11003;

SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_POLIZA_SIMON IN (5010001410602, 5010001586302, 5010000536206)
  AND PES_FCHA_PGO IN (TO_DATE('06-01-2024'), TO_DATE('02-03-2024'));

select *
from pgos_efctdos_snstros p
where p.pes_nmro_snstro IN (2024009922,2024009927,2024030191);

SELECT e.*, d.*, p.*
FROM admsisa.errores_proceso_batch    e,
     admsisa.detalle_procesos_batch   d,
     admsisa.Parametros_Proceso_Batch p
WHERE e.erp_dpb_ejecucion = d.dpb_ejecucion
  AND e.erp_dpb_ejecucion = p.prp_dpb_ejecucion
  AND d.dpb_objeto = 'PRC_EXPEDICION_SIMON'
  AND e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  AND e.erp_fecha_crea BETWEEN TO_DATE('25/01/2024', 'DD/MM/YYYY') AND
    TO_DATE('27/01/2024', 'DD/MM/YYYY')
  AND e.erp_error like '%5010001410602%'
order by e.erp_fecha_crea desc;

SELECT S.*, A.*
FROM SINIESTROS_CARGUE_SIMON S, AVSOS_SNSTROS A
WHERE S.COD_CIA = 3
  AND S.COD_SECC= 37
  AND S.COD_RAMO = 486
  AND S.SOLICITUD = A.SNA_NMRO_ITEM
  AND S.FECHA_MORA= A.SNA_FCHA_SNSTRO
-- AND A.SNA_NMRO_SNSTRO IN (
--     2022055579,
--     2022055502
-- )
  AND A.SNA_NMRO_ITEM IN (
    10184065
    )
  AND S.FECHA_PAGO >= TO_DATE('01/01/2024','DD/MM/YYYY');

SELECT (V.VLQ_VLOR * D.LQT_NMRO_DIAS) TOTAL,
       --L.*, D.*, V.*, A.*--,
       LQD_NMRO_SLCTUD, LQD_TPO_LQDCION, LQD_PRDO, LQD_FCHA_PGO, LQT_SERIE, LQT_FCHA_DSDE, LQT_FCHA_HSTA, LQT_NMRO_DIAS, LQT_ESTDO_LQDCION, LQT_FCHA_MRA, LQT_NMRO_SNSTRO, VLQ_SERIE, VLQ_RAM_CDGO, VLQ_CDGO_AMPRO, VLQ_CNCPTO_VLOR, VLQ_VLOR, VLQ_VLOR_ORGNAL, VLQ_ORGEN, VLQ_DSCRPCION, SNA_NMRO_ITEM, SNA_NMRO_SNSTRO, SNA_CAUSA_SNSTRO, SNA_NMRO_PLZA, SNA_FCHA_AVSO, SNA_FCHA_SNSTRO, SNA_ESTDO_SNSTRO, SNA_ESTDO_PGO, SNA_FCHA_ESTDO, SNA_SNSTRO_SIMON, SNA_POLIZA_SIMON
       --DECODE(VLQ_ORGEN, 'V', 'V - Devolucion De Contratos', 'R', 'R - Recibo De Caja', 'O', 'O - Orden De Pago', 'N', 'N - Cruce Por Factura Negativa', 'J', 'J - Ajuste De Siniestro', 'G', 'G - Generación Siniestro', 'E', 'E - Reintegro', 'D', 'D - Desocupación De Contrato', 'C', 'C - Cobranza', 'A', 'A - Aumento De Valor', VLQ_ORGEN) ORIGEN
       --,LQD_NMRO_SLCTUD, LQD_TPO_LQDCION, LQD_PRDO, LQD_FCHA_PGO, LQD_FCHA_MDFCCION, LQT_FCHA_DSDE, LQT_FCHA_HSTA, LQT_NMRO_DIAS, VLQ_VLOR, LQT_ESTDO_LQDCION, LQT_FCHA_MRA, LQT_NMRO_SNSTRO, VLQ_ORGEN, VLQ_DSCRPCION
FROM    LQDCNES       L
   ,LQDCNES_DTLLE D
   ,VLRES_LQDCION V
   , AVSOS_SNSTROS A
WHERE   L.LQD_NMRO_SLCTUD = D.LQT_NMRO_SLCTUD
  AND L.LQD_TPO_LQDCION = D.LQT_TPO_LQDCION
  --AND L.LQD_PRDO IN ('042024')
  AND L.LQD_PRDO = D.LQT_PRDO
  AND D.LQT_NMRO_SLCTUD = V.VLQ_NMRO_SLCTUD
  AND D.LQT_TPO_LQDCION = V.VLQ_TPO_LQDCION
  AND D.LQT_PRDO = V.VLQ_PRDO
  AND D.LQT_SERIE = V.VLQ_SERIE
  AND A.SNA_NMRO_SNSTRO = D.LQT_NMRO_SNSTRO
  AND A.SNA_NMRO_ITEM = D.LQT_NMRO_SLCTUD
  --AND VLQ_CNCPTO_VLOR in ('01', '02')
  --AND V.VLQ_CDGO_AMPRO IN ('01', '08')
  --AND LQT_ESTDO_LQDCION = '01' -- vigente
  --AND LQD_TPO_LQDCION = '04'
  --AND VLQ_ORGEN= 'G'
  --AND D.LQT_NMRO_SNSTRO = 2024034487
  AND L.LQD_NMRO_SLCTUD IN ( 10184065 )
ORDER BY LQD_FCHA_PGO, LQT_NMRO_SNSTRO ASC;

---ESTADOS SINIESTROS
select * from ADMSISA.CG_REF_CODES where rv_domain = 'ESTADO_SINIESTRO';
select * from ADMSISA.CG_REF_CODES where rv_domain = 'ESTADO_SINIESPAGO';

SELECT * FROM CG_REF_CODES
WHERE RV_DOMAIN='ESTADO_SINIESTRO';

SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN = 'ESTADO_DEUDA';
---ESTADOS liquidacion
SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like 'ESTADO_LIQUIDACION';

SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like '%LIQ%';


----codigos de cobertura
select * from vlres_prdcto;

select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (1910795, 1725506, 2014751, 1505957, 1737309);


select  * from SIM_CARGA_SINIESTROS
WHERE SECUENCIA IN (1511738);

select * from datos_contratos where solicitud = 10500017;


SELECT A.RVL_CNCPTO_VLOR CONCEPTO
FROM RSGOS_VGNTES_AVLOR A
WHERE A.RVL_NMRO_ITEM = 10500017
  AND A.RVL_CDGO_AMPRO = '01';


SELECT MAX(SECUENCIA_HISTORICO)
FROM DATOS_CONTRATOS_HISTORICO D
WHERE D.SOLICITUD = 10500017;


SELECT *
FROM DATOS_CONTRATOS_HISTORICO D
WHERE D.SOLICITUD = 10500017;


SELECT A.APR_CDGO_AMPRO, A.APR_TPO_AMPRO
FROM AMPROS_PRDCTO A
WHERE A.APR_RAM_CDGO = 12
  AND A.APR_CDGO_AMPRO LIKE '%'
ORDER BY 1;

/*
DELETE datos_contratos
WHERE secuencia_contrato = 880953
  AND solicitud = 10500017
  AND poliza = 14001;

UPDATE datos_contratos_historico
SET tipo_aumento_canon = 1
WHERE secuencia_historico = (SELECT MAX(SECUENCIA_HISTORICO)
                             FROM DATOS_CONTRATOS_HISTORICO D
                             WHERE D.SOLICITUD = 10500017)
  AND solicitud = 10500017
  AND poliza = 14001;

insert into datos_contratos
values (SEQ_CONTRATOS.NEXTVAL, 10500017, 14001, '00', '12', to_date('01/06/2023', 'dd/mm/yyyy'), 12, 12, 10294333, '1',
        100, user, sysdate, 0, 0, 0, null, null, null, null, null);

 */


select a.sna_nmro_item, a.sna_fcha_snstro
from avsos_snstros a
where a.sna_estdo_snstro = '02'
  and a.sna_estdo_pgo = '02'
  and a.sna_fcha_snstro > to_date('01/01/2022', 'dd/mm/yyyy')
  and a.sna_nmro_plza < 999
  and not exists(select *
                 from rsgos_vgntes r
                 where r.RVI_NMRO_ITEM = a.SNA_NMRO_ITEM)
  and exists(select *
             from RSGOS_RCBOS_NVDAD n
             where n.ren_nmro_item = a.sna_nmro_item
               and n.ren_tpo_nvdad = '02'
               and n.ren_cdgo_ampro = '01');

select a.sna_estdo_pgo , a.*
from avsos_snstros a
WHERE a.sna_nmro_snstro = 2024033360;

select  t.lqt_nmro_dias,
    t.lqt_fcha_hsta
from lqdcnes_dtlle t
WHERE t.lqt_nmro_slctud = 10454198
  AND t.lqt_prdo = '042024';


select *
from avsos_snstros a
where a.sna_estdo_snstro ='02'
  and a.sna_estdo_pgo ='02'
  and a.sna_fcha_snstro >= to_date('01/12/2023','dd/mm/yyyy')
  and not exists (select *
                  from rsgos_vgntes r
                  where r.rvi_nmro_item = a.sna_nmro_item)
  and exists (select *
              from rsgos_rcbos_nvdad n
              where n.ren_nmro_item= a.sna_nmro_item
                and n.ren_cdgo_ampro='01'
                and n.ren_tpo_nvdad='02'
                and n.ren_fcha_nvdad >= to_date('01/10/2023','dd/mm/yyyy'));


select * from vlres_lqdcion where VLQ_NMRO_SLCTUD = 10454198 and VLQ_PRDO = '042024';
select * from lqdcnes_dtlle where lqt_nmro_slctud  = 10454198 and lqt_prdo  = '042024';
select * from lqdcnes where LQD_NMRO_SLCTUD   = 10454198 and LQD_PRDO   = '042024';

select * from lqdcnes where LQD_NMRO_SLCTUD   = 10261454;
select * from lqdcnes_dtlle where lqt_nmro_slctud  = 10261454;
select * from vlres_lqdcion where VLQ_NMRO_SLCTUD = 10261454;

SELECT * FROM avsos_snstros WHERE sna_nmro_snstro = 2024033360;
/*
UPDATE avsos_snstros s
SET s.sna_estdo_pgo = '02'
WHERE s.sna_nmro_snstro = 2024033360;

delete vlres_lqdcion where VLQ_NMRO_SLCTUD = 10454198 and VLQ_PRDO = '042024';
delete lqdcnes_dtlle where lqt_nmro_slctud  = 10454198 and lqt_prdo  = '042024';
delete lqdcnes where LQD_NMRO_SLCTUD   = 10454198 and LQD_PRDO   = '042024';
 */

select *
from RSGOS_RCBOS
where RIR_NMRO_ITEM in (7297741, 7335477);

select * from RSGOS_RCBOS_NVLOR where RNV_NMRO_ITEM in (7297741, 7335477);

SELECT *
FROM AUDTRIAS_SLCTDES
WHERE SLC_NMRO_SLCTUD in (7297741, 7335477);

SELECT *
FROM rsgos_vgntes r
where r.RVI_NMRO_ITEM in (7297741, 7335477);
SELECT *
FROM RASEGURADOS r
where r.solicitud in (7297741, 7335477);

SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in (7297741, 7335477);

SELECT RCN_TPO_CDGO, RCN_DSCRPCION
FROM RCHZOS_NVDDES
WHERE RCN_CDGO = 6
  AND RCN_RAM_CDGO = 12;

SELECT DVA.DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS DVA
WHERE DVA.DVA_NMRO_SLCTUD = 10454198
  AND DVA.DVA_ESTDO = '01'
  AND EXISTS (SELECT * FROM AVSOS_SNSTROS
              WHERE SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
                AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA);

/*
INSERT INTO SLCTDES_ESTDIOS (SES_NMRO, SES_NMRO_PLZA, SES_CLSE_PLZA, SES_RAM_CDGO, SES_FCHA_INGRSO,
                                     SES_TPO_SLCTUD, SES_DSTNO_INMBLE, SES_TPO_INMBLE, SES_CNON_ARRNDMNTO,
                                     SES_CTA_ADMNSTRCION, SES_CDGO_ANLSTA, SES_VLR_ESTDIO, SES_NMRO_ESTDIOS_RLZDOS,
                                     SES_FCHA_LMTE_RSLTDO, SES_FCHA_ULTMO_RSLTDO, SES_USRIO, SES_FCHA_ACTLZCION,
                                     SES_CLFCACCION_GLBAL, SES_VLOR_DESCTO, SES_PGO_PGDO, SES_USRIO_DESC,
                                     SES_VLOR_FCTRA, SES_DEUDA, SES_SUC_CDGO, SES_TPO_IDNTFCCION, SES_NMRO_IDNTFCCION,
                                     SES_LMTE_CBRTRA, SES_LMTE_INDMNZCON, SES_PUNTO_ATENCION, SES_UAR, SES_ESTRATEGIA,
                                     SES_SISTEMA_ORIGEN)
VALUES (7576519, 13519, '00', '12', TO_DATE('2024-05-29 11:44:38', 'YYYY-MM-DD HH24:MI:SS'), 'ES', 'V', 'A',
        2000000.000, 0.00, '99', 119000.00, 1, TO_DATE('2024-05-30', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2024-05-30', 'YYYY-MM-DD HH24:MI:SS'), 'ANALISIS_WEB', TO_DATE('2024-05-30', 'YYYY-MM-DD HH24:MI:SS'),
        null, 0, 0.00, null, null, 'N', '2501', null, null, 0, 0, '01', null, null, 'W');
*/

SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in (11140736);

------verificacion de solicitudes borradas sin - haber retirado el seguro
SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in (10092364, 7576519 ); --SES_FCHA_INGRSO > to_date('01/10/2023','dd/mm/yyyy'); --SES_NMRO in (10092364, 7576519 );
SELECT * FROM AUDTRIAS_SLCTDES WHERE SLC_NMRO_SLCTUD in ( 7576519 )  ;

-- DATOS ASEGURAMIENTO
SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 7576519;

SELECT * FROM RSGOS_VGNTES_NITS WHERE RVN_NMRO_ITEM = 7576519;
select * from ddas_arrndtrios where DAR_NMRO_SLCTUD = 7576519;

select * from arrndtrios where ARR_SES_NMRO = 7576519;

SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_VLRES where RVV_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_AMPRO where RVA_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_AVLOR where RVL_NMRO_ITEM = 10242376;



SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 10092364;

SELECT * FROM RSGOS_VGNTES_NITS WHERE RVN_NMRO_ITEM = 10092364;
select * from ddas_arrndtrios where DAR_NMRO_SLCTUD = 10092364;

select * from arrndtrios where ARR_SES_NMRO = 10092364;

select * from RSGOS_VGNTES_VLRES where RVV_NMRO_ITEM = 10092364;
select * from RSGOS_VGNTES_AMPRO where RVA_NMRO_ITEM = 10092364;
select * from RSGOS_VGNTES_AVLOR where RVL_NMRO_ITEM = 7576519;


--RSGOS_VGNTES_NVDDES
--RSGOS_VGNTES_NVLOR 10092364,
SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in ( 7576519 );

SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in ( 10092364 );
--RSGOS_VGNTES_NITS

-- DATOS RETIRADOS DEL SEGURO
--RSGOS_RCBOS
--RSGOS_RCBOS_VLRES

--RSGOS_RCBOS_AMPRO
--RSGOS_RCBOS_AVLOR

--RSGOS_RCBOS_NVDDES
--RSGOS_RCBOS_NVLOR

--RSGOS_RCBOS_NITS



-----verificacion creacion personas naturales y juridicas
SELECT * FROM PRSNAS where PRS_NMRO_IDNTFCCION = 830501488;
--NATURALES
--JURIDICOS
SELECT * FROM PRSNAS where PRS_NMRO_IDNTFCCION = 860512840;


select * from AVSOS_SNSTROS where SNA_NMRO_ITEM = 10092364;

UPDATE AVSOS_SNSTROS
SET SNA_ESTDO_SNSTRO ='03',
    SNA_ESTDO_PGO    = '02'
where SNA_NMRO_ITEM = 10092364;



select * from DDAS_VGNTES_ARRNDMNTOS where DVA_NMRO_SLCTUD = 10092364;

DVA_ESTDO ='02'

SELECT *
FROM V_TIPO_INMUEBLE
WHERE VALOR = '';

SELECT COUNT(9)
FROM V_TIPO_INMUEBLE
WHERE VALOR = 'V';

SELECT * FROM PLZAS where POL_NMRO_PLZA = 1993;

select * from rsgos_rcbos WHERE RIR_NMRO_ITEM = 7741371;

SELECT SES_NMRO_PLZA,
       SES_DSTNO_INMBLE,
       SES_TPO_INMBLE,
       PK_TERCEROS.F_NOMBRES(ARR_NMRO_IDNTFCCION,ARR_TPO_IDNTFCCION)ARR_NMBRE,
       SES_CNON_ARRNDMNTO,
       SES_CTA_ADMNSTRCION,
       ARR_NMRO_IDNTFCCION,
       ARR_TPO_IDNTFCCION,
       SES_LMTE_CBRTRA,    -- ACTUALIZACION LIMITES DE COBERTURA E INDEMNIZACION
       SES_LMTE_INDMNZCON,  -- JRIO 16/11/2017
    /* Req. 17094 */
       -- INICIO
       SES_ESTRATEGIA
       -- FIN
FROM SLCTDES_ESTDIOS, DIRECCIONES, ARRNDTRIOS
WHERE SES_NMRO = ARR_SES_NMRO
  AND SES_CLSE_PLZA = '00'
  AND SES_TPO_SLCTUD != 'PR'
  AND ARR_NMRO_SLCTUD = 7576519
  AND DI_SOLICITUD = SES_NMRO
  AND DI_TPO_DRCCION = 'E';

select * from DIRECCIONES where DI_SOLICITUD = 7576519;

select * from DIRECCIONES where DI_SOLICITUD = 5316165;

select * from ARRNDTRIOS where ARR_NMRO_SLCTUD = 7576519;

---Query para obtener errores de la interfaz de siniestros
SELECT * FROM SIM_CARGA_ERRORES WHERE SECUENCIA_ORIGEN = 0; -- (SECUENCIA DE CADA TABLA SIM_CARGA)


---SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in (11140736);
--- SI HAY ERROR VERIFICAR EN PKG_OPERACION_SIMON
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022882%';


SELECT F1.FORMA_GIRO_GENERAL
FROM FCHAS_PGO F1
WHERE F1.FPG_ESTDO = 'V'
  AND F1.MARCA_CIERRE_OPRCION = 'S';

SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_ESTDO = 'V'
  AND F1.MARCA_CIERRE_OPRCION = 'S'
  AND F1.TIPO_CIERRE = 'A'
  AND F1.FPG_FCHA_PGO = (SELECT MAX(F1.FPG_FCHA_PGO)
                         FROM FCHAS_PGO F1
                         WHERE F1.FPG_ESTDO = 'V'
                           AND F1.MARCA_CIERRE_OPRCION = 'S'
                           AND F1.TIPO_CIERRE = 'A');

SELECT * FROM INFO_POLIZAS where clave is not null ;

SELECT * FROM PLZAS where POL_NMRO_PLZA = 144779;

SELECT * FROM PLZAS where POL_POLIZA_SIMON = 5010002075302;

select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%ORA-01422%';
  --and e.erp_error like '%PRC_EXPEDICION_POLIZA%';

---RIVN_TPO_NVDAD = '01'->es ingreso ''
select * from RSGOS_VGNTES_NVDDES where RIVN_NMRO_ITEM = 7728756;
select * from RSGOS_VGNTES_AVLOR where RVL_NMRO_ITEM = 7728756;
select *
from rsgos_vgntes_nvddes r
where r.rivn_nmro_item = 7728756;
select *
from rsgos_vgntes_avlor a
where a.rvl_nmro_item = 7728756;
---ORGSNVDDES

select * from AVSOS_SNSTROS where SNA_NMRO_ITEM = 7741371;

update AVSOS_SNSTROS
set SNA_SNSTRO_SIMON = 50100002585
where SNA_NMRO_ITEM = 7741371;

update AVSOS_SNSTROS
set SNA_SNSTRO_SIMON = 50100002604
where SNA_NMRO_ITEM = 7741371;


UPDATE USRIOS
SET EMAIL = 'dayana.toro@segurosbolivar.com'
WHERE USR_CDGO_USRIO = '1144190847';

SELECT USR_NMBRE NOMBRE,EMAIL, RUS_CDGO_ROL, USRIOS.*
FROM ROLES_USRIOS,USRIOS
WHERE RUS_CDGO_ROL = '9'
  AND RUS_CDGO_USRIO = USR_CDGO_USRIO
  AND USR_ESTDO = 'V'
  AND EMAIL IS NOT NULL;

--karen.molano@segurosbolivar.com,sergio.monroy@segurosbolivar.com,annie.lopez@segurosbolivar.com,
--sadith.nunez@segurosbolivar.com
SELECT DISTINCT USR_ESTDO FROM USRIOS GROUP BY USR_ESTDO;

UPDATE USRIOS
SET EMAIL = 'karen.molano@segurosbolivar.com'
WHERE USR_CDGO_USRIO = '1031171289';

UPDATE USRIOS
SET EMAIL = 'sergio.monroy@segurosbolivar.com'
WHERE USR_CDGO_USRIO = '1020814388';

UPDATE USRIOS
SET EMAIL = 'annie.lopez@segurosbolivar.com'
WHERE USR_CDGO_USRIO = '1048280814';

UPDATE USRIOS
SET EMAIL = null
WHERE USR_CDGO_USRIO in ('1031171289','1020814388','1048280814');

UPDATE USRIOS
SET EMAIL = 'sadith.nunez@segurosbolivar.com'
WHERE USR_CDGO_USRIO in
      ('admsisa');


SELECT * FROM USRIOS WHERE USR_CDGO_USRIO = '1045679950';

select * from RSGOS_VGNTES_VLRES where RVV_NMRO_ITEM in (11527069);
select * from RSGOS_VGNTES_AVLOR where RVL_NMRO_ITEM in (7728756);

select *
from VLRES_AMPRO_PRDCTO
where VAR_RAM_CDGO = '12'
  and VAR_CDGO_AMPRO = '08'
  and VAR_CNCPTO_VLOR = '07';

select *
from VLRES_AMPRO_PRDCTO
where VAR_CNCPTO_VLOR = '07';

INSERT INTO VLRES_AMPRO_PRDCTO (VAR_RAM_CDGO, VAR_CDGO_AMPRO, VAR_CNCPTO_VLOR, VAR_USRIO, VAR_FCHA_MDFCCION,
                                VAR_INCLUIR_CRTLA, VAR_TXTO_LMTE_CBRTRA)
VALUES ('12', '08', '07', 'sisfpv', DATE '2024-12-05', 'N', null);


DELETE FROM RSGOS_VGNTES_AVLOR
WHERE RVL_CDGO_AMPRO = '08'
  AND RVL_RAM_CDGO = '12'
  AND RVL_NMRO_ITEM = 7728756
  AND RVL_NMRO_PLZA = 11147
  AND RVL_CLSE_PLZA = '00'
  AND RVL_CNCPTO_VLOR = '07';


DELETE FROM VLRES_AMPRO_PRDCTO
WHERE VAR_RAM_CDGO = '12'
  AND VAR_CDGO_AMPRO = '08'
  AND VAR_CNCPTO_VLOR = '07'
  AND VAR_USRIO = 'sisfpv';

SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_PLZA = 148898
SELECT * FROM PGOS_EFCTDOS_SNSTROS WHERE PES_NMRO_SNSTRO = 50100003129

SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 11527069
  AND PES_FCHA_PGO = TO_DATE('22/12/2025','DD/MM/YYYY')
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-DIC-25', 'DD-MON-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('22-DIC-25'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('22-DIC-25'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-DIC-25', 'DD-MON-YYYY');

SELECT PAR_RFRNCIA FROM PRMTROS WHERE PAR_DSCRPCION='USER_CARGUE_SIMON';

UPDATE AVSOS_SNSTROS
    SET SNA_NMRO_SNSTRO = 2023084058
WHERE SNA_NMRO_ITEM = 7611096;

SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_ITEM = 7611096;


SELECT * FROM PGOS_EFCTDOS_SNSTROS WHERE PES_NMRO_SNSTRO IN (2023084058, 2024091419);



select a.sna_nmro_item, a.sna_fcha_snstro, a.sna_estdo_snstro, a.sna_estdo_pgo
from avsos_snstros a
where a.sna_nmro_item =  6463728
  and a.sna_fcha_snstro = to_date('01/07/2024','dd/mm/yyyy');
select *
from cntrtos_dvlver c
where c.cnd_nmro_snstro = 2024077397;
select *
from rvrsnes_snstros r
where r.rvs_nmro_snstro = 2024077397;
select d.ddp_cncpto, d.ddp_vlor_dda, d.ddp_vlor_pgdo, d.ddp_orgen, d.ddp_fcha_dsde, d.ddp_fcha_hsta, d.DDP_SERIE
from ddas_plzas d
where d.ddp_nmro_slctud  =6463728
  and d.ddp_fcha_mra = to_date('01/07/2024','dd/mm/yyyy');

--query de consulta a ls tablas de logs de sai que se llaman procesos batch
select  distinct REPLACE(substr(e.erp_error,1,500), CHR(10), '-') , d.DPB_OBJETO,e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso,  e.erp_fecha_crea,p.prp_nombre_param, p.prp_valor
from errores_proceso_batch e, detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and d.dpb_objeto != 'PRC_EXPEDICION_SIMON'
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and e.erp_fecha_crea >= TO_DATE('25062023', 'DDMMYYYY');

SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('21-11-24', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('21-NOV-24'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('21-11-24'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (SELECT SNV_NMRO_SNSTRO
                          FROM SNSTROS_NUEVOS
                          WHERE SNV_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY')
                            )
  AND PES_NMRO_SNSTRO IN (2025071710, 2025067887);
select * from PGOS_EFCTDOS_SNSTROS;
SELECT COUNT(*) as CANDIDATOS
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND PES_FCHA_PGO = TO_DATE('20-08-2024', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (2023083953, 2024030191);

SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY')
  --AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);

select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/08/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';

SELECT * FROM SIM_CARGA_SINIESTROS WHERE FECHA_CREACION >= TO_DATE('16/09/2025','DD/MM/YYYY');
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE NUM_SINI IN (2025071710, 2025067887);

SELECT * from LMTES_IND_RSGOS;

UPDATE SLCTDES_ESTDIOS
SET  SES_NMRO_PLZA = 141283
WHERE SES_NMRO = 10685318;

UPDATE SLCTDES_ESTDIOS
SET  SES_NMRO_PLZA = 144782
WHERE SES_NMRO = 11070017;

SELECT * FROM vlres_ddas;

SELECT * FROM V_ABRESTDCUENTASTT  WHERE EST_SLCTUD = 10408468
                                         AND EST_FCHA_MRA = to_date('01/06/2024','dd/mm/yyyy')
                                         AND EST_CRTRIO_CNSLTA IN ('S')
                                         AND EST_ESTADO LIKE 'PAGADO%'
                                         AND EST_PRDO NOT LIKE 'LIQUIDAC%';
/*
UPDATE USRIOS
SET EMAIL = 'eliana.julio@segurosbolivar.com'
WHERE USR_CDGO_USRIO = '1045679950'
  AND EMAIL IS NULL;
*/

select * from USRIOS WHERE USR_CDGO_USRIO = '4388573';
SELECT *
FROM RSLTDO_ESTDIO
where RET_CDGO_RSLTDO = '58'
  and RET_FCHA_RSLTDO >= TO_DATE('01-01-2024', 'DD-MM-YYYY');

select * from CDGOS_RSLTDS where CRE_CDGO = '58';

select * from SCRSL;

select *
from AVSOS_SNSTROS,
     cntrtos_dvlver
where SNA_NMRO_ITEM = 10408468
  and CND_FCHA_DVLCION = to_date('30/05/2024', 'dd/mm/yyyy')
  and SNA_NMRO_SNSTRO = CND_NMRO_SNSTRO;

SELECT *  FROM Detalle_Procesos_Batch;

SELECT * FROM Parametros_Proceso_Batch;


select * from VLRES_LQDCION where VLQ_NMRO_SLCTUD = 10261454
                              AND VLQ_TPO_LQDCION = '04'
                              AND VLQ_PRDO = '032025'
                              AND VLQ_SERIE = 1;
/*
UPDATE VLRES_LQDCION SET VLQ_PRDO = '042025'
WHERE VLQ_NMRO_SLCTUD = 10261454
  AND VLQ_TPO_LQDCION = '04'
  AND VLQ_PRDO = '032025'
  AND VLQ_SERIE = 1;
*/
INSERT INTO VLRES_LQDCION (VLQ_NMRO_SLCTUD,VLQ_TPO_LQDCION,VLQ_PRDO,VLQ_SERIE,VLQ_RAM_CDGO,VLQ_CDGO_AMPRO,VLQ_CNCPTO_VLOR ,VLQ_USER,VLQ_VLOR,VLQ_VLOR_ORGNAL,VLQ_FCHA_MDFCCION,VLQ_ORGEN,VLQ_DSCRPCION)
VALUES (10261454,'04','032025',1,'12','01','01',USER,37086.67,37086.67,SYSDATE,'O','LIQUIDACION FALTANTE CASO GD933-217-MDSB-788398*');

select * from liquidaciones_obligacion;
select * from obligaciones_pagar;
select * from detalles_pago;
select * from rcbos_cja;
select * from rlcion_rcbos_cja;

SELECT p.codigo_transaccion Solicitud, p.FECHA_TRANSACCION Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy')
  and o.FECHA_GENERACION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_FCHA_MDFCCION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and r.RLR_FCHA_RCBOS >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I'
  and p.codigo_transaccion is not null
  and p.codigo_transaccion <> '-1';

select * from pagos_linea_libertador;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----consulta pagos libertador
SELECT p.codigo_transaccion, p.ESTADO_TRANSACCION Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/01/2024', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';

SELECT NVL(TO_CHAR(p.codigo_transaccion), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(p.FECHA_TRANSACCION, 'YYYY-MM-DD HH24:MI:SS'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.rcc_nmro_rcbo), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.fecha_factura, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.RCC_NMRO_LQDC), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_FCHA_RCBOS, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO, '999999999.99'), '0') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO_INVESA, '999999999.99'), '0') || ';' ||
       NVL(e.estado, 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.nro_factura_dian), 'SIN_DATO') AS CSV_Export
FROM rcbos_cja rcb
         INNER JOIN rlcion_rcbos_cja r ON rcb.rcc_nmro_rcbo = r.rlr_nmro_rcbo_invesa
         INNER JOIN factura_electronica_libertador e ON r.rlr_nmro_fctra = e.nro_factura_sai
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE rcb.RCC_FCHA_RCBO >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';


-----consulta pagos analisis digital
SELECT w.SOLICITUD Solicitud, w.FEC_DILIGENCIA Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from factura_electronica_libertador;

SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_FCHA_PGO > TO_DATE('01-10-2025');

-- Consulta de parametro PERIODO SAI
SELECT PAR_RFRNCIA FROM PRMTROS WHERE PAR_CDGO='1' AND PAR_MDLO='6' AND PAR_VLOR1=1;
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/10/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
SELECT * FROM PLZAS where POL_NMRO_PLZA = 11003;
select * from lqdcnes where LQD_NMRO_SLCTUD   = 10261454 AND LQD_TPO_LQDCION = '04' AND LQD_PRDO = '032025';
select * from lqdcnes_dtlle where lqt_nmro_slctud  = 10261454 AND LQT_TPO_LQDCION = '04' AND LQT_PRDO = '032025';
select * from vlres_lqdcion where VLQ_NMRO_SLCTUD = 10261454 AND VLQ_TPO_LQDCION = '04' AND VLQ_PRDO = '032025';

SELECT * FROM pgos_efctdos_snstros WHERE PES_NMRO_SNSTRO = 2023087523;

select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003 and PGS_FCHA_PGO >= TO_DATE('21/03/2025','DD/MM/YYYY');
SELECT * FROM AVSOS_SNSTROS;
select * from PGOS_SNSTROS where PGS_FCHA_PGO >= TO_DATE('01/01/2025','DD/MM/YYYY') AND NVL(PGS_NMRO_ORDEN_PGO,0) != 0;
select SNA_NMRO_PLZA, MAX(SNA_NMRO_ITEM), MAX(SNA_NMRO_SNSTRO)
from AVSOS_SNSTROS
WHERE SNA_NMRO_PLZA IN (13765,
                        12249,
                        12249,
                        11421,
                        11421,
                        1886,
                        12249,
                        11421,
                        12199,
                        11421,
                        12249,
                        1665,
                        11421,
                        1665,
                        1665,
                        13676,
                        1665,
                        11386,
                        10323,
                        11386,
                        11386,
                        11386,
                        10719,
                        10111,
                        11386,
                        11472,
                        13487,
                        11066,
                        11218,
                        10561,
                        10658,
                        2103,
                        10790,
                        429,
                        10790,
                        13465,
                        13465,
                        13465,
                        12195,
                        14021,
                        12195,
                        634,
                        13465,
                        12548,
                        14021,
                        13465,
                        13465,
                        12548,
                        12548,
                        10790,
                        12548,
                        10790,
                        12548,
                        12550,
                        12548,
                        627,
                        12548,
                        12550,
                        139,
                        10658,
                        390,
                        446,
                        636,
                        1388,
                        1513,
                        1513,
                        914,
                        914,
                        914,
                        914,
                        13324,
                        11083,
                        914,
                        11083,
                        914,
                        11083,
                        11083,
                        758,
                        627,
                        11083,
                        13499,
                        13442,
                        11083,
                        11083,
                        11083,
                        11377,
                        11083,
                        11161,
                        13499,
                        11083,
                        11161,
                        13499,
                        11083,
                        11161,
                        13499,
                        11083,
                        11161,
                        11083,
                        10724,
                        10323,
                        10487,
                        13458,
                        910,
                        12343,
                        846,
                        1537,
                        464,
                        1182
    ) AND SNA_FCHA_AVSO >= TO_DATE('01/01/2025','DD/MM/YYYY')
GROUP BY SNA_NMRO_PLZA;
    --ORDER BY SNA_NMRO_PLZA, SNA_FCHA_AVSO DESC;

SELECT DISTINCT
    A.SNA_NMRO_ITEM,          -- El dato que necesitas identificar
    A.SNA_NMRO_SNSTRO,        -- Número de siniestro
    P.PGS_NMRO_ORDEN_PGO,     -- Número de orden de pago
    P.PGS_FCHA_PGO,           -- Fecha de pago
    A.SNA_FCHA_SNSTRO,        -- Fecha del siniestro
    P.PGS_VLOR_PGDO,          -- Valor pagado
    A.SNA_NMRO_PLZA,
    A.SNA_RAM_CDGO
FROM ADMSISA.PGOS_SNSTROS P
JOIN ADMSISA.AVSOS_SNSTROS A
    ON P.PGS_NMRO_PLZA = A.SNA_NMRO_PLZA
    AND P.PGS_RAM_CDGO = A.SNA_RAM_CDGO
    AND P.PGS_CLSE_PLZA = A.SNA_CLSE_PLZA
WHERE
    P.PGS_FCHA_PGO >= TO_DATE('01/01/2025','DD/MM/YYYY')
    AND NVL(P.PGS_NMRO_ORDEN_PGO, 0) != 0
    -- Filtro lógico: El pago debe ser posterior a la fecha del siniestro
    AND P.PGS_FCHA_PGO >= A.SNA_FCHA_SNSTRO
ORDER BY
    P.PGS_FCHA_PGO DESC;

SELECT DISTINCT
    -- Datos Identificadores Clave
    A.SNA_NMRO_ITEM,            -- Ítem afectado (Dato solicitado)
    A.SNA_NMRO_SNSTRO,          -- Número de Siniestro
    P.PGS_NMRO_ORDEN_PGO,       -- Orden de Pago

    -- Información Financiera y Fechas
    P.PGS_FCHA_PGO,
    A.SNA_FCHA_SNSTRO,
    P.PGS_VLOR_PGDO as VLOR_PAGO_TOTAL_ORDEN,
    E.PES_VLOR_PGDO as VLOR_PAGO_ESTE_SINIESTRO,

    -- Detalle de Póliza
    PL.POL_NMRO_PLZA,
    PL.POL_RAM_CDGO,
    PL.POL_FCHA_DSDE_ACTUAL as INICIO_VIGENCIA,
    PL.POL_FCHA_HSTA_ACTUAL as FIN_VIGENCIA

FROM ADMSISA.PGOS_SNSTROS P

-- 1. Puente para vincular Pago con Siniestro específico (Evita duplicidad)
JOIN ADMSISA.PGOS_EFCTDOS_SNSTROS E
    ON P.PGS_NMRO_PLZA = E.PES_NMRO_PLZA
    AND P.PGS_CLSE_PLZA = E.PES_CLSE_PLZA
    AND P.PGS_RAM_CDGO = E.PES_RAM_CDGO
    AND P.PGS_FCHA_PGO = E.PES_FCHA_PGO
    AND P.PGS_VLOR_PGDO = E.PES_VLOR_PGDO

-- 2. Obtener detalle del Siniestro (Ítem afectado)
JOIN ADMSISA.AVSOS_SNSTROS A
    ON E.PES_NMRO_SNSTRO = A.SNA_NMRO_SNSTRO
    AND E.PES_RAM_CDGO = A.SNA_RAM_CDGO

-- 3. Información Administrativa de Póliza
JOIN ADMSISA.PLZAS PL
    ON P.PGS_NMRO_PLZA = PL.POL_NMRO_PLZA
    AND P.PGS_CLSE_PLZA = PL.POL_CDGO_CLSE
    AND P.PGS_RAM_CDGO = PL.POL_RAM_CDGO

WHERE P.PGS_NMRO_ORDEN_PGO IN (
    50102023000036, 50102023003092, 50132023000800, 50102023003059, 50102023001242,
    50102023001543, 50102023000936, 50102023001849, 50102023000644, 50102023000342,
    50102023000052, 50102023002369, 50102024002484, 50102025000960, 50132023002037,
    50132023001935, 50192023000297, 50152023000855, 50152023000355, 50152023000447,
    50152023000271, 50152023000184, 50152023000095, 50112023000409, 50112023003040,
    50132024000187, 50112024003989, 50152024000106, 50192025000114, 50192025000037,
    50112025001652, 50112025001550, 50142025000337, 50132023001917, 50192023000272,
    50102023001410, 50102023001183, 50112023003799, 50142023000788, 50142023000858,
    50142023000248, 50142023000089, 50112023001296, 50112023000339, 50132023002066,
    50132023001651, 50132023001859, 50132023001275, 50132023001471, 50132023000914,
    50132023001085, 50132023000733, 50132023000372, 50132023000540, 50142023000352,
    50102024003704, 50102024004156, 50102024004034, 50102024002328, 50102024003007,
    50102024003372, 50132024000680, 50132024000903, 50132024001098, 50132024001284,
    50132024001919, 50142024000779, 50132024000079, 50142024000650, 50142024000718,
    50142024001468, 50112024000712, 50112025001568, 50112025001648, 50132025000085,
    50132025000294, 50132025000606, 50132025000549, 50132025000447, 50192025000220,
    50192025000136, 50192025000201, 50112025000405, 50112025000678, 50112025000941,
    50102025000781, 50102025000172, 50122025000062, 50122025000086, 50122025000208,
    50122025000245, 50122025000286, 50122025000380, 50122025000167, 50192024000356,
    50192025000215, 50192023000207, 50192023000378, 50192023000290, 50192023000175,
    50192023000375, 50192023000198, 50192023000261, 50192023000321, 50192023000302,
    50192023000114, 50132023000510, 50192024000291, 50192024000021, 50192024000302,
    50192024000044, 50192024000160, 50192025000018, 50192025000135, 50192025000228,
    50102019000080, 50102015000105, 50102017000075, 50102018000230, 50102022000218,
    50102018000243, 50102022000146, 50102015000171, 50102015000191, 50102016000138,
    50102022000065, 50102022000038, 50102022000041, 50192021000007, 50192019000267,
    50192022000030, 50192021000127, 50192021000192, 50132021001657, 50192022000077,
    50192021000142, 50192021000191, 50192019000027, 50102016002260, 50192022000006,
    50192019000195, 50192020000036, 50102018001307, 50192020000091, 50192020000084,
    50192020000052, 50192020000118, 50192020000001, 50192019000105, 50192019000111,
    50192021000164, 50192019000127, 50132020001109, 50132020000960, 50132020000808,
    50132020001251, 50192020000174, 50192020000007, 50192019000164, 50192019000162,
    50192020000046, 50192022000227, 50192020000070, 50192020000195, 50192020000278,
    50192019000064, 50192021000079, 50192020000100, 50192019000006, 50192020000051,
    50132021000935, 50132021000792, 50132021000638, 50132021000474, 50132021000321,
    50132021000200, 50132021000015, 50132020001623, 50132020001493, 50132020001357,
    50132020001080, 50132020000932, 50132020000532, 50132020001223, 50132020000777,
    50102015000219, 50192020000031, 50192020000072, 50192020000035, 50192021000011,
    50192020000125, 50192022000249, 50192021000020, 50192021000104, 50122022000605,
    50122022000514, 50122022000682, 50122022000427, 50122022000335, 50122022000191,
    50122022000141, 50122022000264, 50192021000030, 50192020000044, 50102022000732,
    50102022000733, 50192020000102, 50192020000110, 50122022000142, 50122022000284,
    50192020000083, 50192020000127, 50192021000080, 50192019000157, 50192020000201,
    50192019000178, 50192021000061, 50192020000237, 50192019000096, 50192020000145,
    50102021003026, 50102021002491, 50102021002188, 50102021001859, 50102021001533,
    50102021002769, 50192019000266, 50192020000087, 50192020000230, 50192020000053,
    50192019000283, 50192020000012, 50192021000155, 50192020000269, 50192020000049,
    50192020000024, 50192020000025, 50102019000645, 50192020000168, 50112021002467,
    50112021001689, 50112021000999, 50112021000761, 50192019000256, 50192019000151,
    50192020000180, 50192021000182, 50132020001466, 50102022000153, 50102021003674,
    50142022000127, 50152022000718, 50152022000794, 50152022000635, 50152022000560,
    50142016000626, 50102018002030, 50142018001149, 50152015000339, 50102021001165,
    50102021001020, 50112022002473, 50112022002801, 50112022001655, 50112022001915,
    50112022001756, 50112022002961, 50142020000731, 50112022000550, 50122017000181,
    50132022001032, 50112021000270, 50112020001701, 50112020001476, 50112020001245,
    50102018002673, 50122022000697, 50112020002494, 50192020000113, 50122022000447,
    50112021001371, 50102021003419, 50142016000288, 50142020000111, 50142017000101,
    50142022000903, 50142022000770, 50112019000906, 50102022002964, 50132018000433,
    50122016000215, 50102021002333, 50102021002078, 50102021002389, 50102021002077,
    50102021002330, 50122017000334, 50142018000818, 50132018000159, 50102022002137,
    50112016000308, 50112021001520, 50122016000139, 50122015000290, 50192020000056,
    50192020000059, 50152020000161, 50152018000091, 50142019001259, 50132016000358,
    50122021000780, 50102017001689, 50102017001447, 50102022002000, 50152018000635,
    50142019000746, 50142014000387, 50142016000957, 50142016000672, 50152015000471,
    50122022000015, 50122021000622, 50122021000740, 50122021000708, 50122022000811,
    50122022000769, 50122022000693, 50112015001020, 50142020001711, 50142019000719,
    50142021001095, 50142021001094, 50152022000629, 50142019000236, 50142019000128,
    50142019000351, 50102022002505, 50102022000549, 50102021000764, 50102021000478,
    50112015000905, 50132015000691, 50102015001602, 50102021001087
)
ORDER BY P.PGS_FCHA_PGO DESC;

select * from PGOS_SNSTROS WHERE P.PGS_NMRO_ORDEN_PGO IN (
    50102023000036, 50102023003092, 50132023000800, 50102023003059, 50102023001242,
    50102023001543, 50102023000936, 50102023001849, 50102023000644, 50102023000342,
    50102023000052, 50102023002369, 50102024002484, 50102025000960, 50132023002037,
    50132023001935, 50192023000297, 50152023000855, 50152023000355, 50152023000447,
    50152023000271, 50152023000184, 50152023000095, 50112023000409, 50112023003040,
    50132024000187, 50112024003989, 50152024000106, 50192025000114, 50192025000037,
    50112025001652, 50112025001550, 50142025000337, 50132023001917, 50192023000272,
    50102023001410, 50102023001183, 50112023003799, 50142023000788, 50142023000858,
    50142023000248, 50142023000089, 50112023001296, 50112023000339, 50132023002066,
    50132023001651, 50132023001859, 50132023001275, 50132023001471, 50132023000914,
    50132023001085, 50132023000733, 50132023000372, 50132023000540, 50142023000352,
    50102024003704, 50102024004156, 50102024004034, 50102024002328, 50102024003007,
    50102024003372, 50132024000680, 50132024000903, 50132024001098, 50132024001284,
    50132024001919, 50142024000779, 50132024000079, 50142024000650, 50142024000718,
    50142024001468, 50112024000712, 50112025001568, 50112025001648, 50132025000085,
    50132025000294, 50132025000606, 50132025000549, 50132025000447, 50192025000220,
    50192025000136, 50192025000201, 50112025000405, 50112025000678, 50112025000941,
    50102025000781, 50102025000172, 50122025000062, 50122025000086, 50122025000208,
    50122025000245, 50122025000286, 50122025000380, 50122025000167, 50192024000356,
    50192025000215, 50192023000207, 50192023000378, 50192023000290, 50192023000175,
    50192023000375, 50192023000198, 50192023000261, 50192023000321, 50192023000302,
    50192023000114, 50132023000510, 50192024000291, 50192024000021, 50192024000302,
    50192024000044, 50192024000160, 50192025000018, 50192025000135, 50192025000228,
    50102019000080, 50102015000105, 50102017000075, 50102018000230, 50102022000218,
    50102018000243, 50102022000146, 50102015000171, 50102015000191, 50102016000138,
    50102022000065, 50102022000038, 50102022000041, 50192021000007, 50192019000267,
    50192022000030, 50192021000127, 50192021000192, 50132021001657, 50192022000077,
    50192021000142, 50192021000191, 50192019000027, 50102016002260, 50192022000006,
    50192019000195, 50192020000036, 50102018001307, 50192020000091, 50192020000084,
    50192020000052, 50192020000118, 50192020000001, 50192019000105, 50192019000111,
    50192021000164, 50192019000127, 50132020001109, 50132020000960, 50132020000808,
    50132020001251, 50192020000174, 50192020000007, 50192019000164, 50192019000162,
    50192020000046, 50192022000227, 50192020000070, 50192020000195, 50192020000278,
    50192019000064, 50192021000079, 50192020000100, 50192019000006, 50192020000051,
    50132021000935, 50132021000792, 50132021000638, 50132021000474, 50132021000321,
    50132021000200, 50132021000015, 50132020001623, 50132020001493, 50132020001357,
    50132020001080, 50132020000932, 50132020000532, 50132020001223, 50132020000777,
    50102015000219, 50192020000031, 50192020000072, 50192020000035, 50192021000011,
    50192020000125, 50192022000249, 50192021000020, 50192021000104, 50122022000605,
    50122022000514, 50122022000682, 50122022000427, 50122022000335, 50122022000191,
    50122022000141, 50122022000264, 50192021000030, 50192020000044, 50102022000732,
    50102022000733, 50192020000102, 50192020000110, 50122022000142, 50122022000284,
    50192020000083, 50192020000127, 50192021000080, 50192019000157, 50192020000201,
    50192019000178, 50192021000061, 50192020000237, 50192019000096, 50192020000145,
    50102021003026, 50102021002491, 50102021002188, 50102021001859, 50102021001533,
    50102021002769, 50192019000266, 50192020000087, 50192020000230, 50192020000053,
    50192019000283, 50192020000012, 50192021000155, 50192020000269, 50192020000049,
    50192020000024, 50192020000025, 50102019000645, 50192020000168, 50112021002467,
    50112021001689, 50112021000999, 50112021000761, 50192019000256, 50192019000151,
    50192020000180, 50192021000182, 50132020001466, 50102022000153, 50102021003674,
    50142022000127, 50152022000718, 50152022000794, 50152022000635, 50152022000560,
    50142016000626, 50102018002030, 50142018001149, 50152015000339, 50102021001165,
    50102021001020, 50112022002473, 50112022002801, 50112022001655, 50112022001915,
    50112022001756, 50112022002961, 50142020000731, 50112022000550, 50122017000181,
    50132022001032, 50112021000270, 50112020001701, 50112020001476, 50112020001245,
    50102018002673, 50122022000697, 50112020002494, 50192020000113, 50122022000447,
    50112021001371, 50102021003419, 50142016000288, 50142020000111, 50142017000101,
    50142022000903, 50142022000770, 50112019000906, 50102022002964, 50132018000433,
    50122016000215, 50102021002333, 50102021002078, 50102021002389, 50102021002077,
    50102021002330, 50122017000334, 50142018000818, 50132018000159, 50102022002137,
    50112016000308, 50112021001520, 50122016000139, 50122015000290, 50192020000056,
    50192020000059, 50152020000161, 50152018000091, 50142019001259, 50132016000358,
    50122021000780, 50102017001689, 50102017001447, 50102022002000, 50152018000635,
    50142019000746, 50142014000387, 50142016000957, 50142016000672, 50152015000471,
    50122022000015, 50122021000622, 50122021000740, 50122021000708, 50122022000811,
    50122022000769, 50122022000693, 50112015001020, 50142020001711, 50142019000719,
    50142021001095, 50142021001094, 50152022000629, 50142019000236, 50142019000128,
    50142019000351, 50102022002505, 50102022000549, 50102021000764, 50102021000478,
    50112015000905, 50132015000691, 50102015001602, 50102021001087
)
ORDER BY PGS_FCHA_PGO DESC;

select A.SNA_ESTDO_PGO, SNA_ESTDO_SNSTRO, A.SNA_FCHA_ULTMO_PGO, A.*
from AVSOS_SNSTROS A
where A.SNA_NMRO_ITEM = 10261454
  AND A.SNA_NMRO_SNSTRO = 2023087523
  AND A.SNA_CAUSA_SNSTRO = '01'
  AND A.SNA_NMRO_PLZA = 11003;


SELECT SNA_NMRO_ITEM,
       SNA_NMRO_SNSTRO,
       DVA_FCHA_MRA,
       SNA_ESTDO_SNSTRO,
       SNA_ESTDO_PGO,
       SNA_FCHA_AVSO,
       SNA_MARCA_POLIZA
FROM AVSOS_SNSTROS, DDAS_VGNTES_ARRNDMNTOS
WHERE SNA_NMRO_PLZA = 11003
  AND SNA_CLSE_PLZA = '00'
  AND SNA_RAM_CDGO = '12'
  AND (SNA_ESTDO_PGO = '01' OR SNA_ESTDO_PGO = '00' OR
       SNA_ESTDO_PGO = '03' OR SNA_ESTDO_PGO = '04')
  AND SNA_ESTDO_SNSTRO not in ('06', '04')
  AND SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
  AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA
  AND
  -- Pagos Anticipados Mantis # 9602
    EXISTS
        (SELECT *
         FROM LQDCNES D, LQDCNES_DTLLE L
         WHERE D.LQD_NMRO_SLCTUD = L.LQT_NMRO_SLCTUD
           AND D.LQD_TPO_LQDCION = L.LQT_TPO_LQDCION
           AND D.LQD_PRDO = L.LQT_PRDO
           AND L.LQT_NMRO_SNSTRO = SNA_NMRO_SNSTRO
           AND TRUNC(D.LQD_FCHA_PGO) = date '2025-04-23')
-- Ajuste para que tome los suspendidos que tengan reintegros  GGM 02/05/2014
UNION
SELECT SNA_NMRO_ITEM,
       SNA_NMRO_SNSTRO,
       DVA_FCHA_MRA,
       SNA_ESTDO_SNSTRO,
       SNA_ESTDO_PGO,
       SNA_FCHA_AVSO,
       SNA_MARCA_POLIZA
FROM AVSOS_SNSTROS, DDAS_VGNTES_ARRNDMNTOS
WHERE SNA_NMRO_PLZA = 11003
  AND SNA_CLSE_PLZA = '00'
  AND SNA_RAM_CDGO = '12'
  AND SNA_ESTDO_PGO = '02'
  AND SNA_ESTDO_SNSTRO not in ('06', '04')
  AND SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
  AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA
  -- Mantis 34415 y 35703 error de facturas negativas 22/04/2015 GGM.
  AND PKG_CONSULTA_INDEMNIZACION.FUN_VALIDA_REINTEGROS(SNA_NMRO_SNSTRO,
                                                       date '2025-04-23') = 'S'
  -- Pagos Anticipados Mantis # 9602
  AND EXISTS
    (SELECT *
     FROM LQDCNES D, LQDCNES_DTLLE L, VLRES_LQDCION V
     WHERE D.LQD_NMRO_SLCTUD = L.LQT_NMRO_SLCTUD
       AND D.LQD_TPO_LQDCION = L.LQT_TPO_LQDCION
       AND D.LQD_PRDO = L.LQT_PRDO
       AND V.VLQ_NMRO_SLCTUD = L.LQT_NMRO_SLCTUD
       AND V.VLQ_TPO_LQDCION = L.LQT_TPO_LQDCION
       AND V.VLQ_PRDO = L.LQT_PRDO
       AND V.VLQ_SERIE = L.LQT_SERIE
       AND L.LQT_NMRO_SNSTRO = SNA_NMRO_SNSTRO
       AND V.VLQ_ORGEN IN ('E', 'N', 'V', 'D')
       AND V.VLQ_VLOR < 0
       AND TRUNC(D.LQD_FCHA_PGO) = date '2025-04-23');


SELECT w.SOLICITUD Solicitud, w.FEC_DILIGENCIA Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');

SELECT * FROM factura_electronica_libertador;
SELECT * FROM rcbos_cja;
select * from rlcion_rcbos_cja;

select *
from estdos_snstros
where ESN_NMRO_SLCTUD = 10261454
  and ESN_FCHA_SNSTRO >= to_date('01/02/2025', 'dd/mm/yyyy');

----RCBOS -> significa que se han retirado del seguro todas las tabla con ese prefijo
----TABLAS DE MODIFICACIONES DESDE SIMON TRONADOR HACIA SAI (AQUI PUEEN VENIR LOS AUMENTO CAMBIOS EN EL SEGURO ETC......)
SELECT * FROM RSGOS_VGNTES R WHERE R.RVI_NMRO_ITEM IN (10143329) ORDER BY RVI_NMRO_ITEM, RVI_FCHA_MDFCCION ASC;
SELECT * FROM RSGOS_VGNTES_VLRES R WHERE R.RVV_NMRO_ITEM IN (10143329) ORDER BY RVV_NMRO_ITEM,RVV_FCHA_MDFCCION ASC ;
SELECT * FROM RSGOS_VGNTES_AMPRO A WHERE A.RVA_NMRO_ITEM IN (10143329) ORDER BY RVA_NMRO_ITEM, RVA_FCHA_MDFCCION ASC;
SELECT * FROM RSGOS_VGNTES_AVLOR A WHERE A.RVL_NMRO_ITEM IN (10143329) ORDER BY RVL_NMRO_ITEM, RVL_FCHA_MDFCCION asc;
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_ITEM IN (7541338) ORDER BY RIVN_NMRO_ITEM, RIVN_FCHA_NVDAD asc;
SELECT * FROM RSGOS_VGNTES_NVLOR WHERE RVNV_NMRO_ITEM IN (7541338) ORDER BY RVNV_NMRO_ITEM, RVNV_FCHA_NVDAD asc;
SELECT * FROM RSGOS_RCBOS R WHERE R.RVI_NMRO_ITEM = 7705919;
--SELECT * FROM RSGOS_RCBOS_VLRES R WHERE R.RVV_NMRO_ITEM=10143329;
SELECT * FROM RSGOS_RCBOS_AMPRO A WHERE A.RRA_NMRO_CRTFCDO=1987537;
SELECT * FROM RSGOS_VGNTES_AVLOR A WHERE A.RVL_NMRO_ITEM=10143329 AND RVL_CDGO_AMPRO='01';
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_ITEM=7297741 AND RIVN_CDGO_AMPRO='01';
SELECT * FROM RSGOS_VGNTES_NVLOR WHERE RVNV_NMRO_ITEM=7297741 AND RVNV_CDGO_AMPRO in ('01', '03');
SELECT * FROM AMPROS_SNSTROS;
-----TABLA DE AUMENTOS DE SEGURO
SELECT * FROM AMNTOS_SNSTROS A WHERE A.AMN_SLCTUD=7541338;


SELECT w.SOLICITUD Solicitud, w.FEC_DILIGENCIA Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN, e.SUCURSAL sucursal
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');


SELECT * FROM AMNTOS_SNSTROS A WHERE A.AMN_NMRO_SNSTRO=1977000037;

SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL=29807458069;

SELECT *
FROM RCBOS_CJA
WHERE rcc_nmro_rcbo = 505329071;


SELECT 'RCBOS_CJA insertados:' as TABLA, COUNT(*) as REGISTROS
FROM RCBOS_CJA
WHERE RCC_NMRO_RCBO IN (505329071, 505329072, 505329073)
UNION ALL
SELECT 'DDAS_PLZAS insertados:', COUNT(*)
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857);

-- Verificar recibo principal
SELECT RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_VLOR_RCBO, RCC_TXTO
FROM RCBOS_CJA
WHERE RCC_NMRO_RCBO = 505329071;

-- Verificar deudas relacionadas
SELECT *
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857)
ORDER BY DDP_NMRO_SLCTUD;

SELECT P.*, T.*
FROM USRIOS P,ROLES_USRIOS T
WHERE T.RUS_CDGO_ROL = '12' AND P.USR_CDGO_USRIO = T.RUS_CDGO_USRIO
  AND USR_ESTDO = 'V'
  AND EMAIL IS NOT NULL
  order by P.USR_FCHA_ACTLZCION ASC
  FETCH FIRST 10 ROWS ONLY;

select * from roles where ROL_CDGO = '12';

SELECT P.EMAIL
FROM USRIOS P,ROLES_USRIOS T
WHERE T.RUS_CDGO_ROL = '12'
  AND P.USR_CDGO_USRIO = T.RUS_CDGO_USRIO
  AND USR_ESTDO = 'V'
  AND EMAIL IS NOT NULL
order by P.USR_FCHA_ACTLZCION ASC
    FETCH FIRST 10 ROWS ONLY;

select A.SNA_ESTDO_PGO, SNA_ESTDO_SNSTRO, A.SNA_FCHA_ULTMO_PGO, A.*
from AVSOS_SNSTROS A
where A.SNA_NMRO_ITEM IN (10937150, 10900892);


------------------------------------------CLASE SADITH-------------------------------------------------------------------------------------
SELECT * FROM PLZAS where POL_NMRO_PLZA = 13147;
SELECT * FROM rsgos_vgntes r where r.RVI_NMRO_ITEM = 7612528;
SELECT * FROM RSGOS_VGNTES_VLRES R WHERE R.RVV_NMRO_ITEM IN (10143329) ORDER BY RVV_NMRO_ITEM,RVV_FCHA_MDFCCION ASC ;

SELECT * FROM CRTFCDOS WHERE CER_CDGO_CRTFCDO = 2142876;
----CER_ESTDO_PRDCCION: 00-SIN FACTURACION (NO SE A FACTURADO PRIMA AUN)| 20-PRIMA SIN PAGAR | 30-PRIMA PAGADA | 40-FACTURADO PARCIAL | 50-FACTURADO TOTAL | 60-ANULADO

SELECT * FROM EXTRACTOS WHERE EXT_NMRO_PLZA = 557;
SELECT * FROM DETALLE_EXTRACTOS;

-----amparos que cubre la compañia
SELECT A.APR_CDGO_AMPRO, A.APR_TPO_AMPRO, A.*
FROM AMPROS_PRDCTO A
WHERE A.APR_RAM_CDGO = 12;

-------------------------------siniestros---------------------------------------
SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_ITEM = 10143329;
SELECT * FROM AMPROS_SNSTROS;
SELECT * FROM VLRES_SNSTROS WHERE VSN_NMRO_SNSTRO = 2023087523;

SELECT * FROM VLRES_SNSTROS WHERE VSN_NMRO_SNSTRO = 2024078306;

---TODOS LOS ESTADOS SINIESTROS
SELECT * FROM CG_REF_CODES WHERE RV_DOMAIN= 'ESTADO_SINIESTRO';
---ESTADOS DE PAGO
SELECT * FROM CG_REF_CODES WHERE RV_DOMAIN= 'ESTADO_SINIESPAGO';
---INMOBILIARIA - PROPIETARIO
---INQUILINO
SELECT * FROM CG_REF_CODES WHERE RV_DOMAIN LIKE '%CODI%';
---12MESES
---SOLICITUD 12 MESE PAGANDO
---TABLA CONTROL----

SELECT parameter, value
FROM nls_database_parameters
WHERE parameter LIKE 'NLS_CHARACTERSET';


-- Ver información del usuario actual
SELECT username, account_status, password_versions
FROM dba_users
WHERE username = 'ADMSISA';

-- O si no tienes permisos DBA:
SELECT username, account_status
FROM user_users;

select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022942%';

SELECT * FROM PLZAS where POL_NMRO_PLZA = 75272;
SELECT * FROM PLZAS where POL_PRS_NMRO_IDNTFCCION = 1019009832;

-----identificar Constrain
SELECT
    c.constraint_name,
    c.table_name,
    c.constraint_type,
    c.search_condition,
    c.r_constraint_name,
    c.status,
    cc.column_name,
    cc.position
FROM all_constraints c
         LEFT JOIN all_cons_columns cc ON c.constraint_name = cc.constraint_name
    AND c.owner = cc.owner
WHERE c.constraint_name = 'FGR_RCC_FK'
  AND c.owner = 'ADMSISA'
ORDER BY cc.position;

select *
from polizas_simon t
where t.poliza_simon IN 5010002294202;

select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100022942);

SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL in (29828220078, 29828220079);



SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511;

UPDATE POLIZAS_SIMON
SET ESTADO_CARGUE_SAI = null
where TIPO_MOVIMIENTO = '3'
  and SECUENCIA = 86304
  and NUM_SECU_POL = 29828220078
  and POLIZA_SIMON = 5010002294202;
UPDATE POLIZAS_SIMON
SET ESTADO_CARGUE_SAI = null
where TIPO_MOVIMIENTO = '2'
  and SECUENCIA = 86945
  and NUM_SECU_POL = 29828220078
  and POLIZA_SIMON = 5010002294202;


select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002294202%';

SELECT P.SECUENCIA,
       P.ESTADO_CARGUE_SAI
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON IN ('C','A')
  AND P.ESTADO_CARGUE_SAI IS NOT NULL
  AND P.POLIZA_SIMON LIKE '50100022942%'
  AND P.FECHA_CREACION IN ( SELECT MAX(A.FECHA_CREACION)
                            FROM POLIZAS_SIMON A
                            WHERE A.COD_CIA = 3
                              AND A.COD_SECC = 37
                              AND A.COD_RAMO = 486
                              AND A.ESTADO_CARGUE_SIMON IN ('C','A')
                              AND A.ESTADO_CARGUE_SAI IS NOT NULL
                              AND A.POLIZA_SIMON LIKE '50100022942%');


select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%TRG_RGOS_RCBOS_AUX_POL_IND%'
  AND E.ERP_FECHA_CREA >= TO_DATE('01/06/2025','DD/MM/YYYY');

select * from CNCPTOS_DTLLE_RCBOS where CDR_CDGO_CNCPTO IN ('HON','CUO') AND CDR_RFRNCIA LIKE '7083044%';

-----Para buscar siniestros terminados que tienen fecha de desocupación y están vigentes en el seguro:
select a.SNA_ESTDO_SNSTRO, a.SNA_ESTDO_PGO, d.DVA_FCHA_MRA, a.*
from avsos_snstros a, ddas_vgntes_arrndmntos d
where --a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
 a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7613324
    );

SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL),SNA_FCHA_SNSTRO
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 11202600
  --AND SNA_FCHA_SNSTRO = P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;

SELECT * FROM avsos_snstros WHERE SNA_NMRO_ITEM IN (7610874);

SELECT DVA_FCHA_DSCPCION, DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS, AMPROS_SNSTROS
WHERE DVA_NMRO_SLCTUD = 7610874 AND DVA_ESTDO = '01' AND
    DVA_NMRO_SLCTUD = AMS_NMRO_ITEM(+) AND
    DVA_FCHA_MRA = TO_DATE('16/07/2025','DD/MM/YYYY') AND AMS_CDGO_AMPRO(+) = '01';

select * from AMPROS_SNSTROS where AMS_NMRO_SNSTRO = 2025072589;
select * from DDAS_VGNTES_ARRNDMNTOS where DVA_NMRO_SLCTUD = 7610874 AND DVA_FCHA_MRA = TO_DATE('16/07/2025','DD/MM/YYYY');

select max(a.sna_fcha_snstro)
from avsos_snstros a, ampros_snstros m
where a.sna_nmro_item = 11202600
  and a.sna_nmro_snstro=m.ams_nmro_snstro
  and m.ams_cdgo_ampro='01';

SELECT *
FROM PLZAS
WHERE POL_NMRO_PLZA = 145581;

select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100025638%'
  ORDER BY ERP_FECHA_CREA DESC;


Select *
from Rsgos_Rcbos_Nvdad
where ren_cdgo_ampro = 05
  and ren_nmro_item = 10407807
  and ren_nmro_plza = 139384
  and ren_clse_plza = 00
  and ren_ram_cdgo = 12
  and ren_nmro_crtfcdo = 2069421
  and ren_tpo_nvdad = '02';

select a.FECHA_EXPEDICION, a.*
from AEW_DEUDORES a
where FECHA_EXPEDICION is not null;

select * from SLCTDES_ESTDIOS where SES_NMRO = 11181238;

SELECT * FROM estdos_plzas;

SELECT  PK_TERCEROS.F_NOMBRES(79547922, 'CC')  FROM DUAL;

SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       D.FECHA_EXPEDICION,
       S.SES_CNON_ARRNDMNTO AS CANON,
       S.SES_CTA_ADMNSTRCION AS CUOTA,
       R.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(R.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DDMMYYYY HH:MM:SS') FECHA_RADICACION,
       TO_CHAR(R.RET_FCHA_RSLTDO,'DDMMYYYY HH:MM:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES R ON S.SES_NMRO = R.DI_SOLICITUD AND R.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO R ON (S.SES_NMRO = R.RET_NMRO_SLCTUD AND R.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  R.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 135
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01/08/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
UNION
SELECT W.SOLICITUD AS SOLICITUD,
       W.COD_INMOBILIARIA AS POLIZA,
       D.NUM_DOCUMENTO AS IDENTIFICACION_INQUILINO,
       D.TIP_DOCUMENTO AS TIPO_IDENTIFICACION,
       D.PNOMBRE||' '||D.SNOMBRE||' '||D.PAPELLIDO||' '||D.SAPELLIDO AS NOMBRE_INQUILINO,
       D.CORREO AS CORREO_INQUILINO ,
       D.NUM_TELEFONO AS TELEFONO_INQUILINO,
       D.INGRESOS,
D.FECHA_EXPEDICION,
       W.VLR_CANON AS CANON,
       W.VLR_ADMIN AS CUOTA,
       W.DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       W.NOMBRE_ASESOR,
       W.CORREO_ASESOR,
       'APLAZADO-NUBE' AS ESTADO_GENERAL,
       TO_CHAR(W.FEC_DILIGENCIA,'DDMMYYYY HH:MM:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DDMMYYYY HH:MM:SS') FECHA_RESULTADO
FROM AEW_ESTUDIOS W
         LEFT JOIN AEW_DEUDORES D ON W.SOLICITUD = D.SOLICITUD AND D.TIPO = 'I'
         INNER JOIN DIVISION_POLITICAS P ON  W.CIUDAD = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON W.DESTINO = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE W.COD_INMOBILIARIA = 135
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('01/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD)


SELECT *
FROM   intrfaz_cntble i
WHERE  to_char(i.inc_fcha_cntble,'MMYYYY') = '012025'
  AND i.inc_asnto='EMA'
  and rownum <50
ORDER BY i.inc_asnto,i.inc_agncia, i.inc_fcha_cntble;


SELECT
    i.inc_cmpnia
        ||';'||i.inc_agncia
        ||';'||i.inc_asnto
        ||';'||TO_CHAR(i.inc_fcha_cntble,'DD/MM/YYYY')
        ||';'||i.inc_cnta_cntble
        ||';'||i.inc_dcmnto
        ||';'||i.inc_rmo
        ||';'||i.inc_bnfcrio
        ||';'||i.inc_cmprbnte
        ||';'||i.inc_cnsctvo
        ||';'||i.inc_inflcion
        ||';'||i.inc_bncos
        ||';'||i.inc_agrpcion
        ||';'||i.inc_dbto
        ||';'||i.inc_crdto
        ||';'||i.inc_orgen
        ||';'||i.inc_nit_bnfcrio
        ||';'||i.inc_actvdad_bnfcrio
        ||';'||i.inc_prdctor
        ||';'||TO_CHAR(i.inc_fcha_mvmnto,'DD/MM/YYYY')
        ||';'||TO_CHAR(i.inc_fcha_mdfccion,'DD/MM/YYYY')
        ||';'||i.inc_nmro_cpon
        ||';'||i.inc_tpo_bnfcrio
        ||';'||'final' AS registro_completo
FROM (
         SELECT i.*,
                ROW_NUMBER() OVER (PARTITION BY i.inc_asnto ORDER BY i.inc_fcha_cntble, i.inc_agncia) AS rn
         FROM intrfaz_cntble i
         WHERE TO_CHAR(i.inc_fcha_cntble,'MMYYYY') = '012025'
           AND i.inc_asnto IN ('CPS','DEB','PPA','CPR','EMA','SAR','RAR','CAR','NCA','ARC','RCA')
     ) i
WHERE i.rn <= 50
ORDER BY i.inc_asnto, i.inc_agncia, i.inc_fcha_cntble;

SELECT * -- DVA.DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS DVA
WHERE DVA.DVA_NMRO_SLCTUD = 5210134
  AND DVA.DVA_ESTDO = '01'
  AND EXISTS (SELECT * FROM AVSOS_SNSTROS
              WHERE SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
                AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA
                AND SNA_ESTDO_SNSTRO IN ('02','05','01'));

-- Parametros de tipos de estado de pago de siniestros
SELECT * FROM CG_REF_CODES
WHERE RV_DOMAIN='ESTADO_SINIESTRO';

SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN = 'ESTADO_DEUDA';

SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like 'ESTADO_LIQUIDACION';

SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_POLIZA_SIMON IN (5010001410602, 5010001586302, 5010000536206)
  AND PES_FCHA_PGO IN (TO_DATE('23-10-2025'), TO_DATE('23-10-2025'));

SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_ESTDO = 'V'
  AND F1.MARCA_CIERRE_OPRCION = 'S';

SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_FCHA_PGO > TO_DATE('01-10-2025');

select *
from PLZAS
where POL_NMRO_SLCTUD IN (7460532, 7679589, 7651704, 7096179, 10729874, 10874390, 7611439)
    AND POL_POLIZA_SIMON in
      (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201);

SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_NMRO_SLCTUD IN (7460532, 7679589, 7651704, 7096179, 10729874, 10874390, 7611439)
  ---AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201)
  AND PES_FCHA_PGO > TO_DATE('01-10-2025');

SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND PES_NMRO_SNSTRO IN(50100002021, 50100002180)
  AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201);

SELECT * FROM AVSOS_SNSTROS WHERE SNA_SNSTRO_SIMON IN (50100002021, 50100002180, 50100002610, 50100002680, 50100002500, 50100002614, 50100002654);

select p.POL_POLIZA_SIMON, p.* from PLZAS p where POL_NMRO_PLZA in (146205, 139628);

SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('21/11/2025', 'DD/MM/YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('21-11-2025'),'DD-MM-YYYY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('21-11-2025'),'DD-MM-YYYY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
AND PES_FCHA_PGO = TO_DATE('22-08-2025');

---CONSULTA NOMBRE DE FORMAS
SELECT *
from ADMSISA.SBMDLOS
where SMD_DSCRPCION LIKE '%PAZ%';

SELECT A.APR_CDGO_AMPRO, A.APR_RAMO, A.APR_SECCION, A.APR_SUBPRODUCTO
FROM AMPROS_PRDCTO A
 WHERE A.APR_TRFCION_EXTRNA ='S';

SELECT *
      -- INTO PERIODO
    FROM PRMTROS
   WHERE
       PAR_FCHA_ACTLZCION > TO_DATE('01-01-2020')
     AND  PAR_CDGO  = '1'
     AND PAR_MDLO  = '3'
     AND PAR_VLOR1 = 1;

------------------------------------------CLASE SADITH-------------------------------------------------------------------------------------
SELECT * FROM PLZAS where POL_NMRO_PLZA = 10670;
SELECT * FROM rsgos_vgntes r where r.RVI_NMRO_ITEM = 10242376;
SELECT * FROM RSGOS_VGNTES_VLRES R WHERE R.RVV_NMRO_ITEM IN (10242376) ORDER BY RVV_NMRO_ITEM,RVV_FCHA_MDFCCION ASC ;

SELECT * FROM CRTFCDOS WHERE CER_NMRO_PLZA = 10670 AND  CER_FCHA_PRDCCION < TO_DATE('01/12/2025', 'DD/MM/YYYY');
----CER_ESTDO_PRDCCION: 00-SIN FACTURACION (NO SE A FACTURADO PRIMA AUN)| 20-PRIMA SIN PAGAR | 30-PRIMA PAGADA | 40-FACTURADO PARCIAL | 50-FACTURADO TOTAL | 60-ANULADO

SELECT * FROM EXTRACTOS WHERE EXT_NMRO_PLZA = 557;
SELECT * FROM DETALLE_EXTRACTOS;


---NOMBRE_ARCHIVO    := :PARAMETER.PATH ||LPAD(TO_CHAR(3),2,'0') || LPAD(TO_CHAR(V_SECCION),3,'0')||LPAD(TO_CHAR(V_RAMO_TRON),3,'0')|| TO_CHAR(:FPG_FCHA_PGO,'DDMMYYYY')||'REC';
SELECT *
from ADMSISA.SBMDLOS
where SMD_NMBRE_ARCHVO LIKE '%ESTA%';

SELECT  * FROM TMP_REP_SNSTROS WHERE SNA_NMRO_ITEM= 10242376;

---SUM(VLQ.VLQ_VLOR * LQT.LQT_NMRO_DIAS)
 SELECT VLQ.VLQ_VLOR, LQT.LQT_NMRO_DIAS
        FROM LQDCNES_DTLLE LQT
       INNER JOIN LQDCNES LQD ON (LQT.LQT_NMRO_SLCTUD = LQD.LQD_NMRO_SLCTUD AND
                                  LQT.LQT_TPO_LQDCION = LQD.LQD_TPO_LQDCION AND
                                  LQT.LQT_PRDO        = LQD.LQD_PRDO)
       INNER JOIN VLRES_LQDCION VLQ ON (LQT.LQT_NMRO_SLCTUD = VLQ.VLQ_NMRO_SLCTUD AND
                                        LQT.LQT_TPO_LQDCION = VLQ.VLQ_TPO_LQDCION AND
                                        LQT.LQT_PRDO  = VLQ.VLQ_PRDO AND
                                        LQT.LQT_SERIE = VLQ.VLQ_SERIE)
       INNER JOIN AVSOS_SNSTROS AV ON (LQT.LQT_NMRO_SNSTRO = AV.SNA_NMRO_SNSTRO AND
                                       LQT.LQT_RAM_CDGO    = AV.SNA_RAM_CDGO AND
                                       LQT.LQT_NMRO_SLCTUD = AV.SNA_NMRO_ITEM)
       WHERE LQT.LQT_NMRO_SLCTUD = 10242376
         AND LQT.LQT_ESTDO_LQDCION = '01'
         AND LQT.LQT_TPO_LQDCION IN ('01', '02', '03', '04')
         --AND LQD.LQD_FCHA_PGO = P_FECHA_PAGO
         AND AV.SNA_NMRO_PLZA = 15092
         AND AV.SNA_ESTDO_SNSTRO NOT IN ('04', '06')
         AND VLQ.VLQ_CDGO_AMPRO = '01'
         AND VLQ.VLQ_CNCPTO_VLOR = '01';

----RCBOS -> significa que se han retirado del seguro todas las tabla con ese prefijo
----TABLAS DE MODIFICACIONES DESDE SIMON TRONADOR HACIA SAI (AQUI PUEEN VENIR LOS AUMENTO CAMBIOS EN EL SEGURO ETC......) LQT_ESTDO_LQDCION
SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_VLRES where RVV_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_AMPRO where RVA_NMRO_ITEM = 10242376;
select * from RSGOS_VGNTES_AVLOR where RVL_NMRO_ITEM = 10242376;
select * from LQDCNES_DTLLE where LQT_NMRO_SLCTUD = 10242376;
select * from LQDCNES where LQD_NMRO_SLCTUD = 10242376;
select * from VLRES_LQDCION VLQ where VLQ_NMRO_SLCTUD=10242376;
select * from AVSOS_SNSTROS where SNA_NMRO_ITEM = 10242376;

SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 10242376;
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_ITEM IN (10242376) ORDER BY RIVN_NMRO_ITEM, RIVN_FCHA_NVDAD asc;
SELECT * FROM RSGOS_VGNTES_NVLOR WHERE RVNV_NMRO_ITEM IN (10242376) ORDER BY RVNV_NMRO_ITEM, RVNV_FCHA_NVDAD asc;
SELECT * FROM RSGOS_RCBOS R WHERE R.RIR_NMRO_ITEM = 10242376;
--SELECT * FROM RSGOS_RCBOS_VLRES R WHERE R.RVV_NMRO_ITEM=10143329;
SELECT * FROM RSGOS_RCBOS_AMPRO A WHERE A.RRA_NMRO_CRTFCDO=10242376;
SELECT * FROM AMPROS_SNSTROS where AMS_NMRO_ITEM = 10242376;
-----TABLA DE AUMENTOS DE SEGURO
SELECT * FROM AMNTOS_SNSTROS A WHERE A.AMN_SLCTUD=10242376;
Select *
from Rsgos_Rcbos_Nvdad
where ren_nmro_item = 10242376;


----liquidaciones y avissos
select * from LQDCNES_DTLLE where LQT_NMRO_SLCTUD = 10804751;
select * from LQDCNES where LQD_NMRO_SLCTUD = 10804751;
select * from VLRES_LQDCION VLQ where VLQ_NMRO_SLCTUD=10804751;
select * from AVSOS_SNSTROS where SNA_NMRO_ITEM = 10804751;
select * from PGOS_EFCTDOS_SNSTROS where PES_NMRO_PLZA = 142417;


SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 10804751
  AND PES_FCHA_PGO = TO_DATE('22/12/2025','DD/MM/YYYY')
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-DIC-25', 'DD-MON-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('22-DIC-25'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('22-DIC-25'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-DIC-25', 'DD-MON-YYYY');

-----tabla tipo de novedad
SELECT * FROM ADMSISA.TPOS_NVDAD_PRDCTO;

select *
from VLRES_LQDCION
where VLQ_NMRO_SLCTUD = '10242376'
  AND VLQ_TPO_LQDCION = '04'
  AND VLQ_PRDO = '122025';

UPDATE VLRES_LQDCION
SET VLQ_VLOR = '180992'
WHERE VLQ_NMRO_SLCTUD = '10242376'
  AND VLQ_TPO_LQDCION = '04'
  AND VLQ_PRDO = '122025'
  AND VLQ_SERIE = '1'
  AND VLQ_ORGEN = 'G';

UPDATE VLRES_LQDCION
SET VLQ_VLOR = '197788'
WHERE VLQ_NMRO_SLCTUD = '10242376'
  AND VLQ_TPO_LQDCION = '04'
  AND VLQ_PRDO = '122025'
  AND VLQ_SERIE = '1'
  AND VLQ_ORGEN = 'G';

select * from AMNTOS_SNSTROS where AMN_SLCTUD = '10242376'


select *
from rsgos_vgntes r
where r.rvi_vlor_asgrdo_bien <0 and RVI_NMRO_ITEM = 928339;

select sum(r.rva_vlor_asgrdo_ttal)
from rsgos_vgntes_ampro r
where r.rva_vlor_asgrdo_ttal<0;

select *
from rsgos_vgntes_ampro r
where r.RVA_NMRO_ITEM = 717362;

select *
from rsgos_vgntes_avlor v
where v.RVL_NMRO_ITEM = 717362;

select *
from rsgos_vgntes_avlor  a
where a.rvl_vlor <0;

SELECT * FROM AEW_VARIABLES_SAI WHERE NVL(P_AVISOS_HISTORICO,0) > 0;

SELECT * FROM AEW_VARIABLES_SAI WHERE NUM_DOCUMENTO = 1000832354;

-----****** VERIFICACION SOLICITUDES ASEGURADAS Y DIRECCION POR SOLICITUD O CAMBIO DE INQUILINO************------------
SELECT *
FROM RSGOS_VGNTES R
WHERE R.RVI_NMRO_ITEM= 10242376;

SELECT *
FROM DIRECCIONES D
WHERE D.DI_SOLICITUD = 7836806;

SELECT *
FROM SLCTDES_ESTDIOS S
WHERE S.SES_NMRO = 5316165;

SELECT D.DI_SOLICITUD, D.DI_TPO_DRCCION, D.DI_DIRECCION
FROM ARRNDTRIOS A, DIRECCIONES D
WHERE A.ARR_NMRO_SLCTUD = 5316165
AND A.ARR_SES_NMRO = D.DI_SOLICITUD
AND ROWNUM = 1
ORDER BY DI_TPO_DRCCION DESC;

SELECT *
FROM ARRNDTRIOS A
WHERE A.ARR_NMRO_SLCTUD = 5316165;

SELECT *
FROM ARRNDTRIOS A
WHERE A.ARR_SES_NMRO = 7836806;
-----****** VERIFICACION SOLICITUDES ASEGURADAS Y DIRECCION FIN************------------


SELECT  fa.*
  FROM facturacion_electronica fa
 WHERE trunc(fa.fecha_creacion)  > TO_DATE('01/12/2025', 'DD/MM/YYYY')
  order by fa.fecha_proceso asc;


 select pcd.id, PC.fecha_proceso, PC.USUARIO
             from procesos_cierres_detalle pcd
                join procesos_cierres PC
                on  PC.SECUENCIA_PROCESO=pcd.secuencia_proceso
              where PC.tipo_proceso='D'
                and PC.estado in ('P','E')
                and pcd.estado in ('P','E');

select * from procesos_cierres_detalle WHERE FECHA_HORA_INICIO > TO_DATE('01/01/2025', 'DD/MM/YYYY');

SELECT  * FROM procesos_cierres WHERE FECHA_PROCESO > TO_DATE('01/01/2025', 'DD/MM/YYYY');


select *
 from Errores_Proceso_Batch e
 where e.erp_dpb_cod_proceso = 7324;

SELECT * FROM PROCESOS_BATCH_SAI;

SELECT * FROM RCBOS_CJA;

select * from liquidaciones_obligacion;

SELECT * FROM diafstvos WHERE DIAF_FECHA > TO_DATE('01/01/2000', 'DD/MM/YYYY');

SELECT RCC_NMRO_RCBO, RCC_TPO_RCBO, RCC_CIA_CDGO, RCC_USRIO, r.rcc_fcha_lmte_pgo
      FROM  RCBOS_CJA r
      WHERE RCC_FCHA_RCBO >= to_date('01/12/2025','dd/mm/yyyy')
       AND    RCC_FCHA_RCBO < to_date('05/01/2026','dd/mm/yyyy') + 1
       AND    RCC_ESTDO_RCBO ='I'
       AND    RCC_CIA_CDGO = '40'
       AND not EXISTS (SELECT 1
             FROM    estado_cta_rcbos e
             WHERE  e.est_nmro_rcbo  = r.RCC_NMRO_RCBO
             AND E.EST_CIA_CDGO = R.RCC_CIA_CDGO
             AND    E.EST_ESTDO_RCBO      = 'I' );

SELECT *
FROM RCBOS_CJA
where RCC_NMRO_RCBO in (505683565,505683566);

SELECT *
FROM A5021113
WHERE NUM_LIQUIDACION in (505683565,505683566);

select *
from estado_cta_rcbos
where EST_NMRO_RCBO in (505683565,505683566);

-----parametrizacion aumento porcentaje valores asegurados SAI SIOS
 SELECT *
            FROM PRMTROS
           WHERE PAR_CDGO = '2'
             AND PAR_MDLO = '2'
             AND PAR_VLOR1 = 9
             AND PAR_SUC_CDGO = SUCURSAL
             AND PAR_SUC_CIA_CDGO = COMPANIA;
  SELECT *
            FROM PRMTROS
           WHERE PAR_CDGO = '2'
             AND PAR_MDLO = '2'
             AND PAR_VLOR1 = 14
             AND PAR_SUC_CDGO = SUCURSAL
             AND PAR_SUC_CIA_CDGO = COMPANIA;


        SELECT *
                FROM PRMTROS
               WHERE PAR_CDGO = '2'
                 AND PAR_MDLO = '2'
                 AND PAR_VLOR1 = 12


 select * from trfa_ampros_prdcto;

select *
from intrfaz_cntble
where INC_CNTA_CNTBLE = '41953005'
  and INC_FCHA_CNTBLE between to_date('01/11/2022', 'dd/mm/yyyy') and to_date('31/12/2022', 'dd/mm/yyyy');

select *
from intrfaz_cntble
where INC_NIT_BNFCRIO = '419530005'
  and INC_FCHA_CNTBLE between to_date('01/11/2022', 'dd/mm/yyyy') and to_date('31/12/2022', 'dd/mm/yyyy');

select *
from INTRFAZ_CNTBLE_P where INC_RMO = '419530005'

select * from NOTAS_CR_DB;

select count(*)
from ADMSISA.SLCTDES_ESTDIOS
where SES_FCHA_INGRSO between to_date('01/01/2024', 'dd/mm/yyyy') and to_date('31/03/2024', 'dd/mm/yyyy');
---18mil a 20mil en promedio REGISTROS POR MES

----18 Cierre Diario
----17 pagos de siniestros
----19 PARA FACTIRACIÓN ELECTRÓNICA
SELECT * FROM PERSONAL_SOPORTE_CARGUE where ID_PROCESO in (17,18,19);
SELECT * FROM PERSONAL_SOPORTE_CARGUE where EMAIL = 'paola.munoz@segurosbolivar.com';

/*
INSERT INTO PERSONAL_SOPORTE_CARGUE (ID_PROCESO, USUARIO, EMAIL, SENAL_ACTIVO, FECHA_ULT_MOD, USUARIO_ULT_MOD)
VALUES (17, 'Ricardo Salamanca', 'ricardo.salamanca.mora@segurosbolivar.com', 'S', SYSDATE, 'ADMSISA');
INSERT INTO PERSONAL_SOPORTE_CARGUE (ID_PROCESO, USUARIO, EMAIL, SENAL_ACTIVO, FECHA_ULT_MOD, USUARIO_ULT_MOD)
VALUES (18, 'Ricardo Salamanca', 'ricardo.salamanca.mora@segurosbolivar.com', 'S', SYSDATE, 'ADMSISA');
INSERT INTO PERSONAL_SOPORTE_CARGUE (ID_PROCESO, USUARIO, EMAIL, SENAL_ACTIVO, FECHA_ULT_MOD, USUARIO_ULT_MOD)
VALUES (19, 'Ricardo Salamanca', 'ricardo.salamanca.mora@segurosbolivar.com', 'S', SYSDATE, 'ADMSISA');
*/

select * from SLCTDES_ESTDIOS;

------PAGOS DEL ECHOS AL LIBERTADOR O BOLIVAR
SELECT *
FROM A5021900
WHERE RECIBO = 2001574189;
SELECT *
FROM A5021113
WHERE NUM_LIQUIDACION in (504376531, 504376532, 504301397, 504301398, 504436399, 504436400);
SELECT *
FROM PAGOS_LINEA_LIBERTADOR
where CODIGO_TRANSACCION in (376834042, 478317179);
SELECT *
FROM DETALLES_PAGO
where SECUENCIA_PAGO in
      (SELECT SECUENCIA_PAGO FROM PAGOS_LINEA_LIBERTADOR where CODIGO_TRANSACCION in (376834042, 478317179));
select *
from registro_pagos_davivienda r
where r.talon in (109702044, 702044, 852885);


SELECT p.codigo_transaccion
     , p.ESTADO_TRANSACCION Fecha_radicacion
     , rcb.rcc_nmro_rcbo Liquidacion
     , e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador
     , r.RLR_FCHA_RCBOS Fecha_recibo_caja
     , r.RLR_VLOR_RCBO valor_recibo
     , r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre
     , e.nro_factura_dian factura_DIAN
     , o.SOLICITUD numero_solicitud           -- ← NUEVO CAMPO
     , av.NUMERO_SINIESTRO numero_siniestro   -- ← NUEVO CAMPO
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
         LEFT JOIN avisos_siniestros av ON av.SOLICITUD = o.SOLICITUD  -- ← NUEVO JOIN
WHERE e.fecha_factura >= to_date('01/01/2024', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';