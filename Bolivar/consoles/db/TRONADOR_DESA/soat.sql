BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_consulta_pargensini','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_consulta_pargensini','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_proceso_expediente','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_proceso_expediente','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;

BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('pkg_archivos_soat','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('pkg_archivos_soat','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;

SELECT * FROM SIM_PASO_ESTADOS_SINI WHERE ID_ESTSINIPROD_DE IN (SELECT DISTINCT ID_ESTSINIPROD
                                                                FROM SIM_ESTADOS_SINI_PROD  WHERE COD_CIA = 3 AND COD_SECC = 23);


SELECT *
FROM c9999040
WHERE usuario = 'SUPER_SOAT_SINI'
  AND colnum16 = 0;




SELECT SUM(DECODE(Tipo_Reg,
                  'P',
                  DECODE(Cod_Ciacoa, '999', NVL(Importe_Liq, 0), 0),
                  NVL(Importe_Liq, 0)))
FROM A3001700 A, A3001800 B, A7001000 C
WHERE A.Num_Secu_Liq = B.Num_Secu_Liq
  AND A.Num_Sini = C.Num_Sini
  AND A.Cod_Secc = C.Cod_Secc
  AND A.Nro_Exped = C.Nro_Exped
  AND C.Nro_Orden_Exp = 0
  AND A.Cod_Secc = 310
          and A.Num_Liq = NULL
  AND C.Tipo_Exped = DECODE(NULL, NULL, C.Tipo_Exped, NULL) -- Modificado
  AND A.Num_Sini = 15220000136
  AND A.Num_Liq = DECODE(NULL, NULL, A.Num_Liq, NULL)
  AND A.Nro_Exped =
      DECODE(NULL, NULL, A.Nro_Exped, NULL)
  AND A.Cod_Benef = DECODE(NULL, NULL, A.Cod_Benef, NULL) -- Modificado
  AND B.Cod_Cob = DECODE(NULL, NULL, B.Cod_Cob, NULL)
  AND ((A.Fecha_Liq BETWEEN
            DECODE('01/01/21', NULL, A.Fecha_Liq, '01/01/21') AND
            DECODE('03/03/21', NULL, A.Fecha_Liq, '03/03/21') AND
        NVL(B.Mca_Anul, 'N') = 'N') OR
       (A.Fecha_Anu_Liq BETWEEN
            DECODE('01/01/21', NULL, A.Fecha_Anu_Liq, '01/01/21') AND
            DECODE('03/03/21', NULL, A.Fecha_Anu_Liq, '03/03/21') AND
        NVL(B.Mca_Anul, 'N') = 'S'))
  AND B.Tipo_Reg = DECODE(0, 1, 'P', 'T')
  AND NVL(B.Cod_Ciacoa, 0) = DECODE(0, 1, 999, 0)
  AND NVL(A.Mca_Transit, 'N') <> 'S'
  AND B.COD_CONCEP_LIQ = DECODE(576, NULL , COD_CONCEP_LIQ,576)
;





SELECT COD_CIA, COD_SECC, COD_PRODUCTO from SIM_PRODUCTOS
WHERE COD_CIA = 3 AND COD_PRODUCTO IN (480,76,470,220,450,214,200,455,910,45,790,40,1,152,219,154,460,8,215,440,120,218)
ORDER BY COD_CIA, COD_SECC, COD_PRODUCTO;

SELECT * FROM SIM_ESTADOS_SINI;

SELECT * FROM C9999909 WHERE COD_TAB = 'MOTOR_DEFNICION';



select * from c9999908 where FECHA_EQUIPO > '08-03-2021' order by FECHA_EQUIPO desc;

select N.SIM_ULT_EST_SINI, N.* from a7000900 N WHERE NUM_SINI = 15000001882

select
       a.*, b.*
FROM a7000900 a, a3001700 b
WHERE
 a.nro_orden_sini =
      (SELECT MAX(x.nro_orden_sini)
       FROM a7000900 x
       WHERE x.num_secu_sini = a.num_secu_sini)
  AND ((b.fecha_liq BETWEEN to_date('20012020', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY') AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) NOT BETWEEN
            to_date('20012020', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY')) OR
       (b.fecha_liq NOT BETWEEN to_date('20012020', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY') AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) BETWEEN
            to_date('20012020', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY')))

  AND a.cod_cia = b.cod_cia
  AND a.cod_secc = b.cod_secc
  AND a.num_sini = b.num_sini
  AND a.NUM_SINI = 15000001882;
 -- AND b.NUMERO_LIQ is not null ;




select cod_cia, cod_secc, num_sini FROM a7000900 where NUM_SINI = 20100000026;

select cod_cia, cod_secc, num_sini, fecha_liq FROM a3001700 where NUM_SINI = 15000001882 and fecha_liq BETWEEN to_date('20012020', 'DDMMYYYY') AND
    to_date('25012020', 'DDMMYYYY');


select * FROM a3001700 where NUM_SINI = 15000001882

select * FROM a3001700 where NUM_SINI = 20100000026




select
    a.*, b.*
FROM a7000900 a, a3001700 b
WHERE
        a.nro_orden_sini =
        (SELECT MAX(x.nro_orden_sini)
         FROM a7000900 x
         WHERE x.num_secu_sini = a.num_secu_sini)
  AND ((b.fecha_liq BETWEEN to_date('20012019', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY') AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) NOT BETWEEN
            to_date('20012019', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY')) OR
       (b.fecha_liq NOT BETWEEN to_date('20012019', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY') AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) BETWEEN
            to_date('20012019', 'DDMMYYYY') AND
            to_date('25012020', 'DDMMYYYY')))

  AND a.cod_cia = b.cod_cia
  AND a.cod_secc = b.cod_secc
  AND a.num_sini = b.num_sini
  AND a.NUM_SINI = 20100000026
  AND b.NUMERO_LIQ is not null ;


SELECT * FROM C7999908 WHERE COD_USR = '00030303350108032021PAGNOEXI'

SELECT * FROM C7999908 WHERE COD_USR = '00030303350008032021PAGNOEXI'

select * from C7999908 where cod_usr ='00030303350008032021PAG';

INSERT INTO c9999040
(usuario,
 num_secu_pol,
 colnum01,
 colnum02,
 colnum03,
 colnum04,
 colcar18,
 colcar01,
 colcar02,
 colcar03,
 colcar04,
 colnum06,
 colnum07,
 colcar05,
 colcar06,
 colcar07,
 colnum08,
 colcar08,
 colnum09,
 colcar09,
 colnum10,
 colcar10,
 colnum11,
 colcar11,
 colnum12,
 colnum13,
 colcar15,
 colcar16,
 colnum14,
 colnum15,
 colnum16,
 colnum17,
 colcar17,
 colcar20,
 colnum21,
 colcar12,
 colcar13,
 colcar14,
 colcar19,
 colnum05,
 colnum18,--NRO SOAT MANTIS 57816
 colnum19,
 colnum22,
 colnum23,
 colnum24)
SELECT c_usuario,
       a.num_secu_sini,
       a.num_sini,
       a.nro_orden_sini,
       a.cod_secc,
       to_number(CASE
           pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                                 a.nro_orden_sini,
                                                 c_tdoc_victima1,
                                                 c_nivel,
                                                 c_grupo,
                                                 c_movimiento)
                     WHEN 'CC' THEN
                         1
                     WHEN 'CE' THEN
                         2
                     WHEN 'NT' THEN
                         3
                     WHEN 'NC' THEN
                         3
                     WHEN 'TI' THEN
                         4
                     WHEN 'PP' THEN
                         5
                     WHEN 'CD' THEN
                         6
                     WHEN 'RC' THEN
                         9
                     WHEN 'AS' THEN
                         10
                     WHEN 'MS' THEN
                         11
                     WHEN 'NU' THEN
                         9
                     ELSE
                         0
           END) tip_iden_vic,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_id_victima,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) nro_iden_vic,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_apell1_vict,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) apell1_vic,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_apell2_vict,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) apell2_vic,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_nom_vict,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) nombres_vic,
       to_char(a.fecha_sini, c_formato_fec) fec_accidente,
       substr(lpad(pckg_cons_siniestros.fn_divpolmun(p_cod_tron_mun => pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                                                                                             a.nro_orden_sini,
                                                                                                             c_cod_ciudad,
                                                                                                             1,
                                                                                                             c_grupo,
                                                                                                             c_movimiento)),
                   5,
                   '0'),
              1,
              2) depto,
       substr(pckg_cons_siniestros.fn_divpolmun(p_cod_tron_mun => pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                                                                                        a.nro_orden_sini,
                                                                                                        c_cod_ciudad,
                                                                                                        1,
                                                                                                        c_grupo,
                                                                                                        c_movimiento)),
              -3) ciudad,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_fec_ingres_ips,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) fec_ingres_ips,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_fec_egreso_ips,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) fec_egreso_ips,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_fec_muerte,
                                             c_nivel,
                                             c_grupo,
                                             c_movimiento) fec_muerte,

       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_gme,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => c_codcob_gme,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) valor_liq_gme,

       to_char(pckg_cons_siniestros.ftrae_max_fecliq_exp(p_codsecc     => a.cod_secc,
                                                         p_numsini     => a.num_sini,
                                                         p_nroexped    => NULL,
                                                         p_tipoexped   => c_tip_exp_gme,
                                                         p_cod_benef   => b.cod_benef,
                                                         p_fecha_hasta => to_date(p_fechasta,
                                                                                  c_formato_fec)),
               c_formato_fec) fec_max_gme,
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_icp,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => c_codcob_icp,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) valor_liq_icp,
       to_char(pckg_cons_siniestros.ftrae_max_fecliq_exp(p_codsecc     => a.cod_secc,
                                                         p_numsini     => a.num_sini,
                                                         p_nroexped    => NULL,
                                                         p_tipoexped   => c_tip_exp_icp,
                                                         p_cod_benef   => b.cod_benef,
                                                         p_fecha_hasta => to_date(p_fechasta,
                                                                                  c_formato_fec)),
               c_formato_fec) fec_max_icp,
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_mta,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => c_codcob_mta,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) valor_liq_mta,
       to_char(pckg_cons_siniestros.ftrae_max_fecliq_exp(p_codsecc     => a.cod_secc,
                                                         p_numsini     => a.num_sini,
                                                         p_nroexped    => NULL,
                                                         p_tipoexped   => c_tip_exp_mta,
                                                         p_cod_benef   => b.cod_benef,
                                                         p_fecha_hasta => to_date(p_fechasta,
                                                                                  c_formato_fec)),
               c_formato_fec) fec_max_mta,
       ---------------------------------------------------------------------------------------------
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_pjs,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => NULL,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) +
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_gsj,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => NULL,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) +
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_gso,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => NULL,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) valor_liq_ajuste,

       to_char(pckg_cons_siniestros.ftrae_max_fecliq_ajustes(p_codsecc   => a.cod_secc,
                                                             p_numsini   => a.num_sini,
                                                             p_fec_hasta => to_date(p_fechasta,
                                                                                    c_formato_fec)),
               c_formato_fec) fec_max_ajus,
       to_number(CASE b.tdoc_tercero
                     WHEN 'CC' THEN
                         1
                     WHEN 'CE' THEN
                         2
                     WHEN 'NT' THEN
                         3
                     WHEN 'NC' THEN
                         3
                     WHEN 'TI' THEN
                         4
                     WHEN 'PP' THEN
                         5
                     WHEN 'CD' THEN
                         6
                     WHEN 'RC' THEN
                         9
                     ELSE
                         0
           END) tipo_doc_benef,
       b.cod_benef nro_ident_benef,
       'AT1327' || lpad(nvl(pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                                                  a.nro_orden_sini,
                                                                  c_nro_papeleria,
                                                                  1,
                                                                  c_grupo,
                                                                  c_movimiento),
                            '0000000'),
                        7,
                        '0') nro_poliza_at,
       pckg_cons_siniestros.fn_datosa7000025(a.num_secu_sini,
                                             a.nro_orden_sini,
                                             c_placa,
                                             1,
                                             c_grupo,
                                             c_movimiento) placa,
       pckg_cons_siniestros.fn_datosa2000020(p_num_secu_pol => a.num_secu_pol,
                                             p_cod_campo    => c_ciiu_asegurado) cod_ciiu,

       to_number(CASE a.tdoc_tercero_tom
                     WHEN 'CC' THEN
                         1
                     WHEN 'CE' THEN
                         2
                     WHEN 'NT' THEN
                         3
                     WHEN 'NC' THEN
                         3
                     WHEN 'TI' THEN
                         4
                     WHEN 'PP' THEN
                         5
                     WHEN 'CD' THEN
                         6
                     WHEN 'RC' THEN
                         9
                     ELSE
                         0
           END) t_doc_tomador,
       a.nro_documto nro_doc_tomador,
       pckg_cons_siniestros.ftrae_vrliq_sini2(pcodsecc   => a.cod_secc,
                                              pnumsini   => a.num_sini,
                                              pnumliq    => NULL,
                                              pnroexped  => NULL,
                                              ptipoexped => c_tip_exp_gtr,
                                              ptipopago  => c_tipo_pago,
                                              pcodcob    => c_codcob_gtr,
                                              pcodben    => b.cod_benef,
                                              pfecdesde  => to_date(p_fecdesde,
                                                                    c_formato_fec),
                                              pfechasta  => to_date(p_fechasta,
                                                                    c_formato_fec)) valor_liq_gtr,
       to_char(pckg_cons_siniestros.ftrae_max_fecliq_exp(p_codsecc     => a.cod_secc,
                                                         p_numsini     => a.num_sini,
                                                         p_nroexped    => NULL,
                                                         p_tipoexped   => c_tip_exp_gtr,
                                                         p_cod_benef   => b.cod_benef,
                                                         p_fecha_hasta => to_date(p_fechasta,
                                                                                  c_formato_fec)),
               c_formato_fec) fec_max_gtr,
       pkg_archivos_soat.fnc_nro_papeleria(a.num_secu_pol, --> MANTIS 57816
                                           a.num_end),
       a.num_pol1 || LPad(a.num_end, 2, '0') num_pol1,
       ---              TO_CHAR(a.fec_denu_sini,'DDMMYYYY') fecha_aviso,

       pckg_cons_siniestros.f_fecha_liq_audmed(p_sini   => a.num_sini,
                                               p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                               p_fec2  => to_date(p_fechasta,c_formato_fec),
                                               Pcodben => b.cod_benef) fecha_liq_audmed,

       pckg_cons_siniestros.f_fecha_liq_37(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) fecha_liq_37,

       pckg_cons_siniestros.f_fecha_liq_39(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) fecha_liq_39,

       pckg_cons_siniestros.f_fecha_liq_41(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) fecha_liq_41,

       (SELECT min(COD_RAMO_VEH) FROM sim_datossoat WHERE num_secu_pol = a.num_secu_pol) codigo_tarifa,
       pckg_cons_siniestros.Ftrae_Vrliq_Concepto(Pcodsecc => a.cod_secc,
                                                 Pnumsini => a.num_sini,
                                                 Pnumliq  => NULL,
                                                 Pnroexped => NULL,
                                                 Ptipoexped => NULL,
                                                 Ptipopago  => c_tipo_pago,
                                                 Pcodcob    => NULL,
                                                 Pcodben    => NULL,
                                                 Pfecdesde  => to_date(p_fecdesde,
                                                                       c_formato_fec),
                                                 Pfechasta  => to_date(p_fechasta,
                                                                       c_formato_fec),
                                                 PConcepLiq => 333)
           +
       pckg_cons_siniestros.Ftrae_Vrliq_Concepto(Pcodsecc => a.cod_secc,
                                                 Pnumsini => a.num_sini,
                                                 Pnumliq  => NULL,
                                                 Pnroexped => NULL,
                                                 Ptipoexped => NULL,
                                                 Ptipopago  => c_tipo_pago,
                                                 Pcodcob    => NULL,
                                                 Pcodben    => NULL,
                                                 Pfecdesde  => to_date(p_fecdesde,
                                                                       c_formato_fec),
                                                 Pfechasta  => to_date(p_fechasta,
                                                                       c_formato_fec),
                                                 PConcepLiq => 336)
           +
       pckg_cons_siniestros.Ftrae_Vrliq_Concepto(Pcodsecc => a.cod_secc,
                                                 Pnumsini => a.num_sini,
                                                 Pnumliq  => NULL,
                                                 Pnroexped => NULL,
                                                 Ptipoexped => NULL,
                                                 Ptipopago  => c_tipo_pago,
                                                 Pcodcob    => NULL,
                                                 Pcodben    => NULL,
                                                 Pfecdesde  => to_date(p_fecdesde,
                                                                       c_formato_fec),
                                                 Pfechasta  => to_date(p_fechasta,
                                                                       c_formato_fec),
                                                 PConcepLiq => 576) valor_liq_aud,

       pckg_cons_siniestros.f_valor_liq_audmed(p_sini   => a.num_sini,
                                               p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                               p_fec2  => to_date(p_fechasta,c_formato_fec),
                                               Pcodben => b.cod_benef) valor_liq_audmed,
       pckg_cons_siniestros.f_valor_liq_37(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) valor_liq_37,
       pckg_cons_siniestros.f_valor_liq_39(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) valor_liq_39,
       pckg_cons_siniestros.f_valor_liq_41(p_sini   => a.num_sini,
                                           p_fec1  => to_date(p_fecdesde,c_formato_fec),
                                           p_fec2  => to_date(p_fechasta,c_formato_fec),
                                           Pcodben => b.cod_benef) valor_liq_41
FROM a7000900 a, a3001700 b
WHERE a.cod_secc = c_secc
  AND a.cod_cia = c_cia
  AND a.cod_ramo = c_ramo
  AND a.nro_orden_sini =
      (SELECT MAX(x.nro_orden_sini)
       FROM a7000900 x
       WHERE x.num_secu_sini = a.num_secu_sini)
  AND ((b.fecha_liq BETWEEN to_date(p_fecdesde, c_formato_fec) AND
            to_date(p_fechasta, c_formato_fec) AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) NOT BETWEEN
            to_date(p_fecdesde, c_formato_fec) AND
            to_date(p_fechasta, c_formato_fec)) OR
       (b.fecha_liq NOT BETWEEN to_date(p_fecdesde, c_formato_fec) AND
            to_date(p_fechasta, c_formato_fec) AND
        nvl(b.fecha_anu_liq, to_date('01011900', 'DDMMYYYY')) BETWEEN
            to_date(p_fecdesde, c_formato_fec) AND
            to_date(p_fechasta, c_formato_fec)))

  AND a.cod_cia = b.cod_cia
  AND a.cod_secc = b.cod_secc
  AND a.num_sini = b.num_sini;



IF cx.valor_liq_icp IS NOT NULL AND cx.valor_liq_icp != 0 THEN
                v_cadena_5      := NULL;
v_nro_secuencia := v_nro_secuencia + 1;
v_cadena_5      := lpad(v_nro_secuencia, 8, 0) || '5' || --CONSTANTE (TIPO REGISTRO)
                                   '364' || --CONSTANTE (CODIGO FORMATO)
                                   '14' || -- CONSTANTE (CODIGO O NRO DE LA COLUMNA)
                                   '01' || --CONSTANTE (CODIGO DE LA UNIDAD DE CAPTURA)
                                   lpad(v_sub_cont, 6, '0') || '+' ||
                                   lpad(abs(cx.valor_liq_icp), 17, '0') || '*';
INSERT INTO c9999908
(cod_usr, num_reg, cadena, fecha_equipo)
VALUES
(c_usuario_08, v_nro_secuencia, v_cadena_5, SYSDATE);
COMMIT;
---COLUMNA 15
IF cx.fec_max_icp IS NOT NULL AND cx.fec_max_icp != 0 THEN
                  v_cadena_5      := NULL;
v_nro_secuencia := v_nro_secuencia + 1;
v_cadena_5      := lpad(v_nro_secuencia, 8, 0) || '5' || --CONSTANTE (TIPO REGISTRO)
                                     '364' || --CONSTANTE (CODIGO FORMATO)
                                     '15' || -- CONSTANTE (CODIGO O NRO DE LA COLUMNA)
                                     '01' || --CONSTANTE (CODIGO DE LA UNIDAD DE CAPTURA)
                                     lpad(v_sub_cont, 6, '0') || '+' ||
                                     lpad(cx.fec_max_icp, 17, '0') || '*';
INSERT INTO c9999908
(cod_usr, num_reg, cadena, fecha_equipo)
VALUES
(c_usuario_08, v_nro_secuencia, v_cadena_5, SYSDATE);
COMMIT;
--INICIO RIN MANTIS 30092
ELSE
                  v_fecha_anulacion := pckg_cons_siniestros.ftrae_max_anul_fecliq_exp(p_codsecc     => cx.cod_secc,
                                                                                      p_numsini     => cx.num_sini,
                                                                                      p_nroexped    => cx.nro_orden_sini,
                                                                                      p_tipoexped   => 'ICP',
                                                                                      p_cod_benef   => cx.nro_ident_benef,
                                                                                      p_fecha_hasta => to_date(p_fechasta,
                                                                                                               'DDMMYYYY'));

END IF;
IF v_fecha_anulacion IS NOT NULL THEN
                  v_cadena_5      := NULL;
v_nro_secuencia := v_nro_secuencia + 1;
v_cadena_5      := lpad(v_nro_secuencia, 8, 0) || '5' || --CONSTANTE (TIPO REGISTRO)
                                     '364' || --CONSTANTE (CODIGO FORMATO)
                                     '13' || -- CONSTANTE (CODIGO O NRO DE LA COLUMNA)
                                     '01' || --CONSTANTE (CODIGO DE LA UNIDAD DE CAPTURA)
                                     lpad(v_sub_cont, 6, '0') || '+' ||
                                     lpad(to_char(v_fecha_anulacion,
                                                  'DDMMYYYY'),
                                          17,
                                          '0') || '*';
INSERT INTO c9999908
(cod_usr, num_reg, cadena, fecha_equipo)
VALUES
(c_usuario_08, v_nro_secuencia, v_cadena_5, SYSDATE);
COMMIT;
--V_fecha_anulacion_ctl :=V_fecha_anulacion;
--MANTIS 36599 --RIN
-----Si hay anulación se actualiza el pago con  (Negativo - ) por eso se actualiza
-----el registro anterior y se cambia + por -
UPDATE c9999908 a
SET a.cadena = REPLACE(a.cadena, '+', '-')
WHERE a.cod_usr = c_usuario_08
  AND a.num_reg = v_nro_secuencia - 1;
COMMIT;
---Fin MANTIS 36599 --RIN
END IF;
                --FIN RIN MANTIS 30092
END IF;