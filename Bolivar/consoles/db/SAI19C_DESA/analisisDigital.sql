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

select * from aew_variables_sai;

select  * from AEW_VARIABLES_HDC;

SELECT * FROM AEW_RESULTADOS_ESTUDIO
WHERE DESC_COD_SECUNDARIO='Transaccion obtener historia credito fallida';

SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD = 11427731;

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

select * from slctdes_estdios order by ses_fcha_actlzcion desc;
--where ses_nmro = 11427731;

----variables_Analisis.solicitudes_negadas
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= 800043383
      AND x.arr_tpo_idntfccion = '13')
  AND x.ret_cdgo_rsltdo = '03';

select * from PLZAS where POL_NMRO_PLZA = 249;

select * from TPOS_IDNTFCCION;

----variables_Analisis.numero_avisos
select nvl(count(x.sna_nmro_snstro),0)
from avsos_snstros x ,(
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 800043383
      and d.dar_tpo_arrndtrio in ('I','P')) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra;

----variables_Analisis.numero_indemnizaciones
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

----variables_Analisis.cantidad_solicitudes_mora
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

----variables_Analisis.monto_solicitudes_mora
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


SELECT * FROM CARPETA_UBICACION;

select * from ALL_OBJECTS ao
where ao.object_name LIKE '%CARPETA_UBICACION%'
  AND OBJECT_TYPE='TABLE'


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