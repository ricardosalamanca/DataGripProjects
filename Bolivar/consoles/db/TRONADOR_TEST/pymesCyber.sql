---CREACION CAMPO VARIABLE SINIESTRO
-- DATOS VARIABLES COMPAÑIA
SELECT * FROM G2000010 WHERE COD_CIA = 3 AND COD_CAMPO LIKE 'VR_RESERVA%'

-- DATOS VARIABLES SECCION Y RAMO
SELECT * FROM G7000025 WHERE COD_CIA = 3 AND COD_SECC = 66 AND COD_RAMO = 777 AND COD_CAMPO in( 'VR_PRETENSION', 'VR_RESERVA_12'); --AND  VR_RESERVA_12
---REGLA VALIDACION RESERVA CYBER 700SVV010
INSERT INTO G7000025(COD_CIA, COD_SECC, COD_NIVEL, NUM_SECU, COD_CAMPO,
                     COD_USER, ACEPTA_NULL, OBLIGATORIO, COD_RAMO, MCA_COMMIT,REG_PRE_FIELD)
VALUES (3, 66, 1, 162, 'VR_RESERVA_12',
        'B7959582', 'N', 'S', 777, 'S','700SVV010');

-- DATOS VARIABLES SIMON
SELECT * FROM SIM_G7000025 WHERE COD_CIA = 3 AND COD_SECC = 66 AND COD_RAMO = 777 AND COD_CAMPO in( 'VR_PRETENSION', 'VR_RESERVA_12');

INSERT INTO SIM_G7000025(ID_SIM_DATVAR, COD_CIA, COD_SECC, COD_RAMO, COD_CAMPO,
                         COD_NIVEL, CATEGORIA, ORDEN_CATEGORIA, COMPONENTE, TITULO,
                         FECHA_CREACION, FECHA_ALTA, USUARIO_CREACION, ESTADO, OBLIG_AVISO, FORMATO, LISTA_DEPENDIENTE, HAB_CONSULTA, HACE_PRECAMPO)
VALUES (SIM_SEQ_CAT_DV_PROD.NEXTVAL, 3, 66, 777, 'VR_RESERVA_12',
        1, 701, 162, 'TX', 'VLR. RESERVA CYBER',
        SYSDATE, SYSDATE, 'B7959582', 'A', 'S', '999,999,999,999', 'N', 'N', 'S');

---querys manuel
--select * from g2000020 where cod_ramo = 777;
select * from sim_g2000020 where cod_ramo = 777;

----
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_proceso_datos_emision3','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_proceso_datos_emision3','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_pymes','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_pymes','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_reglasnegocio','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_reglasnegocio','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_acceso_servicios','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_acceso_servicios','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_motor_tarifa','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_motor_tarifa','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_proceso_modificacion2','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_proceso_modificacion2','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;
BEGIN
    SIM_PCK_CONTROL_DESARROLLO.desbloquearObjeto('sim_pck_consulta_pargensini','RICARDO SALAMANCA');
    SIM_PCK_CONTROL_DESARROLLO.bloquearObjeto('sim_pck_consulta_pargensini','RICARDO SALAMANCA','ricardo.salamanca.mora@segurosbolivar.com');
END;

select * from SIM_DEDUCIBLES where cod_cia = 3 and cod_secc = 66 and cod_ramo = 777;

select * from c9999909 where COD_TAB like '%PYM%';

select * from c9999909 where COD_TAB like '%AGRUP_PYME%';

select * from c9999909 where COD_TAB like '%AGRUP_X_COB_PYME%';


Select *
From  SIM_DEDUCIBLES
Where cod_cia = 3
  and fecha_baja is null;

select * from A1002100 where  cod_cob  =  660 ;

select *
from A1002100
where COD_COB in (287,
                  600,
                  597,
                  125,
                  124,
                  123,
                  122,
                  121,
                  120,
                  292,
                  291
    ) and COD_CIA = 3 and COD_RAMO = 777;

SELECT TO_CHAR(10000,'L99G999D99MI',
               'NLS_NUMERIC_CHARACTERS = ''.''''''
               NLS_CURRENCY = ''$'' ') "Amount"
FROM DUAL;


SELECT TO_CHAR(10000,'999,999,999,999.99') "Amount"  FROM DUAL;


--------------------------------------------------
select * from OPS$PUMA.G2000020;


---------DML  --REGLAS DATOS VARIABLES
update g2000020 set cod_regla = null where cod_ramo = 777 and cod_campo = 'DIRECC_RIES';
select * from g2000020 where cod_ramo = 777;


----REGLAS DE COBERTURA
select * from a1002100 where cod_ramo = 777 AND COD_COB = 660;
--update A1002100 set COD_REG_VAL = '266PUC016' WHERE COD_RAMO = 777 AND COD_COB = 660;

select *  from CREGLAS where cdreg = '266PUC016'


select *  from CREGLAS where cdreg = '266PUC015'


Select c.cod_ries,d.codigo1,e.dat_obs,max(c.cod_cob) cod_cob,Sum(c.end_prima_cob) prima
From   A2000040 c, c9999909 d, c9999909 e
Where  c.num_secu_pol = 29744772418
  And    c.num_end      = 3
  And    d.codigo2      = c.cod_cob
  And    c.cod_ries     = 2
  And    c.tipo_reg     = 'T'
  And    d.cod_tab = 'AGRUP_X_COB_PYME'
  And    e.cod_tab = 'AGRUP_PYME'
  And    e.codigo1 = d.codigo1
Group  By c.cod_ries,d.codigo1,e.dat_obs
Order  By c.cod_ries,d.codigo1,e.dat_obs;


Select c.Num_Secu_Pol,
       c.Num_End,
       c.Cod_Ries,
       c.Nro_Item,
       c.Tipo_Documto,
       c.Nro_Documto,
       c.Apellido,
       c.Nombre,
       c.Marca Lider
From A9990100 c
Where c.Num_Secu_Pol = 29744772418
  And c.Num_End = 3
  And c.Nomina = 'ASEG'
Order By c.Num_End, c.Cod_Ries;

Select Distinct (c.Codigo2) Codbien,
                Decode(d.Dat_Obs,
                       'Responsabilidad Civil',
                       'Daños a Terceros',
                       Decode(d.Dat_Obs,
                              'Mercancias Fijas',
                              'Mercancias',
                              d.Dat_Obs)) Descbien,
                d.Dat_Car2 Dvbien,
                d.Dat_Car Bienlv
From A2000040 b, C9999909 c, C9999909 d, SIM_COB_BIENASEGURADO Sc
Where b.Num_Secu_Pol = 29744772418
  And b.Cod_Ries = 2
  And b.Num_End = 3
  And b.End_Prima_Cob != 0
  And b.Tipo_Reg = 'T'
  And c.Cod_Tab = 'PYME_COB_BIEN'
  And c.Codigo1 = b.Cod_Cob
  And d.Cod_Tab = 'PYME_BIEN_ASEGURADO'
  And c.Codigo2 = d.Codigo2
    /*BRGH Anade para incluir solo los bienes activos a la cobertura*/
  --And Sc.cod_cob = b.Cod_Cob
  --And Sc.Cod_Bien = c.Codigo2
  --And Sc.Valor > 0
    /*Fin BRGH Anade para incluir solo los bienes activos a la cobertura*/
Order By c.Codigo2;

select * from c9999909 where cod_tab =  'PYME_BIEN_ASEGURADO'

update  c9999909 set DAT_OBS = 'Ciberseguridad Pymes' where cod_tab = 'AGRUP_PYME' and cod_ramo = 777 and cod_secc = 66 and codigo = 8 and codigo1 = 8;
commit;

update  c9999909 set DAT_OBS = 'Ciberseguridad Pymes' where cod_tab = 'PYME_BIEN_ASEGURADO' and cod_ramo = 777 and cod_secc = 66 and codigo = 11 and codigo2 = 11;
commit;

select * from A2000040 where num_secu_pol = 29744772418 and num_end      = 3 and cod_ries     = 2 and tipo_reg     = 'T';



select n.NUM_END, n.NUM_SECU_POL, n.* from a2000030 n where NUM_POL1 = 1530375065501

select n.NUM_END, n.NUM_SECU_POL, n.* from a2000030 n where NUM_POL1 = 1530375065301


Select c.cod_cob,d.codigo1,e.dat_obs, c.num_end, c.cod_ries
From   A2000040 c, c9999909 d, c9999909 e
Where  c.num_secu_pol = 29744816650
  And    d.codigo2      = c.cod_cob
  And    c.tipo_reg     = 'T'
  And    d.cod_tab = 'AGRUP_X_COB_PYME'
  And    e.cod_tab = 'AGRUP_PYME'
  And    e.codigo1 = d.codigo1;

Select c.cod_cob,d.codigo1,e.dat_obs, c.num_end, c.cod_ries
From   A2000040 c, c9999909 d, c9999909 e
Where  c.num_secu_pol = '29744816789'
  And    d.codigo2      = c.cod_cob
  And    c.tipo_reg     = 'T'
  And    d.cod_tab = 'AGRUP_X_COB_PYME'
  And    e.cod_tab = 'AGRUP_PYME'
  And    e.codigo1 = d.codigo1;




------querys manuel-----------------
----DATOS FIJOS------
select NUM_SECU_POL from a2000030 where NUM_POL1 = 2010000162601;
    29744797776

select NUM_SECU_POL from a2000030 where cod_ramo = 777 and NUM_POL_COTIZ = 1530000641601;
----COBERTURAS DEL NEGOCIO-----
select * from A2000040 where NUM_SECU_POL = 29744797776;

----TABLA DETALLE DEL NOMBRE DE LAS COBERTURAS
select * from a1002100 where COD_COB in(
120,
121,
216,
287,
288,
416,
597,
660,
712,
800,
801,
802) and COD_RAMO = 777;

----tabla servicios que se llaman desde simon ventas
select * from SIM_LOG_WEBSERVICES where ID_SIMLOGWS > 34610797 order by ID_SIMLOGWS desc;

----parametrizacion expedientes cyber
SELECT * FROM A7000100 WHERE COD_CAUSA = 171 AND TIPO_EXPED IS NOT NULL FOR UPDATE
SELECT * FROM A7000100 WHERE COD_CAUSA = 171 AND COD_CONS = 104


select * from sim_log
where columna like 'SIM_P266_PUC015%' order by FECHA desc ;

select * from sim_log
where columna like 'BRGH P266PVV001%' order by FECHA desc ;

select * from sim_log
where columna like 'PYME CALIFICA RESULTADO%' order by FECHA desc;

select * from sim_log
where columna like 'l_Arrcob(Cobert)->%' order by FECHA desc;

Select *
From X2000020
Where Num_Secu_Pol = 29744916573
  And Cod_Ries = 1;



---wilson sancristan PREGUNTAR SERVICIO LOCALIZACION

----loggg
---PRC299_PRUEBASERVICEGEN
begin
    -- Call the procedure
    prc299_pruebaservicegen(ip_idsimlog => :ip_idsimlog);
end;
select * from SIM_LOG_WEBSERVICES where ID_SIMLOGWS = 33530493 for update;
select * from SIM_LOG_WEBSERVICES where ID_SIMLOGWS = 33530521 for update;
select * from SIM_LOG_WEBSERVICES order by ID_SIMLOGWS desc


---configuracion actividades cyber seleccion precios
select * from sim_limite_vlr_xactxbien where cod_actividad = 11001 and cod_bien_aseg =11 for update;

select * from SIM_PARAMETROS_SIMON;


----solucion problema error cotizacion y emicion
                  select xmltype(scl.opsalida),
                 scl.opresultado,
                 dbms_lob.substr(scl.oparrerrores, 4000, 1)
from sim_ctrl_liq scl
where secuencia = 75300;

select * from sim_ctrl_liq scl
where secuencia > 75200;

---verificar datos variable enviados por el servicio
select * from a2000020 where num_secu_pol = '29744830055'
select * from a2000040 where num_secu_pol = '29744830055'

----------valores por actividades-------------------
select * from sim_limite_vlr_xactxbien where cod_actividad = 11001 and cod_bien_aseg =11
   --- 29744835035
select n.PRIMA_COB, n.END_PRIMA_COB, n.PRIMA_ANU, n.END_PRIMA_ANU, n.* from a2000040 n where num_secu_pol = '29744836787' and cod_cob = 216
    1530375074601
select PRIMA_COB, END_PRIMA_COB, PRIMA_ANU, END_PRIMA_ANU from x2000040 where num_secu_pol = '29744836787' and cod_cob = 216
---1530375073401
select coefcob from X2000030 where num_secu_pol = '29744835035'

select * from sim_log
where columna like '266PUC015%'



Begin
    Update X2000040 a
    Set a.End_Prima_Cob = v_Prima, a.Prima_Cob = v_Prima
    Where a.Num_Secu_Pol = Pnumsecupol
      And a.Cod_Ries = Pcodries
      And a.Cod_Cob = 216;
End;
Op_Prima := v_Prima;



Select *
From X2000020
Where Num_Secu_Pol = 29744846479


Select *
From a2000020
Where Num_Secu_Pol = 29744846479

-----reglas datos variable
select * from g2000020 where  cod_ramo = 777 and cod_campo = 'ASISTENCIA_99';

select * from creglas where cdreg = '266GVV601';
select * from creglas where cdreg = '266GVV600';
---

select codigo from c9999909 where cod_tab = 'AGRUP_PYME'


---update g2000020 set valor_defecto = 'S' where  cod_ramo = 777 and cod_campo = 'ASISTENCIA_99';

COMMIT;

--tipos de reglas
--cobertura
--pre-cobertura
--validacion
--calculo
--control tecnico

select * from SIM_COBXALT where COD_RAMO = 777
select * from SIM_LIMITE_VLR_XACTXBIEN;
select * from sim_limite_vlr_xactxbien where cod_actividad = 11001 and cod_bien_aseg =11


Select * From SIM_PARAM_BIEN_ASEGURADO;

------pasar de produccion a desarrollo-------
Select * From C9999909 Where COD_TAB ='PYME_AMENAZA';                     --amenazas
Select * from sim_act_economica ;  --actividad economica
Select * From C9999909 Where cod_tab = 'PYME_BIEN_ASEGURADO';             --Bien asegurado

Select * From SIM_COB_AMENAZA_PYME;                                       --amenaza cobertura              -- solo indica si aplica
select * from SIM_COB_BIENASEGURADO;                                      --cobertura bien asegurado       -- solo indica si aplica

select * from SIM_PIVOTE_TARIFACION where COBERTURA = 802 and COD_RAMO = 777

----------------------------------------------------------------------------------------------------------------------------

create table SIM_PARAM_BIEN_ASEGURADO_COPY AS SELECT * FROM SIM_PARAM_BIEN_ASEGURADO;

select * from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD and a.COD_BIEN_ASEG = b.COD_BIEN_ASEG AND a.COD_ACTIVIDAD = 3011
where a.FECHA_BAJA is null and b.FECHA_BAJA is null order by a.COD_ACTIVIDAD, a.COD_BIEN_ASEG


select * from SIM_PARAM_BIEN_ASEGURADO where COD_ACTIVIDAD = 3011;

update SIM_PARAM_BIEN_ASEGURADO set tipo_bien_aseg = 'V' where COD_ACTIVIDAD = 3011 AND cod_bien_aseg = 9;


select * from SIM_LIMITE_VLR_XACTXBIEN where COD_ACTIVIDAD = 3011 and cod_bien_aseg = 9;

delete from SIM_LIMITE_VLR_XACTXBIEN where COD_ACTIVIDAD = 3011 and cod_bien_aseg = 9;

INSERT INTO SIM_LIMITE_VLR_XACTXBIEN (COD_ACTIVIDAD, COD_BIEN_ASEG, VALOR1, VALOR2, FECHA_CREACION, FECHA_MODIFICA, USUARIO, USUARIO_BAJA, FECHA_BAJA, SECUENCIA, SECUENCIA_PAR_BIEN_ASEG)
VALUES (3011, 9, 0.00, 10000000, TO_DATE('2021-06-22 18:59:21', 'YYYY-MM-DD HH24:MI:SS'), null, '51938035', null, null, 9124, 1508);


select a.SECUENCIA, b.SECUENCIA_PAR_BIEN_ASEG, b.SECUENCIA
from SIM_PARAM_BIEN_ASEGURADO a
         inner join SIM_LIMITE_VLR_XACTXBIEN b
                    on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD and a.COD_BIEN_ASEG = b.COD_BIEN_ASEG
order by a.COD_ACTIVIDAD, a.COD_BIEN_ASEG;


select * from SIM_LIMITE_VLR_XACTXBIEN where cod_bien_aseg = 8 and cod_actividad = 3011;

select * from SIM_PIVOTE_TARIFACION where cobertura = 216;



select * from SIM_COB_AMENAZA_PYME where COD_COB = 287;

select * from SIM_COB_AMENAZA where COD_COB = 287;

select *  from SIM_COB_AMENAZA_PYME a inner join SIM_COB_AMENAZA b on a.id_cob_ame = b.secuencia;

update SIM_LIMITE_VLR_XACTXBIEN set SECUENCIA_PAR_BIEN_ASEG =	509	where secuencia =	5261	;


Select SEC_SIM_LIMITE_VLR_XACTXBIEN.Nextval from   dual;


SELECT * FROM sim_act_economica where COD_ACTIVIDAD like '%03011%';

SELECT * FROM SIM_PARAM_BIEN_ASEGURADO WHERE COD_ACTIVIDAD = '3011'

SELECT * FROM SIM_LIMITE_VLR_XACTXBIEN WHERE COD_ACTIVIDAD = '3011'

------sprint 3 pymes

select *  from SIM_DEDUCIBLES;

select * from SIM_COB_BIENASEGURADO;

select *  from SIM_RANGO_VALASEG_PYME;

select  * from SIM_COB_AMENAZA;

select *  from sim_rango_valaseg_pyme;

select * from SIM_TARIFA_DET_PYMES;

--------

select a.NUM_POL_COTIZ , a.mca_cotizacion, a.* from a2000030 a where cod_secc = 66 and NUM_POL_COTIZ like '1530000750%';

    7508

select a.mca_cotizacion, a.NUM_POL_COTIZ , a.* from a2000030 a where NUM_POL1 = 1540215151502 and num_end = 0


Alter table SIM_COB_AMENAZA add USUARIO_BAJA varchar2(30);
Alter table SIM_AMENAZA_MAPAS add USUARIO_BAJA varchar2(30);
Alter table SIM_AMENAZA_ACTIV add USUARIO_BAJA varchar2(30);

select *  from SIM_COB_AMENAZA_PYME;

--------------------------------------------------------------------------jira ESTCORE-4015
select D.TDOC_TERCERO, D.NRO_DOCUMTO, D.* from a2000030 D where cod_ramo = 777 and NUM_POL1 = 1540215151502;


--901144449
--NT

select *
from sim_parametros_simon
where nombre = 'WS_PYMES_URL'



select * from sim_log
where columna like 'TARIFA PYM%'
order by SECUENCIA desc;

