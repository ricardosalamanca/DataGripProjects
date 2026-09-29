select * from SIM_COBXALT where COD_RAMO = 777

select * from SIM_LIMITE_VLR_XACTXBIEN where VALOR1 = 180000000;



select * from SIM_LIMITE_VLR_XACTXBIEN where SECUENCIA_PAR_BIEN_ASEG = 521;


Select SEC_SIM_LIMITE_VLR_XACTXBIEN.Nextval from   dual;

select * from SIM_LIMITE_VLR_XACTXBIEN where   COD_ACTIVIDAD = 1001

Select * From SIM_PARAM_BIEN_ASEGURADO where   COD_ACTIVIDAD = 1001;

select * from SIM_PARAM_BIEN_ASEGURADO a
    inner join SIM_LIMITE_VLR_XACTXBIEN b on a.SECUENCIA = b.SECUENCIA_PAR_BIEN_ASEG

select count(*)
from SIM_LIMITE_VLR_XACTXBIEN_COPY;

select a.SECUENCIA, b.SECUENCIA_PAR_BIEN_ASEG, b.SECUENCIA from SIM_PARAM_BIEN_ASEGURADO_COPY a
                  inner join SIM_LIMITE_VLR_XACTXBIEN_COPY b on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD and a.COD_BIEN_ASEG = b.COD_BIEN_ASEG
where a.FECHA_BAJA is null and b.FECHA_BAJA is null order by a.COD_ACTIVIDAD, a.COD_BIEN_ASEG

update SIM_LIMITE_VLR_XACTXBIEN set SECUENCIA_PAR_BIEN_ASEG = 	1174	 where secuencia =	8589	;

-----QUERYS POSIBLE SOLUCIUON TABLAS PARAMETRICAS-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--create table SIM_PARAM_BIEN_ASEGURADO_COPY AS SELECT * FROM SIM_PARAM_BIEN_ASEGURADO;
DELETE FROM SIM_PARAM_BIEN_ASEGURADO;
INSERT INTO SIM_PARAM_BIEN_ASEGURADO SELECT * FROM SIM_PARAM_BIEN_ASEGURADO_COPY;
SELECT * FROM SIM_PARAM_BIEN_ASEGURADO;

--create table SIM_LIMITE_VLR_XACTXBIEN_COPY AS SELECT * FROM SIM_LIMITE_VLR_XACTXBIEN;
DELETE FROM SIM_LIMITE_VLR_XACTXBIEN;
INSERT INTO SIM_LIMITE_VLR_XACTXBIEN SELECT * FROM SIM_LIMITE_VLR_XACTXBIEN_COPY;
SELECT * FROM SIM_LIMITE_VLR_XACTXBIEN;

select * from SIM_PARAM_BIEN_ASEGURADO_COPY a
                  inner join SIM_LIMITE_VLR_XACTXBIEN_COPY b on a.SECUENCIA = b.SECUENCIA_PAR_BIEN_ASEG


update SIM_LIMITE_VLR_XACTXBIEN_COPY, SIM_PARAM_BIEN_ASEGURADO_COPY
set SIM_PARAM_BIEN_ASEGURADO_COPY.SECUENCIA = SIM_LIMITE_VLR_XACTXBIEN_COPY.SECUENCIA_PAR_BIEN_ASEG
    where SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_ACTIVIDAD = SIM_PARAM_BIEN_ASEGURADO_COPY.COD_ACTIVIDAD
    AND SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_BIEN_ASEG = SIM_PARAM_BIEN_ASEGURADO_COPY.COD_BIEN_ASEG;


update SIM_LIMITE_VLR_XACTXBIEN
set SIM_LIMITE_VLR_XACTXBIEN.SECUENCIA_PAR_BIEN_ASEG=SIM_PARAM_BIEN_ASEGURADO.SECUENCIA
    from SIM_PARAM_BIEN_ASEGURADO, SIM_LIMITE_VLR_XACTXBIEN
where SIM_LIMITE_VLR_XACTXBIEN.COD_AC

select b.SECUENCIA_PAR_BIEN_ASEG , a.SECUENCIA, B.FECHA_BAJA , b.*, A.*  from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD AND A.COD_BIEN_ASEG = B.COD_BIEN_ASEG

UPDATE SIM_LIMITE_VLR_XACTXBIEN_COPY SET SECUENCIA_PAR_BIEN_ASEG = 549 WHERE COD_ACTIVIDAD = 9010 AND COD_BIEN_ASEG = 1 AND FECHA_BAJA IS NULL AND FECHA_MODIFICA IS NULL

SELECT * FROM SIM_LIMITE_VLR_XACTXBIEN_COPY WHERE COD_ACTIVIDAD = 9010 AND COD_BIEN_ASEG = 1 AND FECHA_BAJA IS NULL AND FECHA_MODIFICA IS NULL;

update SIM_LIMITE_VLR_XACTXBIEN_COPY
set SECUENCIA_PAR_BIEN_ASEG = (select t2.SECUENCIA
              from SIM_PARAM_BIEN_ASEGURADO_COPY t2
              where SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_ACTIVIDAD = t2.COD_ACTIVIDAD AND SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_BIEN_ASEG = t2.COD_BIEN_ASEG)
where SECUENCIA_PAR_BIEN_ASEG = (select SIM_LIMITE_VLR_XACTXBIEN_COPY.SECUENCIA_PAR_BIEN_ASEG
                                 from SIM_PARAM_BIEN_ASEGURADO_COPY t2
                                 where SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_ACTIVIDAD = t2.COD_ACTIVIDAD AND SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_BIEN_ASEG = t2.COD_BIEN_ASEG);


WHERE EXISTS(select 1
             from SIM_LIMITE_VLR_XACTXBIEN t1, SIM_PARAM_BIEN_ASEGURADO t2
             where t1.COD_ACTIVIDAD = t2.COD_ACTIVIDAD AND t1.COD_BIEN_ASEG = t2.COD_BIEN_ASEG);

UPDATE
    (select SIM_LIMITE_VLR_XACTXBIEN_COPY.SECUENCIA_PAR_BIEN_ASEG as OLD, SIM_PARAM_BIEN_ASEGURADO_COPY.SECUENCIA as NEW
     from SIM_PARAM_BIEN_ASEGURADO_COPY
              inner join SIM_LIMITE_VLR_XACTXBIEN_COPY
                         on SIM_PARAM_BIEN_ASEGURADO_COPY.COD_ACTIVIDAD = SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_ACTIVIDAD AND
                            SIM_PARAM_BIEN_ASEGURADO_COPY.COD_BIEN_ASEG = SIM_LIMITE_VLR_XACTXBIEN_COPY.COD_BIEN_ASEG
    ) t
SET OLD = NEW;


UPDATE SIM_LIMITE_VLR_XACTXBIEN t1
SET (SECUENCIA_PAR_BIEN_ASEG) = (select t2.SECUENCIA FROM SIM_PARAM_BIEN_ASEGURADO t2 WHERE t1.COD_ACTIVIDAD = t2.COD_ACTIVIDAD AND t1.COD_BIEN_ASEG = t2.COD_BIEN_ASEG)
WHERE EXISTS(select 1 FROM SIM_PARAM_BIEN_ASEGURADO t2 WHERE t1.COD_ACTIVIDAD = t2.COD_ACTIVIDAD AND t1.COD_BIEN_ASEG = t2.COD_BIEN_ASEG);





select a.*,b.* from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD AND A.COD_BIEN_ASEG = B.COD_BIEN_ASEG
where b.FECHA_BAJA is null and a.FECHA_BAJA is null

select * from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.SECUENCIA = b.SECUENCIA_PAR_BIEN_ASEG


SELECT * FROM SIM_PARAM_BIEN_ASEGURADO WHERE SECUENCIA=1019;

SELECT  * FROM SIM_LIMITE_VLR_XACTXBIEN WHERE SECUENCIA_PAR_BIEN_ASEG = 1019;


-----QUERYS POSIBLE SOLUCIUON TABLAS PARAMETRICAS           FIN                 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--update SIM_LIMITE_VLR_XACTXBIEN set FECHA_BAJA = TO_DATE('2021-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHERE COD_BIEN_ASEG = 11 and FECHA_BAJA is null and VALOR1 = 180000000;

--INSERT INTO SIM_LIMITE_VLR_XACTXBIEN (COD_ACTIVIDAD, COD_BIEN_ASEG, VALOR1, VALOR2, FECHA_CREACION, FECHA_MODIFICA, USUARIO, USUARIO_BAJA, FECHA_BAJA, SECUENCIA, SECUENCIA_PAR_BIEN_ASEG)
--VALUES (7001, 11, 180000000.00, null, TO_DATE('2021-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '51938035', null, null, (select max(secuencia) from SIM_LIMITE_VLR_XACTXBIEN)+1, 521);

select * from SIM_COB_AMENAZA_PYME;
select * from SIM_COB_BIENASEGURADO;

select * from SIM_PIVOTE_TARIFACION where COBERTURA = 802 and COD_RAMO = 777

--update SIM_PIVOTE_TARIFACION set FACTOR = 0.00388200 where COBERTURA = 802 and COD_RAMO = 777;

--update SIM_PIVOTE_TARIFACION set FACTOR = 0.00349400 where COBERTURA = 802 and COD_RAMO = 777;


SELECT * FROM sim_act_economica where FECHA_BAJA is null ;
SELECT *  FROM SIM_COBXALT where cod_cob in (802,801);
select *  from SIM_PIVOTE_TARIFACION where COBERTURA = 287

select * from SIM_COBERTURA_VA;


--SECUENCUENCIA LIMITEVALOR POR ACTIVIDAD
Select SEC_SIM_LIMITE_VLR_XACTXBIEN.Nextval
from   dual;

---SECUENCIA LIMITE POR ACTIVIDAD ULTIMO DESARROLLO
Select SEC_SIM_PARAM_BIEN_ASEGURADO.Nextval
from   dual;

--Select SEC_SIM_PARAM_BIEN_ASEGURADO.Nextval
--from   dual;

SELECT * FROM sim_act_economica where COD_ACTIVIDAD like '02002';

---SECUENCIA ACTIVIDADES ECONOMICAS
Select SEQ_ACTIVIDAD_ECONOMICA.Nextval from   dual;

select * from SIM_LIMITE_VLR_XACTXBIEN where COD_ACTIVIDAD = 02002 and COD_BIEN_ASEG = 6

select * from SIM_PARAM_BIEN_ASEGURADO where COD_ACTIVIDAD = 02002 and COD_BIEN_ASEG = 6

Alter table SIM_PIVOTE_TARIFACION add USUARIO_BAJA varchar2(30);


INSERT INTO SIM_PARAM_BIEN_ASEGURADO (COD_ACTIVIDAD, COD_BIEN_ASEG, TIPO_BIEN_ASEG, FECHA_CREACION, FECHA_MODIFICA, USUARIO, USUARIO_BAJA, FECHA_BAJA, FECHA_ALTA, SECUENCIA)
VALUES (7002, 1, 'V', TO_DATE('2021-06-22 16:40:01', 'YYYY-MM-DD HH24:MI:SS'), null, '51938035', null, null, TO_DATE('2021-06-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1483);


select n.NUM_END, n.COD_END, n.SUB_COD_END, n.NUM_SECU_POL, n.* from a2000030 n where NUM_POL1 = 1530375065501
select n.NUM_END, n.COD_END, n.SUB_COD_END, n.NUM_SECU_POL, n.* from x2000030 n where  NUM_END > 0 and COD_RAMO = 777
select n.NUM_END, n.COD_END, n.SUB_COD_END, n.NUM_SECU_POL, n.* from x2000030 n where num_secu_pol = 29744824793


select * from SIM_LIMITE_VLR_XACTXBIEN where SECUENCIA = 8589;


select * from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.SECUENCIA = b.SECUENCIA_PAR_BIEN_ASEG
where a.COD_BIEN_ASEG = 9


select a.SECUENCIA, b.SECUENCIA_PAR_BIEN_ASEG, b.SECUENCIA, b.* from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD and a.COD_BIEN_ASEG = b.COD_BIEN_ASEG
--where b.COD_ACTIVIDAD = 07002
order by a.COD_ACTIVIDAD, a.COD_BIEN_ASEG;


select * from SIM_PIVOTE_TARIFACION;



alter table SIM_PIVOTE_TARIFACION
    add USUARIO_BAJA varchar2(30);

select * from OPS$PUMA.CREGLAS;

select * from a2000040 where num_secu_pol = '29744836787' and cod_cob = 216;

--select * from SIM_COB_AMENAZA_PYME where COD_COB = 287;
---amenaza por cobertura
select * from SIM_COB_AMENAZA where COD_COB = 120;

select * from SIM_AMENAZA_ACTIV;

select *  from SIM_COB_AMENAZA_PYME a inner join SIM_COB_AMENAZA b on a.id_cob_ame = b.secuencia;

Select e.cod_cob,f.cod_amenaza,f.tipo_tarifacion,e.end_suma_aseg,f.tasa
From   a2000040 e,SIM_COB_AMENAZA f,SIM_COB_AMENAZA_PYME g
Where
    e.num_secu_pol  = 29744824793
  And    e.cod_ries      = 1
  and e.tipo_reg      = 'T'
  And    e.cod_cob       = f.cod_cob
  And    e.cod_cob       = g.cod_cob
  --And    e.cod_cob       = nvl(cob,e.cod_cob)
  And    f.cod_amenaza   = g.cod_amenaza
  And    nvl(e.end_suma_aseg,0) != 0
  And    g.valor        != 0
  And    trunc(sysdate) Between trunc(g.fecha_creacion) And nvl(trunc(g.fecha_baja),trunc(Sysdate+1))
  And    trunc(sysdate) Between trunc(f.fecha_creacion) And nvl(trunc(f.fecha_baja),trunc(Sysdate+1))
Order By e.cod_cob,f.cod_amenaza,f.tipo_tarifacion;

Select e.cod_cob
     ,e.end_suma_aseg
     ,b.factor tasa
     ,e.end_suma_aseg*factor prima
,b.TABLA, b.*
From   a2000040 e, sim_tarifa_det_pymes b
Where  e.num_secu_pol  = 29744824793
  And    e.cod_ries      = 1
  And    b.num_end       = 0
  And    e.tipo_reg      = 'T'
  And    e.cod_cob       = b.cod_cob
  And    e.cod_cob       != 216
  And    e.num_secu_pol  = b.num_secu_pol
  And    e.cod_ries      = b.cod_ries
--And    nvl(e.suma_aseg,0) != 0
  And    nvl(e.end_suma_aseg,0) != 0;


SELECT n.NUM_END,n.SUB_COD_END, n.* from a2000030 n where num_pol1 =  2101010003002;


select n.NUM_END,n.SUB_COD_END , n.*
from x2000030 n
where num_secu_pol = 29749203084;

select  n.cod_ries, n.*
from x2000040 n
where num_secu_pol = 29749203084
  and cod_ries = 5
  and cod_cob not in (801, 802)
  and end_suma_Aseg > 0;

select * from sim_log
where columna like 'SEG_DEH%'

select * from sim_log
where columna like 'PYME CALIFICA RESULTADO%'


    Select * From Sim_Param_Bien_Asegurado Where Cod_Actividad=06001
                                                and Cod_Bien_Aseg=10;


Select Secuencia, Cod_Actividad, Cod_Bien_Aseg, Fecha_Baja, Fecha_Creacion, Fecha_Modifica, Usuario, Usuario_Baja, Valor1, Valor2, Secuencia_Par_Bien_Aseg
From Sim_Limite_Vlr_Xactxbien Where (Secuencia_Par_Bien_Aseg In (1294, 1326, 1410));

Select Secuencia, Cod_Actividad, Cod_Bien_Aseg, Fecha_Alta, Fecha_Baja, Fecha_Creacion, Fecha_Modifica, Tipo_Bien_Aseg, Usuario, Usuario_Baja From Sim_Param_Bien_Asegurado
WHERE ((((1 = 1) AND (COD_ACTIVIDAD = 09010)) AND (COD_BIEN_ASEG = 4)) AND (TIPO_BIEN_ASEG = 'L')) ORDER BY SECUENCIA DESC;


SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'MESES_HISTORICO'


Select Secuencia, Cod_Actividad, Cod_Bien_Aseg, Fecha_Baja, Fecha_Creacion, Fecha_Modifica, Usuario, Usuario_Baja, Valor1, Valor2, Secuencia_Par_Bien_Aseg From Sim_Limite_Vlr_Xactxbien Where (Secuencia_Par_Bien_Aseg In (1294, 1326, 1410))


Select Secuencia, Cod_Actividad, Cod_Bien_Aseg, Fecha_Baja, Fecha_Creacion, Fecha_Modifica, Usuario, Usuario_Baja, Valor1, Valor2, Secuencia_Par_Bien_Aseg
From Sim_Limite_Vlr_Xactxbien Where (Secuencia_Par_Bien_Aseg In (1294, 1326, 1410))

select * from SIM_PARAM_BIEN_ASEGURADO a
                  inner join SIM_LIMITE_VLR_XACTXBIEN b on a.SECUENCIA = b.SECUENCIA_PAR_BIEN_ASEG
where Secuencia_Par_Bien_Aseg In (1294, 1326, 1410)


select * from SIM_PIVOTE_TARIFACION where  cobertura = 123;


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


select * from a2000030 n where TDOC_TERCERO = 'NT'

select * from SIM_COB_AMENAZA WHERE  COD_COB = 120 AND TIPO_TARIFACION = 'F';

---Alter table SIM_COB_AMENAZA add USUARIO_BAJA varchar2(30);

select * from SIM_AMENAZA_MAPAS where COD_MAPAS = 1 and TIPO_TARIFACION = 'F';

--Alter table SIM_AMENAZA_MAPAS add USUARIO_BAJA varchar2(30);

select * from SIM_AMENAZA_ACTIV where COD_ACTIVIDAD = 1003;

---Alter table SIM_AMENAZA_ACTIV add USUARIO_BAJA varchar2(30);

select column_name, data_length, data_type from all_tab_columns where table_name = 'SIM_PIVOTE_TARIFACION';

------sprint 3 pymes
----Alter table SIM_DEDUCIBLES add USUARIO_BAJA varchar2(30);
select *  from SIM_DEDUCIBLES;

----Alter table SIM_COB_BIENASEGURADO add USUARIO_BAJA varchar2(30);
select * from SIM_COB_BIENASEGURADO;

-----Alter table SIM_RANGO_VALASEG_PYME add USUARIO_BAJA varchar2(30);
select *  from SIM_RANGO_VALASEG_PYME;

----Alter table SIM_COBERTURA_VA add USUARIO_BAJA varchar2(30);
select * from SIM_COBERTURA_VA;

---Alter table SIM_COB_AMENAZA_PYME add USUARIO_BAJA varchar2(30);
select *  from SIM_COB_AMENAZA_PYME;

select * from a2000030 where NUM_POL1 = 15402151515;

select * from SIM_LOG_WEBSERVICES where ID_SIMLOGWS > 33700635 order by ID_SIMLOGWS desc;
--33700174
--33700656
--33700659


----tabla de coberturas------
SELECT * FROM A1002100 WHERE COD_RAMO = 777;


select * from CREGLAS where cdreg = '266PVV001'


select * from x2000020 where COD_CAMPO = 'REF_CELULAR'

select * from x2000020 where COD_CAMPO = 'API_ESTRATEGIA'



Select Nvl(a.Mca_Hab_Mod, 'N'), b.Ramo_Anexo, a.Mca_Visible
From X2000020 a, G2000020 b
Where a.Num_Secu_Pol = 39744874564
  And a.Cod_Campo = b.Cod_Campo
  And b.Cod_Cia = 3
  And b.Cod_Ramo = 777
  And Nvl(a.Cod_Ries, 0) = Nvl(1, 0)
  And a.Cod_Campo = 'COD_ASEG';


select * from X2000020 a where a.Num_Secu_Pol = 39744874783 and a.COD_CAMPO in ('TIPO_DOC_ASEG', 'COD_ASEG')
--39744874780

select * from G2000020 where COD_CAMPO in ('TIPO_DOC_ASEG', 'COD_ASEG') and COD_CIA = 3 and COD_RAMO = 777


select * from sim_log where columna like 'P266PVV001'
--------------------------------------------------------------------------jira ESTCORE-4015
select NUM_SECU_POL from a2000030 where cod_ramo = 777 and NUM_POL1 = 1540215151502;

select* from SIM_COB_AMENAZA_PYME;



select *  from CREGLAS where cdreg = '266PUC015'


SELECT A.TIPO_EXPED, TO_CHAR((B.VALOR_ACTUAL - B.TOTAL_LIQ))VR_RVA_PENDIENTE
FROM A7001000 A
         INNER JOIN A7001200 B
                    ON A.NUM_SECU_EXPED = B.NUM_SECU_EXPED
                        AND A.NRO_ORDEN_EXP = B.NRO_ORDEN_EXP
         INNER JOIN (SELECT TIPO_EXPED, MAX(NRO_ORDEN_EXP) NRO_ORDEN_EXP
                     FROM A7001000
                     WHERE COD_CIA = 3
                       AND COD_SECC = 23
                       AND NUM_SINI = 10172302254
                     GROUP BY TIPO_EXPED) X
                    ON A.TIPO_EXPED = X.TIPO_EXPED
                        AND A.NRO_ORDEN_EXP = X.NRO_ORDEN_EXP
WHERE B.TIPO_REG = 'T'
  AND A.COD_CIA = 3
  AND A.COD_SECC = 23
  AND A.NUM_SINI = 10172302254
GROUP BY A.TIPO_EXPED, B.VALOR_ACTUAL, B.TOTAL_LIQ;

select * from SIM_COBERTURA_VA;


select *  from A2000020 where COD_CAMPO like '%VLR_MCIAS%' ;


SELECT PP.NUM_POL1 ,
       A20D.COD_RIES ,
       DECODE(A20D.VALOR_CAMPO,'F','FULL','BÁSICO') CYBER_RISK ,
       PP.TDOC_TERCERO ,
       PP.NRO_DOCUMTO ,
       PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES,
       NN.TIPO_DOCUMTO ,
       NN.NRO_DOCUMTO  DOC_BENEF,
       NN.Nombre || ' ' ||
       NN.APELLIDO NOM_BENEF,
       to_char(PP.FECHA_VIG_POL, 'DD-MM-YYYY'),
       to_char(PP.FECHA_VENC_POL, 'DD-MM-YYYY')

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
  AND PP.NUM_END      = ( SELECT MAX(C.NUM_END) FROM A2000030 C
                          WHERE C.NUM_SECU_POL = PP.NUM_SECU_POL)
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
  AND A20D.VALOR_CAMPO  in ('B','F')
  AND PP.NUM_END        =
      (SELECT MAX(SA.NUM_END)
       FROM A2000030 SA
       WHERE SA.NUM_POL1 = PP.NUM_POL1
         AND SA.COD_CIA    = PP.COD_CIA
         AND SA.COD_SECC   = PP.COD_SECC
         AND SA.COD_RAMO   = PP.COD_RAMO
      )
--AND PP.FECHA_EMI_END BETWEEN TO_DATE(?FECHA_INI,'DD-MM-YYYY') AND TO_DATE(?FECHA_FIN,'DD-MM-YYYY')
  AND PP.FECHA_EMI_END BETWEEN TO_DATE('01-08-2021','DD-MM-YYYY') AND TO_DATE('15-08-2021','DD-MM-YYYY')
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 23
  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1,
         A20D.COD_RIES


select * from g2000020 where cod_ramo = 777;

select *
from sim_parametros_simon
where nombre = 'WS_PYMES_URL'

SELECT * FROM sim_calificacion_pymes;

                  Select *
From C9999909 a
Where a.Cod_Cia = 3
  And a.Cod_Tab = 'SMASEGMAXATGC';


SELECT count(*) FROM SIM_LOG_MOTORTARIFA;

SELECT a.num_pol1
     , a.num_end
     , a.num_secu_pol
     , a.fecha_venc_pol
     , a.fecha_venc_end
     , a.cod_ramo
     , a.RENOVADA_POR
     , a.MCA_RENOV
     , a.NUM_POL_ANT
     , a.*
FROM a2000030 a
WHERE a.cod_cia = 3
  AND a.cod_secc = 66
--AND a.cod_ramo = 778
  -- AND RENOVADA_POR IS NOT NULL
  AND a.NUM_POL1 LIKE '15123050313%';
  --AND NUM_SECU_POL = 29795416415;