

BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('SIM_PCK_WS_CONS_SUBOCOL_SINI','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('SIM_PCK_WS_CONS_SUBOCOL_SINI','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;




-- select * from sim_log_ws_subocol_sini where nosiniestro=10497703402

--SELECT * FROM sim_pos_cot_ws_subocol_sini c  WHERE c.secuencia IN (3252751, 3252751, 3252002, 3254937)
--select * from SIM_SINIESTRO_CESVI
SELECT * FROM sim_log_ws_subocol_sini a
WHERE a.secuencia IN (3843037)--(3843037, 3843704)
/*
  AND c.p_cod_cia = 3
  AND c.p_cod_producto = 250
  AND c.tipopieza = 3;*/


SELECT im.p_totaltot im_totalarreglo, im.p_totalrepuestos im_totalrep, im.p_totalmanoobra im_totalmano, pi.p_totaltot pi_totalarreglo, pi.p_totalrepuestos pi_totalrep, pi.p_totalmanoobra , pi.p_cod_cia, pi.p_cod_secc, pi.p_cod_producto
FROM sim_tot_pi_ws_subocol_sini pi, sim_tot_im_ws_subocol_sini im
WHERE pi.secuencia = 3843037
  --AND pi.p_cod_cia = ip_proceso.p_cod_cia --3
  --AND pi.p_cod_secc = ip_proceso.p_cod_secc --1
  --AND pi.p_cod_producto = ip_proceso.p_cod_producto --250
  AND im.secuencia = pi.secuencia
  AND im.p_cod_cia = pi.p_cod_cia
  AND im.p_cod_secc = pi.p_cod_secc
  AND im.p_cod_producto = pi.p_cod_producto;


SELECT c.tipopieza, c.cantidad, c.preciounitario--, to_number(TRIM(c.preciounitario))
FROM sim_pos_cot_ws_subocol_sini c
WHERE c.secuencia = 3843037
  AND c.p_cod_cia = 3
  AND c.p_cod_producto = 250
  AND c.tipopieza = 2;

SELECT to_number(TRIM(REPLACE('51500.0000', '.', ','))) FROM DUAL;


-----------------SINIESTROS EXPEDIENTES CASO ESTCORE-1373-----------------------------------------------------

SELECT sum(nvl(a.valor_actual,0)) valor_actual,
       sum(nvl(a.total_liq,0)) total_liq
FROM   a7001200 a, a7001000 b --tabla de reservas y expedientes
WHERE  a.num_secu_exped = b.num_secu_exped
  AND    a.nro_orden_exp  = b.nro_orden_exp
  AND    a.num_secu_exped = 26748957377
  --AND    a.nro_orden_exp  = v_nro_orden_exp
  --AND    a.tipo_reg = decode(v_cod_coa,1,'P','T')
 -- AND    nvl(a.cod_ciacoa,0) = decode(v_cod_coa,1,999,0)
 -- AND    b.mca_est_exp    = 'T'
  AND    nvl(b.mca_transit,'N') != 'S'
  AND    nvl(b.mca_term_ok,'S') != 'N';

SELECT sum(nvl(a.valor_movim,0)) valor_movim, sum(nvl(a.valor_actual,0)) valor_actual
FROM   a7001200 a, a7001000 b
WHERE  a.num_secu_exped = b.num_secu_exped
  AND    a.nro_orden_exp  = b.nro_orden_exp
  AND    a.num_secu_exped = 26748957377
  -- AND    a.num_secu_exped = 26742120107
  --AND    a.nro_orden_exp  <= v_nro_orden_exp - 1
  -- AND    a.tipo_reg = decode(v_cod_coa,1,'P','T')
  -- AND    nvl(a.cod_ciacoa,0)    = decode(v_cod_coa,1,999,0)
  AND    nvl(b.mca_transit,'N') != 'S'
  AND    nvl(b.mca_term_ok,'S') != 'N';

select E.FEC_APER_EXP, E.* from a7001000 E where num_secu_exped = 26748957377
select * from a7001200 where num_secu_exped = 26748957377

---se puede cambiar agencia desde el principio simon ventas 9246


SELECT R1.NUM_SECU_EXPED
FROM   A7001200 R1,
       (SELECT R.NUM_SECU_EXPED, SUM(VALOR_ACTUAL) VALOR_ACTUAL
        FROM A7001200 R,
             (SELECT DISTINCT E.NUM_SECU_EXPED NUM_SECU_EXPED
              FROM   A7001000 E
              WHERE  E.COD_CIA = 3
                AND    E.COD_SECC = 1
                AND    (E.FEC_APER_EXP = TRUNC(SYSDATE)
                  OR     E.FEC_MODI_EXP = TRUNC(SYSDATE))) X
        WHERE  X.NUM_SECU_EXPED = R.NUM_SECU_EXPED
        GROUP BY R.NUM_SECU_EXPED) Y
WHERE  Y.NUM_SECU_EXPED = R1.NUM_SECU_EXPED
  AND    R1.NRO_ORDEN_EXP = (SELECT MAX(R2.NRO_ORDEN_EXP)
                             FROM A7001200 R2
                             WHERE R2.NUM_SECU_EXPED = R1.NUM_SECU_EXPED)
  AND    R1.VALOR_ACTUAL <> Y.VALOR_ACTUAL;


SELECT R1.NUM_SECU_EXPED
FROM   A7001200 R1,
       (SELECT R.NUM_SECU_EXPED, SUM(VALOR_ACTUAL) VALOR_ACTUAL
        FROM A7001200 R,
             (SELECT DISTINCT E.NUM_SECU_EXPED NUM_SECU_EXPED
              FROM   A7001000 E
              WHERE  E.COD_CIA = 3
                AND    E.COD_SECC = 1
                AND    (E.FEC_APER_EXP = TRUNC(date '2021-05-25')
                  OR     E.FEC_MODI_EXP = TRUNC(date '2021-05-25'))) X
        WHERE  X.NUM_SECU_EXPED = R.NUM_SECU_EXPED
        GROUP BY R.NUM_SECU_EXPED) Y
WHERE  Y.NUM_SECU_EXPED = R1.NUM_SECU_EXPED
  AND    R1.NRO_ORDEN_EXP = (SELECT MAX(R2.NRO_ORDEN_EXP)
                             FROM A7001200 R2
                             WHERE R2.NUM_SECU_EXPED = R1.NUM_SECU_EXPED)
  AND    R1.VALOR_ACTUAL <> Y.VALOR_ACTUAL;


SELECT MAX(F.NUM_FACTURA)
FROM A2000163 F
WHERE F.NUM_SECU_POL = 29736827595
  AND TRUNC(F.FECHA_VIG_FACT,'MM') = TRUNC(add_months(to_date('2021-05-01','yyyy-mm-dd'),-1),'MM');

SELECT MAX(F.NUM_FACTURA)
FROM A2000163 F
WHERE F.NUM_SECU_POL = 29736827595
  AND TRUNC(F.FECHA_VIG_FACT,'MM') = TRUNC(add_months(to_date('2021-04-01','yyyy-mm-dd'),-1),'MM');



select * from sim_siniestro_cesvi where FECHA_ACTUALIZACION > TRUNC(date '2021-07-25');

select * from A2000030 where num_secu_pol = 29736827595;

select * from A2000030 where NRO_DOCUMTO = 900250909;


select a.NUM_END, a.* from A2000030 a where a.NUM_POL1 = 2570000000401 and a.cod_cia = 3 and a.cod_secc= 4 and a.NUM_SECU_POL = 29736827595 order by a.NUM_END;

select * from sim_cooprop_mae_21052020 where NUM_DOC = 900250909; --NUM_POL1 = 2570000000401 and NUM_SECU_POL = 29736827595

select *  from OPS$PUMA.SIM_COOPROP_DET_21052020 where ID_COOP_MAE = 6308 AND MARCA_SINI = 1;

select * from a2000163 where NUM_SECU_POL = 29736827595 AND NUM_END = 15 AND COD_AGRUP_CONT = 'GENERICOS'


SELECT PP.NUM_POL1 ,
       PP.NUM_SECU_POL ,
       A20D.COD_RIES ,
       DECODE(A20D.VALOR_CAMPO,'F','FULL','BASICO') CYBER_RISK ,
       PP.TDOC_TERCERO ,
       PP.NRO_DOCUMTO ,
       PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES,
       NN.TIPO_DOCUMTO ,
       NN.NRO_DOCUMTO ,
       NN.NOMBRE,
       NN.APELLIDO
FROM A2000020 A20D,
     A2000030 PP,
     A9990100 NN
WHERE PP.NUM_SECU_POL = A20D.NUM_SECU_POL
  AND   A20D.NUM_SECU_POL = NN.NUM_SECU_POL
  AND PP.NUM_POL1      IS NOT NULL
  AND A20D.COD_CAMPO    = 'CYBER_RISK'
  AND NN.NOMINA         ='DAVI'
  AND NVL(MCA_BAJA,'N') = 'N'
  AND A20D.COD_RIES     = NN.COD_RIES
  AND NN.NUM_END      = (SELECT MAX(NUM_END) FROM A9990100
                         WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                           AND COD_RIES =  A20D.COD_RIES
                           AND NOMINA   = 'DAVI'
                           AND NVL(MCA_BAJA,'N') = 'N')

  AND A20D.NUM_END      = (SELECT MAX(NUM_END) FROM A2000020
                           WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                             AND COD_RIES =  A20D.COD_RIES
                             AND COD_CAMPO = 'CYBER_RISK'
                             AND NVL(VALOR_CAMPO,'Z') <> 'Z')

  AND A20D.VALOR_CAMPO  IN ('B','F')
  AND PP.NUM_END        =
      (SELECT MAX(SA.NUM_END)
       FROM A2000030 SA
       WHERE SA.NUM_POL1 = PP.NUM_POL1
         AND SA.COD_CIA    = PP.COD_CIA
         AND SA.COD_SECC   = PP.COD_SECC
         AND SA.COD_RAMO   = PP.COD_RAMO
      )
  AND PP.FECHA_EMI_END BETWEEN SYSDATE-8 AND SYSDATE
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 23
  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1,   A20D.COD_RIES



select a.NUM_END, a.* from A2000030 a where a.NUM_POL1 = 2782000000201


select a.NUM_END, a.NUM_SECU_POL, a.NRO_DOCUMTO, a.DESC_POL, a.MCA_ANU_POL, a.TIPO_END, a.*
from A2000030 a
where a.NUM_POL1 = 2570000066701
  and a.NRO_DOCUMTO = 900048773;

select a.NUM_END, a.NUM_SECU_POL, a.NRO_DOCUMTO, a.DESC_POL, a.MCA_ANU_POL, a.TIPO_END, a.*
from A2000030 a
where a.NUM_POL1 = 2782000000201
  AND A.NRO_DOCUMTO = 830057256;

select a.NUM_END, a.NUM_SECU_POL, a.NRO_DOCUMTO, a.DESC_POL, a.MCA_ANU_POL, a.TIPO_END, a.*
from A2000030 a
where a.NUM_POL1 = 2790000001201
  and a.NRO_DOCUMTO = 830110608;


select * from sim_cooprop_mae_21052020 where NUM_DOC = 830110608 and NUM_POL1 = 2790000001201;

select * from sim_cooprop_mae_21052020 where NUM_DOC = 830057256 and NUM_POL1 = 2782000000201;

select * from sim_cooprop_mae_21052020 where NUM_DOC = 900048773 and NUM_POL1 = 2570000066701;

select *  from OPS$PUMA.SIM_COOPROP_DET_21052020 where ID_COOP_MAE = 183 AND MARCA_SINI = 1;

select *
from sim_log_webservices t
where t.fecha_inicio >= trunc(sysdate)
  and t.objeto_entrada like '%53689%'
  and t.objeto_entrada like '%860023053%'
order by t.id_simlogws desc;

----quitar nominas produccto 777
select * from a1002100 where COD_RAMO = '777' and NOMINA is not null ;
--ASEG -cob 660

select * from A9990100 where NUM_SECU_POL = 39744926941;
select * from A9990100 where NUM_SECU_POL = 29741499174;

select A.NUM_END, A.NUM_SECU_POL, A.* from A2000030 A where NUM_POL1 = 1530375067401;

select * from A2000030 where NUM_POL1 =  1010107851701;

select * from a2000040 where num_secu_pol = '29744836787'

select *  from C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION'
AND NVL(FECHA_BAJA, SYSDATE+1) > SYSDATE AND COD_RAMO = 777;

SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION' AND COD_RAMO = 777;

---revisa solo cod_coa = 0;
select a.COD_END,
       a.COD_RAMO,
       a.COD_COA,
       a.SUB_COD_END,
       a.FECHA_VIG_END,
       a.TIPO_END,
       a.num_secu_pol,
       a.num_end,
       a.num_end_flot,
       a.mca_provisorio,
       a.desc_pol,
       a.*
from a2000030 a
where a.num_pol1 = 1000000006101
  and COD_SECC = 39;

select *
from SIM_g2000020
where cod_ramo in (600);

select *
from g2000020
where cod_ramo in (600);

select a.COD_COB, a.SUMA_ASEG, a.END_SUMA_ASEG, a.PRIMA_COB, a.END_PRIMA_COB,a.COD_RIES, a.*
from a2000040 a
where NUM_SECU_POL = 29750564611
order by a.COD_COB, a.NUM_END;
---actualiza_cobertura_vigente PROCEDMIENTO ACTUALIZAR ESTADO VIGENTE
---tabla primas
select sum(END_PRIMA_COB), NUM_END from a2000040 a
where NUM_SECU_POL = 29750564611 group by NUM_END

----tablas de primas core
select * from a2000160 where NUM_SECU_POL = 29759969569; ---ACTUALIZA_PRIMA_VIGENTE
select * from a2000190 where NUM_SECU_POL = 29759969569; -----ACTUALIZA_IMPUESTO_VIGENTE
select A.PRI_COM_END, A.* from a2000250 A where NUM_SECU_POL = 29751841425; ------ACTUALIZA_COMISION_VIGENTE DIFRENTE PR(PROMOTOR)

--tablas de facturacion
select * from a2990700 where NUM_SECU_POL =  29751841425 order by  NUM_END;



select a.COD_RAMO,
       a.NUM_SECU_POL,
       a.COD_END,
       a.COD_COA,
       a.SUB_COD_END,
       a.FECHA_VIG_END,
       a.TIPO_END,
       a.num_secu_pol,
       a.num_end,
       a.num_end_flot,
       a.mca_provisorio,
       a.desc_pol,
       a.*
from a2000030 a
where a.num_pol1 in (1540215169902)
  and COD_SECC = 66
  and NUM_END = 0;



select * from LOCALIDADES where CODIGO_LOCALIDAD = 30000;

select * from A1000100 where cod_postal = 30000;



select TO_DATE('05-FEB-2021','DD-MON-RRRR') from dual;


SELECT
    TO_CHAR( sysdate, 'YYYY-MM-DD' )
FROM
    dual;


select REGLA_COMPLETA from CREGLAS where cdreg = '210PVV125';

SELECT *--ssp.mail_usuario
       --INTO l_mail
FROM sim_soporte_programas ssp
WHERE ssp.codigo_programa = UPPER('PKG_ARMAPLANO_BATCH');

-----verifica facturas y sus impuestos
select num_end,imp_prima,imp_imptos_mon_local,cod_situacion  from a2990700
where num_secu_pol = 29751841425; ---bien
select sum(imp_prima),sum(imp_imptos_mon_local) from a2990700
where num_secu_pol = 29751841425; --bien

select num_end,imp_prima,imp_imptos_mon_local,cod_situacion  from a2990700
where num_secu_pol = 29759969569;
select sum(imp_prima),sum(imp_imptos_mon_local) from a2990700
where num_secu_pol = 29759969569;

---verifica fechas de vigencias con sus endosos
select fecha_vig_pol, fecha_venc_pol, fecha_vig_end,fecha_venc_end, num_end from a2000030
where num_secu_pol = 29751841425
order by num_end

select fecha_vig_pol, fecha_venc_pol, fecha_vig_end,fecha_venc_end,FECHA_EMI_END, num_end from a2000030
where num_secu_pol = 29759969569
order by num_end


select SUM(imp_imptos_mon_local)  from a2990700
where num_secu_pol = 29751841425

select *
from g2000020
where cod_ramo in (777) and cod_Campo = 'CPOS_RIES';
select * from CREGLAS where cdreg = '212GVV014';

select *
from g2000020
where cod_ramo in (777)


---valores de las coberturas
select * from a2000040 where num_secu_pol = '29759969569'
AND COD_RIES =4
order by cod_ries, cod_cob, num_end;

select *
from g2000020
where cod_ramo in (777)