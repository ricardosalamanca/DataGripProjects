select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where NUM_POL1 in (5010001443301, 5010001443302);


select *
from a2000020
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );

select a.mca_cotizacion,
       a.NUM_POL_COTIZ,
       a.NUM_POL1,
       a.FOR_COBRO,
       a.NUM_SECU_POL,
       a.COD_RAMO,
       a.MCA_ANU_POL,
       a.*
from a2000030 a
where NUM_POL1 in (5010001410602, 5010001586302);

----verificacion ejecucion AJQSAI
SELECT *
FROM SIM_CARGA_CONTROL_PROCESO
WHERE COD_SECC = 3
  AND COD_RAMO = 486
  AND FECHA >= TO_DATE('20/05/2024', 'DD/MM/YYYY');

select a.mca_cotizacion,
       a.NUM_POL_COTIZ,
       a.NUM_POL1,
       a.FOR_COBRO,
       a.NUM_SECU_POL,
       a.COD_RAMO,
       a.MCA_ANU_POL,
       a.MCA_EXCLUSIVO,
       a.*
from a2000030 a
where NUM_POL1 in (5010002045201);

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100017895, 50100020753, 50100011711, 50100021552, 50100011156)
  and cod_secc = 37;

select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN
      (5010001149708, 5010001250704, 5010001401803, 5010001474103, 5010001548503, 5010001603303, 5010001657703,
       5010002001702, 5010002217601, 5010002272301, 5010002397901, 5010002397901, 5010002325402, 5010001544903,
       5010001657703, 5010002267501, 5010002272301, 5010001631403, 5010001780804, 5010001998902, 5010002292202,
       5010002454401, 5010002319001, 5010001652603, 5010001822702, 5010001929202, 5010002079502, 5010002141402,
       5010002550601, 5010002592201, 5010002539501, 5010002546701, 5010002709501, 5010002711401, 5010002393801);



select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
WHERE a.NUM_POL1 IN
      (5010001149708, 5010001250704, 5010001401803, 5010001474103, 5010001548503, 5010001603303, 5010001657703,
       5010002001702, 5010002217601, 5010002272301, 5010002397901, 5010002397901, 5010002325402, 5010001544903,
       5010001657703, 5010002267501, 5010002272301, 5010001631403, 5010001780804, 5010001998902, 5010002292202,
       5010002454401, 5010002319001, 5010001652603, 5010001822702, 5010001929202, 5010002079502, 5010002141402,
       5010002550601, 5010002592201, 5010002539501, 5010002546701, 5010002709501, 5010002711401, 5010002393801);

----endosos de producto por seccion
select *
from a1001800
where COD_SECC = 23;
---nobmre de los productos tronador
select *
from sim_productos
where COD_PRODUCTO in (127, 486);
-------------------------------------------PRODUCTO ARRENDAMIENTO-------------------------------------------------------
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where COD_SECC = 37
  and COD_RAMO = 486


select *
from JURIDICOS
where NUMERO_DOCUMENTO = 830501488;

select *
from JURIDICOS
where NUMERO_DOCUMENTO = 860512840;

---SIM_ULT_EST_SINI ---verdadero estado sinestro
---MCA_EST_SINI -mca_estado_reserva
SELECT *
FROM A7000900
WHERE NUM_SINI = 2023056209;

-----ESTADOS DE CARGUE DE SOLICITUDES DE SIMON A SAI
--ESTADO_CARGUE_SIMON is 'Estado de envio de la información de Simón I. Inserta registro C. Disponible para cargue en SAI. E Elimino en Simon Registro, A Actualizo Simon Registro'
--ESTADO_CARGUE_SAI is 'Estado de proceso de la información en SAI E=ERROR C=CARGADO P=PROCESADO'
SELECT *
FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010002563801);

select *
from SIM_HIST_ESTADOS_SINI
where NUM_SECU_SINI in (50100002585, 50100002604);

select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010002045201);

select *
from SIM_CARGA_VAR_SINIESTROS
WHERE NUM_POL1 IN (5010002045201);

SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN = 1785823;

SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (2403146, 2403147);

SELECT *
FROM A7000100
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_CAUSA = 993;

Select s.num_secu_sini
     , s.num_sini
     , s.fecha_sini
     , s.fec_denu_sini
     , s.cod_ries
     , s.num_secu_pol
     , s.num_end
     , s.cod_cia
     , s.cod_secc
     , s.cod_ramo
     , s.num_pol1
     , s.num_end_coa
     , s.mca_est_sini
     , s.cod_prod
     , s.mca_transit
     , s.nro_orden_sini
     , s.cod_causa_sini
     , s.fec_baja_sini
     , s.nodo_id
     , s.cod_aseg
     , s.tdoc_tercero_aseg
     , s.mca_mas_poliz
     , s.hora_sini
     , s.desc_sini
     , s.sec_tercero_aseg
     , s.suc_tercero_aseg
     , s.mca_rechazo
     , s.mca_term_ok
     , s.Sim_Longitud
     , s.Sim_Latitud
     , s.Sim_Altitud
-- Inicio marca modificacion 2
     , s.sim_ult_est_sini
-- Fin marca modificacion 2
     , s.Sim_Usuario_Creacion
     , s.Sim_fec_formalizac
From A7000900 s
Where s.cod_secc = 37
---  And     s.num_pol1       = nvl(null,s.num_pol1)
  --And     s.fecha_sini     = nvl(to_date(null,'DDMMYYYY'),s.fecha_sini)
  And s.num_sini = nvl(50100002604, s.num_sini)
  And s.nro_orden_sini = (select max(s1.nro_orden_sini)
                          from A7000900 s1
                          Where s1.num_secu_sini = s.num_secu_sini);

select *
from A7000900
where num_sini = 50100002604;

select *
from A7000900
where num_sini in (50100002585, 50100002604);

select *
from A7000025
where NUM_SECU_SINI = 27302286240;



select CASE
           WHEN TO_CHAR(FEC_PROC_SINI, 'YYYY-MM-DD') = 'NULL' THEN NULL
           ELSE TO_DATE(TO_CHAR(FEC_PROC_SINI, 'YYYY-MM-DD'), 'YYYY-MM-DD') END
from dual;


SELECT *
FROM C7999925;

SELECT *
FROM SIM_CARGA_EXPEDIENTES
WHERE SECUENCIA IN (1785823);

SELECT *
FROM SIM_CARGA_EXPEDIENTES
WHERE NUM_SINI IN (50100002585, 50100002604);



SELECT *
FROM SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (1785823);

SELECT *
FROM SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN
      (SELECT SECUENCIA FROM SIM_CARGA_EXPEDIENTES WHERE SECUENCIA_CAR_SINI IN (1527996, 1533812, 1531343));



SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE SECUENCIA IN (2370259, 2370260);

SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE NUM_SINI IN (50100002585, 50100002604);



SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (2370259, 2370260);

SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (SELECT SECUENCIA FROM SIM_CARGA_LIQUIDACIONES WHERE NUM_SINI IN (50100002585, 50100002604));



select *
from A7000900
where num_sini = 50100002642;


---expediente
select *
from A7001000
where NUM_SINI = 50100002886;
---RESERVAS
select *
from A7001200
where NUM_SECU_SINI = 50100002886;
---LIQUIDACIONES
SELECT *
FROM A3001700
where NUM_SINI = 50100002886;
---DETALLE LIQUIDACIONES
SELECT *
FROM A3001800
where NUM_LIQ in (SELECT NUM_LIQ FROM A3001700 where NUM_SINI = 50100002886);

SELECT DISTINCT 'N', -- Modificado Carlos M 16-11-2012

                z.mca_val_sini,
                z.suma_aseg,
                z.val_asegurable,
                NULL,
                z.porc_ppago,
                21420000,
                0,
                21420000 - 0,
                NULL,
                z.nomina,
                27302286240,
                x.cod_agravante,
                x.cod_rebaja,
                NULL,
                z.tipo_franq,
                z.fec_vig_franq
FROM a7000100 x,
     a7000100 y,
     a7001210 z
WHERE x.cod_cia = 3
  AND x.cod_secc = '999'
  AND x.tipo_exped = 'ARR'
  AND x.cod_causa IN (993, '98')
  AND y.cod_cia = 3
  AND y.cod_secc = 37
  AND y.tipo_exped IS NULL
  AND y.cod_causa IN (993, '98')
  --AND z.num_secu_sini = 27302286240
  AND x.cod_cob = z.cod_cob
  AND x.cod_cob = y.cod_cob
  AND x.cod_concep_rva = 60
  AND z.cod_cob = 716;

SELECT *
FROM A7000100
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_CAUSA = 993;

SELECT *
FROM A7000100
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_CAUSA = 993;

------CAUSA-COBERTURA-EXPEDIENTE
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE cod_secc = 999
  AND TIPO_EXPED = 'SEP';

----CAUSA-CONSECUENCIA-COBERTURA
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE cod_secc = 37
  AND COD_CONS = 46;

-----validar que la cobertura exista para ese siniestro COBERTURA-SINIESTRO
SELECT *
FROM a7001210
WHERE NUM_SECU_SINI = 27302286240;


select *
from A7000025
where NUM_SECU_SINI = 27302286240;

SELECT valor_campo
FROM a7000025 d
WHERE d.cod_campo IN ('COD_CONS1', 'COD_CONS2', 'COD_CONS3', 'COD_CONS4')
  AND d.num_secu_sini = 27302286240
  AND valor_campo IS NOT NULL;

SELECT *
FROM a7000100
WHERE cod_secc = 37
  AND cod_causa = 993
  AND cod_cons = 45
  AND cod_cob = 716
  AND cod_cob IN (SELECT cod_cob FROM a2000040 WHERE num_secu_pol = 29799356538)
  AND rownum = 1;

SELECT *
FROM a2000040
WHERE num_secu_pol = 29799356538;

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) = 50100018984
  and cod_secc = 37;
----todo lo que se hace en tronador hacia SAI VA QUEDANDO EN ESTA TABLA
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) = 50100018984;
---CRUZE DE POLIZAS SIMON CON COBERTURAS SIMON
SELECT P.SECUENCIA
     , P.POLIZA_SIMON
     , P.NUM_SECU_POL
     , P.SOLICITUD
     , P.NUM_END
     , P.TIPO_MOVIMIENTO
     , C.CODIGO_COBERTURA
     , C.VALOR_ASEGURADO
     , C.VALOR_PRIMA
     , C.TASA
     , P.FECHA_MOVIMIENTO
     , P.FECHA_CREACION
     , P.FECHA_VIG_END
     , P.FECHA_VENC_END
FROM POLIZAS_SIMON P
         INNER JOIN COBERTURAS_SIMON C ON (C.SECUENCIA = P.SECUENCIA)
WHERE substr(P.poliza_simon, 0, 11) = 50100020753
ORDER BY P.SECUENCIA, P.NUM_END, C.SECUENCIA_COBERTURA ASC;

select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010001898402);

SELECT *
FROM A2000030
WHERE NUM_POL1 IN (5010001336003, 5010001336002);

SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE NUM_SINI IN (50100002642);

SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (SELECT SECUENCIA FROM SIM_CARGA_LIQUIDACIONES WHERE NUM_SINI IN (50100002642));

SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (select SECUENCIA
                           from SIM_CARGA_SINIESTROS
                           WHERE NUM_POL1 IN (5010001898402));

SELECT *
FROM A7001200
WHERE NUM_SECU_SINI IN (select NUM_SECU_SINI from A7000900 where num_sini = 50100002642);

---si el siniestro se encuentra en control técnico es por el campo MCA_TRANSIT,
--y la razón del control técnico del siniestro la encuentra en A2000220 con num_secu_pol igual a num_secu_sini
---siniestro ve si esta en MCA_TRANSIT en S tiene control tecnico
select *
from A7000900
where num_sini = 50100002642;
-----tabla mirar controles tecnicos de siniestros---- COD_RECHAZO 1 es observado, 3 a autorizar.
select *
from A2000220
where NUM_SECU_POL in (27308703910);
select *
from A2000220
WHERE COD_ERROR IN (702, 706, 714, 721, 728);
-----codigos de error controles tecnicos---------
select *
from G2000210
where COD_ERROR IN (702, 706, 714, 721, 728)
  and COD_CIA = 3;

-- SINIESTROS
SELECT *
FROM A7000900 S;
-- EXPEDIENTES
SELECT *
FROM A7001000 E;
---COD_RECHAZO 1 es observado, 3 a autorizar.
SELECT *
FROM A7000900 A
WHERE A.NUM_SINI = 50100001868;
-- tabla de controles técnicos
select *
from a2000220 A
WHERE A.NUM_SECU_POL = 29771129966;
-- CODIGOS DE CONTROLES TECNICOS
SELECT *
FROM g2000210
where COD_CIA = 3
  AND COD_ERROR IN (705, 706, 721, 728, 302);
-- LOG DE AUTORIZACION CONTROLES TECNICOS
select *
from C2990540;


SELECT MAX(P.NUM_POL1)
FROM A2000030 P,
     A2000030 P1
WHERE (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND P.COD_CIA = P1.COD_CIA
  AND P.COD_SECC = P1.COD_SECC
  AND P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P1.NUM_POL1 = 5010001544903
  AND NVL(P.MCA_ANU_POL, 'N') = 'N'
  AND P.FECHA_VIG_END <= to_date('01-NOV-24', 'YYYY-MM-DD')
  AND P.FECHA_VENC_END >= to_date('01-NOV-24', 'YYYY-MM-DD');


SELECT *
FROM SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (select SECUENCIA
                             from SIM_CARGA_EXPEDIENTES
                             where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                          from SIM_CARGA_SINIESTROS
                                                          WHERE NUM_POL1 IN
                                                                (5010001930902, 5010002001402, 5010001544903,
                                                                 5010001898402, 5010001999201, 5010001619302)));


select *
from sim_procesos
where ID_PROCESO in (70, 78, 771, 772);

---PROMPT TABLA 5010001544903
SELECT P.NUM_POL1
FROM A2000030 P,
     A2000030 P1
WHERE (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND P.COD_CIA = P1.COD_CIA
  AND P.COD_SECC = P1.COD_SECC
  AND P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P1.NUM_POL1 = 5010001544903
  AND NVL(P.MCA_ANU_POL, 'N') = 'N'
  AND P.FECHA_VIG_END <= TO_DATE('2024-11-01', 'YYYY-MM-DD')
  AND P.FECHA_VENC_END >= TO_DATE('2024-11-01', 'YYYY-MM-DD');

select *
from a2000030
where num_pol1 in (5010001544902, 5010001930901, 5010002001401);

select *
from a2000020
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );

select *
from a2000040
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );

PROMPT TABLA 5010001544903
SELECT max(P.NUM_POL1)
FROM A2000030 P,
     A2000030 P1
WHERE (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND P.COD_CIA = P1.COD_CIA
  AND P.COD_SECC = P1.COD_SECC
  AND P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P1.NUM_POL1 = 5010001544903
  AND NVL(P.MCA_ANU_POL, 'N') = 'N'
  AND P.FECHA_VIG_END <= TO_DATE('2024-11-01', 'YYYY-MM-DD')
  AND P.FECHA_VENC_END >= TO_DATE('2024-11-01', 'YYYY-MM-DD');

PROMPT TABLA 5010001930902
SELECT P.NUM_POL1
FROM A2000030 P,
     A2000030 P1
WHERE (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND P.COD_CIA = P1.COD_CIA
  AND P.COD_SECC = P1.COD_SECC
  AND P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P1.NUM_POL1 = 5010001930902
  AND NVL(P.MCA_ANU_POL, 'N') = 'N'
  AND P.FECHA_VIG_END <= TO_DATE('2024-09-28', 'YYYY-MM-DD')
  AND P.FECHA_VENC_END >= TO_DATE('2024-09-28', 'YYYY-MM-DD');

---- PKG_INDEMNIZACION -> FUN_POLIZA_VIG_LIBERTADOR
--PROMPT TABLA 5010002001402
SELECT max(P.NUM_POL1)
FROM A2000030 P,
     A2000030 P1
WHERE (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND P.COD_CIA = P1.COD_CIA
  AND P.COD_SECC = P1.COD_SECC
  AND P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P1.NUM_POL1 = 5010002001402
  AND NVL(P.MCA_ANU_POL, 'N') = 'N'
  AND P.FECHA_VIG_END <= TO_DATE('2024-11-01', 'YYYY-MM-DD')
  AND P.FECHA_VENC_END >= TO_DATE('2024-11-01', 'YYYY-MM-DD');

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100022265)
  and cod_secc = 37;

SELECT *
FROM SIM_CARGA_SINIESTROS
WHERE SUBSTR(NUM_POL1, 0, 11) IN (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193);

SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (SELECT secuencia
                           FROM SIM_CARGA_SINIESTROS
                           WHERE SUBSTR(NUM_POL1, 0, 11) IN
                                 (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193));


SELECT NVL(SISTEMA_ORIGEN, 0), 0
FROM C1990003 select *
from C7990801
where SUBSTR(NUM_POL1, 0, 11) IN (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193);


SELECT SS.COD_CIA,
       SS.COD_RAMO,
       SS.COD_SECC,
       SS.COD_RIES,
       SS.NDOC_TERCERO_ASEG,
       SS.COD_CAUSA_SINI,
       SS.DESC_SINI,
       SS.ENT_COLOCADORA,
       SS.FECHA_DENU_SINI,
       SS.FECHA_SINI,
       SS.HORA_SINI,
       SS.NDOC_TERCERO_TOM,
       SS.PROCESO,
       SS.FECHA_FORMALIZAC,
       SS.SISTEMA_ORIGEN,
       SS.COD_USER,
       SS.TDOC_TERCERO_ASEG,
       SS.TDOC_TERCERO_TOM,
       SS.TIPO_DEC,
       SS.SECUENCIA,
       SS.NUM_POL1,
       SS.POL_PRINCIPAL,
       SS.SIM_USUARIO
FROM SIM_CARGA_SINIESTROS SS
WHERE SS.PROCESO = 70
  AND SS.COD_CIA = 3
  AND SS.COD_SECC = 37
  AND SS.COD_RAMO = 486
-- Inicio marca modificacion 9
  AND SS.MCA_PROCESO = 'P'
--AND    SS.SEC_CONTROL = Ip_sec_proceso
-- Fin marca modificacion 9
-- Inicio marca modificacion 6
---AND    SS.SECUENCIA = NVL(Ip_Proceso.p_subproceso, SS.SECUENCIA)
-- Fin marca modificacion 6
ORDER BY SS.SECUENCIA;

update SIM_CARGA_SINIESTROS
set MCA_PROCESO   = null,
    FECHA_PROCESO = null
where secuencia in (97588, 97589, 97590);


select *
from A7000900
where NUM_POL1 in (5010001544902, 5010001930901, 5010002001401);


---Prompt Tabla SIM_CARGA_SINIESTROS
select *
from SIM_CARGA_SINIESTROS
WHERE substr(num_pol1, 0, 11) in (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193);

---Prompt Tabla SIM_CARGA_VAR_SINIESTROS
select *
from SIM_CARGA_VAR_SINIESTROS
WHERE substr(num_pol1, 0, 11) in (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193);

---Prompt Tabla SIM_CARGA_EXPEDIENTES
select *
from SIM_CARGA_EXPEDIENTES
where SECUENCIA_CAR_SINI in (select SECUENCIA
                             from SIM_CARGA_SINIESTROS
                             WHERE substr(num_pol1, 0, 11) in
                                   (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193));

--Prompt  SIM_CARGA_RESERVAS
SELECT *
FROM SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (select SECUENCIA
                             from SIM_CARGA_EXPEDIENTES
                             where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                          from SIM_CARGA_SINIESTROS
                                                          WHERE substr(num_pol1, 0, 11) in
                                                                (50100019309, 50100020014, 50100015449, 50100018984,
                                                                 50100019992, 50100016193)));

--Prompt Tabla SIM_CARGA_LIQUIDACIONES
select *
from SIM_CARGA_LIQUIDACIONES
where SECUENCIA_CAR_SINI in (select SECUENCIA
                             from SIM_CARGA_SINIESTROS
                             WHERE substr(num_pol1, 0, 11) in
                                   (50100019309, 50100020014, 50100015449, 50100018984, 50100019992, 50100016193));

----SIM_CARGA_DET_LIQUIDACIONES
SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (select secuencia
                            from SIM_CARGA_LIQUIDACIONES
                            where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                         from SIM_CARGA_SINIESTROS
                                                         WHERE substr(num_pol1, 0, 11) in
                                                               (50100019309, 50100020014, 50100015449, 50100018984,
                                                                50100019992, 50100016193)));

SELECT *
FROM x7000025 d
WHERE d.cod_campo IN ('COD_CONS1', 'COD_CONS2', 'COD_CONS3', 'COD_CONS4')
  AND d.num_secu_sini = 27036050459
  AND valor_campo IS NOT NULL;

SELECT valor_campo, d.*
FROM a7000025 d
WHERE d.cod_campo IN ('COD_CONS1', 'COD_CONS2', 'COD_CONS3', 'COD_CONS4')
  AND d.num_secu_sini = 26951152940
  --and valor_campo = 45
  AND valor_campo IS NOT NULL;

SELECT *
FROM a7000100
WHERE cod_secc = 37
  AND cod_causa = 993
  AND cod_cons = 45
  AND cod_cob = 716
  AND cod_cob IN (SELECT cod_cob FROM a2000040 WHERE num_secu_pol = 29797276950)
  AND rownum = 1;

select *
from SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (select SECUENCIA
                             from SIM_CARGA_EXPEDIENTES
                             where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                          from SIM_CARGA_SINIESTROS
                                                          WHERE NUM_POL1 IN
                                                                (5010001789502, 5010002075302, 5010001171103,
                                                                 5010002155201, 5010001115604)));

SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (SELECT SECUENCIA
                            from SIM_CARGA_LIQUIDACIONES
                            where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                         from SIM_CARGA_SINIESTROS
                                                         WHERE NUM_POL1 IN (5010001789502, 5010002075302, 5010001171102,
                                                                            5010002155202, 5010001115604)));

select *
from CREGLAS
where cdreg = '237PVV005';

SELECT C09.*
FROM C9999910 C10,
     C9999909 C09
WHERE C09.COD_TAB = 'DATO_VAR_X_COBERTURA';

SELECT *
FROM SIM_SUMAS_ASEGURADAS SAS,
     SIM_RANGOS_LIMITES RLI
WHERE SAS.ID_LIMITE = RLI.ID_LIMITE
  AND SAS.COD_CIA = 3
  AND SAS.COD_SECC = 37
  AND SAS.COD_RAMO = 486
  --AND SAS.CIUDAD = inCiudad
  AND SAS.TIPO_POLIZA = 'I'
  AND SAS.COD_COB = 716
  --AND SAS.TIPO_INMUEBLE = inDestinoInmueble
  --AND inValorCobertura BETWEEN RLI.VALOR_ASEGURADO_MINIMO AND
  -- RLI.VALOR_ASEGURADO_MAXIMO
  AND RLI.FECHA_BAJA IS NULL
  AND SAS.FECHA_BAJA IS NULL;


SELECT *
FROM SIM_CAUSAS_PROD
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_PRODUCTO = 486;
SELECT *
FROM SIM_CONSEC_PROD
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_PRODUCTO = 486;
select *
from A1002100
where cod_cia = 3
  and cod_ramo = 486;

select *
from a7000100
where cod_cia = 3
  and cod_secc = 37
  and cod_cob = 718;
select *
from a7001210;

select *
from a7001210
where num_secu_sini = 50100002886;

select *
from a2000040
where num_secu_pol = 29797276950;

select *
from a2000030
where num_secu_pol = 29797276950;

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100013360)
  and cod_secc = 37;

select *
from a2000040
where num_secu_pol in (select distinct num_secu_pol
                       from a2000030 t
                       where substr(t.num_pol1, 0, 11) in (50100013360)
                         and cod_secc = 37)
order by NUM_END;

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100002117)
  and cod_secc = 37;

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100022942)
  and cod_secc = 37;

select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100022942);

SELECT *
FROM COBERTURAS_SIMON
WHERE SECUENCIA = 86304
  AND VALOR_ASEGURADO > 0
ORDER BY CODIGO_COBERTURA;


---si el siniestro se encuentra en control técnico es por el campo MCA_TRANSIT,
--y la razón del control técnico del siniestro la encuentra en A2000220 con num_secu_pol igual a num_secu_sini
---siniestro ve si esta en MCA_TRANSIT en S tiene control tecnico
select *
from A7000900
where MCA_TRANSIT = 'S'
  AND NUM_SECU_POL IN (39745392557);
--AND FECHA_EQUIPO > SYSDATE - 120;
-----tabla mirar controles tecnicos de siniestros---- COD_RECHAZO 1 es observado, 3 a autorizar.
select *
from A2000220
where NUM_SECU_POL in (39745392557);---FECHA_EQUIPO > SYSDATE - 30 GROUP BY NUM_SECU_POL; ---NUM_SECU_POL in (39745392557);
select *
from A2000220
WHERE COD_ERROR IN (702, 706, 714, 721, 728);
-----codigos de error controles tecnicos---------
select *
from G2000210
where COD_ERROR IN (702, 706, 714, 721, 728)
  and COD_CIA = 3;


---Prompt Tabla SIM_CARGA_LIQUIDACIONES
SELECT L.*
FROM SIM_CARGA_LIQUIDACIONES L
WHERE L.COD_CIA = 3
  AND L.COD_SECC = 37
  AND L.COD_RAMO = 486
  AND L.FECHA_PAGO >= TO_DATE('01/01/2025', 'DD/MM/YYYY')
  AND (MCA_PROCESO <> 'S' OR MCA_PROCESO IS NULL);

---Prompt Tabla SIM_CARGA_DET_LIQUIDACIONES
select D.*
FROM SIM_CARGA_DET_LIQUIDACIONES D
WHERE D.SECUENCIA_CAR_LIQ IN (SELECT L.SECUENCIA
                              FROM SIM_CARGA_LIQUIDACIONES L
                              WHERE L.COD_CIA = 3
                                AND L.COD_SECC = 37
                                AND L.COD_RAMO = 486
                                AND L.FECHA_PAGO >= TO_DATE('01/01/2025', 'DD/MM/YYYY')
                                AND (MCA_PROCESO <> 'S' OR MCA_PROCESO IS NULL))
  AND (MCA_PROCESO <> 'S' OR MCA_PROCESO IS NULL);


---si el siniestro se encuentra en control técnico es por el campo MCA_TRANSIT,
--y la razón del control técnico del siniestro la encuentra en A2000220 con num_secu_pol igual a num_secu_sini
---siniestro ve si esta en MCA_TRANSIT en S tiene control tecnico
select A.NUM_SECU_SINI, A.*
from A7000900 A
where A.NUM_SINI IN (10040105843);
--AND FECHA_EQUIPO > SYSDATE - 120;
-----tabla mirar controles tecnicos de siniestros---- COD_RECHAZO 1 es observado, 3 a autorizar.
select *
from A2000220
where NUM_SECU_POL in (select A.NUM_SECU_SINI from A7000900 A where A.NUM_SINI IN (10040105843));---FECHA_EQUIPO > SYSDATE - 30 GROUP BY NUM_SECU_POL; ---NUM_SECU_POL in (39745392557);
select *
from A2000220
WHERE COD_ERROR IN (702, 706, 714, 721, 728);
-----codigos de error controles tecnicos---------
select *
from G2000210
where COD_ERROR IN (702, 706, 714, 721, 728)
  and COD_CIA = 3;

select A.NUM_SECU_SINI, A.*
from A7000900 A
where A.NUM_SINI IN (50100002989);

select A.NUM_SECU_SINI, A.*
from A7000900 A
where A.NUM_POL1 IN (5010002376101);
select *
from a7001000
WHERE NUM_SECU_SINI = 27380020890;
select *
from a7001000
WHERE NUM_SINI = 50100003024;
--
select *
from A2000220
where COD_RECHAZO = 3;

select A.NUM_SECU_SINI, A.*
from A7000900 A
where A.NUM_SECU_SINI IN (select A.NUM_SECU_POL from A2000220 where COD_RECHAZO = 3);

select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100003153)
  and cod_secc = 37;

select *
from a2000020
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );



----TIPOS DE MOVIMIENTO INTERFACE TRONADOR SAI
--TIPO_MOVIMIENTO = 1-- NUEVO NEGOCIO
--TIPO_MOVIMIENTO = 2-- MODIFICACION
--TIPO_MOVIMIENTO = 3-- RENOVACION
--TIPO_MOVIMIENTO = 4-- CANCELACION
--TIPO_MOVIMIENTO = 5-- REHABILITACION
-----ESTADOS DE CARGUE DE SOLICITUDES DE SIMON A SAI
--ESTADO_CARGUE_SIMON is 'Estado de envio de la información de Simón I. Inserta registro C. Disponible para cargue en SAI. E Elimino en Simon Registro, A Actualizo Simon Registro'
--ESTADO_CARGUE_SAI is 'Estado de proceso de la información en SAI E=ERROR C=CARGADO P=PROCESADO T=TERMINADO'
SELECT *
FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010002563801);

SELECT *
FROM COBERTURAS_SIMON
WHERE NUM_SECU_POL = 29820697177;

SELECT *
FROM POLIZAS_SIMON
where ESTADO_CARGUE_SAI is null;

SELECT TIPO_IDENTIFICACION,
       NUMERO_IDENTIFICACION
FROM TERCEROS_SIMON
WHERE SECUENCIA = 79543
  AND TIPO_TERCERO = '1';

SELECT *
FROM TERCEROS_SIMON
WHERE NUM_SECU_POL = 29820697177
ORDER BY FECHA_CREACION DESC;


SELECT TIPO_IDENTIFICACION,
       NUMERO_IDENTIFICACION
FROM TERCEROS_SIMON
WHERE SECUENCIA = 79543
  AND TIPO_TERCERO = '2'
  AND TIPO_DEUDOR = 'I';

-----BUSQUEDA DE PROGRAMAS RENOVADORES
Select *
from g9001000
where desc_prog like '%RENOVA%486%';
Select *
from g9000900
where cod_job = 'AJQLIBER.INP';

Select *
from g9000900
where COD_PROG LIKE '%CB502288%';
Select *
from g9001000
where COD_PROG like '%CB502288%';



select *
from SIM_CARGA_EXPEDIENTES
where TIPO_EXPED = 'ARR';

select *
from a7001000
WHERE TIPO_EXPED = 'ARR'; ---and NUM_SECU_SINI = 27380020890;


select *
from POLIZAS_SIMON
where POLIZA_SIMON = 5010001692705;

select *
from POLIZAS_SIMON
where POLIZA_SIMON = 5010001692705
  and secuencia = 86855;

------CAUSA-COBERTURA-EXPEDIENTE
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE cod_secc = 999
  AND TIPO_EXPED = 'SEP'
  AND cod_causa = 993;

SELECT *
FROM A7001000
WHERE TIPO_EXPED = 'SEP';

----CAUSA-CONSECUENCIA-COBERTURA
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE COD_CIA = 3
  AND cod_secc = 37
  AND cod_causa = 993;

SELECT DISTINCT
    -- p_numsecuexped,    -- NUM_SECU_EXPED que se generaría
    '0'  as nro_orden_rva,
    -- p_tiporeg,         -- Tipo de registro (viene del proceso)
    3    as p_codciacoa,    -- Código de coaseguro (viene del proceso)
    719  as p_cod_cob,      -- Cobertura
    NULL as cod_coa,
    60   as p_codconceprva, -- Concepto de reserva
    NULL as num_secu_rva,
    -- p_codmon,          -- Moneda (viene del proceso)
    -- p_valorrva,        -- Valor reserva (viene de SIM_CARGA_RESERVAS)
    -- p_valorfranq,      -- Valor franquicia (viene de SIM_CARGA_RESERVAS)
    x.cod_ind,
    x.cod_agravante,
    x.cod_rebaja,
    z.mca_val_sini,
    z.suma_aseg,
    z.val_asegurable,
    z.porc_ppago,
    z.nomina,
    z.tipo_franq,
    z.fec_vig_franq
FROM a7000100 x, -- Parametrización GENÉRICA (cod_secc=999)
     a7000100 y, -- Parametrización ESPECÍFICA (cod_secc=37)
     a7001210 z  -- Coberturas del siniestro
WHERE x.cod_cia = 3         -- p_codcia
  AND x.cod_secc = '999'    -- Parametrización GENÉRICA
  AND x.tipo_exped = 'SEP'  -- p_tipoexped
  AND x.cod_causa IN (993)  -- p_codcausa o comodín '98'
  AND y.cod_cia = 3         -- p_codcia
  AND y.cod_secc = 37       -- p_codsecc (parametrización ESPECÍFICA)
  AND y.tipo_exped IS NULL  -- IMPORTANTE: debe ser NULL en tabla Y
  AND y.cod_causa IN (993)  -- p_codcausa o comodín '98'
  -- La validación de COD_CONS está comentada en el código
  ---AND z.num_secu_sini = 50100003069  -- ⚠️ Reemplazar con NUM_SECU_SINI real
  AND x.cod_cob = z.cod_cob
  AND x.cod_cob = y.cod_cob
  AND x.cod_concep_rva = 60 -- p_codconceprva
  AND z.cod_cob = 718; -- p_cod_cob

SELECT *
FROM a7001210
WHERE NUM_SECU_SINI = 50100003069;

SELECT *
FROM a7000100
WHERE cod_secc = 37
  AND cod_causa = 993
  AND cod_cob = 718
  AND cod_cob IN (SELECT cod_cob FROM a2000040 WHERE num_secu_pol = 29804576129);

SELECT cod_cob
FROM a2000040
WHERE num_secu_pol = 29804576129;

SELECT *
FROM a2000040
WHERE num_secu_pol = 29804576129;

----TABLA DE PARAMETRIZACION DE COBERTURAS A NIVEL DE RAMO Y SU NOMBRE RESPECTIVO
select *
from a1002100
where cod_ramo = 486;

-----tabla donde se puede encontrar los TIPO_END de la A2000030
SELECT *
FROM SIM_CODIGOS_ENDOSO_SECCION;

---------------------------------------------
select *
from SIM_CARGA_SINIESTROS;


SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (select SECUENCIA
                           from SIM_CARGA_EXPEDIENTES
                           where SECUENCIA_CAR_SINI in (select SECUENCIA
                                                        from SIM_CARGA_SINIESTROS
                                                        WHERE NUM_POL1 IN (5010002485901)));


select A.NUM_SECU_SINI, A.*
from A7000900 A
where A.NUM_POL1 IN (5010002485901);
SELECT *
FROM A7001210
where NUM_SECU_SINI IN (27036235819);
select A.NUM_SECU_SINI, A.*
from a7001000 A
where A.NUM_SECU_SINI IN (27036235819);
select *
from A7001200
where NUM_SECU_SINI IN (27036235819);


select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010002485901);

SELECT *
FROM SIM_CARGA_VAR_SINIESTROS
WHERE NUM_POL1 IN (5010002485901);

select *
from SIM_CARGA_EXPEDIENTES
where SECUENCIA_CAR_SINI in (1554092);

select *
from SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (1831084);

select *
from SIM_CARGA_LIQUIDACIONES
where NUM_POL1 IN (5010002485901);

SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (SELECT SECUENCIA
                            from SIM_CARGA_LIQUIDACIONES
                            where NUM_POL1 IN (5010002485901));

select *
from a2000030
where num_pol1 = 5010002485901;



SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (2806501);



SELECT *
FROM G1002700
WHERE COD_USER_CIA = 'PDDASI03'
  AND COD_CIA = 3;

select *
from usuario
where codigo_usuario = 'PDDASI03';

select COUNT(*)
from SIM_CARGA_SINIESTROS
where MCA_PROCESO = 'P'
  AND FECHA_PROCESO_TER = TO_DATE('23/10/2025', 'DD/MM/YYYY');

select *
from SIM_CARGA_SINIESTROS
where MCA_PROCESO = 'P'
  AND FECHA_PROCESO_TER = TO_DATE('23/10/2025', 'DD/MM/YYYY');



select *
from SIM_CARGA_DET_LIQUIDACIONES;

select *
from OPS$PUMA.SIM_CARGA_EXPEDIENTES
where SECUENCIA_CAR_SINI = 1558745;


SELECT LAST_DAY(TO_DATE('01/08/2025', 'DD/MM/YYYY')) + 1
FROM DUAL;


select *
from a2000030
where substr(num_pol1, 0, 11) = 50100013360;

SELECT SECUENCIA_CAR_EXPE,
       TIPO_EXPED,
       COUNT(*)                                                       AS CANTIDAD_REGISTROS,
       LISTAGG(COD_COB, ', ') WITHIN GROUP (ORDER BY COD_COB)         AS COBERTURAS,
       LISTAGG(CONSECUTIVO, ', ') WITHIN GROUP (ORDER BY CONSECUTIVO) AS CONSECUTIVOS,
       MIN(FECHA_CREACION)                                            AS PRIMERA_CREACION,
       MAX(FECHA_MODIFICACION)                                        AS ULTIMA_MODIFICACION
FROM SIM_CARGA_RESERVAS
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_RAMO = 486
  AND PROCESO = 70
GROUP BY SECUENCIA_CAR_EXPE,
         TIPO_EXPED
HAVING COUNT(*) > 1
ORDER BY SECUENCIA_CAR_EXPE,
         TIPO_EXPED;

select *
from SIM_CARGA_EXPEDIENTES
where SECUENCIA = '1831141';

select *
from SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (1831141);

select *
from a2000030
where NUM_POL1 in (5010001938801, 5010001973101, 5010002205801, 5010002236701, 5010002778401, 5010002795301);

select *
from SIM_CARGA_SINIESTROS_HI;

select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010001938802, 5010001973102, 5010002205802, 5010002236702, 5010002778401, 5010002795301);

SELECT *
FROM SIM_CARGA_VAR_SINIESTROS
WHERE substr(num_pol1, 0, 11) in (50100019388, 50100019731, 50100022058, 50100022367, 50100027784, 50100027953);

select *
from SIM_CARGA_EXPEDIENTES
where SECUENCIA_CAR_SINI in (select secuencia
                             from SIM_CARGA_SINIESTROS
                             WHERE NUM_POL1 IN
                                   (50100019388, 50100019731, 50100022058, 50100022367, 50100027784, 50100027953));

select *
from SIM_CARGA_EXPEDIENTES
where SECUENCIA in (1847987, 1847988, 1847993, 1847998, 1848003, 1848005);

select *
from SIM_CARGA_RESERVAS
WHERE SECUENCIA_CAR_EXPE IN (1836763);

select *
from SIM_CARGA_LIQUIDACIONES
where NUM_POL1 IN (5010001938802, 5010001973102, 5010002205802, 5010002236702, 5010002778401, 5010002795301);


SELECT *
FROM SIM_CARGA_DET_LIQUIDACIONES
WHERE SECUENCIA_CAR_LIQ IN (SELECT SECUENCIA
                            from SIM_CARGA_LIQUIDACIONES
                            where NUM_POL1 IN
                                  (5010001938802, 5010001973102, 5010002205802, 5010002236702, 5010002778401,
                                   5010002795301));


SELECT NUM_LIQUIDACION,
       NUM_SINI,
       TIPO_EXPED,
       NRO_EXPED,
       GENERA_ORDEN_PAGO,
       TOTAL_LIQUIDACION,
       NUM_ORDEN_PAGO,
       MCA_PROCESO,
       FECHA_PROCESO
FROM SIM_CARGA_LIQUIDACIONES
WHERE NUM_SINI = 2025046956
ORDER BY FECHA_PROCESO;

select A.FECHA_CREACION, A.NUM_SECU_SINI, A.*
from A7000900 A
where cod_secc = 37
  and COD_RAMO = 486
  and cod_cia = 3
  and FECHA_CREACION > TO_DATE('23-05-2025');

SELECT *
FROM a7001210
WHERE NUM_SECU_SINI IN
      (27036235819);

select *
from CREGLAS
where cdreg = '799STV002';
---- Parametrizacion de reglas de control tecnico tranversales para sinestros
select *
from G2000200
where CDREG = '799STV002';

SELECT *
FROM A2000030
WHERE COD_SECC = 37
  AND COD_CIA = 1;

SELECT *
FROM SIM_CARGA_SINIESTROS
WHERE MCA_PROCESO IN ('P', 'E')
  AND FECHA_CREACION > TO_DATE('2025-11-16', 'YYYY-MM-DD');

select *
FROM SIM_CARGA_SINIESTROS;

SELECT *
FROM SIM_CARGA_EXPEDIENTES
WHERE MCA_PROCESO IN ('P', 'E')
  AND FECHA_CREACION > TO_DATE('2025-11-16', 'YYYY-MM-DD');

SELECT *
FROM SIM_CARGA_RESERVAS
WHERE MCA_PROCESO IN ('P', 'E')
  AND FECHA_CREACION > TO_DATE('2025-11-16', 'YYYY-MM-DD');


SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE SECUENCIA_CAR_EXPE IN (1852906, 1852907, 1852908, 1852909, 1852910, 1852911, 1852912, 1852913, 1852914, 1852915);


SELECT *
FROM SIM_CARGA_LIQUIDACIONES
WHERE SECUENCIA_CAR_SINI IN (1563455, 1563457, 1563459, 1563461, 1563463, 1563465, 1563467, 1563469, 1563471, 1563473);


select *
from c9999909 c
where c.cod_tab = 'VALRENOVA_RAMOPARTIC';

select *
from c9999909 c
where c.cod_tab = 'RENOVADIA25';

SELECT *
FROM CREGLAS
WHERE CDREG IN ('220PVV115', '220PVV289', '220PVV423');

SELECT *
FROM CREGLAS
WHERE CDREG IN ('220PVV115');


SELECT 1 + (TC1 / 100) TC1
FROM A1000501
WHERE COD_MON = 8
  AND FECHA_TIPO_CAMBIO =
      (SELECT MAX(FECHA_TIPO_CAMBIO)
       FROM A1000501
       WHERE COD_MON = 8
         AND FECHA_TIPO_CAMBIO <= TRUNC(sysdate));

SELECT *
FROM A1000501
WHERE COD_MON = 8;

select *
from a2000020
where num_secu_pol IN (
    '29794188578'
    )
  and COD_CAMPO like '%INCRE%';

SELECT *
FROM A2000030
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );

SELECT *
from sim_g2000020
where COD_CIA = 3
  and cod_ramo = 486
  and COD_CAMPO like '%INCRE%';

SELECT C09.*
FROM C9999909 C09
WHERE C09.COD_TAB IN ('TIPO_INCREMENTO');

select *
from SIM_CATALOGO_LISTAS
where COD_CIA = 3
  and COD_SECC = 37;--- CODIGO_LISTA like '%INCREME%';

UPDATE OPS$PUMA.C9999909
SET CODIGO1 = 0
where COD_TAB = 'TIPO_INCREMENTO'
  AND DAT_OBS = 'PORCENTAJE'
  AND CODIGO = 2
  AND DAT_NUM = 2
  AND COD_RAMO = 486
  AND COD_SECC = 37
  AND COD_CIA = 3;

select *
from a2000040
where num_secu_pol IN ('29797276950',
                       '29794188578',
                       '29797439485'
    );

----TABLA DE PARAMETRIZACION DE COBERTURAS A NIVEL DE RAMO Y SU NOMBRE RESPECTIVO
select *
from a1002100
where cod_cob in (716, 717, 719)
  and cod_ramo = 486;


select *
from creglas
where CDREG = '237PVV001';

select a.NUM_SECU_POL, a.*
from a2000030 a
where num_secu_pol IN ('29794188578');

select X.NUM_SECU_POL, X.*
from x2000030 X
where COD_CIA = 3
  and COD_SECC = 37
  and cod_ramo = 486;

select X.SUMA_ASEG, X.END_SUMA_ASEG, X.*
from x2000040 X
where num_secu_pol IN (29794188578);


select *
from CREGLAS_ROLLBKP
where cdreg = '220PVV115';


SELECT *
FROM CREGLAS
WHERE CDREG IN ('220PVV115');

SELECT *
FROM CREGLAS
WHERE REGLA_COMPLETA LIKE '%TIPO_INCREME%';

select *
from A2990050
where NOMBRPT like '%CB210005%';


select *
from A2990050
where COD_JOB like '%AJQREINV%';


SELECT A.COD_CIA,
       A.COD_SECC,
       A.COD_RAMO,
       A.NUM_POL1,
       A.NUM_END,
       A.NUM_SECU_POL,
       A.FECHA_VIG_POL,
       A.FECHA_VENC_POL,
       A.FECHA_VENC_PER,
       A.NRO_DOCUMTO                                                  AS DOCUMENTO_TOMADOR,
       -- Esta función valida si pasa las reglas de negocio de arrendamiento (ej. si tiene poliza vigente relacionada)
       -- Solo funcionará si tienes permisos de ejecución sobre el paquete
       PCK299_VALIDA_RENOVACION.Fun_EsPolizaRenovable(A.NUM_SECU_POL) AS ES_RENOVABLE_NEGOCIO
FROM A2000030 A
WHERE A.COD_CIA = 3
  AND A.COD_SECC = 37
  AND A.COD_RAMO = 486
  -- Criterio de Fechas: Vencimiento en Noviembre 2025
  AND A.FECHA_VENC_POL BETWEEN TO_DATE('01/07/2025', 'DD/MM/YYYY')
    AND TO_DATE('30/07/2025', 'DD/MM/YYYY')
  -- Criterio CRÍTICO: La póliza solo se renueva si su vigencia coincide con el vencimiento del periodo
  AND A.FECHA_VENC_POL = A.FECHA_VENC_PER
  -- Validaciones de Estado
  AND NVL(A.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(A.RENOVADA_POR, 0) = 0       -- Que no haya sido ya renovada
  AND NVL(A.MCA_CADUCA, 'N') = 'N'     -- Que no esté caduca
  AND A.COD_COA != 3                   -- Excluye coaseguro tipo 3
  AND NVL(A.MCA_COTIZACION, 'N') = 'N' -- Que sea póliza real, no cotización
  -- Solo el último endoso vigente
  AND A.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = A.NUM_SECU_POL)
  -- Excluye endosos de cancelación
  AND (NVL(A.COD_END, 0) != 900 OR
       (NVL(A.COD_END, 0) = 900 AND NVL(A.SUB_COD_END, 0) != 89));
---NUM_SECU_POL
---29814303312,29814395414,29814588657,29814303067,29814303391,29814616638,29816307485,

SELECT A.RENOVADA_POR, A.NUM_SECU_POL, A.*
FROM A2000030 A
WHERE NUM_SECU_POL IN
      (29808467905, 29807457749, 29808322098, 29808549647, 29808540110, 29807457964, 29807457900)
  and num_end = 0;

SELECT name, value
FROM v$parameter
WHERE name = 'open_cursors';

select round(100 +
             (100 *
              (NVL(80, 0)) / 100),
             0)
from dual;

--ALTER SYSTEM SET open_cursors = 1000 SCOPE=BOTH;
SELECT C09.DAT_OBS, C09.*
FROM C9999909 C09
WHERE C09.COD_TAB IN ('TIPO_INCREMENTO');

SELECT C09.DAT_OBS, C09.*
FROM C9999909 C09
WHERE C09.COD_TAB IN ('DATOS_VAR_COBERTURA')
  and rango1 in (716, 717)
  and RANGO2 = 2
ORDER BY CODIGO;

select *
from a2000020
where num_secu_pol IN (
                       29808467905, 29807457749, 29808322098, 29808549647, 29808540110, 29807457964, 29807457900
    )
  and COD_CAMPO like '%INCRE%';

select X.NUM_SECU_POL, X.SUMA_ASEG, X.END_SUMA_ASEG, X.SIM_PRIMA_COB_ORIG, X.*
from A2000040 X
where num_secu_pol IN (29808540110)
  and cod_cob in (716, 717);

select t.num_secu_pol, t.*
from a2000030 t
where t.num_pol1 in (5010002288202)
  and cod_secc = 37
  and num_end = 0;

select X.NUM_SECU_POL, X.SUMA_ASEG, X.END_SUMA_ASEG, X.SIM_PRIMA_COB_ORIG, X.*
from A2000040 X
where num_secu_pol IN (39745401930)
  and cod_cob in (716, 717);


select X.*
from x2000040 X
where num_secu_pol IN (29808467905)
  and cod_cob in (716, 717);

select round(X.SUMA_ASEG * (1.0551 + NVL(0 / 100, 0)), 0)
from A2000040 X
where num_secu_pol IN (39745270418)
  and cod_cob in (716, 717);

select t.num_secu_pol, t.*
from x2000030 t
where t.NUM_SECU_POL in (39745401891)
  and cod_secc = 37
  and num_end = 0;

select NVL(5 / 100, 0)
from dual;
select NVL(5 / 100, 0) + 1.0551
from dual;

select round(1000 +
             (1000 *
              (1.0551 + NVL(10, 0)) / 100),
             0)
from dual;

SELECT ROUND(1000 * (1 + (1.0551 - 1) * (200 / 100)), 0) AS nuevo_valor
FROM dual;

SELECT C09.*
FROM C9999909 C09
WHERE C09.COD_TAB IN ('TIPO_INCREMENTO');

INSERT INTO C9999909 (COD_TAB, CODIGO, DAT_OBS, DAT_NUM, COD_RAMO,
                      COD_SECC, COD_CIA, FECHA_ACT, USUARIO, DAT_CAR2)
VALUES ('TIPO_INCREMENTO', 7, 'IPC + PUNTOS', 7, 486, 37, 3, SYSDATE,
        'OPS$PUMA', '7');

DELETE C9999909
WHERE COD_TAB = 'TIPO_INCREMENTO'
  AND CODIGO = 7
  AND DAT_NUM = 7.00
  AND COD_RAMO = 486
  AND COD_SECC = 37
  AND COD_CIA = 3;



SELECT 1 + (TC1 / 100) TC1
FROM A1000501
WHERE COD_MON = 8
  AND FECHA_TIPO_CAMBIO = (SELECT MAX(FECHA_TIPO_CAMBIO)
                           FROM A1000501
                           WHERE COD_MON = 8
                             AND FECHA_TIPO_CAMBIO <= TRUNC(sysdate));

SELECT *
FROM A1000501
WHERE COD_MON = 8
  AND FECHA_TIPO_CAMBIO > TO_DATE('01/01/2025', 'DD/MM/YYYY');

SELECT *
         FROM A1000501
        WHERE COD_MON = 8
          and FECHA_TIPO_CAMBIO >= TO_DATE('01/12/2025', 'DD/MM/YYYY');


SELECT *
FROM A2000030 A
WHERE A.COD_CIA = 3
  AND A.COD_SECC = 37
  AND A.COD_RAMO = 486
  AND NVL(A.MCA_ANU_POL, 'N') = 'N'
  AND A.NUM_END =
      (SELECT MAX(B.NUM_END)
       FROM A2000030 B
       WHERE B.NUM_SECU_POL = A.NUM_SECU_POL)
  AND A.NUM_POL1 > 0
  AND A.NUM_SECU_POL in -- MDSB-563779
      (SELECT B.NUM_SECU_POL
       FROM A2000020 B
       WHERE B.VALOR_CAMPO = 5913462
         AND B.COD_CAMPO = 'NRO_SOLICITUD'
         AND B.MCA_VIGENTE = 'S');


select *
from A5021115;


SELECT a.NUM_SECU_POL, a.*
FROM a2000030 a
WHERE a.COD_CIA = 3
  AND a.COD_SECC = 37
  AND a.COD_RAMO = 486
  AND a.FECHA_VENC_POL BETWEEN TO_DATE('01/05/2025', 'DD/MM/YYYY') AND TO_DATE('31/12/2025', 'DD/MM/YYYY')
  AND NVL(a.mca_anu_pol, 'N') != 'S'
  AND a.RENOVADA_POR IS NULL           --normalmente tiene el num_pol1 nuevo
  AND NVL(a.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(a.MCA_CADUCA, 'N') = 'N'
  AND a.COD_COA != 3
  AND NVL(a.MCA_COTIZACION, 'N') = 'N' -- que no sea una cotizacion
  AND a.NUM_END = (SELECT
                       /*+ index(a2000030 I1_A2000030) */
                       MAX(NUM_END)
                   FROM A2000030
                   WHERE NUM_SECU_POL = a.NUM_SECU_POL)
  AND a.NUM_SECU_POL IN (SELECT NUM_SECU_POL
                         FROM a2000020
                         WHERE mca_vigente = 'S'
                           AND cod_ries = 1
                           AND cod_campo = 'DESC_RIES'
                           AND NUM_SECU_POL = a.NUM_SECU_POL
                           AND NVL(valor_campo, 'VIVIENDA') IN ('APARTAMENTO', 'VIVIENDA', 'CASA'));


 SELECT *
    FROM a2000020
    WHERE mca_vigente = 'S'
      AND cod_ries = 1
      AND COD_CAMPO in ('TIPO_INCREME','INCREMENTO_ARR')
      AND num_secu_pol IN (
          SELECT a.NUM_SECU_POL
          FROM a2000030 a
          WHERE a.COD_CIA = 3
            AND a.COD_SECC = 37
            AND a.COD_RAMO = 486
            AND a.FECHA_VENC_POL BETWEEN TO_DATE('01/05/2025', 'DD/MM/YYYY')
                                     AND TO_DATE('30/11/2026', 'DD/MM/YYYY')
            AND NVL(a.mca_anu_pol, 'N') != 'S'
            AND a.RENOVADA_POR IS NULL
            AND NVL(a.MCA_PROVISORIO, 'N') = 'N'
            AND NVL(a.MCA_CADUCA, 'N') = 'N'
            AND a.COD_COA != 3
            AND NVL(a.MCA_COTIZACION, 'N') = 'N'
            AND a.NUM_END = (SELECT /*+ index(a2000030 I1_A2000030) */ MAX(NUM_END)
                             FROM A2000030
                             WHERE NUM_SECU_POL = a.NUM_SECU_POL)
            AND a.NUM_SECU_POL IN (SELECT NUM_SECU_POL
                                   FROM a2000020
                                   WHERE mca_vigente = 'S'
                                     AND cod_ries = 1
                                     AND cod_campo = 'DESC_RIES'
                                     AND NUM_SECU_POL = a.NUM_SECU_POL
                                     AND NVL(valor_campo, 'VIVIENDA') IN ('APARTAMENTO', 'VIVIENDA', 'CASA')));



SELECT A.COD_CIA,
       A.COD_SECC,
       A.COD_RAMO,
       A.NUM_POL1,
       A.NUM_END,
       A.NUM_SECU_POL,
       A.FECHA_VIG_POL,
       A.FECHA_VENC_POL,
       A.FECHA_VENC_PER,
       A.NRO_DOCUMTO AS DOCUMENTO_TOMADOR,
       -- Esta función valida si pasa las reglas de negocio de arrendamiento (ej. si tiene poliza vigente relacionada)
       -- Solo funcionará si tienes permisos de ejecución sobre el paquete
       PCK299_VALIDA_RENOVACION.Fun_EsPolizaRenovable(A.NUM_SECU_POL) AS ES_RENOVABLE_NEGOCIO
FROM A2000030 A
WHERE A.COD_CIA = 3
  AND A.COD_SECC = 37
  AND A.COD_RAMO = 486
  -- Criterio de Fechas: Vencimiento en Noviembre 2025
  AND A.FECHA_VENC_POL BETWEEN TO_DATE('01/04/2026', 'DD/MM/YYYY')
                           AND TO_DATE('30/05/2026', 'DD/MM/YYYY')
  -- Criterio CRÍTICO: La póliza solo se renueva si su vigencia coincide con el vencimiento del periodo
  AND A.FECHA_VENC_POL = A.FECHA_VENC_PER
  -- Validaciones de Estado
  AND NVL(A.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(A.RENOVADA_POR, 0) = 0      -- Que no haya sido ya renovada
  AND NVL(A.MCA_CADUCA, 'N') = 'N'    -- Que no esté caduca
  AND A.COD_COA != 3                  -- Excluye coaseguro tipo 3
  AND NVL(A.MCA_COTIZACION, 'N') = 'N' -- Que sea póliza real, no cotización
  -- Solo el último endoso vigente
  AND A.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = A.NUM_SECU_POL)
  -- Excluye endosos de cancelación
  AND (NVL(A.COD_END, 0) != 900 OR
       (NVL(A.COD_END, 0) = 900 AND NVL(A.SUB_COD_END, 0) != 89));

SELECT R.REGLA_COMPLETA, R.*
FROM CREGLAS R WHERE CDREG = '237PVV009';

SELECT R.REGLA_COMPLETA, R.*
FROM CREGLAS R WHERE CDREG IN ('237PVV020', '237PVV012','237PVV026','237PVV016','237PVV027','201PVV002');

SELECT *
from g2000020
where COD_CIA = 3
  and cod_ramo = 486
  and COD_CAMPO like '%INCRE%';

SELECT *
from sim_g2000020
where COD_CIA = 3
  and cod_ramo = 486
  and COD_CAMPO like '%INCRE%';

----ejmplo quitar controles tecnicos
-- dbms_output.put_line('CON AUTORIZACION VIA CORREO ELECTRONICO, SE ACTAULIZAN LAS ORDENES DE PAGO DEL 486 PARA QUE SE GIREN');
 -- dbms_output.put_line('INICIA PROCESO ' || to_char(SYSDATE, 'DD/MM/YYYY HH24:MI:SS'));
/*
  UPDATE A5021604
     SET MCA_EST_PAGO = NULL
   WHERE COD_CIA      = 3
     AND NUM_ORD_PAGO IN (92002600002989,
                          92002600003150,
                          92002600003156,
                          92002600003155,
                          92002600003153,
                          92002600003154,
                          92002600003159,
                          50192026000116,
                          92002600003151);

  dbms_output.put_line('UPDATE A5021604. '||SQL%ROWCOUNT);
 */