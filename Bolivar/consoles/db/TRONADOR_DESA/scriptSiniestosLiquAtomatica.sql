select * from A2000030 where num_secu_pol = 29711861457;
select * from A2000030 where NUM_POL1 = 5010000609101;

select * from A2000030 where FECHA_VENC_END > to_date('2021-06-01', 'YYYY-MM-DD') and cod_cia = 3 and COD_SECC = 23 and COD_RAMO = 117 AND MCA_ANU_POL IS NULL ;

select * from a7000900 where NUM_SINI = 50102302118;
                             --10172300843
select * from a3001700 where NUM_SINI = 10172302262;

select * from a7000900 where NUM_SECU_SINI = 27034558549; ---NRO_DOCUMTO = 52007029 AND COD_SECC = 23 --

SELECT S.NUM_POL1, S.NUM_SINI, E.NRO_EXPED, R.TOTAL_LIQ, S.NRO_DOCUMTO
FROM   A7000900 S,
       A7001000 E,
       A7001200 R
WHERE  S.COD_CIA = 3
  AND    S.COD_SECC = 4
  AND    S.COD_RAMO = 445
  --AND    S.NUM_POL1 = p_poliza
 -- AND    S.COD_RIES = p_riesgo
  AND    S.COD_CAUSA_BAJA IS NULL
  AND    S.NRO_ORDEN_SINI = (SELECT MAX(S1.NRO_ORDEN_SINI)
                             FROM   A7000900 S1
                             WHERE  S1.COD_CIA = S.COD_CIA
                               AND    S1.COD_SECC = S.COD_SECC
                               AND    S1.NUM_SECU_SINI = S.NUM_SECU_SINI)
  AND    E.COD_CIA = S.COD_CIA
  AND    E.COD_SECC = S.COD_SECC
  AND    E.NUM_SINI = S.NUM_SINI
  AND    E.TIPO_EXPED = 'CAD'
  AND    E.NRO_ORDEN_EXP = (SELECT MAX(E1.NRO_ORDEN_EXP)
                            FROM   A7001000 E1
                            WHERE  E1.NUM_SECU_EXPED = E.NUM_SECU_EXPED)
  AND    R.NUM_SECU_EXPED = E.NUM_SECU_EXPED
  AND    R.NRO_ORDEN_EXP = E.NRO_ORDEN_EXP
ORDER BY S.FECHA_SINI; -- ADICIONAR

---tabla de expedientes
select *
from a7001000
where NUM_SECU_SINI = 27034579549
  and  (TIPO_EXPED, NRO_ORDEN_EXP) in (select TIPO_EXPED, max(NRO_ORDEN_EXP) as max from OPS$PUMA.A7001000 where NUM_SECU_SINI = 27034579549 group by TIPO_EXPED)
  and MCA_EST_EXP is null
 and NRO_EXPED not in (select distinct NRO_EXPED from a3001700 where NUM_SINI = 50102302118)
order by NRO_EXPED, NRO_ORDEN_EXP;


SELECT *
FROM a7001200 where NUM_SECU_EXPED in (26758538387);



SELECT A.COD_CONCEP_RVA, B.TIPO_EXPED, A.COD_COB, A.VALOR_RVA,
       (A.VALOR_ACTUAL - A.TOTAL_LIQ) VALOR_RESERVA_PENDIENTE
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN SIM_EXPED_RVA_AUTOMATICA C ON C.TIPO_EXPED = B.TIPO_EXPED AND C.COD_COB = A.COD_COB AND C.COD_CONCEP_RVA = A.COD_CONCEP_RVA
WHERE A.NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 27034579549
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 27034579549
                                   GROUP BY TIPO_EXPED)
                             AND NVL(MCA_EST_EXP, 'P') = 'P'
                             AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED FROM a3001700 WHERE NUM_SINI = 50102302118)
)
  AND A.tipo_reg = 'T'
  AND C.COD_CIA = 3
  AND C.COD_SECC = 23
  AND C.COD_PRODUCTO = 127
  AND C.LIQUIDACION_AUTOMATICA = 'S'
ORDER BY  A.NRO_ORDEN_EXP;

SELECT NUM_SECU_EXPED, COD_COB, VALOR_ACTUAL,
       TOTAL_LIQ,  (VALOR_ACTUAL-TOTAL_LIQ) RVA_PEND
FROM A7001200 WHERE NUM_SECU_EXPED = 26758538387



select * from a3001700 where NUM_SINI = 27822301075

----PLATILLA DATOS VARIABLE----- PARA LOS DE PREAVISO COD_CAMPO = COPE_
select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 127;
----RESULTADO DATOS VARIABLES PUNTUALES DEL SINIESTRO
select * from OPS$PUMA.A7000025 where  NUM_SECU_SINI = 27034548749;
--select * from OPS$PUMA.A7000025 where  COD_CAMPO = 'VR_PRETENSION' AND  COD_RAMO = 117;
                                      --27034472519;   COD_CAMPO = 'VR_PRETENSION'

select * from G7000025;

---COD_CIA = 3 SECC = 999 PRODUCTO = 999

select * from OPS$PUMA.A7000900 where num_sini = 10172300843

--DAA GSO NO SE LIQUIDAN POR LIQUIDACION AUTOMATICA


select * from SIM_TIPO_RVA_AUTOMATICA wHERE ID_TIPO_RESERVA = 611;
SELECT * FROM SIM_EXPED_RVA_AUTOMATICA WHERE COD_CIA = 3 AND COD_PRODUCTO = 127 AND COD_CAUSA = 10 --COD_COB = 216; --ID_TIPO_RESERVA
    ---RA_VR_VAR_GSO_VLR_PRET


--PARA BUSCAR casos
select * from  A2000030 where NRO_DOCUMTO = 860026620 and cod_cia = 3 AND COD_SECC = 23;



SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_SINI = 50102302114;
SELECT * FROM SIM_CARGA_VAR_SINIESTROS WHERE SECUENCIA_CAR_SINI = 93607;


SELECT DP.*, DE.*
FROM   SIM_PREAVISO_DET_SINIESTROS DP, SIM_EXPED_RVA_AUTOMATICA DE
WHERE
      DE.COD_CIA = 3
  AND    DE.COD_SECC = 23
  AND    DE.COD_PRODUCTO = 127
 -- AND    DE.COD_CAUSA = 44
  AND    DE.DATO_VARIABLE IS NOT NULL
  AND    DE.COD_CONS = DP.COD_CONS_SINI
  AND    DE.COD_COB = DP.COD_COB_SINI
--GROUP BY DE.DATO_VARIABLE;

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                         AND    DE.COD_SECC = 23
                                         AND    DE.COD_PRODUCTO = 127
                                        and DE.COD_CONS = 80

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 23
                                            AND    DE.COD_PRODUCTO = 103
                                            and DE.COD_CONS = 8

select * from SIM_TIPO_RVA_AUTOMATICA where id_TIPO_RESERVA = 889;

select * from sim_tipo_rva_automatica
order by id_tipo_reserva;



select * from sim_log
where columna like 'liquiAuto%'
order by SECUENCIA desc;


SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
--  AND    A.COD_CAMPO = 'EXENTO_ICA'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999


SELECT * FROM SIM_EXPED_RVA_AUTOMATICA WHERE LIQUIDACION_AUTOMATICA = 'S'

---VALOR DE RESERVA PENDIENTE PARA LA LIQUIDACION
SELECT rva.num_secu_Exped, rva.nro_orden_exp, rva.cod_cob, rva.VALOR_RVA,
       rva.valor_movim, rva.valor_actual, rva.total_liq,
       (rva.valor_actual - rva.total_liq) vr_reserva_pendiente
FROM a7001200 rva
where rva.NUM_SECU_EXPED in (26758534787)
  and  rva.nro_orden_exp = (select max(r1.nro_orden_exp) from
    a7001200 r1 where r1.num_secu_exped = rva.num_secu_exped)
  and rva.tipo_reg = 'T'
order by rva.num_secu_exped, rva.nro_orden_exp, rva.cod_cob



select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 112 AND COD_CAMPO  LIKE '%PRETENS%';

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 237
                                            AND    DE.COD_CAUSA = 126
                                            and DE.COD_CONS = 33
                                           -- AND DE.ID_TIPO_RESERVA = 889

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 23
                                            AND    DE.COD_PRODUCTO = 103
                                            AND    DE.COD_CAUSA = 102
                                            and DE.COD_CONS = 17
-- AND DE.ID_TIPO_RESERVA = 889

select * from sim_tipo_rva_automatica
order by id_tipo_reserva;




SELECT * FROM A2000030 WHERE NRO_DOCUMTO = 80501297



select * from a7000900 WHERE COD_CIA = 3 AND COD_SECC = 12 AND COD_RAMO = 130
ORDER BY FECHA_CREACION DESC ;


select *
FROM A1001800
where cod_cia = 3
 -- AND COD_TEXTO = 300
  and TXT_RED like '%UNICO%'
--  and cod_secc in (66, 999)
  and cod_texto = 3
  and sub_cod_texto = 2
  and cod_proceso = '3';

SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'SUB_COD_TEXTO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3



SELECT DAT_OBS
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'COD_TEXTO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3

CREATE OR REPLACE PUBLIC SYNONYM SIM_PCK_PROCESO_DATOS_EMISION FOR OPS$PUMA.SIM_PCK_PROCESO_DATOS_EMISION;
grant all ON SIM_PCK_PROCESO_DATOS_EMISION TO PUBLIC;
GRANT ALL ON SIM_PCK_PROCESO_DATOS_EMISION TO c_comunes;
GRANT ALL ON SIM_PCK_PROCESO_DATOS_EMISION TO SIMONWEBAPP;
--commit;


select * from ind_reglas_definicion definicion0_;

select count(*) from ind_reglas_definicion definicion0_;

SELECT count(*) FROM ind_reglas_clasificacion;

SELECT * FROM ind_reglas_clasificacion;


SELECT S.ID_EXPRVAAUT, S.COD_CIA, S.COD_SECC, S.COD_PRODUCTO, S.COD_CAUSA, S.COD_CONS, S.COD_COB,S.ID_TIPO_RESERVA, S.TIPO_EXPED, S.LIQUIDACION_AUTOMATICA, S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=127 AND S.COD_CAUSA=102 AND S.COD_CONS=17 AND S.COD_COB=228;


SELECT TO_NUMBER(DAT_NUM)
FROM   C9999909 A
WHERE  A.COD_TAB = 'MESES_ATRAS_TOPE'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA = 3
  AND    ROWNUM < 2;


select *
from SIM_LOG_WEBSERVICES
WHERE FECHA_INICIO > TRUNC(date '2021-11-30')
  and (CODIGOWS = 'REQUETS_SCORE_RIESGO_LOG_ERROR' OR CODIGOWS = 'REQUETS_SCORE_RIESGO_LOG')
  and (tipo_proceso like '%:200%' OR tipo_proceso like '%:230%' OR tipo_proceso like '%:440%' OR tipo_proceso like '%:103%'
    OR tipo_proceso like '%:450%' OR tipo_proceso like '%:455%' OR tipo_proceso like '%:460%'
    OR tipo_proceso like '%:470%' OR tipo_proceso like '%:480%' OR tipo_proceso like '%:1%'
    OR tipo_proceso like '%:76%'  OR tipo_proceso like '%:790%' OR tipo_proceso like '%:8%'
    OR tipo_proceso like '%:154%' OR tipo_proceso like '%:910%' OR tipo_proceso like '%:214%'
    OR tipo_proceso like '%:215%' OR tipo_proceso like '%:218%' OR tipo_proceso like '%:219%'
    OR tipo_proceso like '%:220%' OR tipo_proceso like '%:120%' OR tipo_proceso like '%:152%'
    OR tipo_proceso like '%:40%' OR tipo_proceso like  '%:45%');

select * from A2000030 where COD_RAMO = 200  --- NUM_POL1 = 1522101379501;

SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 12
  AND    G.COD_RAMO = 130

SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 23
  AND    G.COD_RAMO = 103


select * from A7000025 where  NUM_SECU_SINI = 29034583755;


select * from SIM_DELEGACIONES;

select * from sim_log
where columna like 'liquiAuto%'
order by SECUENCIA desc;


SELECT A.COD_CONCEP_RVA, B.TIPO_EXPED, A.COD_COB,
       SUM(DISTINCT A.VALOR_ACTUAL - A.TOTAL_LIQ) VALOR_RESERVA_PENDIENTE
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN (SELECT LIQUIDACION_AUTOMATICA, TIPO_EXPED, COD_CONCEP_RVA, COD_COB
                     FROM SIM_EXPED_RVA_AUTOMATICA
                     WHERE COD_CIA = 3
                       AND COD_SECC = 12
                       AND COD_PRODUCTO = 136
                     GROUP BY TIPO_EXPED, LIQUIDACION_AUTOMATICA, COD_CONCEP_RVA, COD_COB)
    C ON C.TIPO_EXPED = B.TIPO_EXPED
    AND C.COD_COB = A.COD_COB AND C.COD_CONCEP_RVA = A.COD_CONCEP_RVA
WHERE A.NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 27034687349
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 27034687349
                                   GROUP BY TIPO_EXPED)
     AND NVL(MCA_EST_EXP, 'P') = 'P'
      AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED FROM a3001700 WHERE NUM_SINI = 35511204753)
)
  AND A.tipo_reg = 'T'
  AND C.LIQUIDACION_AUTOMATICA = 'S'
GROUP BY B.TIPO_EXPED, A.COD_CONCEP_RVA, A.COD_COB order by B.TIPO_EXPED;

SELECT * FROM SIM_CARGA_LIQUIDACIONES where COD_SECC != 70;

SELECT * FROM SIM_CARGA_DET_LIQUIDACIONES;

----TABLA SISTEMAS ORIGENES
select * from C1000703;

---valores asegurados
SELECT *
FROM A2000040
WHERE num_secu_pol = 29749203084
  AND mca_vigente = 'S'
  AND tipo_reg = 'T';

select n.NUM_POL1, SUBSTR(n.NUM_POL1, 0, 4), n.SIM_CANAL, n.SISTEMA_ORIGEN, n.NUM_END, NVL(C.DESC_SISTEMA_ORIGEN, 'INDEFINIDO'), N.COD_PROD, n.*
from A2000030 n
LEFT JOIN C1000703 C ON C.SISTEMA_ORIGEN = n.SISTEMA_ORIGEN
where  NUM_POL1 = 2101010003002 --AND COD_RAMO = 127

SELECT * FROM A7000900
    WHERE COD_ASEG = 901167414
      AND nvl(FECHA_CREACION, FEC_PROC_SINI) >= ADD_MONTHS(SYSDATE, -60)
      AND nvl(FECHA_CREACION, FEC_PROC_SINI) <= SYSDATE;

----canales simon
select * from C9999909 where cod_tab = 'CANALES';

--Sistema origen
select * from C1000703;

select * from C9999909 where COD_TAB = 'MESES_HISTORICO'

---tabla de expedientes
SELECT wm_concat(TIPO_EXPED) AS EXPED
FROM a7001000
WHERE NUM_SECU_SINI = 27034579549
  AND (TIPO_EXPED, NRO_ORDEN_EXP)
    IN (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) AS max
        FROM A7001000
        WHERE NUM_SECU_SINI = 27034579549
        GROUP BY TIPO_EXPED);


----numero de Asiento tesoreria
SELECT cod_ofic_contab,
       to_char(sysdate, 'ddmmyyyy'),
       num_asiento,
       to_number(to_char(sysdate, 'yyyy'))
FROM a5021700
WHERE cod_cia = 3;
select * from a5021700;

----localidad usuario de creacion-------
select * from g1002700 where nom_user like '%20401391%'
                         and cod_cia = 3


SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999;

---correccion expediente se quita unico para producto 173
/*
UPDATE SIM_EXPED_RVA_AUTOMATICA SET MCA_UNICO = 'N' WHERE COD_CIA = 3
                                                      AND COD_SECC = 66
                                                      AND COD_PRODUCTO = 173
                                                      and COD_CONS = 24
                                                      and cod_cob = 1
                                                      and cod_causa = 25
                                                      AND ID_TIPO_RESERVA = 849;
UPDATE SIM_EXPED_RVA_AUTOMATICA SET MCA_UNICO = 'N' WHERE COD_CIA = 3
                                                      AND COD_SECC = 66
                                                      AND COD_PRODUCTO = 173
                                                      and COD_CONS = 34
                                                      and cod_cob = 1
                                                      and cod_causa = 25
                                                      AND ID_TIPO_RESERVA = 611;
*/


----agencia ususario-----
SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999;
select * from g1002700 where nom_user like '%20401391%'
                         and cod_cia = 3;

select * from a5010040;


SELECT    DECODE(Tipo_Mercadeo,2,'PR',4,'PR','AG') For_Act
FROM    Intermediarios;


            SELECT    *
FROM    Intermediarios where clave = 77557

select * from A2000030 where num_secu_pol = 29711861457;



SELECT TO_NUMBER(VALOR)
FROM   SIM_PARAMETROS_SIMON
WHERE  NOMBRE = 'AGENCIA GIRO DEFECTO';