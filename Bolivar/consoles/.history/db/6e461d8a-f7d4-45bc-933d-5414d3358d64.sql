select * from FCHAS_PGO;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO
WHERE DESC_COD_SECUNDARIO='Transaccion obtener historia credito fallida';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD = 11427731;
;-- -. . -..- - / . -. - .-. -.--
select  * from AEW_VARIABLES_HDC;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM facturacion_electronica fa
WHERE trunc(fa.fecha_creacion)  >= TO_DATE('27/07/2024', 'DD/MM/YYYY')
order by fa.fecha_proceso asc;
;-- -. . -..- - / . -. - .-. -.--
WITH w_crtfcdos
         AS
         (
             SELECT c.cer_nmro_plza,
                    c.cer_nmro_crtfcdo, -- numsecupol
                    c.cer_vlor_prma_nta,
                    c.cer_vlor_iva,
                    c.cer_vlor_prma_ttal,
                    c.cer_fcha_prdccion,
                    to_number(c.cer_cdgo_mnda) AS moneda,
                    c.cer_nmro_aplccion
             FROM crtfcdos c
             WHERE c.cer_fcha_prdccion = (
                 SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
                 FROM fchas_pgo fpg
                 WHERE fpg.fpg_estdo = 'C'
                   AND fpg.marca_cierre_oprcion  = 'S'
             )
               AND c.cer_vlor_prma_ttal > 1
         )
SELECT wc.cer_nmro_plza,
       wc.cer_nmro_crtfcdo, -- numsecupol
       p.pol_prs_tpo_idntfccion,
       p.pol_prs_nmro_idntfccion,
       p.pol_fcha_expdcion,
       wc.cer_fcha_prdccion,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_iva,
       wc.cer_vlor_prma_ttal,
       wc.moneda,
       wc.cer_nmro_aplccion
FROM w_crtfcdos wc
-- La unión de tablas es más clara aquí
         JOIN plzas p ON p.pol_nmro_plza = wc.cer_nmro_plza
-- Los filtros van en el WHERE
WHERE p.pol_tpoplza = 'C'
  AND p.pol_prs_nmro_idntfccion IN (
                                    '800101493',
                                    '800256395',
                                    '900132300',
                                    '39181780',
                                    '890311196',
                                    '900285186',
                                    '1037587363'
    );
;-- -. . -..- - / . -. - .-. -.--
WITH w_crtfcdos
         AS
         (
             SELECT c.cer_nmro_plza,
                    c.cer_nmro_crtfcdo, -- numsecupol
                    c.cer_vlor_prma_nta,
                    c.cer_vlor_iva,
                    c.cer_vlor_prma_ttal,
                    c.cer_fcha_prdccion,
                    to_number(c.cer_cdgo_mnda) AS moneda,
                    c.cer_nmro_aplccion
             FROM crtfcdos c
             WHERE c.cer_fcha_prdccion = (
                 SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
                 FROM fchas_pgo fpg
                 WHERE fpg.fpg_estdo = 'C'
                   AND fpg.marca_cierre_oprcion  = 'S'
             )
               AND c.cer_vlor_prma_ttal > 1
             -- and c.cer_nmro_idntfccion = 800158537
             --AND c.cer_nmro_plza IN (36)

         )
SELECT wc.cer_nmro_plza,
       wc.cer_nmro_crtfcdo, -- numsecupol
       p.pol_prs_tpo_idntfccion,
       p.pol_prs_nmro_idntfccion,
       p.pol_fcha_expdcion,
       wc.cer_fcha_prdccion,
       wc.cer_fcha_prdccion,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_iva,
       wc.cer_vlor_prma_ttal,
       wc.moneda,
       wc.*
FROM plzas p, w_crtfcdos wc
WHERE p.pol_nmro_plza = wc.cer_nmro_plza
  AND p.pol_tpoplza = 'C';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
                    c.cer_nmro_crtfcdo, -- numsecupol
                    c.cer_vlor_prma_nta,
                    c.cer_vlor_iva,
                    c.cer_vlor_prma_ttal,
                    c.cer_fcha_prdccion,
                    to_number(c.cer_cdgo_mnda) AS moneda,
                    c.cer_nmro_aplccion
             FROM crtfcdos c
             WHERE c.cer_fcha_prdccion = (
                 SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
                 FROM fchas_pgo fpg
                 WHERE fpg.fpg_estdo = 'C'
                   AND fpg.marca_cierre_oprcion  = 'S'
             )
               AND c.cer_vlor_prma_ttal > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
       c.cer_nmro_crtfcdo, -- numsecupol
       c.cer_vlor_prma_nta,
       c.cer_vlor_iva,
       c.cer_vlor_prma_ttal,
       c.cer_fcha_prdccion,
       to_number(c.cer_cdgo_mnda) AS moneda,
       c.*
FROM crtfcdos c
WHERE c.cer_fcha_prdccion = (
    SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
    FROM fchas_pgo fpg
    WHERE fpg.fpg_estdo = 'C'
      AND fpg.marca_cierre_oprcion  = 'S'
)
  AND c.cer_vlor_prma_ttal > 1;
;-- -. . -..- - / . -. - .-. -.--
select * from slctdes_estdios
where ses_nmro = 11427731;
;-- -. . -..- - / . -. - .-. -.--
select * from slctdes_estdios;
;-- -. . -..- - / . -. - .-. -.--
select * from slctdes_estdios order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(x.ses_cnon_arrndmnto,0)
     ,nvl(x.ses_cta_admnstrcion,0)
     ,nvl(b.rv_meaning,'')
     ,nvl(a.rv_meaning ,'')
     ,nvl(s.suc_nmbre,'')
FROM slctdes_estdios x
         left join scrsl s  on x.ses_suc_cdgo = s.suc_cdgo
         left join (select x.* from cg_ref_codes x where x.rv_domain like '%DESTINO_INMUEBLE%') b on x.ses_dstno_inmble  = b.rv_low_value
         left join (select x.* from cg_ref_codes x where x.rv_domain like '%TIPO_INMUEBLE%') a on  x.ses_tpo_inmble = a.rv_low_value
WHERE x.ses_nmro=11087595
GROUP by x.ses_nmro,x.ses_cnon_arrndmnto,x.ses_cta_admnstrcion,b.rv_meaning,a.rv_meaning,s.suc_nmbre;
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS where POL_NMRO_PLZA = 249;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= 2
      AND x.arr_tpo_idntfccion = 800043383)
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= 02
      AND x.arr_tpo_idntfccion = 800043383)
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= '02'
      AND x.arr_tpo_idntfccion = 800043383)
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= '2'
      AND x.arr_tpo_idntfccion = 800043383)
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select * from TPOS_IDNTFCCION;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= '13'
      AND x.arr_tpo_idntfccion = 800043383)
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= 800043383
      AND x.arr_tpo_idntfccion = '13')
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select nvl(count(x.sna_nmro_snstro),0)
from avsos_snstros x ,(
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 800043383
      and d.dar_tpo_arrndtrio in ('I','P')) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(DISTINCT x.pes_fcha_pgo),0)
FROM PGOS_EFCTDOS_SNSTROS x where x.pes_nmro_snstro IN(
    select x.sna_nmro_snstro
    from avsos_snstros x ,(
        select d.dar_nmro_slctud, d.dar_fcha_mra
        from ddas_arrndtrios d
        where d.dar_tpo_idntfccion = '13'
          and d.dar_nmro_idntfccion = 800043383
          and d.dar_tpo_arrndtrio in ('I','P')) x1
    where x.sna_nmro_item= x1.dar_nmro_slctud
      and x.sna_fcha_snstro= x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 800043383) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 800043383) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857)
ORDER BY DDP_NMRO_SLCTUD;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
select *
from ddas_vgntes_arrndmntos d
where d.dva_nmro_slctud = 7678063;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM RSLTDO_ESTDIO;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM pgos_efctdos_snstros WHERE PES_NMRO_SNSTRO = 2023087523;
;-- -. . -..- - / . -. - .-. -.--
select * from ADMSISA.CG_REF_CODES where rv_domain = 'ESTADO_SINIESTRO';
;-- -. . -..- - / . -. - .-. -.--
select * from ALL_OBJECTS ao
where ao.object_name LIKE '%CARPETA_UBICACION%';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CARPETA_UBICACION;
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE COD_RAMO = 486 AND NUM_POL1 = 5010000536206;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS where POL_NMRO_PLZA = 1993;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_VLRES R WHERE R.RVV_NMRO_ITEM IN (10143329) ORDER BY RVV_NMRO_ITEM,RVV_FCHA_MDFCCION ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM rsgos_vgntes r where r.RVI_NMRO_ITEM = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CRTFCDOS WHERE CER_CDGO_CRTFCADO = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CRTFCDOS WHERE CER_CDGO_CRTFCADO = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CRTFCDOS WHERE CER_CDGO_CRTFCDO = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CRTFCDOS_DTLLE WHERE CED_CDGO_CRTFCDO = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM EXTRACTOS WHERE EXT_NMRO_ITEM = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CRTFCDOS WHERE CER_CDGO_CRTFCDO = 2142876;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM EXTRACTOS WHERE EXT_NMRO_PLZA = 557;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM DETALLE_EXTRACTOS;
;-- -. . -..- - / . -. - .-. -.--
SELECT A.APR_CDGO_AMPRO, A.APR_TPO_AMPRO
FROM AMPROS_PRDCTO A
WHERE A.APR_RAM_CDGO = 12;
;-- -. . -..- - / . -. - .-. -.--
SELECT A.APR_CDGO_AMPRO, A.APR_TPO_AMPRO, A.*
FROM AMPROS_PRDCTO A
WHERE A.APR_RAM_CDGO = 12;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_ITEM = 10937150;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CG_REF_CODES WHERE RV_DOMAIN= 'ESTADO_SINIESPAGO';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM VLRES_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT parameter, value
FROM nls_database_parameters
WHERE parameter LIKE 'NLS_CHARACTERSET';
;-- -. . -..- - / . -. - .-. -.--
ALTER USER admsisa IDENTIFIED BY admsisa;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CG_REF_CODES WHERE RV_DOMAIN= 'ESTADO_SINIESTRO';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_ITEM = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 7611096
  AND PES_FCHA_PGO = TO_DATE('22/04/2024','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 7611096
  AND PES_FCHA_PGO = TO_DATE('22/04/2024','DD/MM/YYYY')
AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('01-SEP-24', 'DD-MON-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('01-SEP-24'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('01-SEP-24'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('01-SEP-24', 'DD-MON-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT PAR_RFRNCIA FROM PRMTROS WHERE PAR_VLOR1='USER_CARGUE_SIMON';
;-- -. . -..- - / . -. - .-. -.--
SELECT PAR_RFRNCIA FROM PRMTROS WHERE PAR_DSCRPCION='USER_CARGUE_SIMON';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 7611096
  AND PES_FCHA_PGO = TO_DATE('22/04/2024','DD/MM/YYYY')
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('01-SEP-24', 'DD-MON-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('01-SEP-24'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('01-SEP-24'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('01-SEP-24', 'DD-MON-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('21-11-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE FECHA_PAGO = TO_DATE('21-11-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/09/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('17-09-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/08/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('20-08-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE FECHA_CREACION > TO_DATE('15-09-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE FECHA_CREACION > TO_DATE('15-09-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE FECHA_CREACION > TO_DATE('15-09-2025', 'DD-MM-YYYY') NUM_SINI IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE FECHA_CREACION > TO_DATE('15-09-2025', 'DD-MM-YYYY') AND NUM_SINI IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE FECHA_CREACION > TO_DATE('15-09-2025', 'DD-MM-YYYY') AND NUM_SINI IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE  NUM_SINI IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE  NUM_SINI IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('20-08-2024', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_POL1 IN (5010000237206, 5010000536205);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE  NUM_POL1 IN (5010000237206, 5010000536205);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_ERRORES
WHERE FECHA_EJCCION >= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_ERRORES;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM OPS$PUMA.SIM_CARGA_SINIESTROS WHERE NUM_POL1 IN (5010000237206, 5010000536205);
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO = TO_DATE('20-08-2024', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS;
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('22-08-2024', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (2024081378, 2024081379);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('20-08-2024', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('20-08-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('22-08-2024', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (SELECT SNV_NMRO_SNSTRO
                          FROM SNSTROS_NUEVOS
                          WHERE SNV_FCHA_PGO > TO_DATE('20-08-2024', 'DD-MM-YYYY')
                            AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191));
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-08-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-07-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-06-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-05-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-04-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-03-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-02-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-01-2025', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-12-2024', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-11-2024', 'DD-MM-YYYY')
  AND SNV_NMRO_SNSTRO IN (2023083953, 2024030191);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('01-09-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('19-09-2024', 'DD-MM-YYYY')
  AND PES_NMRO_SNSTRO IN (SELECT SNV_NMRO_SNSTRO
                          FROM SNSTROS_NUEVOS
                          WHERE SNV_FCHA_PGO > TO_DATE('01-09-2025', 'DD-MM-YYYY')
                            );
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('19-09-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO > TO_DATE('01-09-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO > TO_DATE('20-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO = TO_DATE('20-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO > TO_DATE('01-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SNSTROS_NUEVOS
WHERE SNV_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
                            );
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_SINI IN (2025067887, 2025067887);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_SINI IN (2025071710, 2025067887);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_LIQUIDACIONES WHERE NUM_SINI IN (2025071710, 2025067887);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_POL1 IN (5010001149708,5010001250704)-;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_POL1 IN (5010001149708,5010001250704);
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT SNV_NMRO_SNSTRO
                          FROM SNSTROS_NUEVOS
                          WHERE SNV_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_SINIESTROS WHERE FECHA_CREACION >= TO_DATE('16/09/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS where POL_NMRO_PLZA = 75272;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS where POL_PRS_NMRO_IDNTFCCION = 1019009832;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    'INS12345 POLIZAS_SIMON (' ||
    'SECUENCIA, ' ||
    'COD_CIA, ' ||
    'COD_SECC, ' ||
    'COD_RAMO, ' ||
    'TIPO_MOVIMIENTO, ' ||
    'NUM_END, ' ||
    'COD_RIES, ' ||
    'NUM_SECU_POL, ' ||
    'POLIZA_SIMON, ' ||
    'TIPO_POLIZA, ' ||
    'FECHA_MOVIMIENTO, ' ||
    'FECHA_INICIO_VIGENCIA, ' ||
    'FECHA_FINAL_VIGENCIA, ' ||
    'ANUALIDAD, ' ||
    'SOLICITUD, ' ||
    'DIRECCION_RIESGO, ' ||
    'CIUDAD, ' ||
    'CLAVE, ' ||
    'LOCALIDAD, ' ||
    'VALOR_GASTOS, ' ||
    'ESTADO_CARGUE_SIMON, ' ||
    'ESTADO_CARGUE_SAI, ' ||
    'FECHA_CARGUE, ' ||
    'FECHA_CREACION, ' ||
    'USUARIO_CREACION, ' ||
    'COD_END, ' ||
    'SUB_COD_END, ' ||
    'TIPO_END, ' ||
    'OBSERVACION_SIMON, ' ||
    'OBSERVACION_SAI, ' ||
    'TIPO_DOCUMENTO, ' ||
    'NUMERO_DOCUMENTO, ' ||
    'NUM_POL_ANT, ' ||
    'RENOVADA_POR, ' ||
    'FEC_ANU_POL, ' ||
    'FEC_ANU_END, ' ||
    'MCA_PROVISORIO, ' ||
    'FECHA_EMI_END, ' ||
    'FECHA_VIG_END, ' ||
    'FECHA_VENC_END, ' ||
    'VALOR_PRIMA, ' ||
    'VALOR_IVA, ' ||
    'FECHA_MODIFICACION, ' ||
    'NUM_POL_COTIZACION' ||
    ') VALUES (' ||
    NVL(TO_CHAR(SECUENCIA), 'NULL') || ', ' ||
    NVL(TO_CHAR(COD_CIA), 'NULL') || ', ' ||
    NVL(TO_CHAR(COD_SECC), 'NULL') || ', ' ||
    NVL(TO_CHAR(COD_RAMO), 'NULL') || ', ' ||
    CASE
        WHEN TIPO_MOVIMIENTO IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(TIPO_MOVIMIENTO, '''', '''''') || ''''
        END || ', ' ||
    NVL(TO_CHAR(NUM_END), 'NULL') || ', ' ||
    NVL(TO_CHAR(COD_RIES), 'NULL') || ', ' ||
    NVL(TO_CHAR(NUM_SECU_POL), 'NULL') || ', ' ||
    NVL(TO_CHAR(POLIZA_SIMON), 'NULL') || ', ' ||
    CASE
        WHEN TIPO_POLIZA IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(TIPO_POLIZA, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN FECHA_MOVIMIENTO IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_MOVIMIENTO, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FECHA_INICIO_VIGENCIA IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_INICIO_VIGENCIA, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FECHA_FINAL_VIGENCIA IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_FINAL_VIGENCIA, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    NVL(TO_CHAR(ANUALIDAD), 'NULL') || ', ' ||
    NVL(TO_CHAR(SOLICITUD), 'NULL') || ', ' ||
    CASE
        WHEN DIRECCION_RIESGO IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(DIRECCION_RIESGO, '''', '''''') || ''''
        END || ', ' ||
    NVL(TO_CHAR(CIUDAD), 'NULL') || ', ' ||
    CASE
        WHEN CLAVE IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(CLAVE, '''', '''''') || ''''
        END || ', ' ||
    NVL(TO_CHAR(LOCALIDAD), 'NULL') || ', ' ||
    NVL(TO_CHAR(VALOR_GASTOS), 'NULL') || ', ' ||
    CASE
        WHEN ESTADO_CARGUE_SIMON IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(ESTADO_CARGUE_SIMON, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN ESTADO_CARGUE_SAI IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(ESTADO_CARGUE_SAI, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN FECHA_CARGUE IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_CARGUE, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FECHA_CREACION IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_CREACION, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN USUARIO_CREACION IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(USUARIO_CREACION, '''', '''''') || ''''
        END || ', ' ||
    NVL(TO_CHAR(COD_END), 'NULL') || ', ' ||
    NVL(TO_CHAR(SUB_COD_END), 'NULL') || ', ' ||
    CASE
        WHEN TIPO_END IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(TIPO_END, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN OBSERVACION_SIMON IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(OBSERVACION_SIMON, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN OBSERVACION_SAI IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(OBSERVACION_SAI, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN TIPO_DOCUMENTO IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(TIPO_DOCUMENTO, '''', '''''') || ''''
        END || ', ' ||
    NVL(TO_CHAR(NUMERO_DOCUMENTO), 'NULL') || ', ' ||
    NVL(TO_CHAR(NUM_POL_ANT), 'NULL') || ', ' ||
    CASE
        WHEN RENOVADA_POR IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(RENOVADA_POR, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN FEC_ANU_POL IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FEC_ANU_POL, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FEC_ANU_END IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FEC_ANU_END, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN MCA_PROVISORIO IS NULL THEN 'NULL'
        ELSE '''' || REPLACE(MCA_PROVISORIO, '''', '''''') || ''''
        END || ', ' ||
    CASE
        WHEN FECHA_EMI_END IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_EMI_END, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FECHA_VIG_END IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_VIG_END, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    CASE
        WHEN FECHA_VENC_END IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_VENC_END, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    NVL(TO_CHAR(VALOR_PRIMA), 'NULL') || ', ' ||
    NVL(TO_CHAR(VALOR_IVA), 'NULL') || ', ' ||
    CASE
        WHEN FECHA_MODIFICACION IS NULL THEN 'NULL'
        ELSE 'TO_DATE(''' || TO_CHAR(FECHA_MODIFICACION, 'DD/MM/YYYY HH24:MI:SS') || ''', ''DD/MM/YYYY HH24:MI:SS'')'
        END || ', ' ||
    NVL(TO_CHAR(NUM_POL_COTIZACION), 'NULL') ||
    ');' AS INSERT_STATEMENT
FROM POLIZAS_SIMON
WHERE POLIZA_SIMON = 5010002294202;
;-- -. . -..- - / . -. - .-. -.--
select d.ddp_cncpto, d.ddp_vlor_dda, d.ddp_vlor_pgdo, d.ddp_orgen, d.ddp_fcha_dsde, d.ddp_fcha_hsta
from ddas_plzas d
where d.ddp_nmro_slctud  =6463728;
;-- -. . -..- - / . -. - .-. -.--
select d.ddp_cncpto, d.ddp_vlor_dda, d.ddp_vlor_pgdo, d.ddp_orgen, d.ddp_fcha_dsde, d.ddp_fcha_hsta, d.DDP_SERIE
from ddas_plzas d
where d.ddp_nmro_slctud  =6463728
  and d.ddp_fcha_mra = to_date('01/07/2024','dd/mm/yyyy');
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON;
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON);
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON
         AND P.FECHA_CARGUE = TRUNC(SYSDATE));
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON
         AND P.COD_CIA = 3
         AND P.COD_SECC = 37
         AND P.COD_RAMO = 486
         AND P.FECHA_CARGUE = TRUNC(SYSDATE));
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = 5010002294202
         AND P.COD_CIA = 3
         AND P.COD_SECC = 37
         AND P.COD_RAMO = 486
         AND P.FECHA_CARGUE = TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = 5010002294202
         AND COD_CIA = 3
         AND COD_SECC = 37
         AND COD_RAMO = 486
         AND FECHA_CARGUE = TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = 5010002294202
         AND COD_CIA = 3
         AND COD_SECC = 37
         AND COD_RAMO = 486
         AND FECHA_CARGUE = TRUNC(SYSDATE));
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO, POLIZA_SIMON
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON
         AND P.FECHA_CARGUE = TRUNC(SYSDATE));
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO, POLIZA_SIMON
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON);
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022942%';
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO, POLIZA_SIMON
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  --AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TO_DATE(SYSDATE,'YYYY-MM-DD')
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.FECHA_CARGUE = TRUNC(SYSDATE)
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where t.poliza_simon = 5010002294202;
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002303701%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100023037%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  --and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100023037%';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM COBERTURAS_SIMON;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL=29828220078;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO POLIZAS_SIMON (SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES, NUM_SECU_POL,
                           POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA, FECHA_FINAL_VIGENCIA,
                           ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE, LOCALIDAD, VALOR_GASTOS,
                           ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE, FECHA_CREACION, USUARIO_CREACION,
                           COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON, OBSERVACION_SAI, TIPO_DOCUMENTO,
                           NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR, FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO,
                           FECHA_EMI_END, FECHA_VIG_END, FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION,
                           NUM_POL_COTIZACION)
VALUES (86305, 3, 37, 486, '3', 0, 1, 29828220079, 5010002294203, 'I', DATE '2025-06-27', DATE '2026-07-23',
        DATE '2027-07-23', 2, 11146511, 'CL 19 N 9 50 P 3 AP 1004', 25175, '75272', 11001, 0, 'C', null,
        DATE '2025-09-23', DATE '2025-06-27', 'OPS$B9143145', null, null, null, 'Fue actualizado Registro: 27/06/2025',
        null, 'CC', 1019009832, 5010002294202, null, null, null, 'N', null, DATE '2026-07-23', DATE '2027-07-23',
        567000.00, 107730.00, null, null);
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  --and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002294203%';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL in (29828220078, 29808836944);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO COBERTURAS_SIMON (SECUENCIA, SECUENCIA_COBERTURA, NUM_SECU_POL, CODIGO_COBERTURA, VALOR_ASEGURADO,
                              VALOR_PRIMA, TASA, FECHA_CREACION, USUARIO_CREACION)
VALUES (86305, 310697, 29828220079, '716', 20200000.00, 567000.00, 3.50, TIMESTAMP '2025-06-27 23:48:28', 'SYS');
;-- -. . -..- - / . -. - .-. -.--
SELECT P.SECUENCIA,
       P.ESTADO_CARGUE_SAI
INTO P_SECUENCIA_ANT,
    L_EST_CARG_SAI
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002294202%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%TRG_RGOS_RCBOS_AUX_POL_IND%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%TRG_RGOS_RCBOS_AUX_POL_IND%'
  AND E.ERP_FECHA_CREA >= TO_DATE('01/06/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100022942);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL in (29828220078, 29828220079);
;-- -. . -..- - / . -. - .-. -.--
select * from CNCPTOS_DTLLE_RCBOS;
;-- -. . -..- - / . -. - .-. -.--
select * from CNCPTOS_DTLLE_RCBOS where CDR_CDGO_CNCPTO = 'HON';
;-- -. . -..- - / . -. - .-. -.--
select * from CNCPTOS_DTLLE_RCBOS where CDR_CDGO_CNCPTO = 'HON' AND DDP_NMRO_SLCTUD = 7083044;
;-- -. . -..- - / . -. - .-. -.--
select * from CNCPTOS_DTLLE_RCBOS where CDR_CDGO_CNCPTO = 'HON' AND CDR_RFRNCIA LIKE '7083044%';
;-- -. . -..- - / . -. - .-. -.--
select * from CNCPTOS_DTLLE_RCBOS where CDR_CDGO_CNCPTO IN ('HON','CUO') AND CDR_RFRNCIA LIKE '7083044%';
;-- -. . -..- - / . -. - .-. -.--
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
    7610874
    )
  AND S.FECHA_PAGO >= TO_DATE('01/01/2024','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from avsos_snstros a, ddas_vgntes_arrndmntos d
where a.sna_estdo_snstro = '03'
  and a.sna_estdo_pgo='02'
  and a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from avsos_snstros a, ddas_vgntes_arrndmntos d
where a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
  and a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from avsos_snstros a, ddas_vgntes_arrndmntos d
where --a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
 a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
select a.SNA_ESTDO_SNSTRO, a.SNA_ESTDO_PGO d.DVA_FCHA_MRA, a.*
from avsos_snstros a, ddas_vgntes_arrndmntos d
where --a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
 a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
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
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM avsos_snstros WHERE SNA_NMRO_ITEM IN (7610874);
;-- -. . -..- - / . -. - .-. -.--
select a.SNA_ESTDO_SNSTRO, a.SNA_ESTDO_PGO, d.DVA_FCHA_MRA, a.*
from avsos_snstros a, ddas_vgntes_arrndmntos d
where --a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
 a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7610874
    );
;-- -. . -..- - / . -. - .-. -.--
SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL)
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 10220059
  AND TRUNC(SNA_FCHA_SNSTRO) = TO_DATE('01/10/2023', 'DD/MM/YYYY') --P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;
;-- -. . -..- - / . -. - .-. -.--
SELECT DVA_FCHA_DSCPCION, DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS, AMPROS_SNSTROS
WHERE  DVA_ESTDO = '01' AND
    DVA_NMRO_SLCTUD = 7610874 AND AMS_CDGO_AMPRO(+) = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT DVA_FCHA_DSCPCION, DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS, AMPROS_SNSTROS
WHERE DVA_NMRO_SLCTUD = 7610874 AND DVA_ESTDO = '01' AND
    DVA_NMRO_SLCTUD = AMS_NMRO_ITEM(+) AND
    DVA_FCHA_MRA = TO_DATE('16/07/2025','DD/MM/YYYY') AND AMS_CDGO_AMPRO(+) = '01';
;-- -. . -..- - / . -. - .-. -.--
select * from AMPROS_SNSTROS where AMS_NMRO_SNSTRO = 2025072589;
;-- -. . -..- - / . -. - .-. -.--
select * from DDAS_VGNTES_ARRNDMNTOS where DVA_NMRO_SLCTUD = 7610874 AND DVA_FCHA_MRA = TO_DATE('16/07/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(8)
FROM PLZAS
WHERE POL_NMRO_PLZA = 145581
  AND NVL(POL_POLIZA_SIMON,0) = 0;
;-- -. . -..- - / . -. - .-. -.--
select max(a.sna_fcha_snstro)
from avsos_snstros a, ampros_snstros m
where a.sna_nmro_item = 7610874
  and a.sna_nmro_snstro=m.ams_nmro_snstro
  and m.ams_cdgo_ampro='01';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PLZAS
WHERE POL_NMRO_PLZA = 145581;
;-- -. . -..- - / . -. - .-. -.--
SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL),SNA_FCHA_SNSTRO
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 7610874
  --AND SNA_FCHA_SNSTRO = P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;
;-- -. . -..- - / . -. - .-. -.--
SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL),SNA_FCHA_SNSTRO
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 7613324
  --AND SNA_FCHA_SNSTRO = P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;
;-- -. . -..- - / . -. - .-. -.--
select a.SNA_ESTDO_SNSTRO, a.SNA_ESTDO_PGO, d.DVA_FCHA_MRA, a.*
from avsos_snstros a, ddas_vgntes_arrndmntos d
where --a.sna_estdo_snstro = '03'
  --and a.sna_estdo_pgo='02'
 a.sna_nmro_item = d.dva_nmro_slctud
  and a.sna_fcha_snstro = d.dva_fcha_mra
  AND A.SNA_NMRO_ITEM IN (
    7613324
    );
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002376101%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100023761%';
;-- -. . -..- - / . -. - .-. -.--
select max(a.sna_fcha_snstro)
from avsos_snstros a, ampros_snstros m
where a.sna_nmro_item = 11202600
  and a.sna_nmro_snstro=m.ams_nmro_snstro
  and m.ams_cdgo_ampro='01';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PGOS_EFCTDOS_SNSTROS WHERE PES_NMRO_SNSTRO IN (2025063841);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PGOS_EFCTDOS_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT SNA_NMRO_SNSTRO,SNA_ESTDO_SNSTRO, SNA_CLSE_PLZA,
       SNA_RAM_CDGO,SNA_NMRO_PLZA, SNA_ESTDO_PGO,AMS_CDGO_AMPRO,
       POL_TPOPLZA,TRUNC(POL_FCHA_HSTA_ACTUAL),SNA_FCHA_SNSTRO
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE SNA_NMRO_ITEM = 11202600
  --AND SNA_FCHA_SNSTRO = P_FECHA_MORA
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SIM_CARGA_LIQUIDACIONES_HI
WHERE NUM_POL1 IN (5010001410602, 5010001586302);
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_ERRORES
where secuencia_origen IN (1910795);
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_ERRORES_HI
where secuencia_origen IN (1910795);
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100025638%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100025638%'
  ORDER BY ERP_FECHA_CREA ASC;
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
 -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100025638%'
  ORDER BY ERP_FECHA_CREA DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT w.SOLICITUD            Solicitud
     , w.FEC_DILIGENCIA       Fecha_radicacion
     , rcb.rcc_nmro_rcbo      Liquidacion
     , rcb.RCC_FCHA_RCBO      Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC      recibo_caja_tronador
     , rcb.RCC_VLOR_RCBO      valor_recibo
     , r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado               Estado_cierre
     , e.nro_factura_dian     factura_DIAN
     , e.SUCURSAL             sucursal
     , e.TDOC_TERCERO         tipo_documento
     , e.NRO_DOCUMTO          numero_documento
     , o.CODIGO_TRANSACCION_PSE
     , l.CODIGO_BARRAS
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/04/2025', 'dd/mm/yyyy');
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),

       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),
       PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                      DAR_TPO_IDNTFCCION) PRS_NMBRE,
       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                        DAR_TPO_IDNTFCCION),
         'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    MAX(DAR_TPO_ARRNDTRIO),
    PRS_NMBRE, -- Usamos el resultado pre-calculado
    'N',
    MAX(DAR_FCHA_MRA)
FROM (
         -- ---- INICIO DE LA SUBCONSULTA ----
         -- Aquí se calcula la función UNA SOLA VEZ
         SELECT
             DAR_NMRO_IDNTFCCION,
             DAR_TPO_IDNTFCCION,
             DAR_TPO_ARRNDTRIO,
             PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION, DAR_TPO_IDNTFCCION) AS PRS_NMBRE,
             DAR_FCHA_MRA
         FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
         WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
                DAR_TPO_ARRNDTRIO IN ('I') AND
                DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
                DVA_FCHA_MRA = DAR_FCHA_MRA)
           AND EXISTS (SELECT 1
                       FROM DDAS_PLZAS
                       WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                         AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                         AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                         AND DDP_FCHA_MRA = DAR_FCHA_MRA)
           AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                               WHERE DAR_NMRO_SLCTUD = 7162936)
         -- ---- FIN DE LA SUBCONSULTA ----
     ) DATOS_PRECALCULADOS
GROUP BY
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    PRS_NMBRE, -- Agrupamos por el resultado que ya tenemos
    'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    MAX(DAR_TPO_ARRNDTRIO),
    PRS_NMBRE, -- Usamos el resultado pre-calculado
    'N',
    MAX(DAR_FCHA_MRA)
FROM (
         -- ---- INICIO DE LA SUBCONSULTA ----
         -- Aquí se calcula la función UNA SOLA VEZ
         SELECT
             DAR_NMRO_IDNTFCCION,
             DAR_TPO_IDNTFCCION,
             DAR_TPO_ARRNDTRIO,
             PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION, DAR_TPO_IDNTFCCION) AS PRS_NMBRE,
             DAR_FCHA_MRA
         FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
         WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
                DAR_TPO_ARRNDTRIO IN ('I') AND
                DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
                DVA_FCHA_MRA = DAR_FCHA_MRA)
           AND EXISTS (SELECT 1
                       FROM DDAS_PLZAS
                       WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                         AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                         AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                         AND DDP_FCHA_MRA = DAR_FCHA_MRA)
           AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                               WHERE DAR_NMRO_SLCTUD = 7162936)
         -- ---- FIN DE LA SUBCONSULTA ----
     ) DATOS_PRECALCULADOS
GROUP BY
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    --PRS_NMBRE, -- Agrupamos por el resultado que ya tenemos
    'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT
             DAR_NMRO_IDNTFCCION,
             DAR_TPO_IDNTFCCION,
             DAR_TPO_ARRNDTRIO,
             PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION, DAR_TPO_IDNTFCCION) AS PRS_NMBRE,
             DAR_FCHA_MRA
         FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
         WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
                DAR_TPO_ARRNDTRIO IN ('I') AND
                DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
                DVA_FCHA_MRA = DAR_FCHA_MRA)
           AND EXISTS (SELECT 1
                       FROM DDAS_PLZAS
                       WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                         AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                         AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                         AND DDP_FCHA_MRA = DAR_FCHA_MRA)
           AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                               WHERE DAR_NMRO_SLCTUD = 7162936);
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),
       PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                      DAR_TPO_IDNTFCCION) PRS_NMBRE,
       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         'N';
;-- -. . -..- - / . -. - .-. -.--
select * from PRVSION_PRMAS where PRO_FCHA_CRCION > to_date('2025-05-01', 'YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
select * from PRVSION_PRMAS where PRO_FCHA_CRCION > to_date('2025-09-01', 'YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
Select *
from Rsgos_Rcbos_Nvdad
where ren_cdgo_ampro = 05
  and ren_nmro_item = 10407807
  and ren_nmro_plza = 139384
  and ren_clse_plza = 00
  and ren_ram_cdgo = 12
  and ren_nmro_crtfcdo = 2069421
  and ren_tpo_nvdad = '02';
;-- -. . -..- - / . -. - .-. -.--
Select *
from Rsgos_Rcbos_Nvdad
where ren_cdgo_ampro = 05
  and ren_nmro_item = 10407807
  and ren_nmro_plza = 139384;
;-- -. . -..- - / . -. - .-. -.--
WITH w_crtfcdos
         AS
         (
             SELECT c.cer_nmro_plza,
                    c.cer_nmro_crtfcdo, -- numsecupol
                    c.cer_vlor_prma_nta,
                    c.cer_vlor_iva,
                    c.cer_vlor_prma_ttal,
                    c.cer_fcha_prdccion,
                    to_number(c.cer_cdgo_mnda) AS moneda,
                    c.cer_nmro_aplccion
             FROM crtfcdos c
             WHERE c.cer_fcha_prdccion = (
                 SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
                 FROM fchas_pgo fpg
                 WHERE fpg.fpg_estdo = 'C'
                   AND fpg.marca_cierre_oprcion  = 'S'
             )
               AND c.cer_vlor_prma_ttal > 1
             -- and c.cer_nmro_idntfccion = 800158537
             --AND c.cer_nmro_plza IN (36)

         )
SELECT wc.cer_nmro_plza,
       wc.cer_nmro_crtfcdo, -- numsecupol
       p.pol_prs_tpo_idntfccion,
       p.pol_prs_nmro_idntfccion,
       p.pol_fcha_expdcion,
       wc.cer_fcha_prdccion,
       wc.cer_fcha_prdccion,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_iva,
       wc.cer_vlor_prma_ttal,
       wc.moneda,
       wc.cer_nmro_aplccion
FROM plzas p, w_crtfcdos wc
WHERE p.pol_nmro_plza = wc.cer_nmro_plza
  AND p.pol_tpoplza = 'C';
;-- -. . -..- - / . -. - .-. -.--
WITH w_crtfcdos
         AS
         (
             SELECT c.cer_nmro_plza,
                    c.cer_nmro_crtfcdo, -- numsecupol
                    c.cer_vlor_prma_nta,
                    c.cer_vlor_iva,
                    c.cer_vlor_prma_ttal,
                    c.cer_fcha_prdccion,
                    to_number(c.cer_cdgo_mnda) AS moneda,
                    c.cer_nmro_aplccion
             FROM crtfcdos c
             WHERE c.cer_fcha_prdccion = (
                 SELECT TRUNC(MAX(fpg.fpg_fcha_pgo),'MM')
                 FROM fchas_pgo fpg
                 WHERE fpg.fpg_estdo = 'C'
                   AND fpg.marca_cierre_oprcion  = 'S'
             )
               AND c.cer_vlor_prma_ttal > 1
               and c.cer_nmro_idntfccion = 811009986
             --AND c.cer_nmro_plza IN (36)

         )
SELECT wc.cer_nmro_plza,
       wc.cer_nmro_crtfcdo, -- numsecupol
       p.pol_prs_tpo_idntfccion,
       p.pol_prs_nmro_idntfccion,
       p.pol_fcha_expdcion,
       wc.cer_fcha_prdccion,
       wc.cer_fcha_prdccion,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_prma_nta,
       wc.cer_vlor_iva,
       wc.cer_vlor_prma_ttal,
       wc.moneda,
       wc.cer_nmro_aplccion
FROM plzas p, w_crtfcdos wc
WHERE p.pol_nmro_plza = wc.cer_nmro_plza
  AND p.pol_tpoplza = 'C';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
       c.cer_nmro_crtfcdo, -- numsecupol
       c.cer_vlor_prma_nta,
       c.cer_vlor_iva,
       c.cer_vlor_prma_ttal,
       c.cer_fcha_prdccion,
       to_number(c.cer_cdgo_mnda) AS moneda,
       c.*
FROM crtfcdos c
WHERE  c.cer_nmro_idntfccion = 811009986;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
       c.cer_nmro_crtfcdo, -- numsecupol
       c.cer_vlor_prma_nta,
       c.cer_vlor_iva,
       c.cer_vlor_prma_ttal,
       c.cer_fcha_prdccion,
       to_number(c.cer_cdgo_mnda) AS moneda,
       c.*
FROM crtfcdos c
WHERE  c.cer_nmro_idntfccion = 811009986
      and CER_FCHA_PRDCCION >= TO_DATE('01/07/2025', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
       c.cer_nmro_crtfcdo, -- numsecupol
       c.cer_vlor_prma_nta,
       c.cer_vlor_iva,
       c.cer_vlor_prma_ttal,
       c.cer_fcha_prdccion,
       to_number(c.cer_cdgo_mnda) AS moneda,
       c.*
FROM crtfcdos c
WHERE  c.cer_nmro_idntfccion = 811009986
  AND c.cer_vlor_prma_ttal > 1
      and CER_FCHA_PRDCCION >= TO_DATE('01/07/2025', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT c.cer_nmro_plza,
       c.cer_nmro_crtfcdo, -- numsecupol
       c.cer_vlor_prma_nta,
       c.cer_vlor_iva,
       c.cer_vlor_prma_ttal,
       c.cer_fcha_prdccion,
       to_number(c.cer_cdgo_mnda) AS moneda,
       c.*
FROM crtfcdos c
WHERE  c.cer_nmro_idntfccion = 811009986
  --AND c.cer_vlor_prma_ttal > 1
      and CER_FCHA_PRDCCION >= TO_DATE('01/07/2025', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SLCTDES_ESTDIOS WHERE SES_NMRO in (11140736);
;-- -. . -..- - / . -. - .-. -.--
select * from AEW_DEUDORES;
;-- -. . -..- - / . -. - .-. -.--
select * from AEW_DEUDORES where FECHA_EXPEDICION is not null;
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01/01/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/01/2024', 'DD/MM/YYYY')
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
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('01/01/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/01/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
select * from SLCTDES_ESTDIOS where SOLICITUD = 11181238;
;-- -. . -..- - / . -. - .-. -.--
select * from SLCTDES_ESTDIOS;
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
WHERE W.COD_INMOBILIARIA = 402
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
      -- TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
WHERE W.COD_INMOBILIARIA = 402
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE W.COD_INMOBILIARIA = 402
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT W.SOLICITUD AS SOLICITUD,
       W.COD_INMOBILIARIA AS POLIZA,
       D.NUM_DOCUMENTO AS IDENTIFICACION_INQUILINO,
       D.TIP_DOCUMENTO AS TIPO_IDENTIFICACION,
       D.PNOMBRE||' '||D.SNOMBRE||' '||D.PAPELLIDO||' '||D.SAPELLIDO AS NOMBRE_INQUILINO,
       D.CORREO AS CORREO_INQUILINO ,
       D.NUM_TELEFONO AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE W.COD_INMOBILIARIA = 402
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/08/2024', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       TO_CHAR(D.FECHA_EXPEDICION, 'YYYY-MM-DD') AS FECHA_EXPEDICION,
       S.SES_CNON_ARRNDMNTO AS CANON,
       S.SES_CTA_ADMNSTRCION AS CUOTA,
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       DIR.DI_DIVPOL_CODIGO AS CODIGO_CIUDAD_INMUEBLE,  -- Temporalmente sin JOIN a DIVISION_POLITICAS
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') AS FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') AS FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03')
         INNER JOIN ARRNDTRIOS A ON S.SES_NMRO = A.ARR_NMRO_SLCTUD
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN = 'DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/08/2024', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT S.SES_NMRO AS SOLICITUD,
       S.SES_NMRO_PLZA AS POLIZA,
       A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
       A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
       PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
       DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO,
       DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
       D.INGRESOS,
       D.FECHA_EXPEDICION,
       S.SES_CNON_ARRNDMNTO AS CANON,
       S.SES_CTA_ADMNSTRCION AS CUOTA,
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       DIR.DI_DIVPOL_CODIGO AS CODIGO_CIUDAD_INMUEBLE,  -- Temporalmente sin JOIN a DIVISION_POLITICAS
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') AS FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') AS FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03')
         INNER JOIN ARRNDTRIOS A ON S.SES_NMRO = A.ARR_NMRO_SLCTUD
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN = 'DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/08/2024', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
WHERE S.SES_NMRO_PLZA = 402
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
WHERE W.COD_INMOBILIARIA = 402
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
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
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
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
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('10/08/2024', 'DD/MM/YYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15/08/2024', 'DD/MM/YYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
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
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
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
       TO_CHAR(W.FEC_DILIGENCIA,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
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
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
select * from SLCTDES_ESTDIOS where SES_NMRO = 11181238;
;-- -. . -..- - / . -. - .-. -.--
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
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 135
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01/08/2024', 'DD/MM/YYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15/08/2024', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
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
       TO_CHAR(W.FEC_DILIGENCIA,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
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
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
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
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 135
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01082024', 'DDMMYYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15082024', 'DDMMYYYY')
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
       TO_CHAR(W.FEC_DILIGENCIA,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM AEW_ESTUDIOS W
         LEFT JOIN AEW_DEUDORES D ON W.SOLICITUD = D.SOLICITUD AND D.TIPO = 'I'
         INNER JOIN DIVISION_POLITICAS P ON  W.CIUDAD = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON W.DESTINO = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE W.COD_INMOBILIARIA = 135
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('01082024', 'DDMMYYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15082024', 'DDMMYYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
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
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 135
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01092024', 'DDMMYYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15092024', 'DDMMYYYY')
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
       TO_CHAR(W.FEC_DILIGENCIA,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM AEW_ESTUDIOS W
         LEFT JOIN AEW_DEUDORES D ON W.SOLICITUD = D.SOLICITUD AND D.TIPO = 'I'
         INNER JOIN DIVISION_POLITICAS P ON  W.CIUDAD = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON W.DESTINO = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE W.COD_INMOBILIARIA = 135
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('01082024', 'DDMMYYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15082024', 'DDMMYYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
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
       DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
       C.RV_MEANING AS DESTINO_INMUEBLE,
       P.NOMBRE AS CIUDAD_INMUEBLE,
       E.NOMBRE_ASESOR,
       E.CORREO_ASESOR,
       DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
       TO_CHAR(S.SES_FCHA_INGRSO,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(RES.RET_FCHA_RSLTDO,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM SLCTDES_ESTDIOS S
         LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
         LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
         INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
         INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
         INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
         INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE S.SES_NMRO_PLZA = 135
  AND TRUNC(S.SES_FCHA_INGRSO) >= TO_DATE('01092024', 'DDMMYYYY')
  AND TRUNC(S.SES_FCHA_INGRSO) <= TO_DATE('15092024', 'DDMMYYYY')
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
       TO_CHAR(W.FEC_DILIGENCIA,'DD/MM/YYYY HH24:MI:SS') FECHA_RADICACION,
       TO_CHAR(W.FEC_MODIFICA,'DD/MM/YYYY HH24:MI:SS') FECHA_RESULTADO
FROM AEW_ESTUDIOS W
         LEFT JOIN AEW_DEUDORES D ON W.SOLICITUD = D.SOLICITUD AND D.TIPO = 'I'
         INNER JOIN DIVISION_POLITICAS P ON  W.CIUDAD = P.CODIGO_CODAZZI
         INNER JOIN CG_REF_CODES C ON W.DESTINO = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
WHERE W.COD_INMOBILIARIA = 135
  AND TRUNC(W.FEC_DILIGENCIA) >= TO_DATE('01022024', 'DDMMYYYY')
  AND TRUNC(W.FEC_DILIGENCIA) <= TO_DATE('15022024', 'DDMMYYYY')
  AND NOT EXISTS (SELECT *
                  FROM RSLTDOS_ARRNDTRIOS T
                  WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                    AND T.REA_TPO_RSLTDO='D')
  AND NOT EXISTS (SELECT *
                  FROM SLCTDES_ESTDIOS S
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
select a.FECHA_EXPEDICION, a.*
from AEW_DEUDORES a
where FECHA_EXPEDICION is not null;
;-- -. . -..- - / . -. - .-. -.--
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
                  WHERE S.SES_NMRO = W.SOLICITUD);
;-- -. . -..- - / . -. - .-. -.--
select * from PRVSION_PRMAS where PRO_FCHA_CRCION > to_date('2025-07-01', 'YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_FCHA_CRCION > to_date('2025-07-01', 'YYYY-MM-DD')
  and PRO_NMRO_CRTFCDO in (2175756,
                           2175786,
                           2175799,
                           2175889,
                           2175905,
                           2175913,
                           2176189,
                           2176192,
                           2173887,
                           2173892,
                           2173914,
                           2173927,
                           2173928,
                           2173960,
                           2174012,
                           2174114,
                           2174213,
                           2174250,
                           2174252,
                           2174275,
                           2170349,
                           2174344,
                           2174373,
                           2174424,
                           2174450,
                           2174508,
                           2174567,
                           2174579,
                           2174601,
                           2175455,
                           2175515,
                           2175524,
                           2175531,
                           2171536,
                           2175536,
                           2175540,
                           2171566,
                           2175566,
                           2171610,
                           2175610,
                           2175695,
                           2175205,
                           2175245,
                           2175315,
                           2175337,
                           2171343,
                           2175340,
                           2175417,
                           2174970,
                           2174996,
                           2175008,
                           2175010,
                           2175088
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where  PRO_NMRO_CRTFCDO in (2175756,
                           2175786,
                           2175799,
                           2175889,
                           2175905,
                           2175913,
                           2176189,
                           2176192,
                           2173887,
                           2173892,
                           2173914,
                           2173927,
                           2173928,
                           2173960,
                           2174012,
                           2174114,
                           2174213,
                           2174250,
                           2174252,
                           2174275,
                           2170349,
                           2174344,
                           2174373,
                           2174424,
                           2174450,
                           2174508,
                           2174567,
                           2174579,
                           2174601,
                           2175455,
                           2175515,
                           2175524,
                           2175531,
                           2171536,
                           2175536,
                           2175540,
                           2171566,
                           2175566,
                           2171610,
                           2175610,
                           2175695,
                           2175205,
                           2175245,
                           2175315,
                           2175337,
                           2171343,
                           2175340,
                           2175417,
                           2174970,
                           2174996,
                           2175008,
                           2175010,
                           2175088
    );
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from PRVSION_PRMAS;
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_NMRO_CRTFCDO = 2034109;
;-- -. . -..- - / . -. - .-. -.--
select * from intrfaz_cntble where inc_dcmnto = '2034109';
;-- -. . -..- - / . -. - .-. -.--
select * from intrfaz_cntble where inc_dcmnto = '2177655';
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS;
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS;
;-- -. . -..- - / . -. - .-. -.--
select TRUNC(SYSDATE) from dual;
;-- -. . -..- - / . -. - .-. -.--
SELECT /*+ LEADING(PP) USE_NL(P) INDEX(P POL_PK) */
    PP.PRO_NMRO_CRTFCDO AS CERTIFICADO,
    PP.PRO_NMRO_PLZA AS POLIZA,
    PP.PRO_CLSE_PLZA AS CLASE,
    PP.PRO_RAM_CDGO AS RAMO,
    PP.PRO_FCHA_PRVSION AS FEC_PROVISION,
    PP.PRO_VLOR AS VALOR,
    P.POL_PRS_TPO_IDNTFCCION AS TIP_IDE,
    P.POL_PRS_NMRO_IDNTFCCION AS IDE,
    UPPER(PK_TERCEROS.F_NOMBRES(P.POL_PRS_NMRO_IDNTFCCION, P.POL_PRS_TPO_IDNTFCCION)) AS NOMBRE
FROM PRVSION_PRMAS PP
         INNER JOIN PLZAS P
                    ON PP.PRO_NMRO_PLZA = P.POL_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = P.POL_CDGO_CLSE
                        AND PP.PRO_RAM_CDGO = P.POL_RAM_CDGO
WHERE PP.PRO_FCHA_CRCION <= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_FCHA_CRCION > to_date('2025-07-01', 'YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT /*+ LEADING(PP) USE_NL(P C) INDEX(P POL_PK) INDEX(C CER_PK) */
    PP.PRO_NMRO_PLZA AS POLIZA,
    P.POL_PRS_NMRO_IDNTFCCION AS IDENTIFICACION,
    UPPER(PK_TERCEROS.F_NOMBRES(P.POL_PRS_NMRO_IDNTFCCION, P.POL_PRS_TPO_IDNTFCCION)) AS NOMBRE,
    PP.PRO_NMRO_CRTFCDO AS CERTIFICADO,
    C.CER_FCHA_DSDE_ACTUAL AS FECHA_CER,
    PP.PRO_VLOR
FROM PRVSION_PRMAS PP
         INNER JOIN PLZAS P
                    ON PP.PRO_NMRO_PLZA = P.POL_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = P.POL_CDGO_CLSE
                        AND PP.PRO_RAM_CDGO = P.POL_RAM_CDGO
         INNER JOIN CRTFCDOS C
                    ON PP.PRO_NMRO_CRTFCDO = C.CER_NMRO_CRTFCDO
                        AND PP.PRO_NMRO_PLZA = C.CER_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = C.CER_CLSE_PLZA
                        AND PP.PRO_RAM_CDGO = C.CER_RAM_CDGO
WHERE PP.PRO_FCHA_CRCION <= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT /*+ LEADING(PP) USE_NL(P C) INDEX(P POL_PK) INDEX(C CER_PK) */
    PP.PRO_NMRO_PLZA                                                                  AS POLIZA,
    P.POL_PRS_NMRO_IDNTFCCION                                                         AS IDENTIFICACION,
    UPPER(PK_TERCEROS.F_NOMBRES(P.POL_PRS_NMRO_IDNTFCCION, P.POL_PRS_TPO_IDNTFCCION)) AS NOMBREPOLIZA,
    PP.PRO_NMRO_CRTFCDO                                                               AS NUMCERT,
    C.CER_FCHA_DSDE_ACTUAL                                                            AS FECHA_CER,
    PP.PRO_VLOR                                                                       AS PRIMA
FROM PRVSION_PRMAS PP
         INNER JOIN PLZAS P
                    ON PP.PRO_NMRO_PLZA = P.POL_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = P.POL_CDGO_CLSE
                        AND PP.PRO_RAM_CDGO = P.POL_RAM_CDGO
         INNER JOIN CRTFCDOS C
                    ON PP.PRO_NMRO_CRTFCDO = C.CER_NMRO_CRTFCDO
                        AND PP.PRO_NMRO_PLZA = C.CER_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = C.CER_CLSE_PLZA
                        AND PP.PRO_RAM_CDGO = C.CER_RAM_CDGO
WHERE PP.PRO_FCHA_CRCION <= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT /*+ LEADING(PP) USE_NL(P C) INDEX(P POL_PK) INDEX(C CER_PK) */
   COUNT(*)
FROM PRVSION_PRMAS PP
         INNER JOIN PLZAS P
                    ON PP.PRO_NMRO_PLZA = P.POL_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = P.POL_CDGO_CLSE
                        AND PP.PRO_RAM_CDGO = P.POL_RAM_CDGO
         INNER JOIN CRTFCDOS C
                    ON PP.PRO_NMRO_CRTFCDO = C.CER_NMRO_CRTFCDO
                        AND PP.PRO_NMRO_PLZA = C.CER_NMRO_PLZA
                        AND PP.PRO_CLSE_PLZA = C.CER_CLSE_PLZA
                        AND PP.PRO_RAM_CDGO = C.CER_RAM_CDGO
WHERE PP.PRO_FCHA_CRCION <= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   intrfaz_cntble i
WHERE  to_char(i.inc_fcha_cntble,'MMYYYY') = '012025'
  AND i.inc_asnto='EMA'
  and rownum <50
ORDER BY i.inc_asnto,i.inc_agncia, i.inc_fcha_cntble;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT username, account_status, password_versions
FROM dba_users
WHERE username = 'ADMSISA';
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- DVA.DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS DVA
WHERE DVA.DVA_NMRO_SLCTUD = 5210134
  AND DVA.DVA_ESTDO = '01'
  AND EXISTS (SELECT * FROM AVSOS_SNSTROS
              WHERE SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
                AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA);
;-- -. . -..- - / . -. - .-. -.--
select *
from estdos_snstros
where ESN_NMRO_SLCTUD = 10261454;
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- DVA.DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS DVA
WHERE DVA.DVA_NMRO_SLCTUD = 5210134
  AND DVA.DVA_ESTDO = '01'
  AND EXISTS (SELECT * FROM AVSOS_SNSTROS
              WHERE SNA_NMRO_ITEM = DVA_NMRO_SLCTUD
                AND SNA_FCHA_SNSTRO = DVA_FCHA_MRA
                AND SNA_ESTDO_SNSTRO IN ('02','05','01'));
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- DVA.DVA_FCHA_MRA
FROM DDAS_VGNTES_ARRNDMNTOS DVA
WHERE DVA.DVA_NMRO_SLCTUD = 5210134
  AND DVA.DVA_ESTDO = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like 'ESTADO_LI%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like 'ESTADO_LIQUIDACION%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN = 'ESTADO_DEUDA';
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  ---AND POL_POLIZA_SIMON IN (5010001410602, 5010001586302, 5010000536206)
  AND PES_FCHA_PGO IN (TO_DATE('23-10-2025'), TO_DATE('23-10-2025'));
;-- -. . -..- - / . -. - .-. -.--
select *
from PLZAS
where POL_POLIZA_SIMON in
      (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201);
;-- -. . -..- - / . -. - .-. -.--
SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_ESTDO = 'V'
  AND F1.MARCA_CIERRE_OPRCION = 'S';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO;
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201)
  AND PES_FCHA_PGO > TO_DATE('01-10-2025');
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  --AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201)
  AND PES_FCHA_PGO > TO_DATE('01-10-2025');
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  --AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201)
  AND PES_FCHA_PGO > TO_DATE('01-01-2025');
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_POLIZA_SIMON IN (5010001541402, 5010001716802, 5010001656002, 5010001020304, 5010001945101, 5010002091601, 5010001999201);
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND POL_NMRO_SLCTUD IN (7460532, 7679589, 7651704, 7096179, 10729874, 10874390, 7611439);
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO;
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND PES_NMRO_SNSTRO IN(50100002021);
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND PES_NMRO_SNSTRO IN(50100002021);
;-- -. . -..- - / . -. - .-. -.--
select *
from PLZAS
where POL_NMRO_SLCTUD IN (7460532, 7679589, 7651704, 7096179, 10729874, 10874390, 7611439);
;-- -. . -..- - / . -. - .-. -.--
SELECT p.POL_POLIZA_SIMON, s.PES_NMRO_SNSTRO, s.*, p.*, a.*
FROM PGOS_EFCTDOS_SNSTROS s,
     PLZAS p,
     AVSOS_SNSTROS a
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND PES_NMRO_SNSTRO IN(50100002021, 50100002180);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_SNSTRO IN (50100002021, 50100002180);
;-- -. . -..- - / . -. - .-. -.--
select *
from PLZAS;
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS where POL_NMRO_PLZA = 146205;
;-- -. . -..- - / . -. - .-. -.--
select p.POL_POLIZA_SIMON, p.* from PLZAS p where POL_NMRO_PLZA = 146205;
;-- -. . -..- - / . -. - .-. -.--
select p.POL_POLIZA_SIMON, p.* from PLZAS p where POL_NMRO_PLZA in (146205, 139628);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS WHERE SNA_NMRO_SNSTRO IN (50100002021, 50100002180, 50100002610, 50100002680, 50100002500, 50100002614, 50100002654);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CG_REF_CODES
WHERE RV_DOMAIN='ESTADO_SINIESTRO';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AVSOS_SNSTROS WHERE SNA_SNSTRO_SIMON IN (50100002021, 50100002180, 50100002610, 50100002680, 50100002500, 50100002614, 50100002654);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PRVSION_PRMAS ORDER BY PRO_FCHA_CRCION DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM VLRES_SNSTROS WHERE VSN_NMRO_SNSTRO = 2023087523;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM VLRES_SNSTROS WHERE VSN_NMRO_SNSTRO = 2024078306;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS where POL_NMRO_PLZA = 13147;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AMPROS_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM rsgos_vgntes r where r.RVI_NMRO_ITEM = 7612528;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where t.poliza_simon IN 5010002294202;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NITS WHERE RVN_NMRO_ITEM = 7576519;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 5085913;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NITS WHERE RVN_NMRO_ITEM = 5085913;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES WHERE RVI_NMRO_ITEM = 7576519;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM rsgos_vgntes r where r.RVI_NMRO_ITEM = 10454198;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from ADMSISA.SBMDLOS
where SMD_DSCRPCION LIKE '%ESTADO DE CUENTA%';
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_NMRO_CRTFCDO = 2177655;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM CG_REF_CODES
WHERE RV_DOMAIN like 'ESTADO_LIQUIDACION';
;-- -. . -..- - / . -. - .-. -.--
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
                     AND FECHA_PAGO = TO_DATE('23-10-2025'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('23-10-2025'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('23-10-2025'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO));