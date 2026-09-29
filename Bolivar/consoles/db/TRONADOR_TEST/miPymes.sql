select t.cod_cia,
       t.cod_ramo,
       t.num_secu,
       t.cod_campo,
       g.txt_titulo,
       t.cod_nivel,
       g.txt_help,
       g.*
from G2000020 t, G2000010 g
where t.cod_cia = g.cod_cia
  and t.cod_campo = g.cod_campo
  and t.cod_cia = 3
  and  t.cod_campo like '%DESC_RIES%';
 -- and t.cod_ramo = 778;


select h.DAT_CAR2, h.* from c9999909 h where COD_TAB = 'ALT_COB_PYME';

update c9999909 h set h.DAT_CAR2 = 'S'
WHERE h.COD_TAB = 'ALT_COB_PYME'
  and h.CODIGO = 1;

/*
update c9999909 h
set h.DAT_CAR2 = 'N'
WHERE h.COD_TAB = 'ALT_COB_PYME'
  and h.CODIGO in (2, 3);
*/

select * from a2000030 where num_pol1= 1530375093401;


select * from a2000030 where num_pol1= 1530375093501;


-----Ejecutar en la BD de Terceros para saltar el Sarlaft:

UPDATE NATURALES
SET FECHA_MODIFICACION = SYSDATE, USUARIO_MODIFICACION = '79295481'
WHERE NUMERO_DOCUMENTO = 1069729145;
UPDATE ATGC_LOG_TRANSACCIONES Y
SET Y.FECHA_TRANSACCION = SYSDATE,
    Y.USUARIO_TRANSACCION = '79295481',
    Y.FORMULARIO_TRANSACCION = 'B122'
WHERE Y.NUMERO_DOCUMENTO_CLIENTE = 1069729145
  AND Y.FECHA_TRANSACCION =
      (SELECT MAX(X.FECHA_TRANSACCION)
       FROM ATGC_LOG_TRANSACCIONES X
       WHERE X.NUMERO_DOCUMENTO_CLIENTE = Y.NUMERO_DOCUMENTO_CLIENTE);
UPDATE ESTADOS_FINANCIEROS E
SET E.FECHA_MODIFICACION = SYSDATE,
    E.USUARIO_MODIFICACION = '79295481',
    E.FECHA_PERIODO = TRUNC(SYSDATE)
WHERE E.NAT_SECUENCIA =
      (SELECT N.SECUENCIA
       FROM NATURALES N
       WHERE N.NUMERO_DOCUMENTO = 1069729145)
  AND E.SECUENCIA =
      (SELECT MAX(E1.SECUENCIA)
       FROM ESTADOS_FINANCIEROS E1
       WHERE E1.NAT_SECUENCIA = E.NAT_SECUENCIA);
----Se reemplaza el 52033033 por el número de documento deseado

SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION_PYME' AND COD_RAMO = 778 and codigo1 = 999;


SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION' AND COD_RAMO = 777;


SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND NVL(CR.COD_SUBPROD,0) = 0
  AND CR.ESTADO_MOTOR       = 'A'
order by orden_Capitulo, orden_Campo;

SELECT
       A.COD_CAMPO,
       B.TXT_TITULO,
       B.LONG_CAMPO,
       B.TIPO_CAMPO,
       DECODE(A.COD_REGLA, '', B.COD_REGLA, A.COD_REGLA),
       A.NUM_SECU,
       A.COD_NIVEL,
       A.MCA_PPTO,
       A.ACEPTA_NULL,
       A.OBLIGATORIO,
       DECODE(A.ACEPTA_NULL,
              'S',
              DECODE(A.OBLIGATORIO, 'S', 'S', 'N'),
              'S'),
       DECODE(A.COD_CAMPO, 'TOMADOR', 'S', 'S'),
       A.COD_NIVEL,
       A.TABLA_VAL,
       A.PGM_HELP,
       A.LISTA_VALORES,
       A.REG_PRE_FIELD,
       A.TEXTO_ERROR,
       A.VALOR_DEFECTO,
       A.COD_COB,
       A.COD_AGRAVANTE,
       A.TXT_HELP,
       'N',
       A.CLAUSULAS,
       COD_NIVEL_SIST
from G2000020 A, G2000010 B
WHERE A.COD_CIA = 3
  AND A.COD_CIA = B.COD_CIA
  AND COD_RAMO = 778
  AND (COD_NIVEL_SIST = 2 OR COD_NIVEL_SIST = 9)
  AND A.COD_CAMPO = B.COD_CAMPO
  AND NVL(A.MCA_BAJA, 'N') <> 'S'
  AND NVL(B.MCA_BAJA, 'N') <> 'S'
  AND COD_NIVEL = 1;

-----COD_NIVEL_SIST SIEMPRE TIENE QUE SE NUMERICO
----- problema en  pkg299_datos_gen_mc.Inserta_transitorias_E0
-- error -> AND (COD_NIVEL_SIST = 2 OR COD_NIVEL_SIST = 9)
-- solucion -> AND (COD_NIVEL_SIST = '2' OR COD_NIVEL_SIST = '9')
select g.COD_NIVEL_SIST, g.* from G2000010 g where cod_cia = 3;

SELECT * FROM X2000020 WHERE NUM_SECU_POL = 12345;




SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND NVL(CR.COD_SUBPROD,0) = 0
  AND CR.ESTADO_MOTOR       = 'A'
ORDER BY orden_Capitulo, orden_Campo;


select * from c9999909 ag where ag.cod_tab = 'AGRUP_PYME' order by codigo ;


--Relación agrupación cob - cobertura
select * from c9999909 agc where agc.cod_tab = 'AGRUP_X_COB_PYME' order by codigo1, codigo;



SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'AGRUP_X_BIEN_PYME';

select *
from SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) > to_date('2023-02-06 09:07:00', 'YYYY-MM-DD HH24:MI:SS')
  AND ID_COTIZACION = '12348';

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '12348'
  AND FECHA_EJECUCION > to_date('2023-02-23 09:07:00', 'YYYY-MM-DD HH24:MI:SS');


select * from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION > to_date('2023-02-23 09:07:00', 'YYYY-MM-DD HH24:MI:SS') AND ID_COTIZACION = '123487'




SELECT TO_NUMBER(TRIM('0.798798')) FROM dual;

SELECT TO_NUMBER(TRIM('0,798798')) FROM dual;


SELECT count(*) FROM SIM_LOG_MOTORTARIFA;
--produccion 20 millones

select *
from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
  AND ID_COTIZACION = 123489;

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = 123489
  AND FECHA_EJECUCION > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS');


SELECT *
FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '39745220812'
  and FECHA_INICIO > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

/*
select * from OPS$PUMA.sim_log_general
where columna like 'RASA_MOTOR%' and TIMESTAMP > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
order by secuencia desc;
*/


SELECT NUM_COTIZACION_DES,
       NUM_COTIZACION_HAS
FROM A2990920
WHERE COD_CIA = 3
  AND COD_SECC = 66
  AND COD_AGENCIA = 5146


-------------------------------------------------------------------------CREACION COTIZACION-------------------------------------------------------------------------------------------------------------------
----PARAMETRIZACION AGENTES CONVENIOS
SELECT * FROM A1001700 WHERE COD_RAMO = 778;
SELECT * FROM A1001701 WHERE COD_RAMO = 778;
SELECT * FROM CONVENIOS_CLAVE WHERE CLAVE = 55800;

select *
from g2000020
where cod_ramo in (778)
  and cod_campo in ('NUM_COTIZ', 'MCIA_CADACUAN');

select *
from g2000020
where cod_ramo in (778) and COD_REGLA = '201PVV001';

select *
from g2000010
where COD_CIA IN (2, 3)
  AND COD_CAMPO IN
      ('COD_OFI_DAVI', 'CORREO', 'EMAIL_CONT', 'FECHA_ORIGEN', 'ID_COTIZ', 'IMPORTE_CESION', 'MAIL_RL', 'NEG_CORPORA',
       'NOMBRE_RL', 'NROIDRL', 'PROMOTOR_DA', 'TELEFONO_RL', 'TIPODOCRL', 'VLR_VTASANUAL');

select n.NUM_END, n.COD_END, n.SUB_COD_END, n.NUM_SECU_POL, n.NUM_POL_CLI, n.* from x2000030 n where NUM_POL1 = 1530375071801;

select n.NUM_END, n.COD_END, n.SUB_COD_END, n.NUM_SECU_POL, n.NUM_POL_CLI, n.* from x2000030 n where num_secu_pol = 39745158827;

select * from naturales where numero_documento = 32145740;

select * from SIM_TERCEROS where numero_documento = 32145740;

--polizas
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.*
from a2000030 a
where cod_secc = 66
  and NUM_POL_COTIZ = 1530000891101;

select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from a2000030 a WHERE NRO_DOCUMTO = 51646836;

select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from a2000030 a
where cod_secc = 66
  and NUM_POL1 = 1530375100301;

select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from a2000030 a
where cod_secc = 66
  and NUM_SECU_POL = 39745164530;

---datos variables polizas
select a.*  from a2000020 a
where num_secu_pol = 29861287020;

select a.*  from x2000020 a
where num_secu_pol = 39745163065;

----coberturas
Select  a.*
From A2000040 a
Where num_secu_pol = 29861287020;

Select  a.*
From x2000040 a
Where num_secu_pol = 39745164521;

---marcas reaseguros
Select  a.COD_SECC_REAS, a.NUM_BLOQUE_REAS, a.MCA_REASEGURO, a.COD_COB, a.*
From A2000040 a
Where num_secu_pol = 39745161820;
----------
Select a.*
From A2000040 a
Where num_secu_pol = 39745161820;

Select  a.*
From x2000040 a
Where num_secu_pol = 39745160331;


--Asegurados
select t.*, rowid from a2001300 t WHERE NUM_SECU_POL = 39745158848;


SELECT NUM_COTIZACION_DES,
       NUM_COTIZACION_HAS,
       COD_SECC,
       COD_AGENCIA
FROM A2990920
WHERE COD_CIA = 3
  AND COD_SECC = 66
  AND COD_AGENCIA = 5146;
SELECT *
FROM A2990920
WHERE COD_CIA = 3
  AND COD_SECC = 66;

select * from CREGLAS where cdreg = '778PCC001';

select t.*, rowid
from SIM_DEBITO_AUTOMATICO t
WHERE NUM_SECU_POL = 39745157078;

select t.*, rowid
from SIM_XDEBITO_AUTOMATICO t
WHERE NUM_SECU_POL = 39745157078;

select t.*, rowid from x2000060 t WHERE NUM_SECU_POL = 39745157078;
-----debito automatico
select t.*, rowid from a2000060 t WHERE NUM_SECU_POL = 39745158848;

SELECT Cod_conv, porc_Comi, mca_base, a.*
FROM x2000253 a
WHERE Num_secu_pol = 39745164508;


select * from x2000252 where NUM_SECU_POL = 39745164521;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1530375076301 AND COD_SECC = 66;
----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745169099;
----FACTURAS
select a.IMP_DER_EMI, a.* from a2990700 a where NUM_SECU_POL in (29861471568, 29861455156);
---VALOR TOTAL DE LA PRIMA
select * from a2000160 where NUM_SECU_POL = 39745169099;
----impuestos
select * from x2000190 where NUM_SECU_POL = 39745169099;
select * from a2000190 where NUM_SECU_POL = 39745169099;

SELECT *
FROM SIM_PROCESOS F
WHERE F.ID_PROCESO = 261
  AND NVL(F.ID_PROCESO_PADRE, -1) = NVL(260, -1);
--AND F.MODULO = IP_MODULO;

Select *
From C1001010
Where-- Cod_Ent_Coord = Ip_Codigoentidad
        Cod_Producto = 778
  And Cod_Cia = 3
Order By Fecha_Vig Desc

Select Cod_Ent_Coord
From C1001000 a
Where a.Cod_Entidad = 0;


select t.*, rowid
from SIM_XDEBITO_AUTOMATICO t
WHERE COD_IDENTIF = '51646836';


select * from Sim_x_Riesgo_Poliza where NUM_SECU_POL = 39745160239;

select t.*, rowid from a2000020 t where t.num_secu_pol = 29780633851;



SELECT 39745162163, 1, A.COD_CAMPO,
       B.TXT_TITULO, B.LONG_CAMPO, B.TIPO_CAMPO,
       DECODE(A.COD_REGLA,'',B.COD_REGLA,A.COD_REGLA),
       A.NUM_SECU, A.COD_NIVEL, A.MCA_PPTO, A.ACEPTA_NULL, A.OBLIGATORIO,
       DECODE(A.ACEPTA_NULL,'S',DECODE(A.OBLIGATORIO,'S','S','N'),'S'),
       DECODE(A.COD_CAMPO,'TOMADOR','S', MCA_VISIBLE),
       A.COD_NIVEL, A.TABLA_VAL, A.PGM_HELP, A.LISTA_VALORES,
       A.REG_PRE_FIELD, A.TEXTO_ERROR, A.VALOR_DEFECTO, A.COD_COB,
       A.COD_AGRAVANTE, A.TXT_HELP ,'N',A.CLAUSULAS
FROM G2000020 A, G2000010 B
WHERE A.COD_CIA  = 3 AND A.COD_CIA  =  B.COD_CIA
  AND COD_RAMO = 778
  AND (COD_NIVEL_SIST =  2 OR COD_NIVEL_SIST =  9 )
  AND  A.COD_CAMPO    = B.COD_CAMPO AND  NVL(A.MCA_BAJA,'N')<>'S'
  AND  NVL(B.MCA_BAJA,'N')<>'S'
  AND ((null IS NULL AND Cod_nivel = 1) OR
       (null IS NOT NULL AND Cod_nivel != 1));


SELECT 39745162163, 1, A.COD_CAMPO,
       B.TXT_TITULO, B.LONG_CAMPO, B.TIPO_CAMPO,
       DECODE(A.COD_REGLA,'',B.COD_REGLA,A.COD_REGLA),
       A.NUM_SECU, A.COD_NIVEL, A.MCA_PPTO, A.ACEPTA_NULL, A.OBLIGATORIO,
       DECODE(A.ACEPTA_NULL,'S',DECODE(A.OBLIGATORIO,'S','S','N'),'S'),
       DECODE(A.COD_CAMPO,'TOMADOR','S', MCA_VISIBLE),
       A.COD_NIVEL, A.TABLA_VAL, A.PGM_HELP, A.LISTA_VALORES,
       A.REG_PRE_FIELD, A.TEXTO_ERROR, A.VALOR_DEFECTO, A.COD_COB,
       A.COD_AGRAVANTE, A.TXT_HELP ,'N',A.CLAUSULAS
FROM G2000020 A, G2000010 B
WHERE A.COD_CIA  = 3 AND A.COD_CIA  =  B.COD_CIA
  AND COD_RAMO = 778
  AND (COD_NIVEL_SIST =  2 OR COD_NIVEL_SIST =  9 )
  AND  A.COD_CAMPO    = B.COD_CAMPO AND  NVL(A.MCA_BAJA,'N')<>'S'
  AND  NVL(B.MCA_BAJA,'N')<>'S'
  -- and A.cod_campo in ('NUM_COTIZ', 'MCIA_CADACUAN')
  AND ((1 IS NULL AND Cod_nivel = 1) OR
       (1 IS NOT NULL AND Cod_nivel != 1));


------config Reaseguros-------------------------------------------------------------------------------------------------------------
select * from a8500140  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2023);


select * from a8500150  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 1023, 1203)
                          AND ano_cont in (2022);
select * from a8500150  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2023);



select * from a8500160  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2022);
select * from a8500160  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2023);


select * from a1002081  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2022);
select * from a1002081  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2023);

select * from a1002080  WHERE cod_cia = 3
                          AND COD_RAMO  IN (778);

select * from C8000005  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2022);
select * from C8000005  WHERE cod_cia = 3
                          AND num_cont in (302, 303, 512, 702, 802, 1023, 1203)
                          AND ano_cont in (2023);
------config Reaseguros-------------------------------------------------------------------------------------------------------------


select * from SIM_TERCEROS where NUM_SECU_POL = 39745168064;

---CONTROLES TECNICOS
select c.REGLA_COMPLETA, c.* from CREGLAS c where cdreg = '999CTT002';

select c.REGLA_COMPLETA, c.* from CREGLAS c where cdreg = '778CTT001';

update CREGLAS set dsabort = 'N' where  cdreg = '778CTT001';

select * from g2000200 where CDREG = '778CTT001';

select * from g2000200;
----TABLA DE MENSAJES DE CONTROLES TECNICOS
select * from g2000210 where cod_error in ('289','329','340');

select * from g2000210 where COD_CIA = 3 and COD_ERROR = 963 and DESC_ERROR like '%EMITIR%'


select t.MCA_COTIZACION,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and t.fecha_venc_pol >= to_date('25/10/2022', 'dd/mm/yyyy') --between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
  AND t.FECHA_VENC_POL = FECHA_VENC_PER
  AND NVL(t.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(t.MCA_CADUCA, 'N') = 'N'
  AND t.COD_COA != 3
  AND NVL(t.MCA_COTIZACION, 'N') IN ('S','V')
  AND t.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)
  and nvl(t.tipo_end, 'XX') <> 'AT'
  and exists
    (SELECT * FROM A2000020 c WHERE c.NUM_SECU_POL = t.NUM_SECU_POL)
order by t.num_pol1, t.num_end;

--------POLIZAS 778
select t.MCA_COTIZACION, t.num_secu_pol,t.NUM_POL_COTIZ,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and t.fecha_venc_pol >= to_date('25/10/2022', 'dd/mm/yyyy') --between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
  and t.FECHA_EMI >= to_date('25/01/2023', 'dd/mm/yyyy')
  AND t.FECHA_VENC_POL = FECHA_VENC_PER
  AND NVL(t.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(t.MCA_CADUCA, 'N') = 'N'
  AND t.COD_COA != 3
  AND NVL(t.MCA_COTIZACION, 'N') IN ('N')
  AND t.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)
  and nvl(t.tipo_end, 'XX') <> 'AT'
  and exists
    (SELECT * FROM A2000020 c WHERE c.NUM_SECU_POL = t.NUM_SECU_POL)
order by t.num_pol1, t.num_end;

-----cod_ries > 1
select b.*
from a2000020 b
where NUM_SECU_POL in (select t.NUM_SECU_POL
                       from a2000030 t
                       where t.cod_secc = 66
                         and t.cod_ramo = 778
                         and t.fecha_venc_pol >= to_date('25/10/2022', 'dd/mm/yyyy') --between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
                         and t.FECHA_EMI >= to_date('25/05/2023', 'dd/mm/yyyy')
                         AND t.FECHA_VENC_POL = FECHA_VENC_PER
                         AND NVL(t.MCA_PROVISORIO, 'N') = 'N'
                         AND NVL(t.MCA_CADUCA, 'N') = 'N'
                         AND t.COD_COA != 3
                         AND NVL(t.MCA_COTIZACION, 'N') IN ('N')
                         AND t.NUM_END = (SELECT MAX(B.NUM_END)
                                          FROM A2000030 B
                                          WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)) and COD_RIES > 1;

select t.MCA_COTIZACION,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and NUM_SECU_POL = 29861380137;

select t.MCA_COTIZACION, t.num_secu_pol ,t.num_pol1,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 777
  and mca_cotizacion is null
  and num_pol1 is not null;


select t.*, rowid
from sim_borrado_automatico t
where t.ESTADO = 'A'
  and t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;


----- INACTIVO TODOS MENOS 778
UPDATE sim_borrado_automatico
SET estado = 'I'
WHERE COD_RAMO IN ('250','999')
  AND COD_SECC IN ( '1', '81')
  AND SUB_RAMO IN ('367','369','363','999')
  AND COD_CIA  IN (2,3)
  AND ID_CONTROL IN ('25','26','27','96','95','89','90','91','92','93','94')
  AND ESTADO = 'A';

---ACTIVO DE NUEVO LOS BORRADOS DE COTIZACIONES DE LOS DEMAS PRODUCTOS
UPDATE sim_borrado_automatico
SET estado = 'A'
WHERE COD_RAMO IN ('250','999')
  AND COD_SECC IN ( '1', '81')
  AND SUB_RAMO IN ('367','369','363','999')
  AND COD_CIA  IN (2,3)
  AND ID_CONTROL IN ('25','26','27','96','95','89','90','91','92','93','94')
  AND ESTADO = 'I';



/*
DELETE sim_borrado_automatico t WHERE t.ESTADO = 'A'
                                  and t.cod_cia = 3
                                  and t.cod_secc = 66
                                  and t.cod_ramo = 778;

INSERT INTO sim_borrado_automatico(COD_CIA, COD_SECC, COD_RAMO, SUB_RAMO, COLECTIVO, AGENCIA, AGENTE,
                                   VAL_NUMPOL_ANT, CANAL_ORIGEN, ES_COTIZ, DIAS_VIGENCIA, FECHA_VIGENCIA, FECHA_BAJA,
                                   FECHA_ACTUALIZA, FECHA_CREACION, USUARIO_ACTUALIZA, USUARIO_CREACION, ESTADO,
                                   ID_TIPO)
VALUES (3, 66, 778, 999, null, 99999, 99999, null, null, null, 35, TO_DATE('2023-04-30', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, TO_DATE('2023-04-30', 'YYYY-MM-DD HH24:MI:SS'), null, 'PDDASI03', 'A', '1');
*/

SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where upper( T.ID_COTIZACION) = '6477BED2CCCA5B40452B60A8';

select *
from SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) > to_date('2023-02-06 09:07:00', 'YYYY-MM-DD HH24:MI:SS')
  AND upper( ID_COTIZACION) = '6477BED2CCCA5B40452B60A8';

SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND NVL(CR.COD_SUBPROD,0) = 0
  AND CR.ESTADO_MOTOR       = 'A'
order by orden_Capitulo, orden_Campo;

SELECT CAMPO, VALOR
FROM SIM_REQUEST_MOTOR_PYMES CR
WHERE CR.COD_CIA = 3
  AND CR.COD_SECC = 66
  AND CR.COD_PROD = 778
  AND CR.ID_COTIZACION = '6477bed2ccca5b40452b60a8'
  --AND FECHA_CREACION > sysdate - 1 / 86400
  AND COD_RIES = 1;



select t.*
from sim_codigos_endoso_seccion t
where cod_secc        IN (66,999)



select * from a2000030 where NUM_SECU_POL = 29861251715;


select *
from sim_request_motor_pymes t
where t.id_cotizacion in
      (select t.id_cotizacion
       from sim_request_motor_pymes t
       where t.fecha_creacion >= trunc(sysdate))
order by t.id_cotizacion, t.cod_ries, t.campo;


SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION in (select t.id_cotizacion
                          from sim_request_motor_pymes t
                          where t.fecha_creacion >= trunc(sysdate));

select t.MCA_COTIZACION, t.num_end, t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and t.num_pol1 = 1530375109401;


select t.recar_per_fact, t.*
from C1999800 t
where t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;


SELECT * FROM G2000010 WHERE COD_CIA = 3 AND COD_CAMPO IN ('LATITUD', 'LONGITUD');


select * from a2000030 t where t.NUM_POL1 = 1020210080701;

select * from a2000030 t where t.num_secu_pol = 29861308880;

select t.imp_prima/2, t.imp_impuesto/2, t.* from a2000160 t where t.num_secu_pol = 29861308880;

select * from a2990700 t where t.num_secu_pol = 29861308880;

select * from a2000040 where num_secu_pol = 29861373445;

select * from a2000020 where num_secu_pol = 29861308880;

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '6495EF1AAFC78B71138720E6'
  AND FECHA_EJECUCION > to_date('2023-02-23 09:07:00', 'YYYY-MM-DD HH24:MI:SS');

select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_POL_COTIZ = 1010000670201;

select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_POL1 = 5010000811701;

select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_SECU_POL = 29861140731;

select t.imp_prima/2, t.imp_impuesto/2, t.* from a2000160 t where t.num_secu_pol = 39745180212;

select t.* from a2000160 t where t.num_secu_pol = 39745180152;

select * from a2990700 t where t.num_secu_pol = 39745180431;

select * from a2000040 where num_secu_pol = 29861251289;

select * from a2000020 where num_secu_pol = 29861251289;

SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where --T.ID_COTIZACION = '64b0632f8acabf4291bf521e';
      FECHA_INICIO > to_date('2023-07-19 14:05:00', 'YYYY-MM-DD HH24:MI:SS');


select t.*
from sim_codigos_endoso_seccion t
where cod_secc        IN (66,999)




-----------------------------------------------------------------------------------------------------------------------------



SELECT * FROM sim_tipoendxproceso WHERE ID_PROCESO IN (293,290);



select t.*
from sim_codigos_endoso_seccion t
where cod_secc        IN (66,999)
  AND   cod_end = 661
  AND  aplica_pol_ppal   = DECODE('N','S','N',aplica_pol_ppal)
  and sub_cod_end = 0;

select t.*, rowid
from sim_grupo_endoso_seccion t
where cod_secc = 66
  and cod_cia = 3;

select * from sim_endososxproceso where COD_SECC = 66;

SELECT *
FROM sim_endosos_seccion_usu se
WHERE cod_cia = 3
  AND cod_secc = 66;


select t.*, rowid
from sim_codigos_endoso_seccion t
where cod_end = 900
  and sub_cod_end in (89,90)
  and cod_cia = 3;

select t.*, rowid
from sim_grupo_endoso_seccion t
where cod_end = 900
  and cod_secc = 66
  and cod_cia = 3;



select t.*, rowid
from sim_grupo_datos_endoso_secc t
where t.secuencia_sges in
      (select t2.secuencia_sges
       from SIM_GRUPO_ENDOSO_SECCION t2
       where t2.cod_end = 661
         --and t2.sub_cod_end = 3
         and t2.secuencia_sges = t.secuencia_sges);

select * from g2000270 where cod_secc = 66;

--Grupos
select *
from SIM_GRUPOS g
where g.codigo_grupo in (select t.codigo_grupo
                         from sim_grupo_endoso_seccion t
                         where cod_end = 661
                           and sub_cod_end = 0
                           and cod_secc = 66
                           and cod_cia = 3);
--Campos x Grupos
select *
from sim_campos_x_grupo cg
where cg.codigo_grupo in (select t.codigo_grupo
                          from sim_grupo_endoso_seccion t
                          where cod_end = 661
                            and sub_cod_end = 0
                            and cod_secc = 66
                            and cod_cia = 3);
--Grupos x Sección
select *
from sim_grupos_seccion gs
where gs.cod_cia = 3
  and gs.cod_secc = 66
  and gs.codigo_grupo in (select t.codigo_grupo
                          from sim_grupo_endoso_seccion t
                          where cod_end = 661
                            and sub_cod_end = 0
                            and cod_secc = 66
                            and cod_cia = 3);

select *
from A1001800 t
where t.cod_cia = 3
  and t.cod_secc = 66;





select t.*, rowid
from sim_codigos_endoso_seccion t
where cod_end = 661
  and sub_cod_end = 0;

select t.*, rowid
from sim_grupo_endoso_seccion t
where cod_secc = 66
  and cod_cia = 3;

select t.*, rowid
from sim_grupo_datos_endoso_secc t
where t.secuencia_sges in
      (select t2.secuencia_sges
       from SIM_GRUPO_ENDOSO_SECCION t2
       where t2.cod_end = 661
         --and t2.sub_cod_end = 3
         and t2.secuencia_sges = t.secuencia_sges);


SELECT DISTINCT(a.codigo_grupo) cod_region
              ,c.descripcion
              ,c.nombre_grupo
              ,a.visible
              ,a.secuencia_sges
FROM sim_grupo_endoso_seccion a
--         ,sim_grupos_seccion b
   ,sim_grupos c
WHERE /*a.codigo_grupo = b.codigo_grupo
      AND a.cod_cia      = b.cod_cia
      AND a.cod_secc     = b.cod_secc
      AND */
        a.codigo_grupo = c.codigo_grupo
  -- AND cod_end        = 661
  --AND sub_cod_end    = 0
  AND a.visible      = 'S'
  AND a.cod_cia      = 3
  --AND a.cod_secc     = 66
ORDER BY 1;



SELECT *
FROM sim_grupo_endoso_seccion
WHERE cod_cia = 3
  --AND cod_secc = 66
  AND cod_end = 900
  --AND sub_cod_end = 89
  -- AND codigo_grupo = l_RegionAgente
  AND modificable = 'S';


select * from sim_endosos_exentosxprodto where COD_SECC in (66);

--Parametrizacion Cumulos por cobertura
select * from A1002085 where COD_CIA = 3 and COD_SECC = 66;


select *
from SIM_COBXALT t
where t.cod_act = '02000'

select COUNT(*) from SIM_REQUEST_MOTOR_PYMES;

select COUNT(*) from SIM_RES_MOTOR_PYMES;


Select *
from c9999909
where cod_tab = 'PROD_MOTOR_RIESGO';

SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND CR.ESTADO_MOTOR       = 'A'
  -- AND CR.VERSION_MOTOR IS NOT NULL
order by orden_Capitulo, orden_Campo;

SELECT *
FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '29861251289'
  and FECHA_INICIO > to_date('2023-11-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS');


select a.*
from X2000020 a
where num_secu_pol = 29861251289
  AND (COD_RIES = 1 OR COD_RIES IS NULL);


select *
from ops$puma.sim_log_general t
where  t.TIMESTAMP > to_date('19-dic-2025 10:00:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'RPR Motor Riesgo%'
order by secuencia desc;

select *
from ops$puma.sim_log_general t
where  t.TIMESTAMP > to_date('19-dic-2025 10:00:00','dd-mon-yyyy HH24:MI:SS') and
        t.llave like '%29817929501%'
order by secuencia desc;


SELECT TO_NUMBER(nvl(x.VALOR_CAMPO, 0))    AS VALOR_CAMPO,
       TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AS VALOR_CAMPO_EN,
       x.COD_CAMPO
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 29861397069
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) <
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AND TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) = 0;


SELECT  COUNT(x.NUM_SECU_POL)
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 29861251289
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) <
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AND TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) = 0;

select * from CREGLAS where cdreg = '778PCC001';

select * from CREGLAS where cdreg = '778PCI001';

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '29861322015'

select * from a1002100 where COD_RAMO = 778;




SELECT * FROM A2000030 WHERE NUM_POL1= 1530375485301


SELECT  B.*
FROM A2000040 B
WHERE NUM_SECU_POL = 29861322015
  AND COD_RIES = 1

SELECT  sum(END_PRIMA_COB), sum(END_PRIMA_ANU)
FROM A2000040 B
WHERE NUM_SECU_POL = 29861322015
  AND COD_RIES = 1
  AND NUM_END = 1;


select a.*  from a2000020 a
where num_secu_pol = 29861322015;


select * from a2000160 where num_secu_pol = 29861322015;
select * from a2990700 where num_secu_pol = 29861322015;




SELECT * FROM a2000020 r WHERE r.NUM_SECU_POL = 29861396230 and cod_campo = 'NUM_COTIZ'

SELECT * FROM x2000020 r WHERE r.NUM_SECU_POL = 29861400899

select *
           from SIM_RES_MOTOR_PYMES
           where ID_COTIZACION = '1530001320701'

SELECT *
FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '39745222223'


select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '39745222223'


select * from a1002100 where COD_RAMO = 778;


select c.* from CREGLAS c where cdreg in ('778PVV102','778PVV103','778PCI001','778PCC001');


select c.* from CREGLAS c where cdreg in ('771PVV102','771PVV103','771PCI001','771PCC001');


select * from sim_calificacion_pymes where ID_COTIZACION is not null -- PROHIB = 'S' --- id_cotizacion = '12sf3f4dfdg8dsfsdewq' and DIRECCION = 'CALLE 108 45-67'
ORDER BY FECHA DESC;

select c.* from CREGLAS c where cdreg in ('778PUC016','266PUC016');

--------POLIZAS 777
select t.MCA_COTIZACION, t.num_secu_pol, t.num_pol1, t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 777
  and t.NUM_POL1 is not null
  and t.FECHA_VENC_POL > to_date('29-ENE-2024 11:40:00','dd-mon-yyyy HH24:MI:SS')



select *
from sim_log_general t
where  (t.TIMESTAMP BETWEEN to_date('28-MAY-2024 14:50:00','dd-mon-yyyy HH24:MI:SS') AND to_date('28-MAY-2024 15:00:00','dd-mon-yyyy HH24:MI:SS') ) and
        t.columna like 'BRGH_PVV001%'
order by secuencia desc;


select *
from sim_log_general t
where  t.TIMESTAMP > to_date('28-MAY-2024 07:00:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'BRGH_PVV001%'
order by secuencia desc;

Select a.*
From   sim_calificacion_pymes a
Where  a.id_cotizacion  in ('657a2242c3feab368fed7182', to_char(29861402762))
  And    a.NUM_END = (1 - 1)
  And     ROWNUM = 1;

SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29861402762;

select * from a2000020 where num_secu_pol = 29861402762;

----COORDENADAS ASEGURABLES
4.752519500000062
-74.05366149999998
---COORDENADAS NO ASEGURABLES
4.614813951000027
-74.08406497999998

SELECT TO_NUMBER(nvl(x.VALOR_CAMPO, 0))    AS VALOR_CAMPO,
       TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AS VALOR_CAMPO_EN,
       x.COD_CAMPO
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 29861397069
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE nvl(x.VALOR_CAMPO_EN, 0) > 0;

SELECT COUNT(x.NUM_SECU_POL)
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 29861397069
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE nvl(x.VALOR_CAMPO_EN, 0) > 0;

SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_PYMES_URL';


select *
from a2990103 WHERE COD_CIA = 3   AND
        COD_SECC= 66  AND
        COD_RAMO= 778  AND
        COD_MON = 1

select t.* from a2000160 t where t.num_secu_pol in (29861430134);
----impuestos
select t.* from a2000190 t where t.num_secu_pol in (29861430134);

select a.*  from a2000020 a
where num_secu_pol = 29861430134;


SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_MOTOR_PYMES';

-----VALIDACION VALORES ASEGURADOS
select * from SIM_REQUEST_MOTOR_PYMES WHERE ID_COTIZACION = 'asasd1405b5cddgb1004';
-----VALIDACION PRIMAS Y TASAS
select * from SIM_RES_MOTOR_PYMES WHERE ID_COTIZACION = 'asasd1405b5cddgb1004';
-----VALIDACION REQUEST Y RESPONSE SERVICIO
SELECT * FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = 'asasd1405b5cddgb1004';


select *
from SIM_COBXALT t
where  t.cod_alt = 4
  and t.fecha_baja is null
union all
select 216 codigo_cobertura
from dual;

select t.recar_per_fact, t.*
from C1999800 t
where t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;


SELECT *
FROM C9999909 T
WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO'



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
  AND a.cod_ramo = 778
  AND a.num_end =
      (select max(w.num_end)
       from a2000030 w
       where w.num_secu_pol = a.num_secu_pol)
  AND nvl(a.mca_provisorio, 'N') = 'N'
  and NVL(a.mca_anu_pol, 'N') != 'S'
  --AND a.num_pol_ant is null
  AND nvl(a.mca_caduca, 'N') = 'N'
  AND nvl(a.mca_term_ok, 'N') = 'S'
  AND num_pol1 <> 0
  -- AND NUM_SECU_POL in ('39745256690')
  AND RENOVADA_POR IS NULL
  AND nvl(a.fecha_venc_pol, a.fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);

--AND NUM_SECU_POL in (''39745258455'')

SELECT TO_TIMESTAMP_TZ(TO_CHAR(TRUNC(SYSDATE+1) +7/24,'YYYY-MM-DD HH24:MI:SS')||' -05:00','YYYY-MM-DD HH24:MI:SS TZH:TZM') FROM DUAL;

----gastos de expedicion
select *
from a2990103
where COD_SECC = 66 AND
        COD_RAMO = 778;

select a.*  from a2000020 a
where NUM_SECU_POL in ('29861452572');

select a.*  from a2000020 a
where NUM_SECU_POL in ('29861469865');

select a.*  from a2000020 a
where NUM_SECU_POL in ('29861469865');

select a.*  from X2000020 a
where NUM_SECU_POL in ('39745267083');



SELECT a.num_pol1
     , a.num_end
     , a.num_secu_pol
     , a.fecha_venc_pol
     , a.fecha_venc_end
     , a.FECHA_EMI
     , a.cod_ramo
     , a.RENOVADA_POR
     , a.MCA_RENOV
     , a.NUM_POL_ANT
     , a.NRO_DOCUMTO
     , a.*
FROM a2000030 a
WHERE a.cod_cia = 3
  AND a.cod_secc = 66
  AND a.cod_ramo = 778
  AND a.num_end =
      (select max(w.num_end)
       from a2000030 w
       where w.num_secu_pol = a.num_secu_pol)
  AND nvl(a.mca_provisorio, 'N') = 'N'
  and NVL(a.mca_anu_pol, 'N') != 'S'
  --AND a.num_pol_ant is null
  AND nvl(a.mca_caduca, 'N') = 'N'
  AND nvl(a.mca_term_ok, 'N') = 'S'
  AND num_pol1 <> 0
 AND NUM_SECU_POL in ('29818117971')
  ---AND NUM_END > 0
  AND RENOVADA_POR IS NULL
  AND nvl(fecha_venc_pol, fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);

select * from a2000030 t where t.num_pol1 in(1003135279202);

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND NUM_SECU_POL in ( '39745249384','39745257583')
  AND COLCAR15 like '%.(778PUC016).ORA-01722%';

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND COLNUM02 IS NOT NULL
 -- AND COLCAR01 = '2024'
  -- AND NUM_SECU_POL in ( 39745258455, 39745256690);
  AND COLCAR03 IN ('23/09/2024');

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  AND NUM_SECU_POL in ('29861423564','29861462263','29861401841','29861397069','29861468657','29861400892')
  AND COLCAR03 IN ('14/05/2024');

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
  AND a.cod_ramo = 778
  AND a.num_end =
      (select max(w.num_end)
       from a2000030 w
       where w.num_secu_pol = a.num_secu_pol)
  AND nvl(a.mca_provisorio, 'N') = 'N'
  and NVL(a.mca_anu_pol, 'N') != 'S'
  --AND a.num_pol_ant is null
  AND nvl(a.mca_caduca, 'N') = 'N'
  AND nvl(a.mca_term_ok, 'N') = 'S'
  AND num_pol1 in ( 1530375490301,
                    1530375490401,
                    1530375490501,
                    1530375490101,
                    1530375490201,
                    1000115099101);
  --AND NUM_SECU_POL in ('29861400818','29861402762','29861453000','29861458625','29861455156','29861459659');



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
  AND a.cod_ramo = 778
  AND a.num_end =
      (select max(w.num_end)
       from a2000030 w
       where w.num_secu_pol = a.num_secu_pol)
  AND nvl(a.mca_provisorio, 'N') = 'N'
  and NVL(a.mca_anu_pol, 'N') != 'S'
  --AND a.num_pol_ant is null
  AND nvl(a.mca_caduca, 'N') = 'N'
  AND nvl(a.mca_term_ok, 'N') = 'S'
  AND num_pol1 <> 0
  AND NRO_DOCUMTO = 52220832;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1530375076301 AND COD_SECC = 66;
----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745216262;
----FACTURAS
select * from a2990700 where NUM_SECU_POL in ('29861462268','29861452572');
---VALOR TOTAL DE LA PRIMA
select * from a2000160 where NUM_SECU_POL in ('29861326779','29861452572');
----impuestos
select * from x2000190 where NUM_SECU_POL = 39745169099;
select * from a2000190 where NUM_SECU_POL = 39745258456;

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
  AND a.cod_ramo = 778
  -- AND a.RENOVADA_POR = 1
  AND a.NUM_POL1 IN ('1530375475703', '1530375475704');
 -- and a.NUM_SECU_POL = 29861326779;
--AND RENOVADA_POR IS NULL;

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
  AND a.cod_ramo = 778
  -- AND a.RENOVADA_POR = 1
  --AND a.NUM_POL1 = 1530375485802;
and a.NUM_SECU_POL = 29861488995;
--AND RENOVADA_POR IS NULL;

----SINIESTROS POR CEDULA
SELECT *
FROM   A7000900
WHERE  COD_CIA = 3
  AND  COD_SECC = 66
  AND  COD_RAMO IN (777,778)
  AND  NRO_ORDEN_SINI = 0
  AND  COD_CAUSA_BAJA IS NULL
  AND  TDOC_TERCERO_ASEG = 'CC'
  AND  COD_ASEG = 52220832;

select * from a2000060 where NUM_SECU_POL = 29861326779;

---datos variables polizas GASTOS_EXPEDI
select a.*  from a2000020 a
where NUM_SECU_POL in ('29861310122','29861310133','29861310203','29861310238','29861310250','29861310350','29861310351','29861310360','29861310366','29861310384','29861310397','29861310414')
AND COD_CAMPO IN ('TIPODOCRL','TIPO_DOC_ASEG','TIPO_DOC_BENEF');

select a.*  from a2000020 a
where NUM_SECU_POL in ('29861469865');

select a.*  from x2000020 a
where NUM_SECU_POL in ('29861472654');

----coberturas
Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('29861472346');

Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('29861471568');

Select  SUM(END_PRIMA_COB)
From A2000040 a
Where NUM_SECU_POL in ('29861468671');

Select  SUM(END_PRIMA_COB)
From A2000040 a
Where NUM_SECU_POL in ('29861397069');

Select  a.*
From x2000040 a
Where num_secu_pol = 29861458625;

SELECT COUNT(cod_cob)
FROM X2000040
WHERE Num_secu_Pol = 29861462263
  AND cod_ries = 1
  AND (NVL(end_prima_cob, 0) <> 0 OR
       ((NVL(mca_gratuita, 'N') = 'S' or NVL(MCA_PRIMA_INF, 'N') = 'S') AND
        cod_selecc = 'S') Or cod_reg_cal Is Null);

Select  a.*
From x2000040 a
Where num_secu_pol = 29861459659;

Select  a.*
From x2000030 a
Where num_secu_pol = 39745259826;



SELECT COD_RIES,
       DIRECCION,
       CIUDAD,
       TO_CHAR(SHAPE_LENG) AS SHAPE_LENG,
       TO_CHAR(SHAPE_AREA) AS SHAPE_AREA,
       TO_CHAR(PROHIB) AS PROHIB,
       TO_CHAR(F_INCD) AS F_INCD,
       TO_CHAR(S_INCD) AS S_INCD,
       TO_CHAR(F_ENER) AS F_ENER,
       TO_CHAR(S_ENER) AS S_ENER,
       TO_CHAR(F_TERR) AS F_TERR,
       TO_CHAR(S_TERR) AS S_TERR,
       TO_CHAR(F_AMIT) AS F_AMIT,
       TO_CHAR(S_AMIT) AS S_AMIT,
       TO_CHAR(F_OPUB) AS F_OPUB,
       TO_CHAR(S_OPUB) AS S_OPUB,
       TO_CHAR(F_VIEN) AS F_VIEN,
       TO_CHAR(S_VIEN) AS S_VIEN,
       TO_CHAR(F_DXAI) AS F_DXAI,
       TO_CHAR(S_DXAI) AS S_DXAI,
       TO_CHAR(F_ANEG) AS F_ANEG,
       TO_CHAR(S_ANEG) AS S_ANEG,
       TO_CHAR(F_SUST) AS F_SUST,
       TO_CHAR(S_SUST) AS S_SUST,
       TO_CHAR(DESLIZ) AS DESLIZ,
       ID_COTIZACION
FROM sim_calificacion_pymes
WHERE ID_COTIZACION = lower('65FDD89EF875B1625B0054B2')
  AND COD_RIES = 1
  AND ROWNUM = 1
ORDER BY FECHA DESC


UPDATE OPS$PUMA.G2000020
SET REG_PRE_FIELD = '266PVV010'
WHERE COD_CIA = 3
  AND COD_RAMO = 778
  AND COD_NIVEL = 1
  AND COD_CAMPO IN
      ('COD_OFI_DAVI', 'CORREO', 'EMAIL_CONT', 'FECHA_ORIGEN', 'GASTOS_EXPEDI', 'ID_COTIZ', 'IMPORTE_CESION');

select *
from g2000020
where cod_ramo in (778);

-----validar tipo de bien por cobertura y actividad economica
select b3.TIPO_BIEN_ASEG, bienes.DAT_CAR2, bienes.*
from c9999909 b2,
     A1002100 c,
     (SELECT *
      FROM C9999909 T
      WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes,
     (SELECT p.*
      FROM sim_param_bien_asegurado p
      WHERE p.cod_actividad = to_number(03002)
        AND p.cod_ramo = 778
        AND p.fecha_baja IS NULL) b3
where b2.cod_tab = 'PYME_COB_BIEN_778'
  and b2.cod_cia = 3
  and b2.Cod_Secc = 66
  and b2.cod_ramo = 778
  and b2.fecha_baja is null
  and b2.codigo1 = c.cod_cob
  and c.cod_cia = b2.cod_cia
  and c.cod_ramo = b2.cod_ramo
  and b2.codigo2 = bienes.codigo
  and bienes.codigo = b3.cod_bien_aseg
  and b2.codigo1 in ('120','121','123','125','216','287','288','290','292','414','416','418','597','660','800','802');

SELECT *
FROM C9999909 T
WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO'

select cod_Act
from SIM_COBXALT t
where t.cod_act in (SELECT nvl(substr(a.cod_actividad, 0, 2), 0) || '000' cod_actividad
                    from sim_act_economica a
                    where a.cod_cia = 3
                      AND a.cod_secc = 66
                      AND a.cod_ramo = 999
--  and a.cod_actividad = ip_datos_riesgos(i).datos_fijos(k).valor
                      and a.fecha_baja is null)
  and t.cod_alt = 1
  and t.fecha_baja is null
group by cod_Act;

select a.NUM_POL_COTIZ, a.NUM_SECU_POL, a.*
from a2000030 a
where NUM_POL_COTIZ = 1000000401201
      and cod_secc = 66;

SELECT * FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t where FECHA_INICIO > to_date('2025-03-06 10:00:00', 'YYYY-MM-DD HH24:MI:SS');