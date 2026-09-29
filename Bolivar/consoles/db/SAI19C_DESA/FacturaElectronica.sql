select * from LOG_FACTURA_ELECTRONICA where fecha > to_date('01/01/2024','dd/mm/yyyy');
SELECT f.*
FROM FACTURACION_ELECTRONICA f
WHERE f.id_proceso IS NOT NULL
  AND f.estado     IN ('ER','EE','RECHAZADA','RECHAZADA_POR_OPERADOR')
  AND f.fecha_factura >= to_date('14/12/2024','dd/mm/yyyy');


select * from LOG_FACTURACION_LIBERTADOR where FECHA_FACTURA > to_date('14/12/2024','dd/mm/yyyy');

SELECT UTL_HTTP.request('http://internal-facturador-prod-core-alb-943938798.us-east-1.elb.amazonaws.com/2.0/factura', null, 'file:/oracle/app/oracle/wallets', 'WalletPassbgt5') from dual;
--mig_ws_metodos

SELECT m.*
FROM mig_ws_metodos m;

select TO_DATE('29/12/2024','dd/mm/yyyy') from dual;

select TRUNC(SYSDATE) from dual;

update FACTURACION_ELECTRONICA f
set f.fecha_factura = TRUNC(SYSDATE),
    f.fecha_dian = TRUNC(SYSDATE),
    f.fecha_ciclo = TRUNC(SYSDATE),
    f.fecha_proceso = TRUNC(SYSDATE),
    f.fecha_creacion = TRUNC(SYSDATE)
where f.estado = 'RECHAZADA_POR_OPERADOR'
  and f.fecha_factura >= TO_DATE('03/12/2024', 'DD/MM/YYYY');

SELECT  fun_ret_cadena_valida_excel(fa.estado)
            ||';'|| fun_ret_cadena_valida_excel(fa.id_int_fac)
            ||';'|| fun_ret_cadena_valida_excel(fa.satelite)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_cia)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_doc_cia_bol)
            ||';'|| fun_ret_cadena_valida_excel(fa.doc_cia_bolivar)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_secc)
            ||';'|| fun_ret_cadena_valida_excel(fa.desc_secc)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_ramo)
            ||';'|| fun_ret_cadena_valida_excel(fa.desc_ramo)
            ||';'|| fun_ret_cadena_valida_excel(fa.sim_subproducto)
            ||';'|| fun_ret_cadena_valida_excel(fa.num_pol1)
            ||';'|| fun_ret_cadena_valida_excel(fa.num_secu_pol)
            ||';'|| fun_ret_cadena_valida_excel(fa.num_end)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_end)
            ||';'|| fun_ret_cadena_valida_excel(fa.sub_cod_end)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_end)
            ||';'|| fun_ret_cadena_valida_excel(fa.tdoc_tercero)
            ||';'|| fun_ret_cadena_valida_excel(fa.nro_documto)
            ||';'|| fun_ret_cadena_valida_excel(fa.sec_tercero)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_persona_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.regimen_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.razon_social_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.nombre_ccial_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.nombre_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.apellidos_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.direccion_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.pais_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.dpto_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.ciudad_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.digito_verific_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.oblig_trib_adq_terc)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_contacto_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.nom_car_contacto_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.correo_contacto_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_tributo_adq)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_emi)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_operacion)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_emi_end)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_mon)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_mon_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_mon_imptos)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_mon_imptos_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_mon_conv)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_factura_prov)
            ||';'|| fun_ret_cadena_valida_excel(fa.tipo_factura_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_factura)
            ||';'|| fun_ret_cadena_valida_excel(fa.total_lineas)
            ||';'|| fun_ret_cadena_valida_excel(fa.imp_prima)
            ||';'|| fun_ret_cadena_valida_excel(fa.prima_prov)
            ||';'|| fun_ret_cadena_valida_excel(fa.imp_imptos_mon_local)
            ||';'|| fun_ret_cadena_valida_excel(fa.total_a_pagar)
            ||';'|| fun_ret_cadena_valida_excel(fa.tc)
            ||';'|| fun_ret_cadena_valida_excel(fa.base_monetaria)
            ||';'|| fun_ret_cadena_valida_excel(fa.medio_pago_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.metodo_pago_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.fec_vcto)
            ||';'|| fun_ret_cadena_valida_excel(fa.codigo_barras)
            ||';'|| fun_ret_cadena_valida_excel(fa.concepto_nota_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.descripcion_nota)
            ||';'|| fun_ret_cadena_valida_excel(fa.nro_linea)
            ||';'|| fun_ret_cadena_valida_excel(fa.cantidad_producto)
            ||';'|| fun_ret_cadena_valida_excel(fa.desc_articulo)
            ||';'|| fun_ret_cadena_valida_excel(fa.unidad_medida)
            ||';'|| fun_ret_cadena_valida_excel(fa.cantidad_real)
            ||';'|| fun_ret_cadena_valida_excel(fa.codigo_producto_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.codigo_estandar_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_creacion)
            ||';'|| fun_ret_cadena_valida_excel(fa.usuario_creacion)
            ||';'|| fun_ret_cadena_valida_excel(fa.estado)
            ||';'|| fun_ret_cadena_valida_excel(fa.mca_datos_faltantes)
            ||';'|| fun_ret_cadena_valida_excel(fa.datos_faltantes)
            ||';'|| fun_ret_cadena_valida_excel(fa.resultado)
            ||';'|| fun_ret_cadena_valida_excel(fa.msj_error)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_proceso)
            ||';'|| fun_ret_cadena_valida_excel(fa.cufe)
            ||';'|| fun_ret_cadena_valida_excel(fa.nro_factura)
            ||';'|| fun_ret_cadena_valida_excel(fa.resultado_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.mensaje_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.ciclo)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_ciclo)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_impuesto)
            ||';'|| fun_ret_cadena_valida_excel(fa.cod_impuesto_dian)
            ||';'|| fun_ret_cadena_valida_excel(fa.tasa_impuesto)
            ||';'|| fun_ret_cadena_valida_excel(fa.mca_imp_retenido)
            ||';'|| fun_ret_cadena_valida_excel(fa.id_proceso)
            ||';'|| fun_ret_cadena_valida_excel(fa.fecha_pgo)
            ||';'|| fun_ret_cadena_valida_excel(fa.nro_certificado)
            ||';'||'final'
FROM facturacion_electronica fa
WHERE trunc(fa.fecha_creacion)  = TO_DATE('03/12/2024', 'DD/MM/YYYY')
order by fa.fecha_proceso asc;

SELECT *
FROM facturacion_electronica fa
WHERE trunc(fa.fecha_creacion)  >= TO_DATE('28/01/2024', 'DD/MM/YYYY')
order by fa.fecha_proceso asc;

DELETE FROM PRMTROS
WHERE PAR_CDGO = 'FACR'
  AND PAR_MDLO = '14'
  AND PAR_VLOR1 = 7006
  AND PAR_SUC_CDGO = '2501'
  AND PAR_SUC_CIA_CDGO = '40'
  AND PAR_RFRNCIA = 'REINTENTOS_FACT_ELEC';
INSERT INTO PRMTROS (PAR_CDGO, PAR_MDLO, PAR_VLOR1, PAR_SUC_CDGO, PAR_SUC_CIA_CDGO, PAR_TPO_PRMTRO,
                     PAR_DSCRPCION, PAR_VLOR2, PAR_VLOR_RFRNCIA, PAR_RFRNCIA, PAR_USRIO, PAR_FCHA_ACTLZCION,
                     PAR_FCHA_CREACION)
VALUES ('FACR', '14', 7006, '2501', '40', 'U',
        'N', null, null, 'REINTENTOS_FACT_ELEC',
        'ADMSISA', SYSDATE, SYSDATE);



select * from prmtros where PAR_CDGO = 'FACR';

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


SELECT *
FROM facturacion_electronica fa
WHERE trunc(fa.fecha_creacion)  >= TO_DATE('27/07/2024', 'DD/MM/YYYY')
order by fa.fecha_proceso asc;

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
  AND c.cer_vlor_prma_ttal > 1
  AND C.CER_NMRO_CRTFCDO IN (2171802,
        2171803,
        2170939,
        2171136,
        2170228,
        2171812,
        2171809);

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

