

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

SELECT *
FROM A2000163 F
WHERE F.NUM_SECU_POL = 29736827595
  AND TRUNC(F.FECHA_VIG_FACT,'MM') = TRUNC(add_months(to_date('2021-03-01','yyyy-mm-dd'),-1),'MM');

select * from A2000030 where num_secu_pol = 29736827595;

select * from A2000030 where NUM_POL1 = 2570000000401;



select * from sim_siniestro_cesvi v
WHERE v.secu_sini = 27010651260 AND
        v.cesv_error IS NULL AND
        v.cesv_status = 'S' AND
        id_asegurado = 1152465075 AND
        rownum = 1;


select * from A2000030 where NUM_POL1 = 3552011441307 and cod_cia = 3 and cod_secc= 4

select COD_RAMO, COD_SECC, COUNT(1) from A2000030 WHERE COD_RAMO = 136 GROUP BY COD_RAMO, COD_SECC;


select a.NUM_END, a.* from A2000030 a where a.NUM_POL1 = 2790000001201;

select * from a7000900 where NUM_SINI = 11412300122;


SELECT * FROM C9999909 WHERE COD_TAB = 'SERV_SCORE_RIESGO' AND COD_SECC = 999 AND COD_RAMO = 999;


select *
from sim_log_webservices t
where t.fecha_inicio >= trunc(sysdate)
  and t.objeto_entrada like '%53689%'
  and t.objeto_entrada like '%860023053%'
order by t.id_simlogws desc;


select cod_Secc, num_pol_cotiz, num_secu_pol, fecha_creacion, t.*
from a2000030 t
where t.cod_secc = 66
  and cod_ramo = 777
  AND T.NRO_DOCUMTO = 79417851;


select * from a1002100 where COD_RAMO = '777' and NOMINA is not null;
--ASEG -cob 660
--UPDATE a1002100 SET NOMINA = NULL where COD_RAMO = '777' and COD_COB = 660 and NOMINA is not null;

select * from A2000030 where NUM_POL1 =  1010107851701;

select * from a2000040 where num_secu_pol = '29768323407' and num_end = 3;

select *  from C9999909 WHERE  COD_TAB  = 'GENNUM_MOVILIZACION';


SELECT COUNT(*)
FROM a2000030
WHERE num_secu_pol = 29705837941
  AND tipo_end = 'MV';

SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION' AND COD_RAMO = 777;


select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 5132005145001
  and COD_SECC = 39;


select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 1020210087901
  and COD_SECC = 39;


---PARA VERIFICAR DOCUMENTO TOMADOR
select a.NRO_DOCUMTO, a.TDOC_TERCERO
from a2000030 a
where num_secu_pol = (select num_secu_pol from a2000030 where cod_secc in (39,600) and num_end=0 and num_pol1=5132005145001)
  and COD_SECC = 39;

----PARA VERIFICAR DOMUENTO ASEGURADO
select COD_CAMPO, VALOR_CAMPO
from a2000020
where cod_campo in ('TIPO_DOC_ASEG', 'COD_ASEG')
  AND num_secu_pol = (select num_secu_pol from a2000030 where cod_secc in (39,600) and num_end=0 and num_pol1=5132005145001);



---PARA VERIFICAR DOCUMENTO TOMADOR
select a.NRO_DOCUMTO, a.TDOC_TERCERO, a.num_pol1
from a2000030 a
where num_secu_pol = 29758377857
  and COD_SECC = 39;

----PARA VERIFICAR DOMUENTO ASEGURADO
select COD_CAMPO, VALOR_CAMPO
from a2000020
where cod_campo in ('TIPO_DOC_ASEG', 'COD_ASEG')
  AND num_secu_pol = 29758377857;


select *
from g2000020
where cod_ramo in (600) and cod_campo in ('COD_ASEG','COD_BENEF','TIPO_DOC_ASEG','TIPO_DOC_BENEF');


select * from CREGLAS where cdreg = '210PVV125';
select * from CREGLAS where cdreg = '201PVV002';

select * from CREGLAS where cdreg = '204PVV025';

select * from CREGLAS where cdreg = '204PVV025';


select COD_CAMPO, VALOR_CAMPO
from a2000020
where  num_secu_pol = 29758377857;




select *
from SIM_g2000020
where cod_ramo in (777) and titulo like '%LOCALIDAD%';


select *
from g2000020
where cod_ramo in (777);

Select * from sim_categorias_dv_producto
where cod_prod = 605 and id_categoria <100



select a.cod_prod, a.* from a2000030 a where cod_ramo = 600;

select num_secu_pol from a2000030 where cod_ramo in (777) and num_end=0 and num_pol1=1020210087901

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
where a.num_pol1 in (1003135205002)
  and COD_SECC = 66


select * from a2000040 where num_secu_pol = '29768323407' and num_end = 3;

select * from x2000040 where num_secu_pol = '29768323407'

select *
from g2000020
where cod_ramo in (777) and cod_Campo = 'CPOS_RIES';

----update g2000020 set cod_regla = '212GVV014' where cod_ramo in (777) and cod_Campo = 'CPOS_RIES';

select *
from SIM_g2000020
where cod_ramo in (777);

select * from CREGLAS where cdreg = '212GVV014';

select * from CREGLAS where cdreg = '266PVV102';

select * from CREGLAS where cdreg = '922PVV012';


Select t.*, C.*
From Sim_Param_Bien_Asegurado t, C9999909 c
Where t.Cod_Bien_Aseg = c.Codigo
  And c.Cod_Tab = 'PYME_BIEN_ASEGURADO'
  --And c.Dat_Car = Codcampo
 -- And t.Cod_Actividad = Actividad



select * from x2000040 where num_secu_pol = '29768323407' and cod_cob in (123, 290, 414)

select * from a2000040 where num_secu_pol = '29768323407'

select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 3520010106901
--  and COD_SECC = 39;


select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 1540215169901;


select a.NRO_DOCUMTO,
       a.num_pol1,
       a.COD_END,
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
from a2000030 a where a.FECHA_VIG_END < to_date('01-may-2022','dd-mon-yyyy') and cod_ramo = 777 and a.num_pol1 is not null;

----quitar polizas tomadas
select * from a2000030 t30
where num_pol1 = 1000115096002;

select * from a2000030 t30
where num_pol1 = 1000115096003;

DELETE a2000030 t30
where num_pol1 = 1000115096003;
----quitar polizas tomadas
update  a2000030 set COD_USER_EXCLU = null, MCA_EXCLUSIVO = 'N' WHERE num_pol1 = '1000115096002';
----poliza
--COD_USER_EXCLU se coloca en (null)--
--MCA_EXCLUSIVO Se coloca en (N)--  212GVV014

UPDATE G2000020 SET COD_REGLA = NULL where COD_CAMPO = 'CPOS_RIES' and COD_RAMO = '777';

SELECT NOMB_PROV
FROM A1000100 WHERE COD_POSTAL = '29000'
                AND '29000' != '99999'

select * from CREGLAS where cdreg = '212GVV014';



select a.*
from a2000020 a
where a.num_secu_pol  = 29768323407
--  and COD_SECC = 39;



Select e.cod_cob
     ,e.end_suma_aseg
     ,b.factor tasa
     ,e.end_suma_aseg*factor prima
     ,b.TABLA, b.*
From   a2000040 e, sim_tarifa_det_pymes b
Where  e.num_secu_pol  = 29768323407
  And    e.cod_ries      = 1
  And    e.num_secu_pol  = b.num_secu_pol
  --And    b.num_end       = 0
 -- And    e.tipo_reg      = 'T'
  And    e.cod_cob       = b.cod_cob
  And    e.cod_cob       != 216
  And    e.cod_ries      = b.cod_ries
--And    nvl(e.suma_aseg,0) != 0
  And    nvl(e.end_suma_aseg,0) != 0;


select * from sim_tarifa_det_pymes;


select * from CREGLAS where regla_completa like '%SIM_P266_PUC00%';

select * from CREGLAS where cdreg = '266PUC000';

select Sim_Pck_Reglasnegocio.Sim_P266_Puc002(29768323407, 1, 123) from dual;


select NUM_SECU_POL
from a2000030 where (NUM_POL1, COD_CIA, COD_SECC, COD_RAMO) IN (
    select NUM_POL_ANT, COD_CIA, COD_SECC, COD_RAMO from x2000030
    where num_secu_pol = 29768323407)
                and num_end = 0;


select * from sim_log
where columna like '%TARIFA PYME%'



select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 1003135152501;


select a.NRO_DOCUMTO,
       a.COD_END,
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
where a.num_pol1 = 1003135152502;

select * from g2000020 where  cod_ramo = 777;

select * from sim_productos WHERE COD_PRODUCTO = 40;