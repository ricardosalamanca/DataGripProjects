SELECT * FROM A1001800 WHERE COD_CIA = 3 AND COD_SECC = 66 AND COD_TEXTO = 778;

select h.DAT_CAR2, h.* from c9999909 h where COD_TAB = 'ALT_COB_PYME';

update c9999909 h set h.DAT_CAR2 = 'S'
WHERE h.COD_TAB = 'ALT_COB_PYME'
  and h.CODIGO = 1;

update c9999909 h
set h.DAT_CAR2 = 'N'
WHERE h.COD_TAB = 'ALT_COB_PYME'
  and h.CODIGO in (2, 3);

COMMIT;

SELECT * FROM C9999909 WHERE  COD_TAB = 'MOVILIZACION_PYME' AND COD_RAMO = 778 AND CODIGO1 = 999;

SELECT * FROM C9999909 WHERE  COD_TAB LIKE '%PYME%';

SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'AGRUP_PYME';

SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'AGRUP_X_BIEN_PYME';

SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'AGRUP_X_COB_PYME';

SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'PYME_COB_BIEN';

SELECT * FROM C9999909 WHERE  COD_TAB LIKE 'AGRUP_PYME_778';


select b.*
from c9999909 b
where cod_tab = 'PYME_BIEN_ASEGURADO'
  and b.cod_cia = 3
  and b.Cod_Secc = 66
  and b.cod_ramo = 999
  and b.fecha_baja is null

SELECT * FROM C9999909 WHERE
    COD_TAB = 'AGRUP_X_COB_PYME'
    AND cod_cia = 3
    AND Cod_Secc = 66
    AND cod_ramo = 777
    AND CODIGO1  = 1;



select bienes.codigo      cod_bien,
       bienes.descripcion desc_bien,
       bienes.DAT_CAR2     COD_CAMPO_VALOR,
       t.codigo1          cod_cob,
       c.txt_cob          desc_cob
from c9999909 t,
     A1002100 c,
     (select b.codigo, b.dat_obs descripcion, b.DAT_CAR2
      from c9999909 b
      where cod_tab = 'PYME_BIEN_ASEGURADO'
        and b.cod_cia = 3
        and b.Cod_Secc = 66
        and b.cod_ramo = 999
        and b.fecha_baja is null) bienes,
     (SELECT d.CODIGO2 cob, d.CODIGO1 FROM C9999909 d WHERE
             COD_TAB = 'AGRUP_X_COB_PYME'
                               AND cod_cia = 3
                               AND Cod_Secc = 66
                               AND cod_ramo = 777
                               AND CODIGO1  = 5) agrup_cob
where t.cod_tab = 'PYME_COB_BIEN_778'
  and t.codigo2 = bienes.codigo
  and t.cod_cia = c.cod_cia
  and t.codigo1 = c.cod_cob
  and t.codigo1 = agrup_cob.cob
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 778
  and c.cod_ramo = 778
  and t.fecha_baja is null
order by t.codigo2, t.codigo1;

SELECT SUBSTR('1_VLR_MUEBLES 2_VLR_DINERO',INSTR('1_VLR_MUEBLES 2_VLR_DINERO','VLR_DINERO')-2, 1) FROM DUAL;

select bienes.codigo   cod_bien,
       bienes.DAT_CAR2 COD_CAMPO_VALOR
from c9999909 t,
     (select b.codigo, b.dat_obs descripcion, b.DAT_CAR2
      from c9999909 b
      where cod_tab = 'PYME_BIEN_ASEGURADO'
        and b.cod_cia = 3
        and b.Cod_Secc = 66
        and b.cod_ramo = 999
        and b.fecha_baja is null) bienes,
     (SELECT d.CODIGO2 cob
      FROM C9999909 d
      WHERE COD_TAB = 'AGRUP_X_COB_PYME'
        AND cod_cia = 3
        AND Cod_Secc = 66
        AND cod_ramo = 777
        AND CODIGO1 = 1) agrup_cob
where t.cod_tab = 'PYME_COB_BIEN_778'
  and t.codigo2 = bienes.codigo
  and t.codigo1 = agrup_cob.cob
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 778
  and t.fecha_baja is null
group by bienes.codigo, bienes.DAT_CAR2;

select * from c9999910
where COD_TAB = 'MOVILIZACION_PYME';

INSERT INTO C9999910 (COD_TAB, DESCRIPCION, USUARIO, FECHA_CREACION, OBLIGATORIO, PARAMETRO_SISTEMA, ESTADO) VALUES ('AGRUP_PYME_778', 'AGRUPACION PYME 778', 'OPS$PUMA', TO_DATE('2022-10-10 10:48:13', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 'A');

INSERT INTO C9999910 (COD_TAB, DESCRIPCION, USUARIO, FECHA_CREACION, OBLIGATORIO, PARAMETRO_SISTEMA, ESTADO) VALUES ('AGRUP_X_COB_PYME_778', 'AGRUPACION CON COBERTURA PYME 778', 'OPS$PUMA', TO_DATE('2022-10-10 10:48:13', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 'A');

select *
from g2000020
where cod_ramo in (777);

select *
from g2000020 where REG_PRE_FIELD = '266PVV010';

select *
from g2000020
where cod_ramo in (778) and cod_campo in ('ID_COTIZ', 'VLR_VTASANUAL');

SELECT * FROM SIM_G2000020 where cod_ramo in (778) and cod_campo in ('ID_COTIZ', 'VLR_VTASANUAL');
--266PVV098

select t.cod_cia,
       t.cod_ramo,
       t.num_secu,
       t.cod_campo,
       g.txt_titulo,
       t.cod_nivel,
       g.txt_help
from G2000020 t, G2000010 g
where t.cod_cia = g.cod_cia
  and t.cod_campo = g.cod_campo
  and t.cod_cia = 3
  and  t.cod_campo like '%DESC_RIES%'
  and t.cod_ramo = 778;


select t.cod_cia,
       t.cod_ramo,
       t.num_secu,
       t.cod_campo,
       g.txt_titulo,
       t.cod_nivel,
       g.txt_help,
       g.TIPO_CAMPO,
       g.LONG_CAMPO
from G2000020 t, G2000010 g
where t.cod_cia = g.cod_cia
  and t.cod_campo = g.cod_campo
  and t.cod_cia = 3
  and  t.cod_campo like '%RAYO_NIV%'
  and t.cod_ramo = 778;

SELECT * FROM G2000010 g where g.cod_campo like '%TELEFONO_RL%';



select t.cod_cia,
       t.cod_ramo,
       t.num_secu,
       t.cod_campo,
       g.txt_titulo,
       t.cod_nivel,
       g.txt_help,
       g.TIPO_CAMPO,
       g.LONG_CAMPO,
       g.COD_TIPO_DATO
from G2000020 t, G2000010 g
where t.cod_cia = g.cod_cia
  and t.cod_campo = g.cod_campo
  and t.cod_cia = 3
  and t.cod_ramo = 778
  and t.NUM_SECU > 809;

---REGLAS PARAMETRIZADAS PARA UN PRODUCTO EN PARTICULAR
SELECT g.COD_REGLA, g.REG_PRE_FIELD FROM G2000020 g where  g.cod_ramo = 778 and cod_cia = 3;


SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 923
  AND CR.COD_RAMO           = 923
  AND NVL(CR.COD_SUBPROD,0) = 0
  AND NVL(CR.COD_BIEN,0)    = 66
  AND NVL(CR.COD_OFERTA,0)  = 61
  AND CR.ESTADO_MOTOR       = 'A'
order by orden_Capitulo, orden_Campo;

SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 923
  AND CR.COD_RAMO           = 923
  AND NVL(CR.COD_SUBPROD,0) = 0
  AND NVL(CR.COD_BIEN,0)    = 66
  AND NVL(CR.COD_OFERTA,0)  = 61
  AND CR.ESTADO_MOTOR       = 'A'
  AND CR.CAMPO LIKE '%FECHA%'
order by orden_Capitulo, orden_Campo;

SELECT * FROM SIM_LOG_MOTORTARIFA t
where T.FECHA_INICIO>SYSDATE-1 AND t.objeto_request like '%Calle 127%';

SELECT * FROM SIM_LOG_MOTORTARIFA t
where T.ID_SIMLOG = 4358181;

SELECT * FROM SIM_LOG_MOTORTARIFA t
where T.ID_COTIZACION = 999 and FECHA_INICIO > to_date('2023-02-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

SELECT * FROM  SIMAPI_RES_MOTOR;

select * from simapi_res_mapa where DIRECCION = 'CALLE 108 45-67';

--PAQUETE : SIM_PCK_HOGAR_TD_MOTOR
select * from SIMAPI_REQUEST_MOTOR;




SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND CR.ESTADO_MOTOR       = 'A'
  AND CR.VERSION_MOTOR    = 'Pyme_version1_112022'
order by orden_Capitulo, orden_Campo;

----coberturas simon 3.0 hogar
select * from simapi_cob_opc_bien_est_ent where ID_ESTRATEGIA = 61;

---select * from sim_productos where cod_secc = 39;
select * from OPS$PUMA.SIMAPI_AGRUPACIONCOB;
select * from OPS$PUMA.SIMAPI_PRESENTA_AGRCOB;



Select * from a1001000
where cod_impuesto = 1 and sub_cod_imp = 0
  and cod_cia in (2,3);

SELECT CAMPO, VALOR, COD_RIES
FROM SIM_REQUEST_MOTOR_PYMES CR
WHERE CR.COD_CIA = 3
  AND CR.COD_SECC = 66
  AND CR.COD_PROD = 778
  AND CR.ID_COTIZACION = '1032'
  AND FECHA_CREACION > sysdate - 15 / 86400
  AND COD_RIES = 'id_riesgo';



select sysdate from dual;

select * from sim_calificacion_pymes where DIRECCION = 'CALLE 108 45-67' AND NUM_SECU_POL = 39745220908 AND id_cotizacion = '12345';

select * from SIM_REQUEST_MOTOR_PYMES WHERE ID_COTIZACION = 1032;

select * from SIM_RES_MOTOR_PYMES WHERE ID_COTIZACION = '648B2FCB9752962506BBE4D2' AND  FECHA_EJECUCION > to_date('2023-02-06 14:07:00', 'YYYY-MM-DD HH24:MI:SS');

SELECT TO_NUMBER(NULL) FROM DUAL;

select * from SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) > to_date('2023-02-06 09:07:00', 'YYYY-MM-DD HH24:MI:SS') AND ID_COTIZACION = '12348' and campo = 'QUANTO_INF';

--DELETE SIM_REQUEST_MOTOR_PYMES;

SELECT ','||LISTAGG(CAMPO_SERVICIO, ',')
    WITHIN GROUP (ORDER BY CAMPO_SERVICIO)||','
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND CR.ESTADO_MOTOR       = 'A'
order by orden_Capitulo, orden_Campo;


select * from SIM_REQUEST_MOTOR_PYMES WHERE trunc(FECHA_CREACION) = trunc(sysdate);

--DELETE SIM_REQUEST_MOTOR_PYMES WHERE trunc(FECHA_CREACION) = trunc(sysdate);

select  LISTAGG('<' || CAMPO ||' value="' || VALOR || '"/>', ' ')
                WITHIN GROUP (ORDER BY CAMPO )
from SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) = trunc(sysdate)
  AND ID_COTIZACION = 1031
GROUP BY COD_RIES;

select CAMPO, VALOR, COD_RIES
from SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) = trunc(sysdate)
  AND ID_COTIZACION = 1031
  AND COD_RIES = 1;

SELECT CAMPO, VALOR
FROM SIM_REQUEST_MOTOR_PYMES CR
WHERE CR.COD_CIA = 3
  AND CR.COD_SECC = 66
  AND CR.COD_PROD = 778
  AND CR.ID_COTIZACION = 1031
  AND trunc(FECHA_CREACION) = trunc(sysdate)
  AND COD_RIES = 1;

SELECT COUNT(COD_RIES) as TOTAL_RIESGOS
FROM (SELECT COD_RIES
      from SIM_REQUEST_MOTOR_PYMES
      WHERE trunc(FECHA_CREACION) = trunc(to_date('2023-02-07 09:07:00', 'YYYY-MM-DD HH24:MI:SS') )
        AND COD_CIA = 3
        AND COD_SECC = 66
        AND COD_PROD = 778
        AND ID_COTIZACION = '12348'
      GROUP BY COD_RIES
      order by COD_RIES);


select * from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION > to_date('2023-02-08 06:07:00', 'YYYY-MM-DD HH24:MI:SS') AND ID_COTIZACION = '123487';

SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_CONSPSE_WALLET';

SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_MOTOR_HOGAR_TD';

SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_MOTOR_PYMES';

/*
UPDATE SIM_PARAMETROS_SIMON
SET VALOR = 'https://intranet.bolnet.com.co/DpoService.svc/soap11'
WHERE NOMBRE = 'WS_MOTOR_PYMES';

UPDATE SIM_PARAMETROS_SIMON
SET VALOR = 'https://bolnet.com.co/DpoService.svc/soap11'
WHERE NOMBRE = 'WS_MOTOR_PYMES';
*/

select distinct agc.codigo2 as cobertura
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null
union all
select 5 cobertura from dual
order by 1;

select agc.*
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null;

select agc.codigo2
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null
      order by agc.codigo2;

SELECT *
FROM XMLTABLE('/PofMetadata'
              PASSING XMLTYPE('
        <PofMetadata>
            <ScheduleId>40d54727-88d2-4fa4-9e76-2e04f44cf79f</ScheduleId>
            <MasterSetId>1724a9cf-7587-4424-914c-d2b3d8bd2502</MasterSetId>
            <StrategyIndex>0</StrategyIndex>
            <ConfigSetId>31470374-1fe9-4c1d-947c-71ef26ab0c10</ConfigSetId>
            <ModelRevisionId>77a43af2-aaa5-4754-89b7-250703f9181a</ModelRevisionId>
            <RequestedMasterSetId>1724a9cf-7587-4424-914c-d2b3d8bd2502</RequestedMasterSetId>
            <ScheduleAliasOfId nil="true"/>
            <KeyName>Pyme_version1_112022</KeyName>
            <KeyStartTime>2022-12-21T08:15:00</KeyStartTime>
        </PofMetadata>
        ')
              COLUMNS
                  ScheduleId VARCHAR2(100) PATH 'ScheduleId',
                  MasterSetId VARCHAR2(100) PATH 'MasterSetId',
                  StrategyIndex NUMBER PATH 'StrategyIndex',
                  ConfigSetId VARCHAR2(100) PATH 'ConfigSetId',
                  ModelRevisionId VARCHAR2(100) PATH 'ModelRevisionId',
                  RequestedMasterSetId VARCHAR2(100) PATH 'RequestedMasterSetId',
                  ScheduleAliasOfId VARCHAR2(100) PATH 'ScheduleAliasOfId',
                  KeyName VARCHAR2(100) PATH 'KeyName',
                  KeyStartTime TIMESTAMP PATH 'KeyStartTime'
    );

select EXTRACTVALUE (XMLTYPE('
<PofMetadata>
    <ScheduleId>40d54727-88d2-4fa4-9e76-2e04f44cf79f</ScheduleId>
    <MasterSetId>1724a9cf-7587-4424-914c-d2b3d8bd2502</MasterSetId>
    <StrategyIndex>0</StrategyIndex>
    <ConfigSetId>31470374-1fe9-4c1d-947c-71ef26ab0c10</ConfigSetId>
    <ModelRevisionId>77a43af2-aaa5-4754-89b7-250703f9181a</ModelRevisionId>
    <RequestedMasterSetId>1724a9cf-7587-4424-914c-d2b3d8bd2502</RequestedMasterSetId>
    <ScheduleAliasOfId nil="true"/>
    <KeyName>Pyme_version1_112022</KeyName>
    <KeyStartTime>2022-12-21T08:15:00</KeyStartTime>
</PofMetadata>
'), '/PofMetadata/KeyName') FROM DUAL;


SELECT
    COLUMN_VALUE,
    EXTRACTVALUE(COLUMN_VALUE, '/quote/CODIGO_RIESGO/@value'),
    TO_NUMBER(REPLACE(EXTRACTVALUE(COLUMN_VALUE, '/quote/TASA_FINAL_120/@value'),
                      '.',
                      ',')) as PRIMA,
    TO_NUMBER(REPLACE(EXTRACTVALUE(COLUMN_VALUE, '/quote/PRIMA_120/@value'),'.',
                      ',')) as TASA
FROM
    (XMLTABLE(
            '/root/quote' PASSING
            XMLTYPE(
                    '
                    <root>
                        <quote>
                            <CODIGO_RIESGO value="1"/>
                            <KEY_SEGUIMIENTO value="789"/>
                            <PRIMA_125 value="28420"/>
                            <TASA_FINAL_125 value="0.947334460375103"/>
                            <PRIMA_292 value="21759"/>
                            <TASA_FINAL_292 value="0.725298130581603"/>
                            <PRIMA_418 value="128813"/>
                            <TASA_FINAL_418 value="4.293766187424"/>
                            <PRIMA_120 value="771703"/>
                            <TASA_FINAL_120 value="0.857447649616957"/>
                        </quote>

                        <quote>
                            <CODIGO_RIESGO value="2"/>
                            <KEY_SEGUIMIENTO value="789"/>
                            <PRIMA_125 value="28420"/>
                            <TASA_FINAL_125 value="0.947334460375103"/>
                            <PRIMA_292 value="21759"/>
                            <TASA_FINAL_292 value="0.725298130581603"/>
                            <PRIMA_418 value="128813"/>
                            <TASA_FINAL_418 value="4.293766187424"/>
                            <PRIMA_120 value="771703"/>
                            <TASA_FINAL_120 value="0.857447649616957"/>
                        </quote>


                    </root>'
                )
        ) );



SELECT
    *
FROM
    (XMLTABLE(
            '/root/quote' PASSING
            XMLTYPE(
                  '
<root>
   <quote>
       <CODIGO_RIESGO value="1"/>
      <KEY_SEGUIMIENTO value="12345"/>
      <PRIMA_125 value="10433"/>
      <TASA_FINAL_125 value="1.0433499048"/>
      <PRIMA_121 value="802912"/>
      <TASA_FINAL_121 value="1.00364053459304"/>

   </quote>
   <quote>
       <CODIGO_RIESGO value="2"/>
      <KEY_SEGUIMIENTO value="12345"/>
      <PRIMA_125 value="9512"/>
      <TASA_FINAL_125 value="0.951161019201792"/>
      <PRIMA_121 value="731435"/>
      <TASA_FINAL_121 value="0.914293844648332"/>

   </quote>
</root>'
                )
            COLUMNS orden FOR ORDINALITY
                ,CODIGO_RIESGO VARCHAR2(40) PATH 'CODIGO_RIESGO/@value'
                ,KEY_SEGUIMIENTO VARCHAR2(400) PATH 'KEY_SEGUIMIENTO/@value'
                ,PRIMA_125 VARCHAR2(400) PATH 'PRIMA_125/@value'
                ,TASA_FINAL_125 VARCHAR2(400) PATH 'TASA_FINAL_125/@value'
                ,PRIMA_121 VARCHAR2(400) PATH 'PRIMA_121/@value'
                ,TASA_FINAL_121 VARCHAR2(400) PATH 'TASA_FINAL_121/@value'
        ) )
        unpivot
        ( valor
        for tipo in (CODIGO_RIESGO, KEY_SEGUIMIENTO, PRIMA_125, PRIMA_121, TASA_FINAL_125, TASA_FINAL_121)
        );



SELECT
    regexp_substr('PRIMA_125', '\d+',5)
FROM DUAL;

select LISTAGG('PRIMA_' || agc.codigo2 || ' VARCHAR2(40) PATH ' || CHR(39) || 'PRIMA_' || agc.codigo2 || '/@value' ||
               CHR(39), ',') WITHIN GROUP (ORDER BY agc.codigo2) AS COLUMNAS_PRIMA,
       LISTAGG('TASA_FINAL_' || agc.codigo2 || ' VARCHAR2(40) PATH ' || CHR(39) || 'TASA_FINAL_' || agc.codigo2 || '/@value' ||
               CHR(39), ',') WITHIN GROUP (ORDER BY agc.codigo2) AS COLUMNAS_TASA,
       LISTAGG('PRIMA_' || agc.codigo2 , ',') WITHIN GROUP (ORDER BY agc.codigo2) AS PIVOT_PRIMA,
       LISTAGG('TASA_FINAL_' || agc.codigo2 , ',') WITHIN GROUP (ORDER BY agc.codigo2) AS PIVOT_TASA
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null;


select 'PRIMA_' || agc.codigo2 AS valor
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null
union
select 'TASA_FINAL_' || agc.codigo2 AS valor
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null
union
select VALOR
from (select 'CODIGO_RIESGO'   AS CODIGO_RIESGO,
             'KEY_SEGUIMIENTO' AS KEY_SEGUIMIENTO,
             'ASISTENCIA_216'  AS ASISTENCIA_216,
             'DESCUENTO'       AS DESCUENTO
      from dual) unpivot
    ( valor
    for tipo in (CODIGO_RIESGO, KEY_SEGUIMIENTO, ASISTENCIA_216, DESCUENTO)
    );




delete SIM_RES_MOTOR_PYMES;


--alter table SIM_RES_MOTOR_PYMES alter column tasa float;

SELECT  SUBSTR(DATA,
               INSTR(DATA,
                     'VLR_MCIAS') - (LENGTH(DATA) - (LENGTH('VLR_MCIAS'))),
               INSTR(DATA,
                     'VLR_MCIAS')-2) DATA FROM(
SELECT  REGEXP_SUBSTR('28_VLR_DINERO,30_VLR_EQUELEC,32_VLR_MAQUINARIA,340_VLR_MCIAS', '[^,]+', 1, LEVEL) AS data
FROM dual
CONNECT BY REGEXP_SUBSTR('28_VLR_DINERO,30_VLR_EQUELEC,32_VLR_MAQUINARIA,340_VLR_MCIAS', '[^,]+', 1, LEVEL) IS NOT NULL)
WHERE DATA LIKE '%VLR_MCIAS%'
  AND ROWNUM = 1;



select distinct t.cod_cob codigo_cobertura
from SIM_COBXALT t
where t.cod_act = 01000
  and t.cod_alt = 4
  and t.fecha_baja is null
union all
select 216 codigo_cobertura
from dual;


         select trim('1' from '123Eje1mplo111') from dual;


create table crucereintegros_ric as
(select d.* from sim_cooprop_crucereint_mae m
         inner join sim_cooprop_crucereintegros d
                    on m.id_cruce_mae = d.id_cruce_mae
where m.id_proceso = 221 and
      d.vr_reintegro != 0);



INSERT INTO OPS$PUMA.SIMAPI_MOTOR_REQUEST (COD_CIA, COD_SECC, COD_RAMO, VERSION_MOTOR, ORDEN_CAPITULO, DESC_CAPITULO,
                                           ORDEN_CAMPO, CAMPO, CAMPO_SERVICIO, TIEMPO_MOTOR, ESTADO_MOTOR)
VALUES (3, 66, 778, 'Pyme_version1_112022', 7, 'DATOSFIJOS', 32, 'DESCRIPCION', 'DESCRIPCION', '2022-11-17', 'A');



select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '39745176577'
  AND FECHA_EJECUCION < to_date('2022-03-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS');
select * from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION < to_date('2022-03-16 09:07:00', 'YYYY-MM-DD HH24:MI:SS') AND ID_COTIZACION = 999;


select *
from SIM_RES_MOTOR_PYMES
WHERE FECHA_EJECUCION > to_date('2024-11-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

select * from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS') AND ID_COTIZACION = 103059;

SELECT * FROM SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '103059' and FECHA_INICIO > to_date('2023-02-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS');



select distinct agc.codigo2 as cobertura
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null
union all
select 5 cobertura
from dual
order by 1;


select * from sim_log_general
where columna like '8032022 valor camp EN%' and TIMESTAMP > to_date('2023-10-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
order by secuencia desc;

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '103059'
  AND FECHA_EJECUCION > to_date('2023-02-23 09:07:00', 'YYYY-MM-DD HH24:MI:SS');


INSERT INTO SIM_RES_MOTOR_PYMES VALUES(3,66,778,9191,2,1,802,252200,0,'Pyme_version1_112022','2022-12-21T08:15:00','1724a9cf-7587-4424-914c-d2b3d8bd2502',SYSDATE);

select nvl(trim(null), 2) from dual;

SELECT TO_NUMBER('0.971980528650702') FROM dual;

SELECT TO_NUMBER('') FROM dual;


SELECT TO_NUMBER('0,798798', '0.00000000000000000000') FROM dual;

SELECT TO_NUMBER('', '0.000000000000000000000') FROM dual;


---INSERT INTO SIM_RES_MOTOR_PYMES VALUES(3,66,778,988,1,1,120,771703,0.857447649616957,'Pyme_version1_112022','2022-12-21T08:15:00','1724a9cf-7587-4424-914c-d2b3d8bd2502',SYSDATE);


select * from nls_database_parameters;
select * from nls_session_parameters;
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';


SELECT to_number( '0.971980528650702' ,
             '0.00000000000000000000',
             'NLS_NUMERIC_CHARACTERS = ''.,'' ') from dual;

select trunc(trunc(SYSDATE) + 22/24, 'HH') from dual;

SELECT TRUNC(SYSDATE) + 22/24 FROM dual;

select *
from all_jobs t
where t.WHAT ='SIM_PCK_PYMES_DIGITAL_MOTOR.prc_crea_job_borrado;'


SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND CR.ESTADO_MOTOR       = 'A'
  -- AND CR.VERSION_MOTOR IS NOT NULL
order by orden_Capitulo, orden_Campo;

---coberturas y agrupaciones
select agc.*
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'
  and agc.fecha_baja is null;
select agc.*
from c9999909 agc
where agc.cod_tab = 'AGRUP_PYME_778'
  and agc.fecha_baja is null;
----tabla de coberturas
select * from a1002100 where COD_RAMO = 778;

select * from a1002100 where COD_RAMO = 777;

select * from a1002100 where COD_RAMO = 923;

select * from A1002000 where COD_RAMO = 778;

---conf datos variables
select *
from g2000020
where cod_ramo in (778) and COD_CAMPO LIKE '%ASEG%';

select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where NUM_POL1 in (5010001443301,5010001443302);

      cod_secc = 66 and COD_RAMO in (777, 778) and FECHA_VENC_POL > to_date('2023-03-17 09:07:00', 'YYYY-MM-DD HH24:MI:SS');;

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
  and NUM_POL_COTIZ = 1530000537001;

select  a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from x2000030 a WHERE NUM_SECU_POL = 39745164530;


select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from a2000030 a
where cod_secc = 66
  and NUM_POL1 = 1530000537001;

select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.*
from a2000030 a
where cod_secc = 66
  and NUM_SECU_POL = 39745164530;

---datos variables polizas
select a.*  from a2000020 a
where num_secu_pol = 39745220812;

select a.*  from x2000020 a
where num_secu_pol = 39745220812;

----coberturas
Select  a.*
From A2000040 a
Where num_secu_pol = 39745164530;

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
Where num_secu_pol = 29768317278;


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

select *
from CREGLAS
where cdreg in ('299GVV080', '299GVV063', '266PVV102', '266PVV102', '266PVV102', '266PVV102', '266PVV102', '266PVV102',
                '266PVV102', '266PVV102', '266PVV102', '266PVV102', '266PVV102', '266PAV014', '266PAV013', '266PAV003',
                '266PAV003', '266PAV002', '266PAV002', '266GVV600', '266GVV102', '266GVV101', '212GVV014', '201PVV001',
                '201PVV001', '201PVV001', '201PAV033', '201PAV033', '201PAV033') and UPPER(REGLA_COMPLETA) like UPPER('%Fun_Recupera_Tasa%');

select *
from CREGLAS
where  UPPER(REGLA_COMPLETA) like UPPER('%Sin Coberturas%');

select *
from CREGLAS
where  UPPER(DSERROR) like UPPER('%Sin Coberturas%');


select *
from g2000020 WHERE COD_REGLA = '266CAL001';

select *
from g2000020
where cod_ramo in (778) and COD_CAMPO LIKE '%ASEG%';

select t.*, rowid
from SIM_DEBITO_AUTOMATICO t
WHERE NUM_SECU_POL = 39745157078;

select t.*, rowid
from SIM_XDEBITO_AUTOMATICO t
WHERE NUM_SECU_POL = 39745157078;

select t.*, rowid from x2000060 t WHERE NUM_SECU_POL = 39745157078;
-----debito automatico
select t.*, rowid from a2000060 t WHERE NUM_SECU_POL = 39745158848;
select *
from a2000060 t
where t.num_secu_pol in
      (select t.num_secu_pol
       from a2000030 t
       where t.cod_secc = 66
         and t.num_pol_cotiz = 1505001062601);

----tabla documentaron las tablas origen del Core
select * from a1000000 t where t.comentario like '%COMI%'

select * from a1000000 t where t.TABLA = 'A2000250';

SELECT Cod_conv, porc_Comi, mca_base, a.*
FROM x2000253 a
WHERE Num_secu_pol = 39745216301;

SELECT ROUND((PORC_COMI / PORC_PART) * 100, 2)
FROM A2000250
WHERE NUM_SECU_POL = 39745216262
  AND NUM_END = (SELECT MAX(NUM_END)
                 FROM A2000250
                 WHERE NUM_SECU_POL = 39745216262
                   AND COD_AGENTE = 55800
                   AND TIPO_REG = 'T')
  AND TIPO_REG = 'T'
  AND NVL(COMI_PACTADA, 'N') = 'S'
  AND COD_AGENTE = 55800
  AND MCA_BASE = 'S';

SELECT * FROM sim_agentes_convenio
WHERE COD_AGENTE = 56169;

----gastos de expedicion
select *
from a2990103
where COD_SECC = 66 AND
        COD_RAMO = 778;

select * from x2000252 where NUM_SECU_POL = 39745216262;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1530375076301 AND COD_SECC = 66;
----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745216262;
----FACTURAS
select * from a2990700 where NUM_SECU_POL = 39745169099;
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


select * from Sim_x_Riesgo_Poliza where NUM_SECU_POL = 39745220908;

select t.*, rowid from a2000020 t where t.num_secu_pol = 29780633851;



SELECT 39745162163,
       1,
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
       DECODE(A.ACEPTA_NULL, 'S', DECODE(A.OBLIGATORIO, 'S', 'S', 'N'), 'S'),
       DECODE(A.COD_CAMPO, 'TOMADOR', 'S', MCA_VISIBLE),
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
       A.CLAUSULAS
FROM G2000020 A,
     G2000010 B
WHERE A.COD_CIA = 3
  AND A.COD_CIA = B.COD_CIA
  AND COD_RAMO = 778
  AND (COD_NIVEL_SIST = 2 OR COD_NIVEL_SIST = 9)
  AND A.COD_CAMPO = B.COD_CAMPO
  AND NVL(A.MCA_BAJA, 'N') <> 'S'
  AND NVL(B.MCA_BAJA, 'N') <> 'S'
  AND COD_NIVEL != 1

select * from G2000010 where COD_CIA = 3 and COD_CAMPO IN ('LATITUD','LONGITUD');


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
select c.* from CREGLAS c where cdreg in ('778PVV102','778PVV103','778PCI001','778PCC001');

select c.REGLA_COMPLETA, c.* from CREGLAS c where cdreg = '266PVV001';

select c.REGLA_COMPLETA, c.* from CREGLAS c where cdreg = '299GVU002';

select * from g2000200 where CDREG = '999CTT002';

select * from g2000200 where cod_ramo = 777;

select * from g2000200 where cod_ramo = 778;

select count(1), max(COD_SECC), max(COD_RAMO) from g2000200 where CDREG = '3333' group by COD_SECC, COD_RAMO ;

/*
INSERT INTO G2000200 (COD_CIA, COD_AGENCIA, COD_SECC, COD_RAMO, COD_SIST, CDREG, DSNIVEL, COD_USR_CT, COD_USR,
                               SIM_USUARIO_CREACION, SIM_FECHA_CREACION)
VALUES (3, 9999, 66, 778, '2', '778CTT001', '1', null, 'b1030598', null, null);
*/

----TABLA DE MENSAJES DE CONTROLES TECNICOS
select * from g2000210 where COD_CIA = 3 and cod_error in ('289','329','340', '963');

select * from g2000220;

SELECT
       COD_ERROR,
       COD_RECHAZO,
       '1',
       NIVEL_AUT
FROM G2000210
WHERE COD_CIA = 3
  AND COD_ERROR = 963;

select * from g2000210 where COD_CIA = 3 and COD_ERROR = 963 and DESC_ERROR like '%EMITIR%'

/*
INSERT INTO G2000210 (COD_CIA, COD_ERROR, DESC_ERROR, COD_RECHAZO, COD_USER_SECRE, COD_USR, NIVEL_AUT, ID_PROCESO,
                      TIPO_CONTROL)
VALUES (3, 963, 'PRODUCTO NO PERMITIDO PARA EMITIR POR ESTE CANAL', 2, 'OPS$PUMA', 'OPS$PUMA', 2, null, 'T');
*/

Select *
from C9999909 c
where c.cod_tab = 'CIERREXSMARTCORE';

Select *
from C9999909 c
where c.cod_tab = 'ORIGENHABIPYMES';


select *  from C9999910 WHERE  COD_TAB  = 'CIERREXSMARTCORE';
/*
INSERT INTO C9999910 (COD_TAB, DESCRIPCION, USUARIO, FECHA_CREACION, OBLIGATORIO, PARAMETRO_SISTEMA, TIPO_USO,
                               FECHA_MODIFICA, FECHA_BAJA, USUARIO_MODIFICA, USUARIO_BAJA, OBSERVACIONES,
                               PROGRAMA_PROCESO, ESTADO, MODULO)
VALUES ('ORIGENHABIPYMES', 'SISTEMAS ORIGENES HABILITADOS PARA EMISION PYMES 778', 'b1030598',
        TO_DATE('2023-05-10', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null, 'A',
        null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4)
VALUES ('ORIGENHABIPYMES', 1, null, null, 'SISTEMAS ORIGENES HABILITADOS PARA EMISION PYMES 778', 'AP200030', 190,
        null, 778, 66, 3, TO_DATE('2023-05-10', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, 'b1030598', null,
        TO_DATE('2023-05-10', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, 'A', null, null);
*/

----tabla final donde quedan los controles tecnicos disparados
SELECT * FROM A2000220 WHERE COD_ERROR = 963 and cod_cia = 3 and DSNIVEL = '1';
SELECT * FROM X2000220 WHERE COD_ERROR = 963 and DSNIVEL = '1';


select * from sim_log
where trunc(Fecha) > to_date('09-05-2023','dd-mm-yyyy')
  and secuencia > 1299258068 and COLUMNA like '%Proc_Bloqueo_778CTT001%';

select *
from sim_log_general
where trunc(TIMESTAMP) > to_date('14-06-2023', 'dd-mm-yyyy')
  and COLUMNA like 'Ip_CodprogRic%';


select t.*, rowid
from sim_borrado_automatico t
where t.ESTADO = 'A'
  and t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;

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
select t.*, rowid
from sim_borrado_automatico t
where t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;




----- INACTIVO TODOS MENOS 778
UPDATE sim_borrado_automatico
SET estado = 'I'
WHERE COD_RAMO IN ('250', '160', '922', '922')
  AND COD_SECC IN ( '1', '81', '922', '922')
  AND SUB_RAMO IN ('251','367','369','363','999')
  AND COD_CIA  IN (2,3)
  AND ID_CONTROL IN ('73','25','26','27','84','86','88','90','91','92','94','76','70','96')
  AND ESTADO = 'A';

---ACTIVO DE NUEVO LOS BORRADOS DE COTIZACIONES DE LOS DEMAS PRODUCTOS
UPDATE sim_borrado_automatico
SET estado = 'A'
WHERE COD_RAMO IN ('250', '160', '922', '922')
  AND COD_SECC IN ( '1', '81', '922', '922')
  AND SUB_RAMO IN ('251','367','369','363','999')
  AND COD_CIA  IN (2,3)
  AND ID_CONTROL IN ('73','25','26','27','84','86','88','90','91','92','94','76','70','96')
  AND ESTADO = 'I';

--Consulta de cotizaciones 778
select t.tdoc_tercero tipo_doc_cliente,
       t.nro_documto nro_doc_cliente,
       (select dv.valor_campo
        from a2000020 dv
        where dv.num_secu_pol = t.num_secu_pol
          and dv.num_end = 0
          and dv.cod_ries = 1
          and dv.cod_campo = 'NOM_ASEGURADO') asegurado,
       (select dv.valor_campo
        from a2000020 dv
        where dv.num_secu_pol = t.num_secu_pol
          and dv.num_end = 0
          and dv.cod_campo = 'TELEFONO_RL') celular,
       t.num_secu_pol,
       t.cod_secc,
       t.num_pol_cotiz,
       t.num_end,
       t.fecha_emi,
       t.fecha_emi_end,
       t.fecha_vig_pol,
       t.fecha_venc_pol,
       T.COD_PROD,
       nvl(t.tipo_end, 'XX'),
       t.sim_subproducto,
       t.for_cobro,
       ((select count(*)
         from a2000020 dv
         where dv.num_secu_pol = t.num_secu_pol
           and dv.num_end = 0
           and dv.cod_campo = 'NOM_ASEGURADO')) riesgos
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and t.fecha_venc_pol >= to_date('25/10/2022', 'dd/mm/yyyy') --between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
  AND t.FECHA_VENC_POL = FECHA_VENC_PER
  AND NVL(t.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(t.MCA_CADUCA, 'N') = 'N'
  AND t.COD_COA != 3
  AND NVL(t.MCA_COTIZACION, 'N') = 'S'
  AND t.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)
  and nvl(t.tipo_end, 'XX') <> 'AT'
  and exists
    (SELECT * FROM A2000020 c WHERE c.NUM_SECU_POL = t.NUM_SECU_POL)
order by t.num_pol1, t.num_end;

select t.MCA_COTIZACION,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 777
  and t.FECHA_EMI >= to_date('25/05/2023', 'dd/mm/yyyy')--between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
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
select t.MCA_COTIZACION, t.num_secu_pol, t.NUM_POL_COTIZ, t.NUM_END,t.*
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
                   WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)
  and nvl(t.tipo_end, 'XX') <> 'AT'
  and exists
    (SELECT * FROM A2000020 c WHERE c.NUM_SECU_POL = t.NUM_SECU_POL)
order by t.FECHA_EMI desc;

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
  and mca_cotizacion = 'V'
  and NUM_SECU_POL = 39745175335;

select t.MCA_COTIZACION,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 777;

SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where upper( T.ID_COTIZACION) = '12348';


select *
from SIM_REQUEST_MOTOR_PYMES
WHERE FECHA_CREACION > to_date('2023-06-01 09:07:00', 'YYYY-MM-DD HH24:MI:SS')
  AND upper( ID_COTIZACION) = '12348';


DELETE SIM_REQUEST_MOTOR_PYMES
WHERE trunc(FECHA_CREACION) = trunc(sysdate)
  AND ID_COTIZACION = '12348';

select count(1) from SIM_REQUEST_MOTOR_PYMES;


SELECT nvl(dias_vigencia, 0) dias_vigencia
FROM sim_borrado_automatico ctrl
WHERE ctrl.cod_cia = 3
  AND ctrl.cod_secc IN (66, 999)
  AND ctrl.cod_ramo IN (778, 999)
  AND ctrl.sub_ramo IN (999, 999)
  AND nvl(ctrl.colectivo, 'GENERICO') IN ('N', 'GENERICO')
  AND ctrl.agencia IN (1530, 99999)
  AND ctrl.agente IN (55800, 99999)
  AND nvl(ctrl.val_numpol_ant, 'GENERICOS') IN
      ('N', 'GENERICOS')
  AND nvl(ctrl.canal_origen, 999) IN (3, 999)
  AND nvl(ctrl.es_cotiz, 'GENERICO') IN (SIM_PCK_PROCESO_DML_EMISION_F2.FUN_GET_TIPO_COTIZACION(29861256544), 'GENERICO')
  -- AND nvl(ctrl.es_cotiz, 'GENERICO') IN (ip_tipo_cotiz, 'GENERICO')
  AND ctrl.estado = 'A'
  AND ctrl.id_tipo = 1
ORDER BY ctrl.cod_secc,
         ctrl.cod_ramo,
         ctrl.sub_ramo,
         ctrl.agencia,
         ctrl.agente,
         NVL(ctrl.es_cotiz,'A') DESC;

/*
t.cod_secc = 39
  and t.cod_ramo = 602
*/

select COD_RAMO
from a2000030 t
where t.cod_secc = 66
GROUP BY COD_RAMO;

select t.*
from sim_codigos_endoso_seccion t WHERE COD_END = 900 AND SUB_COD_END IN (90,89) and cod_cia = 3;

select t.*
from sim_codigos_endoso_seccion t WHERE COD_END = 777 AND SUB_COD_END IN (1) and cod_cia = 3;


select * from a2000030 where NUM_SECU_POL = 39745174089;

select SUBSTR('1030598961', 1, 8) from dual;

select * from a1001800
where cod_texto is not null
  and sub_cod_texto is not null
  and tipo_end is null
  and cod_cia=3 and cod_secc=66
  and cod_proceso=2;



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

select * from SIM_RES_MOTOR_PYMES
WHERE FECHA_EJECUCION < sysdate - 1 / 86400
  AND ID_COTIZACION = 'ABCD1234';

select SYSDATE - 1/(24*60), sysdate from dual;


SELECT * FROM G2000010 WHERE COD_CIA = 3 AND COD_CAMPO IN ('LATITUD', 'LONGITUD');



select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_POL1 = 1010255078101;

select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_POL1 = 5010000811701;

select t.NUM_SECU_POL, t.MCA_COTIZACION, t.* from a2000030 t where t.NUM_SECU_POL = 29861140731;

select t.imp_prima/2, t.imp_impuesto/2, t.* from a2000160 t where t.num_secu_pol = 39745180212;

select t.* from a2000160 t where t.num_secu_pol = 39745180152;

--select t.* from X2000160 t where t.num_secu_pol = 39745180152;

select * from a2990700 t where t.num_secu_pol = 39745180431;

select * from a2000040 where num_secu_pol = 39745222223;

select * from a2000020 where num_secu_pol = 39745180212;

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = 'ABCD12345' AND
 FECHA_EJECUCION > to_date('2023-07-05 06:07:00', 'YYYY-MM-DD HH24:MI:SS');

SELECT * FROM C9999910 WHERE COD_TAB = 'ALT_COB_PYME';

SELECT t.codigo, t.dat_car3, t.dat_car2, t.*
FROM C9999909 T
WHERE T.COD_TAB = 'ALT_COB_PYME'
  and t.fecha_baja is null;


select t.MCA_COTIZACION,t.*
from a2000030 t
where t.cod_secc = 66
  and t.cod_ramo = 778
  and t.fecha_venc_pol >= to_date('25/06/2023', 'dd/mm/yyyy') --between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('31/10/2022', 'dd/mm/yyyy')
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


select t.recar_per_fact, t.*
from C1999800 t
where t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;

SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where --T.ID_COTIZACION = '64b0632f8acabf4291bf521e';
      FECHA_INICIO > to_date('2023-07-19 13:50:00', 'YYYY-MM-DD HH24:MI:SS');



select * from CREGLAS where cdreg = '778CTT001';




select t.cod_ramo,
       t.cod_actividad,
       a.desc_actividad,
       cod_bien_aseg,
       bienes.dat_obs,
       tipo_bien_aseg
from sim_param_bien_asegurado t,
     (SELECT * FROM C9999909 c WHERE c.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes,
     sim_act_economica a
where t.cod_ramo = 778
  and t.fecha_baja is null
  and t.cod_bien_aseg = bienes.codigo
  and t.cod_actividad = to_number(a.cod_actividad)
 and t.tipo_bien_aseg = 'P'
order by t.cod_actividad, t.cod_bien_aseg, t.tipo_bien_aseg;

--Parametrizacion Cumulos por cobertura
select * from A1002085 where COD_CIA = 3 and COD_SECC = 66;


select * from sim_accesos_datos where ID_PRODUCTO = 777;

----validacion endosos consumen motor
SELECT * FROM g2000270 where COD_SECC = 66;

select *
from g2000020
where  COD_REGLA = '922PCC002';

select *
from g2000020
where cod_ramo in (923) and COD_CAMPO LIKE '%VLR_EDIF%';

select * from CREGLAS where cdreg = '266PUC015';

select * from CREGLAS where UPPER(REGLA_COMPLETA) LIKE UPPER('%Proc_778CAL002%');

select * from a1002100 where COD_RAMO = 923;

select * from a1002100 where COD_RAMO = 778;

select * from a1002100 where COD_RAMO = 778 AND COD_COB IN ('123','124','216','290','291','310','660','800','802');

select * from a1002100 where COD_RAMO = 777;

select * from a1002100 where COD_REG_CAL = '220PCC100' IS NOT NULL; --= '922PCC002';

select * from CREGLAS where cdreg = '778PVV102';

select * from CREGLAS where cdreg = '778PVV103';

select * from CREGLAS where cdreg = '778PCI001';

select * from CREGLAS where cdreg = '778PCC001';

select * from CREGLAS where cdreg = '778CTT001';

select * from CREGLAS where cdreg = '266PUC016';

select * from CREGLAS where cdreg = '778PVV102';

select * from CREGLAS where cdreg = '778PVV103';

SELECT * FROM sim_tipotarifa_cob WHERE COD_RAMO = 777;---COD_SECC = 66 --AND

Select *
from SIMAPI_DV_BIEN_EST_ENT_WS WHERE  PRECAMPO LIKE '%HOGAR%' --AND COD_CAMPO = 'VLR_EDIF' ;

select t.codigo   codigo_plan,
       t.dat_car3 desc_plan,
       t.dat_car2 mca_personalizada,
       t.dat_num  orden
from c9999909 t
where cod_tab = 'ALT_COB_PYME'
  and t.fecha_baja is null
order by t.dat_num

select ag.codigo  codigo_agrupacion,
       ag.dat_obs descripcion_agrupacion
from c9999909 ag
where ag.cod_tab = 'AGRUP_PYME_778'
  and ag.fecha_baja is null
order by ag.codigo

select *
from SIM_COBXALT t
where t.cod_act = '01000'
  and t.cod_alt = 1
  and t.fecha_baja is null
union all
select 216 codigo_cobertura
from dual
order by codigo_cobertura;

select distinct t.cod_cob codigo_cobertura
from SIM_COBXALT t
where t.cod_act = '01000'
  and t.cod_alt = 4
  and t.fecha_baja is null
union all
select 216 codigo_cobertura
from dual
order by codigo_cobertura;

select cod_Act
from SIM_COBXALT t
where t.cod_act in (SELECT nvl(substr(a.cod_actividad, 0, 2), 0) || '000' cod_actividad
                    from sim_act_economica a
                    where a.cod_cia = 3
                      AND a.cod_secc = 66
                      AND a.cod_ramo = 999
--  and a.cod_actividad = ip_datos_riesgos(i).datos_fijos(k).valor
                      and a.fecha_baja is null)
  and t.cod_alt = 4
  and t.fecha_baja is null
  group by cod_Act;

SELECT nvl(substr(a.cod_actividad, 0, 2), 0) || '000' cod_actividad,
       a.desc_actividad
from sim_act_economica a
where a.cod_cia = 3
  AND a.cod_secc = 66
  AND a.cod_ramo = 999
--  and a.cod_actividad = ip_datos_riesgos(i).datos_fijos(k).valor
  and a.fecha_baja is null;




select agc.*
from c9999909 agc
where agc.cod_tab = 'AGRUP_X_COB_PYME_778'

Select j.*
From    x2000040 j
Where  j.num_secu_pol  = 39745197552
  And    j.cod_ries      = 1
  And    j.tipo_reg      = 'T';

select (((-70000000 * 2)/1000) * 1)  from dual;

Select j.*
From    A2000040 j
Where  j.num_secu_pol  = 39745220812
  And    j.cod_ries      = 1;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('29-NOV-2023 18:40:00','dd-mon-yyyy HH24:MI:SS') and
      t.columna like 'VALIDA_PYMESDIG - RIC-Proc_778CAL001-RIC%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('10-ENE-2024 18:00:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'SEG_DEH%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('17-ENE-2024 14:50:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'RIC_REG%'
order by secuencia desc;

Select a.*
From   sim_calificacion_pymes a
Where  a.id_cotizacion  in ('12sf3f4dfdg8dsfsdewq')
  And    a.NUM_END = (1 - 1)
  And     ROWNUM = 1;

SELECT N.SUB_COD_END, N.NUM_END, N.*
FROM X2000030 N
WHERE NUM_SECU_POL = 39745222223;

select *
from sim_log t
where  t.FECHA > to_date('15-ENE-2024 09:00:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'RIC_REG%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('30-NOV-2023 13:43:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'SIM_PCK_CONTEXTO_EMISION.REGLAS%' and
        t.LLAVE like '%39745220812%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('29-NOV-2023 15:40:00','dd-mon-yyyy HH24:MI:SS')
and COLUMNA like 'VALIDA_PYMESDIG - RIC-Proc_778CAL001-%'
--AND LLAVE LIKE '%39745220812%'
order by secuencia desc;

select * from sim_log_general
where TIMESTAMP > to_date('28-NOV-2023 10:55:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1770717606 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'RIC-Proc%'
  and VARIABLE like '%39745220812%'
order by secuencia desc;

select * from sim_log_general
where TIMESTAMP > to_date('05-ABR-2024 18:15:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1896675581 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'VALIDA_PYMESDIG%'
--and COLUMNA like '%778PCC001%'
order by secuencia desc;


---datos variables polizas
select a.*  from a2000020 a
where num_secu_pol = 39745220908 and (COD_CAMPO LIKE '%VLR%' OR COD_CAMPO LIKE '%VALOR%');

select a.*
from X2000020 a
where num_secu_pol = 39745197552
  AND (COD_RIES = 1 OR COD_RIES IS NULL);

select COD_CAMPO, VALOR_CAMPO
from X2000020 a
where num_secu_pol = 39745220908
  AND (COD_RIES = 1 OR COD_RIES IS NULL);

select *
from a2000030
where NUM_SECU_POL = 39745220812;

select  (nvl('200000000',0) !=  0) from dual;

SELECT CASE WHEN NVL('0', 0) <> 0 THEN 1 ELSE -1 END AS resultado FROM dual;

SELECT CASE WHEN NVL(END_SUMA_ASEG, 0) < 0 THEN -1 ELSE 1 END
FROM X2000040
WHERE NUM_SECU_POL = 39745220812
  AND COD_RIES = 1
  AND COD_COB = 290
  AND TIPO_REG = 'T';

SELECT *
FROM X2000040
WHERE NUM_SECU_POL = 39745220812 AND
        COD_RIES = 1 AND
        COD_COB = 290 AND
        TIPO_REG = 'T';


select *
from a2000030
where num_pol1 = 1530375087601;
 -- AND NUM_END = 1;

select TDOC_TERCERO, COD_ASEG
from a2001300 t
WHERE NUM_SECU_POL = 39745220908
  AND COD_RIES = 1
  AND NUM_END = 0;


SELECT  COUNT(x.NUM_SECU_POL)
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) <
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0));


SELECT TO_NUMBER(nvl(x.VALOR_CAMPO, 0))    AS VALOR_CAMPO,
       TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AS VALOR_CAMPO_EN,
       x.COD_CAMPO
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) <>
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AND TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) = 0;

SELECT TO_NUMBER(nvl(x.VALOR_CAMPO, 0))    AS VALOR_CAMPO,
       TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AS VALOR_CAMPO_EN,
       x.COD_CAMPO
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) =
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0));



SELECT
    COUNT(x.VALOR_CAMPO)
FROM
    (select *
     from X2000020
     WHERE NUM_SECU_POL = 39745220812
       AND COD_RIES = 1
       AND COD_CAMPO in (select t.dat_car2
                         from c9999909 t
                         where cod_tab = 'PYME_BIEN_ASEGURADO'
                           and t.fecha_baja is null) ) x
WHERE x.VALOR_CAMPO < x.VALOR_CAMPO_EN;

select t.dat_car2
from c9999909 t
where cod_tab = 'PYME_BIEN_ASEGURADO'
  and t.fecha_baja is null

SELECT a.NUM_SECU_POL,
       a.NUM_END,
       a.COD_RIES,
       a.COD_CAMPO,
       a.VALOR_CAMPO AS VALOR_CAMPO_EN_A,
       x.VALOR_CAMPO_EN AS VALOR_CAMPO_EN_X
FROM (select *
      from A2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND (COD_CAMPO LIKE '%VLR%' OR COD_CAMPO LIKE '%VALOR%')) a
         FULL OUTER JOIN
     (select *
      from X2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND (COD_CAMPO LIKE '%VLR%' OR COD_CAMPO LIKE '%VALOR%')) x ON a.COD_CAMPO = x.COD_CAMPO
WHERE (a.VALOR_CAMPO < x.VALOR_CAMPO_EN
    OR (a.VALOR_CAMPO IS NULL AND x.VALOR_CAMPO_EN IS NOT NULL)
    OR (a.VALOR_CAMPO IS NOT NULL AND x.VALOR_CAMPO_EN IS NULL));

SELECT COUNT(x.COD_CAMPO)
FROM (select *
      from X2000020
      WHERE NUM_SECU_POL = 39745220812
        AND COD_RIES = 1
        AND COD_CAMPO in (select t.dat_car2
                          from c9999909 t
                          where cod_tab = 'PYME_BIEN_ASEGURADO'
                            and t.fecha_baja is null)) x
WHERE nvl(x.VALOR_CAMPO, 0) < x.VALOR_CAMPO_EN;

select * from g2000200 where cod_ramo = 777;

select * from g2000200 where cod_ramo = 778

select * from g2000200 where cod_ramo = 923;


SELECT COD_CAMPO,
       CASE
           WHEN COD_CAMPO in (select t.dat_car2
                              from c9999909 t
                              where cod_tab = 'PYME_BIEN_ASEGURADO'
                                and t.fecha_baja is null) THEN
               TO_CHAR(TO_NUMBER(VALOR_CAMPO_EN) - TO_NUMBER(VALOR_CAMPO))
           ELSE
               VALOR_CAMPO_EN
           END AS VALOR_CAMPO_EN2, VALOR_CAMPO, VALOR_CAMPO_EN
FROM X2000020 a
WHERE num_secu_pol = 39745197552
  AND (COD_RIES = 1 OR COD_RIES IS NULL);

select TO_CHAR(TO_NUMBER('2000000') - TO_NUMBER(nvl(null,0))) from dual;


select *
from SIM_RES_MOTOR_PYMES
WHERE UPPER(ID_COTIZACION) = UPPER('39745220812')
AND  FECHA_EJECUCION > to_date('2023-11-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS');


select *
from SIM_RES_MOTOR_PYMES
WHERE   UPPER(ID_COTIZACION) = UPPER('12sf3f4dfdg8dsfsdewq') AND
      FECHA_EJECUCION > to_date('2023-11-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

select * from SIM_REQUEST_MOTOR_PYMES WHERE ID_COTIZACION = '39745220812' --trunc(FECHA_CREACION) = trunc(sysdate);

select sysdate - 1 / 86400 from dual;

DELETE SIM_RES_MOTOR_PYMES
WHERE FECHA_EJECUCION < sysdate - 1 / 86400
  AND ID_COTIZACION = '39745220812' ;

select COUNT(*) from SIM_REQUEST_MOTOR_PYMES;

select COUNT(*) from SIM_RES_MOTOR_PYMES;

select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = 'abc123'

SELECT * FROM SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '12sf3f4dfdg8dsfsdewq';


select * from sim_calificacion_pymes where ID_COTIZACION is not null ---and  id_cotizacion = '123487ric' ----and DIRECCION = 'CALLE 108 45-67'
ORDER BY FECHA DESC;
-----parametrizacion procedimiento motor
Select *
from c9999909
where cod_tab = 'PROD_MOTOR_RIESGO';
----parametrizacion de acceso a consumo a motor
Select *
from c9999909
where cod_tab = 'MOTOR_TARIFA_RIESGO';

SELECT rango1
FROM C9999909 c
WHERE cod_tab  = 'MOTOR_TARIFA_RIESGO'
  AND   cod_cia  = 3
  AND   cod_secc = 66
  AND   cod_ramo = 778;

UPDATE c9999909
SET RANGO1 = 39745256006
WHERE COD_RAMO = 778
  AND COD_SECC = 66
  AND COD_CIA = 3
  AND COD_TAB = 'MOTOR_TARIFA_RIESGO';

select * from c9999910
where COD_TAB = 'MOTOR_TARIFA_RIESGO';


SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC           = 66
  AND CR.COD_RAMO           = 778
  AND CR.ESTADO_MOTOR       = 'A'
  -- AND CR.VERSION_MOTOR IS NOT NULL
order by orden_Capitulo, orden_Campo;

select * from Sim_x_Riesgo_Poliza where NUM_SECU_POL = 39745220908;

SELECT *
FROM x2000160
WHERE num_Secu_pol = 39745220908;


UPDATE a1002100
SET COD_REG_CAL = NULL
WHERE COD_RAMO = 778
  AND COD_CIA = 3
  AND COD_COB NOT IN (660,216)
  AND  COD_REG_CAL = '778PCC001';

UPDATE a1002100
SET COD_REG_CAL = '778PCC001'
WHERE COD_RAMO = 778
  AND COD_CIA = 3
  AND COD_COB NOT IN (660);


UPDATE a1002100
SET COD_REG_PRE = '778PCI001'
WHERE COD_RAMO = 778
  AND COD_CIA = 3
  AND COD_COB NOT IN (660, 216);

UPDATE a1002100
SET COD_REG_VAL = null
WHERE COD_RAMO = 778
  AND COD_CIA = 3
  AND COD_COB NOT IN (660,216,802,801);


UPDATE a1002100
SET COD_REG_VAL = '778PUC016'
WHERE COD_RAMO = 778
  AND COD_CIA = 3
  AND COD_COB IN (660);


COMMIT;

SELECT TASA_AGRAVANTE, FORMA_APLIC, TIPO_AGRAVANTE
FROM X2990800
WHERE NUM_SECU_POL = 39745220812
  AND COD_RIES = 1
  AND COD_COB = P_CodCob


SELECT COD_CAMPO,
       CASE
           WHEN COD_CAMPO in (select t.dat_car2
                              from c9999909 t
                              where cod_tab = 'PYME_BIEN_ASEGURADO'
                                and t.fecha_baja is null)
               THEN TO_CHAR(TO_NUMBER(VALOR_CAMPO_EN) - TO_NUMBER(VALOR_CAMPO))
           ELSE VALOR_CAMPO_EN
           END AS VALOR_CAMPO_EN
FROM X2000020 a
WHERE num_secu_pol = 39745220812
  AND (COD_RIES = 1 OR COD_RIES IS NULL);


select * from OPERACION where secuencia in (5207,5211,5212,5214);

select * from OPERACION where secuencia = 5228;

SELECT *
FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '39745222223'


select *
from SIM_RES_MOTOR_PYMES
WHERE ID_COTIZACION = '39745222223'


select b2.* , bienes.dat_car2
from c9999909 b2,
     A1002100 c,
     (SELECT *
      FROM C9999909 T
      WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes
where b2.cod_tab = 'PYME_COB_BIEN_778'
  and b2.cod_cia = 3
  and b2.Cod_Secc = 66
  and b2.cod_ramo = 778
  and b2.fecha_baja is null
  and b2.codigo1 = c.cod_cob
  and b2.codigo1 = 120
  and c.cod_cia = b2.cod_cia
  and c.cod_ramo = b2.cod_ramo
  and b2.codigo2 = bienes.codigo
 -- and bienes.dat_car2 = 'VLR_EDIF'
order by b2.codigo;

SELECT
    NVL(to_number(nvl(dv.valor_campo_en, '0')) - to_number(nvl(dv.valor_campo, '0')),0)
from x2000020 dv
where dv.num_secu_pol = Ip_NumSecupol
  and dv.cod_ries = Ip_CodRies
  and dv.cod_campo in
      (select bienes.dat_car2
       from c9999909 b2,
            A1002100 c,
            (SELECT *
             FROM C9999909 T
             WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes
       where b2.cod_tab = 'PYME_COB_BIEN_778'
         and b2.cod_cia = Ip_CodCia
         and b2.Cod_Secc = 66
         and b2.cod_ramo = 778
         and b2.fecha_baja is null
         and b2.codigo1 = c.cod_cob
         and c.cod_cia = b2.cod_cia
         and c.cod_ramo = b2.cod_ramo
         and b2.codigo2 = bienes.codigo
         and c.cod_cob = Ip_CodCob;

select 72485 - ((((52000000 * 0.696969696969697) / 1000) *
                         1) * -1)  from dual;


select  ABS(-0.696969696969697) from dual;

SELECT PRIMA_COB, NVL(END_TASA_COB, NVL(TASA_COB, END_TASA_TOTAL)), B.*
FROM A2000040 B
WHERE NUM_SECU_POL = 39745197552
  AND COD_RIES = 1
  AND COD_COB = 288
  AND NUM_END = (SELECT MAX(NUM_END)
                 FROM A2000040 A
                 WHERE A.NUM_SECU_POL = 39745197552
                   AND A.COD_RIES = 1
                   AND A.COD_COB = 288);

SELECT NUM_SECU_POL FROM A2000030 WHERE NUM_POL1= 1530375313401


SELECT  B.*
FROM A2000040 B
WHERE NUM_SECU_POL = 39745217811
  AND COD_RIES = 1


SELECT  sum(END_PRIMA_COB), sum(END_PRIMA_ANU)
FROM X2000040 B
WHERE NUM_SECU_POL = 39745222223
  AND COD_RIES = 1;




SELECT COUNT(x.NUM_SECU_POL)
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745222223
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL)) x
WHERE TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) <
      TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0))
  AND TO_NUMBER(nvl(x.VALOR_CAMPO, 0)) = 0;


select * from a1002100 where COD_RAMO = 778;

select * from a1002100 where COD_RAMO = 777;

select * from sim_endosos_exentosxprodto where COD_SECC in (66);
select * from sim_endososxproceso;

select c.* from CREGLAS c where cdreg in ('778PUC016');

select c.* from CREGLAS c where cdreg in ('266PVV098');

SELECT f.*  FROM A502_DOC_DISPONIBLE_CEN f;

------numeracion cotizacion
Select * from A2990920 where cod_Secc = 66;
------numeracion poliza
Select * from A2990500 t where t.cod_secc = 66;


select t.cod_ramo,
       t.cod_actividad,
       a.desc_actividad,
       cod_bien_aseg,
       bienes.dat_obs,
       tipo_bien_aseg
from sim_param_bien_asegurado t,
     (SELECT * FROM C9999909 c WHERE c.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes,
     sim_act_economica a
where t.cod_ramo = 778
  and t.fecha_baja is null
  and t.cod_bien_aseg = bienes.codigo
  and t.cod_actividad = to_number(a.cod_actividad)
  and t.tipo_bien_aseg = 'P'
order by t.cod_actividad, t.cod_bien_aseg, t.tipo_bien_aseg;


select a.*, b.*
from SIM_PARAM_BIEN_ASEGURADO a
         inner join SIM_LIMITE_VLR_XACTXBIEN b
                    on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD AND A.COD_BIEN_ASEG = B.COD_BIEN_ASEG
where b.FECHA_BAJA is null
  and a.FECHA_BAJA is null


select * from SIM_LIMITE_VLR_XACTXBIEN;

Select a.*
From   sim_calificacion_pymes a
Where  a.id_cotizacion  in ('655e52cd300d27726b5fa944', to_char(39745220919))
  And    a.NUM_END = (1 - 1)
  And     ROWNUM = 1;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('18-ABR-2024 10:50:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'test REGLA CALC Prima es%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('18-ABR-2024 10:50:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'RPR Linea 4918 prima cob%'
order by secuencia desc;

select *
from sim_log_general t
where  t.TIMESTAMP > to_date('04-NOV-2024 09:50:00','dd-mon-yyyy HH24:MI:SS') and
        t.columna like 'LBCB-COBER-MOTOR%'
order by secuencia desc;

SELECT COUNT(x.NUM_SECU_POL)
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745220919
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL
                            AND t.DAT_CAR2 <> 'VLR_CYBER')) x
WHERE nvl(x.VALOR_CAMPO_EN, 0) > 0;


SELECT TO_NUMBER(nvl(x.VALOR_CAMPO, 0))    AS VALOR_CAMPO,
       TO_NUMBER(nvl(x.VALOR_CAMPO_EN, 0)) AS VALOR_CAMPO_EN,
       x.COD_CAMPO
FROM (SELECT *
      FROM X2000020
      WHERE NUM_SECU_POL = 39745220919
        AND COD_RIES = 1
        AND COD_CAMPO IN (SELECT t.dat_car2
                          FROM c9999909 t
                          WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
                            AND t.fecha_baja IS NULL
                            AND t.DAT_CAR2 <> 'VLR_CYBER')) x
WHERE nvl(x.VALOR_CAMPO_EN, 0) > 0;

SELECT *
FROM X2000020
WHERE NUM_SECU_POL = 39745220919
  AND COD_RIES = 1


SELECT * FROM SIM_PARAMETROS_SIMON WHERE NOMBRE = 'WS_PYMES_URL';

select c9.dat_num, c9.*
from c9999909 c9
where c9.cod_tab  = 'DIAS_XRA_RENOVAR'

SELECT c9.codigo, c9.*
FROM C9999909 c9
WHERE COD_TAB = 'DIAS_RENOVA_OFERTAS'

----gastos de expedicion
select *
from a2990103
where imp_der_emi > 0


---datos variables polizas
select a.*  from x2000020 a
where num_secu_pol = 39745239959;

select a.*  from a2000020 a
where num_secu_pol = 39745241744;

---POLIZAS
select t.*
from a2000160 t
where t.num_secu_pol in
      (39745239846, 39745239768, 39745239850, 39745239851, 39745239852, 39745239959, 39745240186, 39745240830,
       39745240839, 39745241035, 39745241309);
select t.*
from a2000190 t
where t.num_secu_pol in
      (39745239846, 39745239768, 39745239850, 39745239851, 39745239852, 39745239959, 39745240186, 39745240830,
       39745240839, 39745241035, 39745241309);

----COTIZACIONES
---VALOR TOTAL DE LA PRIMA
select t.* from a2000160 t where t.num_secu_pol in (39745241527, 39745242236);
----impuestos
select t.* from a2000190 t where t.num_secu_pol in (39745241527, 39745242236);


SELECT  round(decode(0,0,IMP_DER_EMI,
                     decode('AP299453','AP299453', imp_der_emi, '2/99/P/AP299453', imp_der_emi,
                            Decode(66,310,decode('AP299453','AP200406',Imp_der_end,0), IMP_DER_END))))
FROM   A2990103
WHERE COD_CIA = 3   AND
        COD_SECC= 66  AND
        COD_RAMO= 778  AND
        COD_MON = 1   AND
        PRIMA_HASTA >= 3109619;

select *
from a2990103 WHERE COD_CIA = 3   AND
        COD_SECC= 66  AND
        COD_RAMO= 778  AND
        COD_MON = 1

SELECT * FROM A2000030 WHERE NUM_SECU_POL = 39745240186;

SELECT w.num_pol1
     ,w.num_end
     ,w.num_secu_pol
     ,w.fecha_venc_pol
     ,w.fecha_venc_end
FROM (WITH polizas_pyme AS (SELECT a.num_pol1
                                 ,a.num_end
                                 ,a.num_secu_pol
                                 ,a.fecha_venc_pol
                                 ,a.fecha_venc_end
                            FROM a2000030 a
                            WHERE a.cod_cia = 3
                              AND a.cod_secc = 66
                              AND a.cod_ramo = 778
                              AND a.num_end =
                                  (select max(w.num_end)
                                   from a2000030 w
                                   where w.num_secu_pol = a.num_secu_pol)
                              AND nvl(a.mca_provisorio, 'N') = 'N'
                                                       and NVL(a.mca_anu_pol,'N') != 'S'
                                                       --AND a.num_pol_ant is null
                                                       AND nvl(a.mca_caduca, 'N') = 'N'
                                                       AND nvl(a.mca_term_ok, 'N') = 'S'
                                                       AND num_pol1 <> 0)
      SELECT p.num_pol1
           ,p.num_end
           ,p.num_secu_pol
           ,p.fecha_venc_pol
           ,p.fecha_venc_end
           ,rank() over(PARTITION BY p.num_secu_pol
          ORDER BY p.num_end DESC) AS rango
      FROM polizas_pyme p) w
WHERE w.rango = 1 AND nvl(w.fecha_venc_pol, w.fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);


select SYSDATE + 10/1440 from dual;
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;


SELECT to_number(nvl('15300,45', 0)) FROM DUAL;

SELECT
       TRUNC(TO_NUMBER('15300,45'))
FROM DUAL;


------plan sugerido
SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA          = 3
  AND CR.COD_SECC         = 66
  AND CR.COD_RAMO         = 778
  AND CR.ESTADO_MOTOR     = 'A'
  AND CR.VERSION_MOTOR    = 'Pyme_integración_032024'
  -- AND CR.VERSION_MOTOR IS NOT NULL
order by orden_Capitulo, orden_Campo;

select bienes.codigo   cod_bien,
       bienes.DAT_CAR2 COD_CAMPO_VALOR
from c9999909 t,
     (select b.codigo, b.dat_obs descripcion, b.DAT_CAR2
      from c9999909 b
      where cod_tab = 'PYME_BIEN_ASEGURADO'
        and b.cod_cia = 3
        and b.Cod_Secc = 66
        and b.cod_ramo = 999
        and b.fecha_baja is null) bienes,
     (SELECT d.CODIGO2 cob
      FROM C9999909 d
      WHERE COD_TAB = 'AGRUP_X_COB_PYME'
        AND cod_cia = 3
        AND Cod_Secc = 66
        AND cod_ramo = 777
        AND CODIGO1 = 1) agrup_cob
where t.cod_tab = 'PYME_COB_BIEN_778'
  and t.codigo2 = bienes.codigo
  and t.codigo1 = agrup_cob.cob
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 778
  and t.fecha_baja is null
group by bienes.codigo, bienes.DAT_CAR2;


select t.*
from c9999909 t
where t.cod_tab = 'PYME_BIEN_ASEGURADO'
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 999
  and t.fecha_baja is null

select t.*
from c9999909 t
where t.cod_tab = 'PYME_BIEN_SUGERIDO'
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 778
  and t.fecha_baja is null


select t.*
from c9999909 t
where t.cod_tab = 'PYME_BIEN_SUGERIDO'
  and t.cod_cia = 3
  and t.Cod_Secc = 66
  and t.Cod_Ramo = 778
  and t.fecha_baja is null;

SELECT ',' || LISTAGG(CAMPO_SERVICIO, ',') WITHIN GROUP(ORDER BY CAMPO_SERVICIO) || ','
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA = 3
  AND CR.COD_SECC = 66
  AND CR.COD_RAMO = 778
  AND CR.ESTADO_MOTOR = 'A'
  AND CR.VERSION_MOTOR = 'Pyme_integración_032024';


SELECT *
FROM SIMAPI_MOTOR_REQUEST CR
WHERE CR.COD_CIA = 3
  AND CR.COD_SECC = 66
  AND CR.COD_RAMO = 778
  AND CR.ESTADO_MOTOR = 'A'
  AND CR.VERSION_MOTOR = 'Pyme_integracion_032024';


select bien_sug.DAT_CAR2 bien, req.VALOR valor, bien_sug.CODIGO codigo, bien_sug.DAT_OBS descripcion
from SIM_REQUEST_MOTOR_PYMES req
         INNER JOIN (select COD_CAMPO, DAT_CAR2, CODIGO, DAT_OBS
                     from c9999909
                     where cod_tab = 'PYME_BIEN_SUGERIDO'
                       and cod_cia = 3
                       and Cod_Secc = 66
                       and Cod_Ramo = 778
                       and fecha_baja is null) bien_sug ON bien_sug.COD_CAMPO = req.CAMPO
WHERE req.ID_COTIZACION = '1234567SUGERIDO'
  AND req.COD_RIES = 1
  AND req.VALOR <> '0';


-----VALIDACION VALORES ASEGURADOS
select * from SIM_REQUEST_MOTOR_PYMES WHERE ID_COTIZACION = '39745264468';
-----VALIDACION PRIMAS Y TASAS
select * from SIM_RES_MOTOR_PYMES WHERE ID_COTIZACION = 'asasd1405b5cddgb123';
-----VALIDACION REQUEST Y RESPONSE SERVICIO
SELECT * FROM SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '39745264468';

---- RENOVACION AUTOMATICA


SELECT              REV.USUARIO AS USUARIO   ,
                    REV.NUM_SECU_POL AS NUMSECUPOL  ,
                    REV.COLNUM01 AS  NUMPOL    	,
                    REV.COLNUM02 AS NUMPOLRENOV     ,
                    REV.COLCAR15  AS RAZONFALLO  	,
                    REV.COLCAR10     	AS ESTADO,
                    REV.COLCAR01 	AS ANIORENOVA,
                    REV.COLCAR02   AS MESRENOVA 	,
                    REV.COLCAR03  AS FECHA_RENOV    ,
                    A.FECHA_VIG_POL 	AS FECHA_VIG_POL    ,
                    A.COD_PROD 		AS CODPROD  ,
                    A.FOR_COBRO    	AS FORCOBRO ,
                    COBRO.DESC_FORM_COBRO AS DESCFORMA,

                    A.NRO_DOCUMTO AS NRODOCUMTO   ,
                    (NAT.PRIMER_NOMBRE     ||
                     ' '                    ||
                     NAT.SEGUNDO_NOMBRE     ||
                     ' '                    ||
                     NAT.PRIMER_APELLIDO    ||
                     ' '                    ||
                     NAT.SEGUNDO_APELLIDO  )     AS NOMBRETOMADOR1    ,
                    JUR.RAZON_SOCIAL AS NOMBRETOMADOR,
                    SUM(A40.END_PRIMA_COB) AS PRIMACOB,
                    A.COD_SECC,
                    A.COD_RAMO
FROM C9999040 REV
         LEFT JOIN A2000030  A 	ON REV.COLNUM02 	= 	A.NUM_POL1
         LEFT JOIN A2000040 A40 	ON A40.NUM_SECU_POL 	=	A.NUM_SECU_POL
         LEFT JOIN NATURALES NAT ON NAT.NUMERO_DOCUMENTO = A.NRO_DOCUMTO
         LEFT JOIN JURIDICOS JUR ON JUR.NUMERO_DOCUMENTO = A.NRO_DOCUMTO
         LEFT JOIN A1002400 COBRO ON  COBRO.COD_COBRO = A.FOR_COBRO
WHERE REV.USUARIO = 'RENOVADORAUT'
      -- AND TO_DATE(REV.COLCAR03,'DD/MM/YYYY') BETWEEN TO_DATE(?FECHA_INI, 'DD/MM/YYYY') AND TO_DATE(?FECHA_FIN, 'DD/MM/YYYY')
GROUP BY REV.USUARIO			,
         REV.NUM_SECU_POL	,
         REV.COLNUM01		,
         REV.COLNUM02		,
         REV.COLCAR15				,
         REV.COLCAR10				,
         REV.COLCAR01				,
         REV.COLCAR02		,
         REV.COLCAR03		,
         A.FECHA_VIG_POL			,
         A.COD_PROD 		,
         A.FOR_COBRO    	,
         COBRO.DESC_FORM_COBRO 			,
         A.NRO_DOCUMTO 		,
         NAT.PRIMER_NOMBRE      		,
         NAT.SEGUNDO_NOMBRE     		,
         NAT.PRIMER_APELLIDO    		,
         NAT.SEGUNDO_APELLIDO   		,
         JUR.RAZON_SOCIAL,
         A.COD_SECC,
         A.COD_RAMO;

SELECT * FROM C9999040 WHERE USUARIO = 'RENOVADORAUT';


SELECT w.num_pol1
     , w.num_end
     , w.num_secu_pol
     , w.fecha_venc_end
     , w.cod_ramo
FROM (WITH polizas_pyme AS (SELECT a.num_pol1
                                 , a.num_end
                                 , a.num_secu_pol
                                 , a.fecha_venc_pol
                                 , a.fecha_venc_end
                                 , a.cod_ramo
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
                             -- AND NUM_SECU_POL in ('39745254523')
                             )
      SELECT p.num_pol1
           , p.num_end
           , p.num_secu_pol
           , p.fecha_venc_pol
           , p.fecha_venc_end
           , p.COD_RAMO
           , rank() over (PARTITION BY p.num_secu_pol
          ORDER BY p.num_end DESC) AS rango
      FROM polizas_pyme p) w
WHERE w.rango = 1
  AND nvl(w.fecha_venc_pol, w.fecha_venc_end) < SYSDATE;



select b.COD_CAMPO dato_variable
from c9999909 b
where cod_tab = 'PYME_BIEN_SUGERIDO'
  and b.cod_cia = 3
  and b.Cod_Secc = 66
  and b.cod_ramo = 778
  and b.fecha_baja is null
  and b.codigo2 =
      (select b2.codigo2 cod_bien
       from c9999909 b2
       where b2.cod_tab = 'PYME_COB_BIEN_778'
         and b2.cod_cia = 3
         and b2.Cod_Secc = 66
         and b2.cod_ramo = 778
         and b2.fecha_baja is null
         and b2.codigo1 = 120);


SELECT COD_COB, END_SUMA_ASEG
FROM A2000040
WHERE NUM_SECU_POL = 39745259854
  AND COD_RIES = 1
  AND END_SUMA_ASEG > 0
  AND NUM_END = (SELECT MAX(NUM_END)
                 FROM A2000040
                 WHERE NUM_SECU_POL = 39745259854
                   AND COD_RIES = 1);


----coberturas
Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('39745260544')

Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('39745264468');

Select  a.*
From x2000040 a
Where num_secu_pol = 39745259854;

Select  a.*
From x2000040 a
Where num_secu_pol = 39745259864;

Select  a.*
From x2000030 a
Where num_secu_pol = 39745259826;


Select *
from c9999909
where cod_tab = 'MOTOR_TARIFA_RIESGO';


---datos variables polizas
select a.*  from a2000020 a
where NUM_SECU_POL in ('39745264468');

select a.*  from a2000020 a
where NUM_SECU_POL in ('39745260544');

select a.*  from x2000020 a
where NUM_SECU_POL in ('39745264468');


SELECT COD_CAMPO, VALOR_CAMPO
FROM A2000020
WHERE num_secu_pol = 39745256690
  AND (COD_RIES = 1 OR COD_RIES IS NULL)

----gastos de expedicion
select *
from a2990103
where COD_SECC = 66 AND
        COD_RAMO = 778;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1530375076301 AND COD_SECC = 66;
----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745216262;
----FACTURAS
select * from a2990700 where NUM_SECU_POL in ('39745176577','39745265084');
---VALOR TOTAL DE LA PRIMA
select * from a2000160 where NUM_SECU_POL in ('39745176577','39745260592');
select * from a2000163 where NUM_SECU_POL in ('39745260591','39745260592');

select * from x2000160 where NUM_SECU_POL = '39745259117';


SELECT NVL(SUM(NVL(END_SUMA_ASEG,0)),0)
FROM X2000040
WHERE NUM_SECU_POL = 39745259854
  AND MCA_TIPO_COB   <> '1'
  AND cod_selecc = 'S'
  AND cod_cob IN (SELECT cod_cob FROM a1002100
                  WHERE cod_ramo = 778
                    AND cod_cia = 3
                    AND nvl(mca_suma_aseg,'N') = 'S'
                  UNION
                  SELECT cod_cob FROM a2302150
                  WHERE cod_ramo = 778
                    AND cod_cia = 3
                    AND nvl(mca_suma_aseg,'N') = 'S');

SELECT NVL(SUM(NVL(END_PRIMA_COB,0)),0),NVL(SUM(NVL(END_PRIMA_ANU,0)),0)
FROM X2000040
WHERE NUM_SECU_POL = 39745259117
  AND MCA_TIPO_COB   <> '1'
  AND ((NVL(PRIMA_COB,0) != 0) OR
       (nvl(END_PRIMA_COB,0) != 0 ));

----impuestos
select * from x2000190 where NUM_SECU_POL = 39745169099;
select * from a2000190 where NUM_SECU_POL = 39745258456;


select SUBSTR(TO_CHAR(a.NUM_POL1), 1, 11), a.*
from a2990700 a
where COD_CIA = 3
  AND COD_SECC = 66
  AND COD_RAMO = 778
  AND NUM_POL1 like SUBSTR(TO_CHAR(15303750933), 1, 11)||'%';

select a.*  from a2000020 a
where num_secu_pol = 39745258927;

-----VALIDACION VALORES ASEGURADOS
select * from SIM_REQUEST_MOTOR_PYMES WHERE ID_COTIZACION = '39745258456';
-----VALIDACION PRIMAS Y TASAS
select * from SIM_RES_MOTOR_PYMES WHERE ID_COTIZACION = '39745258449';
-----VALIDACION REQUEST Y RESPONSE SERVICIO
SELECT * FROM SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = '39745258449';

SELECT *
FROM ops$puma.SIM_LOG_MOTORTARIFA_PYMES t
where --T.ID_COTIZACION = '64b0632f8acabf4291bf521e';
      FECHA_INICIO > to_date('2024-05-21 13:50:00', 'YYYY-MM-DD HH24:MI:SS');


SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  AND NUM_SECU_POL in ( 39745258455, 39745256690);


SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
 -- AND NUM_SECU_POL in ( 39745258455, 39745256690);
  AND COLCAR03 = '02/05/2024';




SELECT w.num_pol1
     , w.num_end
     , w.num_secu_pol
     , w.fecha_venc_end
     , w.cod_ramo
FROM (WITH polizas_pyme AS (SELECT a.num_pol1
                                 , a.num_end
                                 , a.num_secu_pol
                                 , a.fecha_venc_pol
                                 , a.fecha_venc_end
                                 , a.cod_ramo
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
                              AND RENOVADA_POR IS NULL
                              )
      SELECT p.num_pol1
           , p.num_end
           , p.num_secu_pol
           , p.fecha_venc_pol
           , p.fecha_venc_end
           , p.COD_RAMO
           , rank() over (PARTITION BY p.num_secu_pol
          ORDER BY p.num_end DESC) AS rango
      FROM polizas_pyme p) w
WHERE w.rango = 1
  AND nvl(w.fecha_venc_pol, w.fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);


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
  AND NUM_SECU_POL in ('39745264468','39745260544')
  AND nvl(a.fecha_venc_pol, a.fecha_venc_end) < SYSDATE;

Select Slw.*
From sim_Log_Webservices Slw
Where Id_Simlogws IN (36650305,36650329,36650330,36650333,36650334,36650337,36650338,36651403,36651406,36651409);


select a.*  from x2000020 a
where num_secu_pol = 39745258236;


select a.*  from a2000020 a
where num_secu_pol = 39745258927;

select a.*  from a2000020 a
where num_secu_pol = 39745265044;

----gastos de expedicion
select *
from a2990103
where COD_SECC = 66 AND
      COD_RAMO = 778;


SELECT COUNT(cod_cob)
FROM X2000040
WHERE Num_secu_Pol = 39745267530
  AND ( NVL(end_prima_cob,0) <> 0
    OR ((NVL(mca_gratuita,'N') = 'S' or NVL(mca_prima_inf,'N') ='S')
        AND ( NVL (mca_grat_ant, 'N') = 'N'
            OR   0 = 0)
        AND   cod_selecc = 'S'));


SELECT *
FROM X2000040
WHERE Num_secu_Pol = 39745267530
  AND ( NVL(end_prima_cob,0) <> 0
    OR ((NVL(mca_gratuita,'N') = 'S' or NVL(mca_prima_inf,'N') ='S')
        AND ( NVL (mca_grat_ant, 'N') = 'N'
            OR   0 = 0)
        AND   cod_selecc = 'S'));

SELECT COUNT(*)
FROM x2000030
WHERE num_secu_pol = 39745267530
  AND coefcob = 1
  AND months_between(fecha_venc_pol, fecha_vig_pol) != 12
  AND cod_secc != 310;

SELECT rango1
FROM C9999909 c
WHERE cod_tab  = 'MOTOR_TARIFA_RIESGO'
  AND   cod_cia  = 3
  AND   cod_secc = 66
  AND   cod_ramo = 778;

select a.*  from a2000020 a
where NUM_SECU_POL in ('39745261563');

select a.*  from a2000020 a
where NUM_SECU_POL in ('39745267593');

select a.*  from X2000020 a
where NUM_SECU_POL in ('39745267083');

Select a.RENOVADA_POR, a.*
From a2000030 a
Where num_secu_pol in ( '39745169659','39745261563','39745260586');

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  AND NUM_SECU_POL in ( '39745169659','39745261563','39745260586')
 AND COLCAR03 IN ('24/09/2024');

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  AND NUM_SECU_POL in ( '39745169659','39745261563','39745260586');
 -- AND COLCAR03 IN ('20/09/2024');

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND NUM_SECU_POL in ( '39745249384','39745257583')
  AND COLCAR15 like '%.(778PUC016).ORA-01722%';


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
  ---AND NUM_SECU_POL in ('29834263485')
  AND RENOVADA_POR IS NULL
  --AND NUM_END > 0
  --AND NUM_POL_ANT IS NULL
  AND nvl(fecha_venc_pol, fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);

select t.RENOVADA_POR, t.NUM_POL1, t.NUM_SECU_POL, t.* from a2000030 t where t.num_pol1 in(1003135279202);

Select Slw.*
From sim_Log_Webservices Slw
Where Id_Simlogws = 36671791;


SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND COLNUM02 IS NOT NULL
 -- AND COLCAR01 = '2024'
  -- AND NUM_SECU_POL in ( 39745258455, 39745256690);
  AND COLCAR03 IN ('20/01/2026');

---polizas renovadas exitosamente
SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND NUM_SECU_POL in ( '39745249384','39745257583')
  AND NUM_SECU_POL IN (SELECT a.num_secu_pol
                       FROM a2000030 a
                       WHERE a.cod_cia = 3
                         AND a.cod_secc = 66
                         AND a.cod_ramo = 778
                         AND RENOVADA_POR IS NOT NULL);
---polizas con problemas de renovacion
SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND NUM_SECU_POL in ( '39745249384','39745257583')
  AND NUM_SECU_POL IN (SELECT a.num_secu_pol
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
                         --AND NUM_END > 0
                         --AND NUM_POL_ANT IS NULL
                         AND nvl(fecha_venc_pol, fecha_venc_end) < ADD_MONTHS(SYSDATE, 1));

SELECT COUNT(x.NUM_SECU_POL)
FROM (SELECT NUM_SECU_POL, VALOR_CAMPO_EN
      FROM X2000020
      WHERE NUM_SECU_POL = 39745261563
        AND COD_RIES = 3
        AND COD_CAMPO IN
            (SELECT t.dat_car2
             FROM c9999909 t
             WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
               AND t.fecha_baja IS NULL
               AND t.DAT_CAR2 <> 'VLR_CYBER')) x
WHERE x.VALOR_CAMPO_EN <> '0' and x.VALOR_CAMPO_EN IS NOT NULL;

SELECT NUM_SECU_POL, VALOR_CAMPO_EN
FROM X2000020
WHERE NUM_SECU_POL = 39745261563
  AND COD_RIES = 3
  AND COD_CAMPO IN
      (SELECT t.dat_car2
       FROM c9999909 t
       WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
         AND t.fecha_baja IS NULL
         AND t.DAT_CAR2 <> 'VLR_CYBER')
  AND
    VALOR_CAMPO_EN > 0
  AND
    nvl(VALOR_CAMPO_EN, 0) > 0;


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
  AND RENOVADA_POR IS NOT NULL;
  AND a.NUM_POL1 in ('1530375094902','1530375094903');
  --and a.NUM_SECU_POL = 39745259854;
  --AND RENOVADA_POR IS NULL;

  ---datos variables polizas
select a.*  from a2000020 a
where NUM_SECU_POL in ('39745267572');

select a.*  from a2000020 a
where NUM_SECU_POL in ('39745176577');

select a.*  from x2000020 a
where NUM_SECU_POL in ('39745257884');

----coberturas
Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('39745176577');

Select  a.*
From A2000040 a
Where NUM_SECU_POL in ('39745220812');

Select  SUM(END_PRIMA_COB)
From A2000040 a
Where NUM_SECU_POL in ('29861326779')

Select  SUM(END_PRIMA_COB)
From A2000040 a
Where NUM_SECU_POL in ('29861452572');

Select  a.*
From x2000040 a
Where num_secu_pol = 39745267448;

Select  a.*
From x2000040 a
Where num_secu_pol = 29861459659;

Select  a.*
From x2000030 a
Where num_secu_pol = 39745259826;

------RELACION DATOS VARIABLES VALORES ASEGURADOS CON COBERTURAS
select b2.codigo1, bienes.dat_car2
from c9999909 b2,
     A1002100 c,
     (SELECT *
      FROM C9999909 T
      WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes
where b2.cod_tab = 'PYME_COB_BIEN_778'
  and b2.cod_cia = 3
  and b2.Cod_Secc = 66
  and b2.cod_ramo = 778
  and b2.fecha_baja is null
  and b2.codigo1 = c.cod_cob
  and c.cod_cia = b2.cod_cia
  and c.cod_ramo = b2.cod_ramo
  and b2.codigo2 = bienes.codigo
  --and bienes.dat_car2 IN ('VLR_CYBER','VLR_DINERO','VLR_EDIF','VLR_EQUELEC','VLR_MUEBLES','VLR_RESPCIV','VLR_ROBOEMP')
order by b2.codigo1;

Select  a.*
From A2000040 a
Where num_secu_pol = 39745164530;

SELECT a.num_secu_pol,
       a.num_pol1
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
  AND a.NUM_POL1 = 1530375083201;
 --and a.NUM_SECU_POL = 39745261563;
--AND RENOVADA_POR IS NULL;

SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  -- AND NUM_SECU_POL in ( 39745258455, 39745256690);
  AND COLCAR03 = '16/05/2024';


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



select M.PRIMA, M.TASA, M.COD_RIES, M.COD_COB
from SIM_RES_MOTOR_PYMES M,
     X2000040 X
WHERE M.COD_COB = X.COD_COB
  AND X.NUM_SECU_POL = 39745258449
  AND M.ID_COTIZACION = '39745258449'
  AND X.TIPO_REG = 'T';


select p.tipo_bien_aseg
from sim_param_bien_asegurado p
where  p.cod_actividad = to_number('1001')
  and p.cod_bien_aseg =
      (select t.codigo
       from c9999909 t
       where cod_tab = 'PYME_BIEN_ASEGURADO'
         and (t.cod_campo = 'VLR_MUEBLES' or
              t.dat_car2 = 'VLR_MUEBLES')
         and t.fecha_baja is null)
  and p.cod_ramo = 778
  and p.fecha_baja is null
  and rownum = 1
group by p.tipo_bien_aseg;

SELECT p.tipo_bien_aseg
FROM sim_param_bien_asegurado p
WHERE  p.cod_actividad = to_number('01000')
  AND p.cod_bien_aseg =
      (SELECT t.codigo
       FROM c9999909 t
       WHERE cod_tab = 'PYME_BIEN_ASEGURADO'
         AND (t.cod_campo = 'VLR_EDIF' OR
              t.dat_car2 = 'VLR_EDIF')
         AND t.fecha_baja IS NULL)
  AND p.cod_ramo = 778
  AND p.fecha_baja IS NULL
  AND rownum = 1
GROUP BY p.tipo_bien_aseg;


select a.*, b.*
from SIM_PARAM_BIEN_ASEGURADO a
         inner join SIM_LIMITE_VLR_XACTXBIEN b
                    on a.COD_ACTIVIDAD = b.COD_ACTIVIDAD AND A.COD_BIEN_ASEG = B.COD_BIEN_ASEG
where b.FECHA_BAJA is null
  and a.FECHA_BAJA is null;

select * from sim_tarifa_det_pymes;

Select * from c1990000;


SELECT ((MAX(CASE WHEN EXTRACT(YEAR FROM FECHA_VIG) = EXTRACT(YEAR FROM SYSDATE) THEN MINIMO_MES END) -
         MAX(CASE WHEN EXTRACT(YEAR FROM FECHA_VIG) = EXTRACT(YEAR FROM SYSDATE) - 1 THEN MINIMO_MES END)) /
        MAX(CASE
                WHEN EXTRACT(YEAR FROM FECHA_VIG) = EXTRACT(YEAR FROM SYSDATE) - 1
                    THEN MINIMO_MES END)) AS porcentaje_incremento
FROM c1990000;



select b3.TIPO_BIEN_ASEG, bienes.DAT_CAR2
from c9999909 b2,
     A1002100 c,
     (SELECT *
      FROM C9999909 T
      WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO') bienes,
     (SELECT p.*
      FROM sim_param_bien_asegurado p
      WHERE p.cod_actividad = to_number(02001)
       AND p.cod_ramo = 778
        AND p.fecha_baja IS NULL)  b3
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
  and b2.codigo1 = 712
  and rownum = 1;


-------------------------------------------------------------------------------------------------------------------------

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
  --AND a.NUM_POL1 = 1530375093501;
  and a.NUM_POL_COTIZ = 1569000492401;
--AND RENOVADA_POR IS NULL;


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
WHERE ID_COTIZACION = lower('12SF3F4DFDG8DSFSDEWQ')
  AND COD_RIES = 1
  AND ROWNUM = 1
ORDER BY FECHA DESC

SELECT *
FROM C9999909 T
WHERE T.COD_TAB = 'PYME_BIEN_ASEGURADO'

UPDATE OPS$PUMA.C9999909
SET DAT_CAR   = 'LV_EDIF'
WHERE  COD_TAB   = 'PYME_BIEN_ASEGURADO' AND
    CODIGO    = 1 AND
    COD_CAMPO = 'VLR_EDIF_L' AND
    COD_RAMO  = 999 AND
    COD_SECC  = 66 AND
    COD_CIA   = 3;


select *
from g2000020
where cod_ramo in (778) and COD_REGLA = '201PVV001';

SELECT *
FROM G2000010
WHERE COD_CIA = 3 AND
        COD_CAMPO = 'PORC_CONFIA_IA';


SELECT TEXT
FROM ALL_SOURCE
WHERE NAME = 'SIM_PCK_REGLASNEGOCIO'
  AND TYPE = 'PACKAGE BODY'
ORDER BY LINE;


Select  *
From     sim_homologa_ciudad_mapas d
Where    d.ciudad_simon = ip_nom_ciu_simon;


Select NVL(a.num_secu_pol,-10) num_secu_pol,a.prohib,a.num_end,a.cod_ries
From   sim_calificacion_pymes a
Where  a.direccion  = ip_direccion
  And    a.ciudad     = ip_ciudad
  And    a.PROHIB is not null and a.PROHIB = 'N'
  And    a.fecha = (Select max(d.fecha)
                    From   sim_calificacion_pymes d
                    Where  d.direccion = a.direccion
                      And    d.ciudad    = a.ciudad
                      And    d.PROHIB is not null and d.prohib = 'N'
                      And    d.fecha >= Sysdate-30);