----TABLA SISTEMAS ORIGENES
select * from C1000703;

select * from A2000030 where num_secu_pol = 29711861457;
select * from A2000030 where NUM_POL1 = 5010000609101;

select * from a7000900 where NUM_SINI = 35511205063;
                             --10172300843
select * from a3001700 where NUM_SINI = 50102302118;

select * from a7000900 where NRO_DOCUMTO = 52007029 AND COD_SECC = 23 -- NUM_SECU_SINI = 26740714530;

---talba de expedientes
select *
from a7001000
where NUM_SECU_SINI = 29034464965
  and  (TIPO_EXPED, NRO_ORDEN_EXP) in (select TIPO_EXPED, max(NRO_ORDEN_EXP) as max from OPS$PUMA.A7001000 where NUM_SECU_SINI = 29034464965 group by TIPO_EXPED)
  --and MCA_EST_EXP is null
 and NRO_EXPED not in (select distinct NRO_EXPED from a3001700 where NUM_SINI = 50102302118)
order by NRO_EXPED, NRO_ORDEN_EXP;

---diferente GSO

SELECT A.COD_CONCEP_RVA, B.TIPO_EXPED, A.COD_COB, A.VALOR_RVA,
       (A.VALOR_ACTUAL - A.TOTAL_LIQ) VALOR_RESERVA_PENDIENTE
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN SIM_EXPED_RVA_AUTOMATICA C ON C.TIPO_EXPED = B.TIPO_EXPED AND C.COD_COB = A.COD_COB AND C.COD_CONCEP_RVA = A.COD_CONCEP_RVA
WHERE A.NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 29034465035
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 29034465035
                                   GROUP BY TIPO_EXPED)
                             AND NVL(MCA_EST_EXP, 'P') = 'P'
                             AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED FROM a3001700 WHERE NUM_SINI = 50102302938)
)
  AND A.tipo_reg = 'T'
  AND C.COD_CIA = 3
  AND C.COD_SECC = 23
  AND C.COD_PRODUCTO = 127
  AND C.LIQUIDACION_AUTOMATICA = 'S'
ORDER BY  A.NRO_ORDEN_EXP;

SELECT A.COD_CONCEP_RVA, B.TIPO_EXPED, A.COD_COB
       --     INTO l_conceprva, l_tipexped, l_cod_cob
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED
WHERE A.NUM_SECU_EXPED in (SELECT *
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 27034510949
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 27034510949
                                   GROUP BY TIPO_EXPED)
                             AND MCA_EST_EXP IS NULL
                             AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED
                                                   FROM a3001700 WHERE NUM_SINI = 50102302113))
  AND A.tipo_reg = 'T'
  AND B.TIPO_EXPED NOT IN ('GSO', 'DAA')
ORDER BY  A.NRO_ORDEN_EXP;



select * from a3001700 where NUM_SINI = 27822301075

----PLATILLA DATOS VARIABLE----- PARA LOS DE PREAVISO COD_CAMPO = COPE_
select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 127;
----RESULTADO DATOS VARIABLES PUNTUALES DEL SINIESTRO
select * from OPS$PUMA.A7000025 where  NUM_SECU_SINI = 27034516549;
select * from OPS$PUMA.A7000025 where  COD_CAMPO = 'VR_PRETENSION' AND COD_RAMO = 117;
                                      --27034472519;   COD_CAMPO = 'VR_PRETENSION'

---COD_CIA = 3 SECC = 999 PRODUCTO = 999

select * from OPS$PUMA.A7000900 where num_sini = 10172300843

--DAA GSO NO SE LIQUIDAN POR LIQUIDACION AUTOMATICA


select * from SIM_TIPO_RVA_AUTOMATICA; --HERE ID_TIPO_RESERVA = 611;
SELECT * FROM SIM_EXPED_RVA_AUTOMATICA WHERE COD_CIA = 3 AND COD_PRODUCTO = 117 AND COD_CAUSA = 6 --COD_COB = 216; --ID_TIPO_RESERVA
    ---RA_VR_VAR_GSO_VLR_PRET


--PARA BUSCAR casos
select * from  A2000030 where NRO_DOCUMTO = 52007029 and cod_cia = 3 AND COD_SECC = 23;



SELECT * FROM SIM_CARGA_SINIESTROS WHERE NUM_SINI = 50102302114;
SELECT * FROM SIM_CARGA_VAR_SINIESTROS WHERE SECUENCIA_CAR_SINI = 93607;


SELECT SUM(DP.VALOR_INDEMNIZAR) VALOR, DE.DATO_VARIABLE
FROM   SIM_PREAVISO_DET_SINIESTROS DP, SIM_EXPED_RVA_AUTOMATICA DE
WHERE
      DE.COD_CIA = 3
  AND    DE.COD_SECC = 23
  AND    DE.COD_PRODUCTO = 127
  AND    DE.COD_CAUSA = 44
  AND    DE.DATO_VARIABLE IS NOT NULL
  AND    DE.COD_CONS = DP.COD_CONS_SINI
  AND    DE.COD_COB = DP.COD_COB_SINI
GROUP BY DE.DATO_VARIABLE;



SELECT * FROM SIM_EXPED_RVA_AUTOMATICA WHERE DATO_VARIABLE = 'VR_PRETENSION'


SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 99
                                            AND   DE.COD_CAUSA = 39;
                                            and DE.COD_CONS = 39


select * from sim_tipo_rva_automatica
order by id_tipo_reserva;

select * from sim_log
where columna like 'liquiAuto%'
order by SECUENCIA desc;



SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'EXENTO_ICA'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999

SELECT DAT_OBS

FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'AUTORIZANTE'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3
  AND ROWNUM < 2;


DELETE FROM C9999909 WHERE COD_TAB = 'DATOS_FIJOS_LIQ'


----Problemas multiples coberturas reserva automatica
SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 173
                                            and DE.COD_CONS = 34
                                            and de.cod_cob = 1
                                            and de.cod_causa = 25;

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 173
                                            and DE.COD_CONS = 24
                                            and de.cod_cob = 1
                                            and de.cod_causa = 25;


                                           -- AND DE.ID_TIPO_RESERVA = 889


SELECT *

FROM   C9999909 A
WHERE  A.COD_TAB = 'TOPE_FUNC_EXP_GSO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA = 3;

select * from A7000025 where COD_CAMPO = 'VR_PRETENSION';  NUM_SECU_SINI = 29034471055;


SELECT DP.* , DE.*
FROM   SIM_PREAVISO_DET_SINIESTROS DP, SIM_EXPED_RVA_AUTOMATICA DE
WHERE -- DP.SECUENCIA_PREAVISO = Ip_Secuencia
   DE.COD_CIA = 3
  AND    DE.COD_SECC = 23
  AND    DE.COD_PRODUCTO = 109
  AND    DE.COD_CAUSA = 10
  AND    DE.DATO_VARIABLE IS NOT NULL
  AND    DE.COD_CONS = DP.COD_CONS_SINI
  AND    DE.COD_COB = DP.COD_COB_SINI
GROUP BY DE.DATO_VARIABLE;


SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 23
  AND    G.COD_RAMO = 109


SELECT * FROM SIM_EXPED_RVA_AUTOMATICA WHERE COD_CIA = 3 AND COD_PRODUCTO = 127 AND COD_CAUSA = 10

SELECT DAT_OBS
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'CONCEPTO_LIQUIDACION'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 237
                                            AND   DE.TIPO_EXPED = 'ECC'
                                            and DE.COD_CONS = 51
-- AND DE.ID_TIPO_RESERVA = 889

select * from a7000900 where NUM_SINI = 15406600568;

SELECT A.COD_CONCEP_RVA,
       B.TIPO_EXPED,
       A.COD_COB,
      --- SUM(A.VALOR_RVA),
      SUM(A.VALOR_ACTUAL - A.TOTAL_LIQ) VALOR_RESERVA_PENDIENTE
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN (SELECT LIQUIDACION_AUTOMATICA, TIPO_EXPED, COD_CONCEP_RVA, COD_COB
                     FROM SIM_EXPED_RVA_AUTOMATICA
                     WHERE COD_CIA = 3
                       AND COD_SECC = 66
                       AND COD_PRODUCTO = 173
                     GROUP BY TIPO_EXPED, LIQUIDACION_AUTOMATICA, COD_CONCEP_RVA, COD_COB) C
                    ON C.TIPO_EXPED = B.TIPO_EXPED
                        AND C.COD_COB = A.COD_COB AND C.COD_CONCEP_RVA = A.COD_CONCEP_RVA
WHERE A.NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 29034530695
                             AND (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                 (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                  FROM A7001000
                                  WHERE NUM_SECU_SINI = 29034530695
                                  GROUP BY TIPO_EXPED)
                             AND NVL(MCA_EST_EXP, 'P') = 'P'
                             --AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED    FROM a3001700 WHERE NUM_SINI = 15406600568)
                             )
  AND A.tipo_reg = 'T'
  AND C.LIQUIDACION_AUTOMATICA = 'S'
  GROUP BY B.TIPO_EXPED, A.COD_CONCEP_RVA, A.COD_COB
---ORDER BY A.NRO_ORDEN_EXP;


SELECT B.TIPO_EXPED,A.*, B.*
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN (SELECT LIQUIDACION_AUTOMATICA, TIPO_EXPED FROM SIM_EXPED_RVA_AUTOMATICA WHERE COD_CIA = 3
  AND COD_SECC = 66
  AND COD_PRODUCTO = 237 GROUP BY TIPO_EXPED, LIQUIDACION_AUTOMATICA) C ON C.TIPO_EXPED = B.TIPO_EXPED
WHERE A.NUM_SECU_EXPED = 26733502097
  AND A.tipo_reg = 'T'
  AND C.LIQUIDACION_AUTOMATICA = 'S'







SELECT A.DESC_CONCEP_LI
FROM A3000400 A
WHERE A.COD_CIA = 3
  AND A.COD_SECC = 66
  AND A.COD_CONCEP_LIQ = 329
  AND A.COD_CONCEP_RVA = 72
  AND A.COD_RAMO =
      (SELECT MIN(B.COD_RAMO)
       FROM A3000400 B
       WHERE B.COD_CIA = A.COD_CIA
         AND B.COD_SECC = A.COD_SECC
         AND B.COD_CONCEP_LIQ = 329
         AND B.COD_CONCEP_RVA = 72
         AND (B.COD_RAMO = 237 OR B.COD_RAMO = 999)
         AND B.MCA_BAJA IS NULL)
  AND A.MCA_BAJA IS NULL
  AND NVL(COD_PAGO, 'P') =
      DECODE('ECC', 'RSS', 'C', 'RES', 'C', 'WRS', 'C', 'P');


SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 777
                                            AND DE.COD_CAUSA = 17
                                            and DE.COD_CONS = 35

SELECT A.COD_CONCEP_RVA, B.TIPO_EXPED, A.COD_COB, A.VALOR_RVA,
       (A.VALOR_ACTUAL - A.TOTAL_LIQ) VALOR_RESERVA_PENDIENTE
FROM a7001200 A
         INNER JOIN a7001000 B ON B.NUM_SECU_EXPED = A.NUM_SECU_EXPED AND B.NRO_ORDEN_EXP = A.NRO_ORDEN_EXP
         INNER JOIN SIM_EXPED_RVA_AUTOMATICA C ON C.TIPO_EXPED = B.TIPO_EXPED
    AND C.COD_COB = A.COD_COB AND C.COD_CONCEP_RVA = A.COD_CONCEP_RVA
WHERE A.NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                           FROM a7001000
                           WHERE NUM_SECU_SINI = 29034480365
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 29034480365
                                   GROUP BY TIPO_EXPED)
                             AND NVL(MCA_EST_EXP, 'P') = 'P'
                             AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED
                                                   FROM a3001700 WHERE NUM_SINI = 10006600317))
  AND A.tipo_reg = 'T'
  AND C.COD_CIA = 3
  AND C.COD_SECC = 66
  AND C.COD_PRODUCTO = 777
  AND C.LIQUIDACION_AUTOMATICA = 'S'
ORDER BY  A.NRO_ORDEN_EXP;

select *
FROM A1001800
where cod_cia = 3
  --and cod_secc in (66, 999)
  and cod_texto = 300
  and sub_cod_texto in (1)
  and cod_proceso = '3';


UPDATE A1001800 SET MCA_TXT_FIJO = 'N', TXT_RED = 'VALOR PAGO UNICO TOTAL Y DEFINITIVO DEL SINIESTRO.'  WHERE COD_CIA=3 AND COD_SECC=999 AND COD_TEXTO=300 AND SUB_COD_TEXTO=1;

select *
FROM A1001800
where cod_cia = 3
  -- AND COD_TEXTO = 300
  and TXT_RED like '%UNICO%'


select *
FROM A1001800
where cod_cia = 3 and TXT_RED like '%UNICO%';

SELECT * FROM x3001700;


select * from sim_log
where columna like 'liquiAuto%'
order by SECUENCIA desc;



SELECT * FROM A2000030 WHERE NRO_DOCUMTO = 80501297


select * from a7000900 WHERE COD_CIA = 3 AND COD_SECC = 66 AND COD_RAMO = 237
ORDER BY FECHA_CREACION DESC ;





SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'SUB_COD_TEXTO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3;

/*
UPDATE C9999909 SET DAT_OBS = 1, DAT_OBS2 = 1 WHERE  COD_TAB = 'DATOS_FIJOS_LIQ'
                                                AND    COD_CAMPO = 'SUB_COD_TEXTO'
                                                AND    COD_RAMO = 999
                                                AND    COD_SECC = 999
                                                AND    COD_CIA  = 3;
*/

SELECT DAT_OBS
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'COD_TEXTO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3



SELECT *
FROM SIM_EXPED_RVA_AUTOMATICA
WHERE COD_CIA = 3
  AND COD_SECC = 23
  AND COD_PRODUCTO = 103
  AND COD_CAUSA = 102
  AND COD_CONS = 17
  AND COD_COB = 228
  AND TIPO_EXPED = 'GSO'
  AND COD_CONCEP_RVA = 11
  AND ID_TIPO_RESERVA = 889;

select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 66 AND COD_RAMO = 237;

select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 103;


SELECT * FROM SIM_TIPO_RVA_AUTOMATICA;


SELECT DAT_OBS
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_CAMPO = 'SUB_COD_TEXTO'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND    A.COD_CIA  = 3
  AND ROWNUM < 2;


SELECT S.ID_EXPRVAAUT, S.COD_CIA, S.COD_SECC, S.COD_PRODUCTO, S.COD_CAUSA, S.COD_CONS, S.COD_COB,S.ID_TIPO_RESERVA, S.TIPO_EXPED, S.LIQUIDACION_AUTOMATICA, S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=103 AND S.COD_CAUSA=102 AND S.COD_CONS=17 AND S.COD_COB=228;



SELECT A.COD_CIA        AS COD_CIA
     , A.COD_SECC       AS COD_SECC
     , A.NUM_POL1       AS NUM_POL1
     , A.FECHA_VIG_POL  AS FECHA_VIG_POL
     , A.FECHA_VENC_POL AS FECHA_VENC_POL
     , A.COD_RAMO       AS COD_RAMO
     , A.NUM_SECU_POL   AS NUM_SECU_POL
     , A.NRO_DOCUMTO    AS NRO_DOCUMTO
     , A.NUM_END        AS NUM_END
     , A.MCA_ANU_POL    AS MCA_ANU_POL
     , C.NOM_PRODUCTO   AS NOM_PRODUCTO
FROM A2000030 A,
     (SELECT COD_ASEG, NUM_SECU_POL, NUM_END, COD_CIA
      FROM A2001300
      WHERE COD_ASEG = 1014237597
      GROUP BY NUM_SECU_POL, COD_ASEG, NUM_END, COD_CIA) B,
     SIM_PRODUCTOS C
WHERE  A.TDOC_TERCERO = 'CC'
  AND B.NUM_SECU_POL = A.NUM_SECU_POL
  AND B.NUM_END = A.NUM_END
  AND A.COD_CIA = B.COD_CIA
  AND A.COD_CIA = C.COD_CIA
  AND A.COD_SECC = C.COD_SECC
  AND A.COD_RAMO = C.COD_PRODUCTO
  AND A.num_end =
      (select max(W.num_end)
       from a2000030 W
       where W.num_secu_pol = A.num_secu_pol)
  AND nvl(A.mca_provisorio, 'N') = 'N'
  and NVL(A.mca_anu_pol, 'N') != 'S'
  AND nvl(A.mca_caduca, 'N') = 'N'
  AND nvl(A.mca_term_ok, 'N') = 'S'
  AND A.num_pol1 <> 0
  AND nvl(A.fecha_venc_pol, A.fecha_venc_end) >= ADD_MONTHS(SYSDATE, -24)
  AND nvl(A.fecha_venc_pol, A.fecha_venc_end) <= SYSDATE;

select * from A2000030 where NUM_POL1 = 1522101379501;

SELECT ADD_MONTHS(SYSDATE, -24) FROM DUAL;



select *
from SIM_LOG_WEBSERVICES
WHERE FECHA_INICIO > TRUNC(date '2021-11-30')
  and (CODIGOWS = 'REQUETS_SCORE_RIESGO_LOG_ERROR' OR CODIGOWS = 'REQUETS_SCORE_RIESGO_LOG')
  and (tipo_proceso like '%:200%' OR tipo_proceso like '%:230%' OR tipo_proceso like '%:440%'
    OR tipo_proceso like '%:450%' OR tipo_proceso like '%:455%' OR tipo_proceso like '%:460%'
    OR tipo_proceso like '%:470%' OR tipo_proceso like '%:480%' OR tipo_proceso like '%:1%'
    OR tipo_proceso like '%:76%'  OR tipo_proceso like '%:790%' OR tipo_proceso like '%:8%'
    OR tipo_proceso like '%:154%' OR tipo_proceso like '%:910%' OR tipo_proceso like '%:214%'
    OR tipo_proceso like '%:215%' OR tipo_proceso like '%:218%' OR tipo_proceso like '%:219%'
    OR tipo_proceso like '%:220%' OR tipo_proceso like '%:120%' OR tipo_proceso like '%:152%'
    OR tipo_proceso like '%:40%' OR tipo_proceso like  '%:45%');

SELECT DAT_OBS, DAT_OBS2
FROM   C9999909 A
WHERE  A.COD_TAB = 'SERV_SCORE_RIESGO'
  AND    A.CODIGO = 1
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999
  AND ROWNUM < 2;

select * from a2000030 where num_secu_pol = 29755877245

select * from SIM_PRODUCTOS where cod_producto = 130

select * from A2000030 where COD_RAMO = 450;

select *  from C9999909 where COD_TAB = 'SERV_SCORE_RIESGO' and CODIGO = 1;


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
                           WHERE NUM_SECU_SINI = 29034568845
                             AND  (TIPO_EXPED, NRO_ORDEN_EXP) IN
                                  (SELECT TIPO_EXPED, max(NRO_ORDEN_EXP) as max
                                   FROM A7001000
                                   WHERE NUM_SECU_SINI = 29034568845
                                   GROUP BY TIPO_EXPED)
                             AND NVL(MCA_EST_EXP, 'P') = 'P'
                             AND NRO_EXPED NOT IN (SELECT DISTINCT NRO_EXPED FROM a3001700 WHERE NUM_SINI = 28101200469)
)
  AND A.tipo_reg = 'T'
  AND C.LIQUIDACION_AUTOMATICA = 'S'
GROUP BY B.TIPO_EXPED, A.COD_CONCEP_RVA, A.COD_COB order by B.TIPO_EXPED;




SELECT S.ID_EXPRVAAUT, S.COD_CIA, S.COD_SECC, S.COD_PRODUCTO, S.COD_CAUSA, S.COD_CONS, S.COD_COB,S.ID_TIPO_RESERVA, S.TIPO_EXPED, S.LIQUIDACION_AUTOMATICA, S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=136 AND S.COD_CAUSA=50 AND S.COD_CONS=50 AND S.COD_COB=228;

select * from a7000900 where NUM_SINI = 28101200469;

select * from SIM_DELEGACIONES;



SELECT * FROM a3001700 WHERE NUM_SINI = 35511205066



select * from SIM_CARGA_LIQUIDACIONES where cod_ramo = 136;

SELECT * FROM SIM_CARGA_DET_LIQUIDACIONES where cod_ramo = 136 AND SECUENCIA_CAR_LIQ = 549623;

select * from SIM_SISTEMA_ORIGEN;



INSERT INTO SIM_CARGA_DET_LIQUIDACIONES (SECUENCIA_CAR_LIQ, CONSECUTIVO, PROCESO, COD_CIA, COD_SECC, COD_RAMO, COD_COB, COD_CONCEP_RVA, COD_CONCEP_LIQ, IMPORTE_LIQ, MCA_PROCESO, FECHA_PROCESO, MCA_PROCESO_TER, FECHA_PROCESO_TER, USUARIO_CREACION, FECHA_CREACION, USUARIO_MODIFICACION, FECHA_MODIFICACION, SEC_CONTROL)
VALUES (549623, 2, 30, 3, 12, 136, 777, 72, '329', 77900.00, 'N', TO_DATE('2021-12-17 10:29:53', 'YYYY-MM-DD HH24:MI:SS'), null, null, 'CONSULTA_PUMA', TO_DATE('2021-12-17 10:27:43', 'YYYY-MM-DD HH24:MI:SS'), 'CONSULTA_PUMA', TO_DATE('2021-12-17 10:29:53', 'YYYY-MM-DD HH24:MI:SS'), 530428);



SELECT S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=109 AND TIPO_EXPED = 'GSO';


SELECT S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=777 AND TIPO_EXPED IN ('GSO','INC','DBT');

SELECT S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=127 AND TIPO_EXPED IN ('MAA','ERC');

SELECT S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=40 AND TIPO_EXPED IN ('GSO','CCO');


SELECT S.*
FROM SIM_EXPED_RVA_AUTOMATICA S
WHERE S.COD_PRODUCTO=109  and cod_causa = 10;


SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 23
  AND    G.COD_RAMO = 103


select * from A7000025 where  NUM_SECU_SINI = 29034583755;

SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 12
  AND    G.COD_RAMO = 130;


SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'MESES_HISTORICO';

----numero de Asiento tesoreria
SELECT cod_ofic_contab,
       to_char(sysdate, 'ddmmyyyy'),
       num_asiento,
       to_number(to_char(sysdate, 'yyyy'))
FROM a5021700
WHERE cod_cia = 3;

----agencia ususario-----
SELECT *
FROM   C9999909 A
WHERE  A.COD_TAB = 'DATOS_FIJOS_LIQ'
  AND    A.COD_RAMO = 999
  AND    A.COD_SECC = 999;
select * from g1002700 where nom_user like '%20401391%'
                         and cod_cia = 3;




select * from a5021700;


