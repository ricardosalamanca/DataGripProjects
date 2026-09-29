select *
from AEW_NOTIFICACIONES_SAI_PENDIENTES;

select S.SES_TPO_SLCTUD, S.*
from SLCTDES_ESTDIOS S WHERE S.SES_TPO_SLCTUD != 'IN'
order by S.SES_FCHA_ACTLZCION desc;
select S.SES_TPO_SLCTUD, S.*
from SLCTDES_ESTDIOS S WHERE S.SES_NMRO IN (1134937,1134934,1134931,1134928);
select S.SES_TPO_SLCTUD, S.*
from SLCTDES_ESTDIOS S WHERE S.SES_NMRO IN (11086025,11086005,11085647,11085986);

select R.REA_TPO_RSLTDO, R.*
from RSLTDOS_ARRNDTRIOS R where R.REA_NMRO_SLCTUD IN (1134937,1134934,1134931,1134928);

select R.REA_TPO_RSLTDO, R.*
from RSLTDOS_ARRNDTRIOS R
where R.REA_NMRO_SLCTUD IN (select S.SES_NMRO
                            from SLCTDES_ESTDIOS S
                            WHERE S.SES_TPO_SLCTUD != 'IN')
  AND R.REA_TPO_RSLTDO = 'D' AND R.REA_USRIO != 'ANALISIS_WEB'
ORDER BY R.REA_FCHA_ACTLZCION DESC;

select R.REA_TPO_RSLTDO, R.*
from RSLTDOS_ARRNDTRIOS R
where R.REA_NMRO_SLCTUD IN (11500503,11500502,11500500,11085908);

select * from RSLTDO_ESTDIO;

select  * from AEW_VARIABLES_HDC;

SELECT * FROM AEW_RESULTADOS_ESTUDIO
WHERE DESC_COD_SECUNDARIO='Transaccion obtener historia credito fallida';

SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427848);

SELECT DISTINCT TIP_RESULTADO
FROM AEW_RESULTADOS_ESTUDIO;

SELECT * FROM AEW_RESULTADOS_ESTUDIO where TIP_RESULTADO = 'D';

SELECT *
FROM AEW_RESULTADOS_ESTUDIO
where DESC_COD_SECUNDARIO like '%NO SE PUDO OBTENER INGRESOS DEL CLIENTE%'
order by fecha desc;

select * from TPOS_IDNTFCCION where TIP_DSCRPCION like '%NIT%';

select *
from slctdes_estdios
where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
order by ses_fcha_actlzcion desc;

select * from PLZAS where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                            from slctdes_estdios
                                            where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138));

select *
from ddas_vgntes_arrndmntos d
where d.DVA_USRIO IN ('10548237', '10697010', '7293054', '10384990', '6223776', '10989559', '10942138');

----variables_Analisis.solicitudes_negadas
SELECT nvl(count(x.ret_nmro_slctud), 0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                                            from PLZAS
                                                            where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                                                    from slctdes_estdios
                                                                                    where
                                                                                        ses_nmro IN (10548237, 10697010,
                                                                                                     7293054, 10384990,
                                                                                                     6223776, 10989559,
                                                                                                     10942138)))
                              AND x.arr_tpo_idntfccion IN ('NT', 'CC'))
  AND x.ret_cdgo_rsltdo = '03';


----variables_Analisis.numero_avisos
select nvl(count(x.sna_nmro_snstro), 0)
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('NT', 'CC')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;

----variables_Analisis.numero_indemnizaciones
SELECT nvl(count(DISTINCT x.pes_fcha_pgo), 0)
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_tpo_idntfccion IN ('NT', 'CC')
                                    and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                                                  from PLZAS
                                                                  where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                                                          from slctdes_estdios
                                                                                          where ses_nmro IN
                                                                                                (10548237, 10697010,
                                                                                                 7293054, 10384990,
                                                                                                 6223776, 10989559,
                                                                                                 10942138)))
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);

----variables_Analisis.cantidad_solicitudes_mora
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('NT', 'CC')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';

----variables_Analisis.monto_solicitudes_mora
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('NT', 'CC')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';


------------------------------ 2
----variables_Analisis.solicitudes_negadas 2
SELECT nvl(count(x.ret_nmro_slctud), 0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN
                                  (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715))
  AND x.ret_cdgo_rsltdo = '03';


----variables_Analisis.numero_avisos 2
select nvl(count(x.sna_nmro_snstro), 0)
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;

----variables_Analisis.numero_indemnizaciones 2
SELECT nvl(count(DISTINCT x.pes_fcha_pgo), 0)
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_nmro_idntfccion IN
                                        (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);

----variables_Analisis.cantidad_solicitudes_mora 2
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';

----variables_Analisis.monto_solicitudes_mora 2
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';


------------------------------ 3
----variables_Analisis.solicitudes_negadas 3
SELECT x.*
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN
                                  (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715))
  AND x.ret_cdgo_rsltdo = '03';


----variables_Analisis.numero_avisos 3
select x1.*, x.*
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;

----variables_Analisis.numero_indemnizaciones 3
SELECT x.*
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_nmro_idntfccion IN
                                        (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);

----variables_Analisis.cantidad_solicitudes_mora 3
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (43812362)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';

----variables_Analisis.monto_solicitudes_mora 3
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';


select * from arrndtrios where arr_ses_nmro = 7274509;
select *
from slctdes_estdios
where ses_nmro IN (7274509)
order by ses_fcha_actlzcion desc;
select * from PLZAS where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                            from slctdes_estdios
                                            where ses_nmro IN (7274509));


-------test
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10989559
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('17/11/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10548237
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';

SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10548237
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';

-------PROD SUMATORIA MONTOS
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 6223776
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('24/05/2025','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10942138
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('23/01/2025','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10697010
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/12/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';


SELECT * FROM CARPETA_UBICACION;
SELECT * FROM UBICACION;
select * from ALL_OBJECTS ao
where ao.object_name LIKE '%CARPETA_UBICACION%'
  AND OBJECT_TYPE='TABLE'


select *
from slctdes_estdios
where ses_nmro IN
      (6223776, 4526648, 7285632, 10548237, 10697010, 7293054, 10384990, 10989559, 10942138, 4784648, 5334275, 5118427)
order by ses_fcha_actlzcion desc;

----variables_Analisis.cantidad_solicitudes_mora 3
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';

----variables_Analisis.monto_solicitudes_mora 3
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


----variables_Analisis.cantidad_solicitudes_mora 3 ---Excluyendo TERMINADO POR DEUDA ESPECIAL 43, 5
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';

select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.NUMERO_UBICACION in (43, 5)
);
-- >>> FIN DEL CAMBIO <<<

----variables_Analisis.monto_solicitudes_mora 3 ---Excluyendo TERMINADO POR DEUDA ESPECIAL 43, 5
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
      --and cu.ID_RESPONSABLE = x1.dar_nmro_idntfccion
     -- and cu.TIPO_ID_RESPONSABLE = x1.dar_tpo_idntfccion
      and cu.NUMERO_UBICACION in (43, 5)
);
-- >>> FIN DEL CAMBIO <<<

SELECT * FROM CARPETA_UBICACION where NUMERO_OBLIGACION in (4784648,5334275,5118427);


select A.MONTO_SOLICITUDES_MORA, A.*
from AEW_VARIABLES_SAI A
where SOLICITUD in (6223776, 10942138, 10697010, 10989559, 10548237);

solicitud origin-> 6223776,4526648,7285632 ->cc 43812362 -> caso 11555670
solicitud origin-> 7293054 ->cc 43908243 -> caso 11582986
solicitud origin-> 10942138 ->cc 1036634100 -> caso 11509155
solicitud origin-> 10989559 ->cc 1039697895 -> caso 11547809
solicitud origin-> 10548237 ->cc 1098799715 -> caso 11521503
solicitud origin-> 10384990 ->cc 1117552332 -> caso 11578766
solicitud origin-> 10697010 ->cc 1130675922 -> caso 11589312

select A.MONTO_SOLICITUDES_MORA, A.*
from AEW_VARIABLES_SAI A
where SOLICITUD in (6223776, 4526648, 7285632, 7293054, 10942138, 10989559, 10548237, 10384990, 10697010);

select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra;


select *
from slctdes_estdios
where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138, 65757)
order by ses_fcha_actlzcion desc;

select A.MONTO_SOLICITUDES_MORA, A.*
from AEW_VARIABLES_SAI A
where SOLICITUD in (11509155,
                    11547809,
                    11521503,
                    11578766,
                    11589312, 11582986, 11555670);


SELECT  nvl(vdp1.nom_ciu,'') as ciudadInmu,nvl(vdp.nom_ciu,'') as ciudadInmo,nvl(pz.pol_nmro_plza,'')
FROM slctdes_estdios x , scrsl sc,plzas pz , V_DIVISION_POLITICAS vdp , direcciones dr ,V_DIVISION_POLITICAS vdp1
where x.ses_nmro=569135
  AND pz.pol_nmro_plza = x.ses_nmro_plza
  AND sc.suc_cdgo = pz.pol_suc_cdgo
  AND sc.suc_cia_cdgo = pz.pol_suc_cia_cdgo
  AND sc.suc_div_cdgo = vdp.codazzi_ciu
  AND x.ses_nmro = dr.di_solicitud
  AND dr.di_tpo_drccion = 'R'
  AND dr.di_divpol_codigo = vdp1.codazzi_ciu;


SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/03/2000','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';


SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (3296128)
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/04/2008','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';

select *
from CARPETA_UBICACION cu
where cu.NUMERO_OBLIGACION = 535184
  and cu.NUMERO_UBICACION in (43, 5);

select COUNT(*)
from CARPETA_UBICACION cu
where ID_RESPONSABLE IS NULL;

    SELECT
        v.*
    FROM
        v_abrestdcuentastt v
    WHERE
        v.est_slctud in (3296128
            )
      AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/04/2008','DD/MM/YYYY'))
      AND v.est_crtrio_cnslta = 'S'
      AND TRIM(v.est_estado) = 'PAGADO';
