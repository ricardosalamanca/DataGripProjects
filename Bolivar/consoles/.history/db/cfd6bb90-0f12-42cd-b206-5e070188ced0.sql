SELECT LISTAGG(P.EMAIL, ',') WITHIN GROUP (ORDER BY P.EMAIL) AS EMAILS_CONCAT
FROM USRIOS P
         JOIN ROLES_USRIOS T ON P.USR_CDGO_USRIO = T.RUS_CDGO_USRIO
WHERE T.RUS_CDGO_ROL = '12';
;-- -. . -..- - / . -. - .-. -.--
select * from BITCRAS_LLMDAS;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO RCBOS_CJA (
    RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_TPO_RCBO, RCC_OFI_CDGO,
    RCC_NMRO_IDNTFCCION, RCC_TPO_IDNTFCCION, RCC_ESTDO_RCBO, RCC_FCHA_RCBO,
    RCC_VLOR_RCBO, RCC_USRIO, RCC_FCHA_MDFCCION, RCC_TXTO,
    RCC_SUC_CDGO, RCC_NMRO_LQDC, RCC_CIA_CDGO_TES, RCC_NMRO_MNAL,
    RCC_DIV_CDGO, RCC_FCHA_LMTE_PGO, RCC_TXTO_CSION, RCC_TPO_LQDCION
) VALUES (
             505329071, 40, 'R', '01',
             '860042985', 'NT', 'T', SYSDATE-1,
             9000000, '53905071', SYSDATE, 'REINTEGRO AGENCIA - TEST CASO ORA-06502',
             '2501', -1, 40, '11001',
             '###', SYSDATE+30, 'W', 'W'
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO RCBOS_CJA (
                 RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_TPO_RCBO, RCC_OFI_CDGO,
                 RCC_NMRO_IDNTFCCION, RCC_TPO_IDNTFCCION, RCC_ESTDO_RCBO, RCC_FCHA_RCBO,
                 RCC_VLOR_RCBO, RCC_USRIO, RCC_FCHA_MDFCCION, RCC_TXTO,
                 RCC_SUC_CDGO, RCC_NMRO_LQDC, RCC_CIA_CDGO_TES, RCC_NMRO_MNAL,
                 RCC_DIV_CDGO, RCC_FCHA_LMTE_PGO, RCC_TXTO_CSION, RCC_TPO_LQDCION
             ) VALUES (
                 505329071, 40, 'R', '01',
                 '860042985', 'NT', 'T', SYSDATE - 1,
                 9000000, '53905071', SYSDATE, 'REINTEGRO AGENCIA - TEST CASO ORA-06502',
                 '2501', -1, 40, '11001',
                 NULL, SYSDATE + 30, 'W', 'W'
             );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO RCBOS_CJA (
                 RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_TPO_RCBO, RCC_OFI_CDGO,
                 RCC_NMRO_IDNTFCCION, RCC_TPO_IDNTFCCION, RCC_ESTDO_RCBO, RCC_FCHA_RCBO,
                 RCC_VLOR_RCBO, RCC_USRIO, RCC_FCHA_MDFCCION, RCC_TXTO,
                 RCC_SUC_CDGO, RCC_NMRO_LQDC, RCC_CIA_CDGO_TES, RCC_NMRO_MNAL,
                 RCC_DIV_CDGO, RCC_FCHA_LMTE_PGO, RCC_TXTO_CSION, RCC_TPO_LQDCION
             ) VALUES (
                 505329071, 40, 'R', '01',
                 '860042985', 'NT', 'T', SYSDATE - 1,
                 9000000, '53905071', SYSDATE, 'REINTEGRO AGENCIA - TEST CASO ORA-06502',
                 '2501', -1, 40, '11001',
                 '11001', SYSDATE + 30, 'W', 'W'
             );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO RCBOS_CJA (
    RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_TPO_RCBO, RCC_OFI_CDGO,
    RCC_NMRO_IDNTFCCION, RCC_TPO_IDNTFCCION, RCC_ESTDO_RCBO, RCC_FCHA_RCBO,
    RCC_VLOR_RCBO, RCC_USRIO, RCC_FCHA_MDFCCION, RCC_TXTO,
    RCC_SUC_CDGO, RCC_NMRO_LQDC, RCC_CIA_CDGO_TES, RCC_NMRO_MNAL,
    RCC_DIV_CDGO, RCC_FCHA_LMTE_PGO, RCC_TXTO_CSION, RCC_TPO_LQDCION
) VALUES (
             505329072, 40, 'R', '01',
             '860042985', 'NT', 'T', SYSDATE-2,
             15000000, '53905071', SYSDATE, 'REINTEGRO AGENCIA - TEST CASO 2',
             '2501', -1, 40, '11001',
             '11001', SYSDATE+30, 'W', 'W'
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO RCBOS_CJA (
    RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_TPO_RCBO, RCC_OFI_CDGO,
    RCC_NMRO_IDNTFCCION, RCC_TPO_IDNTFCCION, RCC_ESTDO_RCBO, RCC_FCHA_RCBO,
    RCC_VLOR_RCBO, RCC_USRIO, RCC_FCHA_MDFCCION, RCC_TXTO,
    RCC_SUC_CDGO, RCC_NMRO_LQDC, RCC_CIA_CDGO_TES, RCC_NMRO_MNAL,
    RCC_DIV_CDGO, RCC_FCHA_LMTE_PGO, RCC_TXTO_CSION, RCC_TPO_LQDCION
) VALUES (
             505329073, 40, 'R', '01',
             '860042985', 'NT', 'T', SYSDATE-3,
             25000000, '53905071', SYSDATE, 'REINTEGRO AGENCIA - TEST CASO 3 CON NOMBRE POLIZA MUY LARGO PARA PROVOCAR OVERFLOW',
             '2501', -1, 40, '11001',
             '11001', SYSDATE+30, 'W', 'W'
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO DDAS_PLZAS (
    DDP_NMRO_PLZA, DDP_CLSE_PLZA, DDP_RAM_CDGO, DDP_SERIE,
    DDP_NMRO_SLCTUD, DDP_FCHA_MRA, DDP_FCHA_DSDE, DDP_FCHA_HSTA,
    DDP_CNCPTO, DDP_VLOR_DDA, DDP_VLOR_PGDO, DDP_ORGEN,
    DDP_USRIO, DDP_FCHA_MDFCCION, DDP_PGDO, DDP_CAUSAL, DDP_DSCRPCION
) VALUES (
             138484, '00', '12', '445776',
             10301855, TRUNC(SYSDATE-1), TRUNC(SYSDATE-1), TRUNC(SYSDATE+365),
             '01', 9000000, 2920796, 'E',
             '53905071', SYSDATE, 'N', 'E', 'REINTEGRO CANON - TEST PRINCIPAL'
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO DDAS_PLZAS (
    DDP_NMRO_PLZA, DDP_CLSE_PLZA, DDP_RAM_CDGO, DDP_SERIE,
    DDP_NMRO_SLCTUD, DDP_FCHA_MRA, DDP_FCHA_DSDE, DDP_FCHA_HSTA,
    DDP_CNCPTO, DDP_VLOR_DDA, DDP_VLOR_PGDO, DDP_ORGEN,
    DDP_USRIO, DDP_FCHA_MDFCCION, DDP_PGDO, DDP_CAUSAL, DDP_DSCRPCION
) VALUES (
             138485, '00', '12', '445777',
             10301856, TRUNC(SYSDATE-2), TRUNC(SYSDATE-2), TRUNC(SYSDATE+365),
             '01', 15000000, 5000000, 'E',
             '53905071', SYSDATE, 'N', 'E', 'REINTEGRO CANON - TEST OVERFLOW CASO 2 CON DESCRIPCION MUY LARGA'
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO DDAS_PLZAS (
    DDP_NMRO_PLZA, DDP_CLSE_PLZA, DDP_RAM_CDGO, DDP_SERIE,
    DDP_NMRO_SLCTUD, DDP_FCHA_MRA, DDP_FCHA_DSDE, DDP_FCHA_HSTA,
    DDP_CNCPTO, DDP_VLOR_DDA, DDP_VLOR_PGDO, DDP_ORGEN,
    DDP_USRIO, DDP_FCHA_MDFCCION, DDP_PGDO, DDP_CAUSAL, DDP_DSCRPCION
) VALUES (
             138486, '00', '12', '445778',
             10301857, TRUNC(SYSDATE-3), TRUNC(SYSDATE-3), TRUNC(SYSDATE+365),
             '01', 25000000, 1000000, 'E',
             '53905071', SYSDATE, 'N', 'E', 'REINTEGRO CANON TEST OVERFLOW CASO 3 CON DESCRIPCION EXTRA LARGA PARA PROVOCAR DESBORDAMIENTO DE BUFFER'
         );
;-- -. . -..- - / . -. - .-. -.--
SELECT 'RCBOS_CJA insertados:' as TABLA, COUNT(*) as REGISTROS
FROM RCBOS_CJA
WHERE RCC_NMRO_RCBO IN (505329071, 505329072, 505329073)
UNION ALL
SELECT 'DDAS_PLZAS insertados:', COUNT(*)
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857);
;-- -. . -..- - / . -. - .-. -.--
SELECT DDP_NMRO_SLCTUD, DDP_NMRO_PLZA, DDP_VLOR_DDA, DDP_VLOR_PGDO,
       (DDP_VLOR_DDA - DDP_VLOR_PGDO) as SALDO_DEUDA,
       DDP_DSCRPCION
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857)
ORDER BY DDP_NMRO_SLCTUD;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM DDAS_PLZAS
WHERE DDP_NMRO_SLCTUD IN (10301855, 10301856, 10301857)
ORDER BY DDP_NMRO_SLCTUD;
;-- -. . -..- - / . -. - .-. -.--
SELECT RCC_NMRO_RCBO, RCC_CIA_CDGO, RCC_VLOR_RCBO, RCC_TXTO
FROM RCBOS_CJA
WHERE RCC_NMRO_RCBO = 505329071;
;-- -. . -..- - / . -. - .-. -.--
select A.SNA_ESTDO_PGO, SNA_ESTDO_SNSTRO, A.SNA_FCHA_ULTMO_PGO, A.*
from AVSOS_SNSTROS A
where A.SNA_NMRO_ITEM IN (10937150, 10900892);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES R WHERE R.RVI_NMRO_ITEM IN (11465009) ORDER BY RVI_NMRO_ITEM, RVI_FCHA_MDFCCION ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS R WHERE R.RVI_NMRO_ITEM = 7705919;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS_NVDAD WHERE REN_NMRO_ITEM = 10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS_NVDAD WHERE REN_NMRO_ITEM = 11465009;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS R WHERE R.RIR_NMRO_ITEM = 7705919;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_ITEM=10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS R WHERE R.RIR_NMRO_CRTFCDO = 11465009;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS_NVDAD;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES where RVI_NMRO_PLZA = 1995;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS R WHERE R.RIR_NMRO_PLZA = 1995;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_PLZA=1995;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS_NVDAD WHERE REN_NMRO_PLZA = 1995;
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010001115604, 5010001115603, 5010001115602);
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_SINIESTROS_HI
WHERE NUM_POL1 IN (5010001115604, 5010001115603, 5010001115602);
;-- -. . -..- - / . -. - .-. -.--
select * from documento_temporal where COD_LIST_DOC = 296332;
;-- -. . -..- - / . -. - .-. -.--
select * from documento_temporal where NUMEROSOLICITUD = 10825099;
;-- -. . -..- - / . -. - .-. -.--
select l.sini_sol_sai_solicitud, d.NUMEROSOLICITUD
from LISTA_DOCUMENTO l
inner join documento_temporal d
  on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD;
;-- -. . -..- - / . -. - .-. -.--
select COUNT(*)
from LISTA_DOCUMENTO l
inner join documento_temporal d
  on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD;
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD;
;-- -. . -..- - / . -. - .-. -.--
select COUNT(*)
from LISTA_DOCUMENTO l
inner join documento_temporal d
           on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;
;-- -. . -..- - / . -. - .-. -.--
select *
from documento_temporal
where numerosolicitud = 76927
  and cod_doc = 1;
;-- -. . -..- - / . -. - .-. -.--
select *
from documento_temporal
where numerosolicitud = 76927;
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC WHERE L.COD_LIST_DOC = 249451;
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC WHERE L.COD_LIST_DOC = 202105;
;-- -. . -..- - / . -. - .-. -.--
select *
from documento_temporal
where numerosolicitud = 5717885
  and cod_doc = 1;
;-- -. . -..- - / . -. - .-. -.--
select numerosolicitud, cod_doc, count(*)
from documento_temporal
group by numerosolicitud, cod_doc
having count(*) > 1;
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC
WHERE d.numerosolicitud in (7701873, 7492676, 5060036, 10580440, 3174718, 10355714);
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC
WHERE d.numerosolicitud in (select numerosolicitud
                            from documento_temporal
                            group by numerosolicitud, cod_doc
                            having count(*) > 1);
;-- -. . -..- - / . -. - .-. -.--
select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;
;-- -. . -..- - / . -. - .-. -.--
select
    'INSERT INTO DOCUMENTO_TEMPORAL (' ||
    'TITULODOCUMENTO, NOMBREUSUARIO, IDENTIFICADORUSUARIO, NOMBREDELDOCUMENTO, TIPODOCUMENTOASEGURADO, NOMBREASEGURADO, NUMERODOCUMENTOASEGURADO, FECHAEXPEDICIONDOCUMENTO, VIGENCIADOCUMENTO, IDCOMPANIA, RAMO, PRODUCTO, NUMEROSOLICITUD, NUMEROSINIESTRO, NUMERODEPOLIZA, NOCASO, IDRIESGO, CLASIFICACIONSEGURIDADINFO, CLASIFICACIONHABEASDATA, TIPOMOVIMIENTO, FECHARECEPCIONDOCUMENTO, ARCHIVO, TIPOARCHIVO, COD_DOC, APLICA) VALUES (''' ||
    d.TITULODOCUMENTO || ''',''' ||
    d.NOMBREUSUARIO || ''',''' ||
    d.IDENTIFICADORUSUARIO || ''',''' ||
    d.NOMBREDELDOCUMENTO || ''',''' ||
    d.TIPODOCUMENTOASEGURADO || ''',''' ||
    d.NOMBREASEGURADO || ''',''' ||
    d.NUMERODOCUMENTOASEGURADO || ''',''' ||
    d.FECHAEXPEDICIONDOCUMENTO || ''',''' ||
    d.VIGENCIADOCUMENTO || ''',''' ||
    d.IDCOMPANIA || ''',''' ||
    d.RAMO || ''',''' ||
    d.PRODUCTO || ''',''' ||
    d.NUMEROSOLICITUD || ''',''' ||
    d.NUMEROSINIESTRO || ''',''' ||
    d.NUMERODEPOLIZA || ''',''' ||
    d.NOCASO || ''',''' ||
    d.IDRIESGO || ''',''' ||
    d.CLASIFICACIONSEGURIDADINFO || ''',''' ||
    d.CLASIFICACIONHABEASDATA || ''',''' ||
    d.TIPOMOVIMIENTO || ''',''' ||
    d.FECHARECEPCIONDOCUMENTO || ''',''BLOB'',''' || -- El campo BLOB se marca como 'BLOB'
    d.TIPOARCHIVO || ''',''' ||
    d.COD_DOC || ''',''' ||
    d.APLICA || ''');' as INSERT_STATEMENT
from LISTA_DOCUMENTO l
         inner join DOCUMENTO_TEMPORAL d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;
;-- -. . -..- - / . -. - .-. -.--
select r.RVI_NMRO_ITEM, p.POL_PRS_NMRO_IDNTFCCION
from rsgos_vgntes r, plzas p
where r.RVI_NMRO_PLZA = p.POL_NMRO_PLZA
and p.POL_NMRO_PLZA < 999
and r.RVI_FCHA_DSDE_ACTUAL > to_date('01/01/2024', 'dd/mm/yyyy') and p.POL_PRS_NMRO_IDNTFCCION = 901143222;
;-- -. . -..- - / . -. - .-. -.--
select r.RVI_NMRO_ITEM, p.POL_PRS_NMRO_IDNTFCCION
from rsgos_vgntes r, plzas p
where r.RVI_NMRO_PLZA = p.POL_NMRO_PLZA
and p.POL_NMRO_PLZA < 999
and r.RVI_FCHA_DSDE_ACTUAL > to_date('01/01/2024', 'dd/mm/yyyy');
;-- -. . -..- - / . -. - .-. -.--
select d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;
;-- -. . -..- - / . -. - .-. -.--
select
    'docfilenet.extend;' || chr(10) ||
    'docfilenet(' || rownum || ') := ty_reg_filenet(''' ||
    d.COD_DOC || ''',''' ||
    d.NUMEROSOLICITUD || ''',''{0051F571-0000-C046-BD54-D700EEAE92A5}'');'
        as linea_plsql
from documento_temporal d;
;-- -. . -..- - / . -. - .-. -.--
SELECT
       dt.cod_doc,
       dt.titulodocumento,
       dt.aplica,
       NULL,
       TO_DATE(dt.fecharecepciondocumento,
               'dd-mm-yyyy hh24:mi:ss')

FROM documento_temporal dt
WHERE dt.numerosolicitud = 7496885
  AND dt.cod_doc = 7
  AND ROWNUM = 1;
;-- -. . -..- - / . -. - .-. -.--
Select * from documento_temporal;
;-- -. . -..- - / . -. - .-. -.--
Select * from documento_temporal where TIPOMOVIMIENTO is not null and order by archivo asc;
;-- -. . -..- - / . -. - .-. -.--
Select *
from documento_temporal
where TIPOMOVIMIENTO is not null
order by archivo asc;
;-- -. . -..- - / . -. - .-. -.--
Select *
from documento_temporal
where TIPOMOVIMIENTO is not null;
;-- -. . -..- - / . -. - .-. -.--
select TIPOMOVIMIENTO, count(*) as cantidad
from documento_temporal
where TIPOMOVIMIENTO is not null
group by TIPOMOVIMIENTO;
;-- -. . -..- - / . -. - .-. -.--
select * from LISTA_DOCUMENTO where sini_sol_sai_solicitud = 10825099;
;-- -. . -..- - / . -. - .-. -.--
select * from documento_temporal;
;-- -. . -..- - / . -. - .-. -.--
select COUNT(*)
from LISTA_DOCUMENTO l;
;-- -. . -..- - / . -. - .-. -.--
Select *
from documento_temporal;
;-- -. . -..- - / . -. - .-. -.--
Select count(*) from documento_temporal;
;-- -. . -..- - / . -. - .-. -.--
SELECT P."NIT COMPANIA", P.* FROM PAGOS_LINEA_LIBERTADOR P;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM DETALLES_PAGO;
;-- -. . -..- - / . -. - .-. -.--
SELECT A.ESTADO_PAGO, A.ESTADO_SOLICITUD, A.FECHA_LIMITE_PAGO, A.POLIZA, A.COBRADOR, A.*
FROM OBLIGACIONES_PAGAR A
WHERE  A.ESTADO_SOLICITUD = 'V'
  AND A.ESTADO_PAGO = 'PE';
;-- -. . -..- - / . -. - .-. -.--
SELECT A.ESTADO_PAGO, A.ESTADO_SOLICITUD, A.FECHA_LIMITE_PAGO, A.POLIZA, A.COBRADOR, A.*
FROM OBLIGACIONES_PAGAR A
WHERE  A.ESTADO_SOLICITUD = 'V'
  AND A.ESTADO_PAGO = 'PE'
  AND A.POLIZA = 13002;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD = 11427731;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD = (11427729,11427730,11427731);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427729,11427730,11427731);
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT TIP_RESULTADO
FROM AEW_RESULTADOS_ESTUDIO;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where TIP_RESULTADO = 'D';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where DESC_COD_SECUNDARIO like '%INGRESOS%';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where DESC_COD_SECUNDARIO like '%NO SE PUDO OBTENER INGRESOS DEL CLIENTE%';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427729,11427730,11427731, 11427734);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427759);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427759,11427760);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427759,11427760,11427761);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427759,11427760,11427761,11427762);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM AEW_RESULTADOS_ESTUDIO
where DESC_COD_SECUNDARIO like '%NO SE PUDO OBTENER INGRESOS DEL CLIENTE%'
order by fecha desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AEW_RESULTADOS_ESTUDIO where AEW_RESULTADOS_ESTUDIO.SOLICITUD in (11427848);
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro = 10697010
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS where POL_NMRO_PLZA = 1702;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion= 900265408
      AND x.arr_tpo_idntfccion = '13')
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select nvl(count(x.sna_nmro_snstro),0)
from avsos_snstros x ,(
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 900265408
      and d.dar_tpo_arrndtrio in ('I','P')) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(DISTINCT x.pes_fcha_pgo),0)
FROM PGOS_EFCTDOS_SNSTROS x where x.pes_nmro_snstro IN(
    select x.sna_nmro_snstro
    from avsos_snstros x ,(
        select d.dar_nmro_slctud, d.dar_fcha_mra
        from ddas_arrndtrios d
        where d.dar_tpo_idntfccion = '13'
          and d.dar_nmro_idntfccion = 900265408
          and d.dar_tpo_arrndtrio in ('I','P')) x1
    where x.sna_nmro_item= x1.dar_nmro_slctud
      and x.sna_fcha_snstro= x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 900265408) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion = 900265408) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
      AND x.arr_tpo_idntfccion = '13')
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select nvl(count(x.sna_nmro_snstro),0)
from avsos_snstros x ,(
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
      and d.dar_tpo_arrndtrio in ('I','P')) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(DISTINCT x.pes_fcha_pgo),0)
FROM PGOS_EFCTDOS_SNSTROS x where x.pes_nmro_snstro IN(
    select x.sna_nmro_snstro
    from avsos_snstros x ,(
        select d.dar_nmro_slctud, d.dar_fcha_mra
        from ddas_arrndtrios d
        where d.dar_tpo_idntfccion = '13'
          and d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
          and d.dar_tpo_arrndtrio in ('I','P')) x1
    where x.sna_nmro_item= x1.dar_nmro_slctud
      and x.sna_fcha_snstro= x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x, ddas_vgntes_arrndmntos ddv, (
    select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)) x1
where x.sna_nmro_item= x1.dar_nmro_slctud
  and x.sna_fcha_snstro= x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03','04','06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where d.dar_tpo_idntfccion = '13'
      and d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138);
;-- -. . -..- - / . -. - .-. -.--
select d.dar_nmro_slctud, d.dar_fcha_mra
    from ddas_arrndtrios d
    where  d.dar_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138);
;-- -. . -..- - / . -. - .-. -.--
select *
from ddas_vgntes_arrndmntos d
where d.DVA_USRIO IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138);
;-- -. . -..- - / . -. - .-. -.--
select *
from ddas_vgntes_arrndmntos d
where d.DVA_USRIO IN ('10548237', '10697010', '7293054', '10384990', '6223776', '10989559', '10942138');
;-- -. . -..- - / . -. - .-. -.--
select * from TPOS_IDNTFCCION;
;-- -. . -..- - / . -. - .-. -.--
select * from TPOS_IDNTFCCION where TIP_DSCRPCION like '%NIT%';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud),0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in(
    SELECT x.arr_ses_nmro FROM arrndtrios x
    WHERE x.arr_nmro_idntfccion IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138)
      AND x.arr_tpo_idntfccion IN ('13','03','06','07','09'))
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                            from slctdes_estdios
                                            where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138));
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud), 0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                                            from PLZAS
                                                            where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                                                    from slctdes_estdios
                                                                                    where
                                                                                        ses_nmro IN (10548237, 10697010,
                                                                                                     7293054, 10384990,
                                                                                                     6223776, 10989559,
                                                                                                     10942138)))
                              AND x.arr_tpo_idntfccion IN ('13', '03', '06', '07', '09'))
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select nvl(count(x.sna_nmro_snstro), 0)
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('13', '03', '06', '07', '09')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(DISTINCT x.pes_fcha_pgo), 0)
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_tpo_idntfccion IN ('13', '03', '06', '07', '09')
                                    and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                                                  from PLZAS
                                                                  where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                                                          from slctdes_estdios
                                                                                          where ses_nmro IN
                                                                                                (10548237, 10697010,
                                                                                                 7293054, 10384990,
                                                                                                 6223776, 10989559,
                                                                                                 10942138)))
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('13', '03', '06', '07', '09')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('13', '03', '06', '07', '09')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select POL_PRS_NMRO_IDNTFCCION
                                                            from PLZAS
                                                            where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                                                    from slctdes_estdios
                                                                                    where
                                                                                        ses_nmro IN (10548237, 10697010,
                                                                                                     7293054, 10384990,
                                                                                                     6223776, 10989559,
                                                                                                     10942138);
;-- -. . -..- - / . -. - .-. -.--
select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138));
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(x.ret_nmro_slctud), 0)
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN
                                  (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715))
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
select count(DISTINCT x.sna_nmro_item)
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN (7274509)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select * from PLZAS where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                            from slctdes_estdios
                                            where ses_nmro IN (7274509));
;-- -. . -..- - / . -. - .-. -.--
select * from arrndtrios where arr_ses_nmro = 7274509;
;-- -. . -..- - / . -. - .-. -.--
select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('13', '03', '06', '07', '09');
;-- -. . -..- - / . -. - .-. -.--
SELECT x.*
FROM rsltdo_estdio x
WHERE x.ret_nmro_slctud in (SELECT x.arr_ses_nmro
                            FROM arrndtrios x
                            WHERE x.arr_nmro_idntfccion IN
                                  (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715))
  AND x.ret_cdgo_rsltdo = '03';
;-- -. . -..- - / . -. - .-. -.--
SELECT x.*
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_nmro_idntfccion IN
                                        (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(count(DISTINCT x.pes_fcha_pgo), 0)
FROM PGOS_EFCTDOS_SNSTROS x
where x.pes_nmro_snstro IN (select x.sna_nmro_snstro
                            from avsos_snstros x,
                                 (select d.dar_nmro_slctud, d.dar_fcha_mra
                                  from ddas_arrndtrios d
                                  where d.dar_nmro_idntfccion IN
                                        (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
                                    and d.dar_tpo_arrndtrio in ('I', 'P')) x1
                            where x.sna_nmro_item = x1.dar_nmro_slctud
                              and x.sna_fcha_snstro = x1.dar_fcha_mra);
;-- -. . -..- - / . -. - .-. -.--
select nvl(count(x.sna_nmro_snstro), 0)
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, x.*
from avsos_snstros x,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)
        and d.dar_tpo_arrndtrio in ('I', 'P')) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
select x1.DAR_NMRO_SLCTUD, x1.DAR_FCHA_MRA
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra
      from ddas_arrndtrios d
      where d.dar_tpo_idntfccion IN ('NT', 'CC')
        and d.dar_nmro_idntfccion IN (select POL_PRS_NMRO_IDNTFCCION
                                      from PLZAS
                                      where POL_NMRO_PLZA IN (select SES_NMRO_PLZA
                                                              from slctdes_estdios
                                                              where ses_nmro IN (10548237, 10697010, 7293054, 10384990,
                                                                                 6223776, 10989559, 10942138)))) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM UBICACION;
;-- -. . -..- - / . -. - .-. -.--
select * from ALL_OBJECTS ao
where ao.object_name LIKE '%CARPETA_UBICACION%'
  AND OBJECT_TYPE='TABLE';
;-- -. . -..- - / . -. - .-. -.--
select * from ALL_OBJECTS ao
where ao.object_name LIKE '%CARPETA_UBICACION%';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10989559
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('17/11/2025','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10989559
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('17/11/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10548237
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'));
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10548237
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud = 10548237
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN (10619963,7245488,10797045,7293584,10718480,10114363)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN (10619963,7245488,10797045,7293584,10718480,10114363,7726165,6695389,7381155,7381155,10310714,6336869,10413852,7441523,10317374)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN
      (6223776, 4526648, 7285632, 10548237, 10697010, 7293054, 10384990, 10989559, 10942138, 4784648, 5334275, 5118427)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (43812362)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_tpo_idntfccion, d.dar_nmro_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
select * from AEW_VARIABLES_SAI;
;-- -. . -..- - / . -. - .-. -.--
select * from AEW_VARIABLES_SAI where SOLICITUD in (6223776, 10942138, 10697010);
;-- -. . -..- - / . -. - .-. -.--
select * from AEW_VARIABLES_SAI where SOLICITUD in (6223776, 10942138, 10697010, 10989559, 10548237);
;-- -. . -..- - / . -. - .-. -.--
select A.MONTO_SOLICITUDES_MORA, A.*
from AEW_VARIABLES_SAI A
where SOLICITUD in (6223776, 10942138, 10697010, 10989559, 10548237);
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra;
;-- -. . -..- - / . -. - .-. -.--
select *
from slctdes_estdios
where ses_nmro IN (10548237, 10697010, 7293054, 10384990, 6223776, 10989559, 10942138, 65757)
order by ses_fcha_actlzcion desc;
;-- -. . -..- - / . -. - .-. -.--
select A.MONTO_SOLICITUDES_MORA, A.*
from AEW_VARIABLES_SAI A
where SOLICITUD in (11509155,
                    11547809,
                    11521503,
                    11578766,
                    11589312, 11582986, 11555670);
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.DAR_NMRO_IDNTFCCION = x1.dar_nmro_idntfccion
      and cu.DAR_TPO_IDNTFCCION = x1.dar_tpo_idntfccion
      and cu.NUMERO_UBICACION in (43, 5);
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.DAR_NMRO_IDNTFCCION = x1.dar_nmro_idntfccion
      and cu.DAR_TPO_IDNTFCCION = x1.dar_tpo_idntfccion
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CARPETA_UBICACION;
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      and cu.ID_RESPONSABLE = x1.dar_nmro_idntfccion
      and cu.TIPO_ID_RESPONSABLE = x1.dar_tpo_idntfccion
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CARPETA_UBICACION where w.NUMERO_OBLIGACION in (4784648,5334275,5118427);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CARPETA_UBICACION where NUMERO_OBLIGACION in (4784648,5334275,5118427);
;-- -. . -..- - / . -. - .-. -.--
SELECT  nvl(vdp1.nom_ciu,'') as ciudadInmu,nvl(vdp.nom_ciu,'') as ciudadInmo,nvl(pz.pol_nmro_plza,'')
FROM slctdes_estdios x , scrsl sc,plzas pz , V_DIVISION_POLITICAS vdp , direcciones dr ,V_DIVISION_POLITICAS vdp1
where x.ses_nmro=11709616
  AND pz.pol_nmro_plza = x.ses_nmro_plza
  AND sc.suc_cdgo = pz.pol_suc_cdgo
  AND sc.suc_cia_cdgo = pz.pol_suc_cia_cdgo
  AND sc.suc_div_cdgo = vdp.codazzi_ciu
  AND x.ses_nmro = dr.di_solicitud
  AND dr.di_tpo_drccion = 'R'
  AND dr.di_divpol_codigo = vdp1.codazzi_ciu;
;-- -. . -..- - / . -. - .-. -.--
SELECT  nvl(vdp1.nom_ciu,'') as ciudadInmu,nvl(vdp.nom_ciu,'') as ciudadInmo,nvl(pz.pol_nmro_plza,'')
FROM slctdes_estdios x , scrsl sc,plzas pz , V_DIVISION_POLITICAS vdp , direcciones dr ,V_DIVISION_POLITICAS vdp1
where x.ses_nmro=569135
  AND pz.pol_nmro_plza = x.ses_nmro_plza
  AND sc.suc_cdgo = pz.pol_suc_cdgo
  AND sc.suc_cia_cdgo = pz.pol_suc_cia_cdgo
  AND sc.suc_div_cdgo = vdp.codazzi_ciu
  AND x.ses_nmro = dr.di_solicitud
  AND dr.di_tpo_drccion = 'R'
  AND dr.di_divpol_codigo = vdp1.codazzi_ciu;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
        ,7406377
        ,4316114
        , 569135
        ,7551577
        ,4504819
        ,4341961
        ,5113463
        ,4866328
        ,3296128)
  --AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/10/2024','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
        ,7406377
        ,4316114
        , 569135
        ,7551577
        ,4504819
        ,4341961
        ,5113463
        ,4866328
        ,3296128)
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('02/02/2025','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  --AND trunc(v.est_fcha_mra) = trunc(TO_DATE('02/02/2025','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
        )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/02/1999','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184)
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/02/1999','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/02/1999','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('04/06/2023','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  --AND trunc(v.est_fcha_mra) = trunc(TO_DATE('04/06/2023','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184)
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/03/2000','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (569135
        )
  --AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/03/2000','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (569135
        )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/09/1999','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
        v.*
    FROM
        v_abrestdcuentastt v
    WHERE
        v.est_slctud in (3296128
            )
      --AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/09/1999','DD/MM/YYYY'))
      AND v.est_crtrio_cnslta = 'S'
      AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    SUM(nvl(v.est_vlor_cia, 0) - nvl(v.est_vlor_afnzdo, 0))as total
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (3296128)
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/04/2008','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
SELECT
        v.*
    FROM
        v_abrestdcuentastt v
    WHERE
        v.est_slctud in (3296128
            )
      AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/04/2008','DD/MM/YYYY'))
      AND v.est_crtrio_cnslta = 'S'
      AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
select *
from CARPETA_UBICACION cu
where cu.NUMERO_OBLIGACION = 535184
  and cu.NUMERO_UBICACION in (43, 5);
;-- -. . -..- - / . -. - .-. -.--
select *
from CARPETA_UBICACION cu
where cu.NUMERO_OBLIGACION = 535184;
;-- -. . -..- - / . -. - .-. -.--
select COUNT(*)
from CARPETA_UBICACION cu
where ID_RESPONSABLE IS NULL;
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01';
;-- -. . -..- - / . -. - .-. -.--
select x1.*, ddv.*, x.*
from avsos_snstros x,
     ddas_vgntes_arrndmntos ddv,
     (select d.dar_nmro_slctud, d.dar_fcha_mra, d.dar_nmro_idntfccion, d.dar_tpo_idntfccion
      from ddas_arrndtrios d
      where
          d.dar_nmro_idntfccion IN (1130675922, 43908243, 1117552332, 1036634100, 43812362, 1039697895, 1098799715, 31211378)) x1
where x.sna_nmro_item = x1.dar_nmro_slctud
  and x.sna_fcha_snstro = x1.dar_fcha_mra
  and x.sna_estdo_snstro not in ('03', '04', '06')
  and x.sna_nmro_item = ddv.dva_nmro_slctud
  and x.sna_fcha_snstro = ddv.dva_fcha_mra
  and ddv.dva_estdo = '01'
  -- >>> INICIO DEL CAMBIO: Excluir las de deuda especial (43, 5) <<<
  and not exists (
    select 1
    from CARPETA_UBICACION cu
    where cu.NUMERO_OBLIGACION = x.sna_nmro_item
      --and cu.ID_RESPONSABLE = x1.dar_nmro_idntfccion
     -- and cu.TIPO_ID_RESPONSABLE = x1.dar_tpo_idntfccion
      and cu.NUMERO_UBICACION in (43, 5)
);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    v.*
FROM
    v_abrestdcuentastt v
WHERE
    v.est_slctud in (535184
    )
  AND trunc(v.est_fcha_mra) = trunc(TO_DATE('01/03/2000','DD/MM/YYYY'))
  AND v.est_crtrio_cnslta = 'S'
  AND TRIM(v.est_estado) = 'PAGADO';
;-- -. . -..- - / . -. - .-. -.--
select *
from VLRES_DDAS
where VLD_NMRO_SLCTUD = 7612528;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS_VLRES R WHERE R.RVV_NMRO_ITEM=10143329;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES R WHERE R.RVI_NMRO_ITEM IN (7612528) ORDER BY RVI_NMRO_ITEM, RVI_FCHA_MDFCCION ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_VLRES R WHERE R.RVV_NMRO_ITEM IN (7612528) ORDER BY RVV_NMRO_ITEM,RVV_FCHA_MDFCCION ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_AMPRO A WHERE A.RVA_NMRO_ITEM IN (7612528) ORDER BY RVA_NMRO_ITEM, RVA_FCHA_MDFCCION ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_AVLOR A WHERE A.RVL_NMRO_ITEM IN (7612528) ORDER BY RVL_NMRO_ITEM, RVL_FCHA_MDFCCION asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NVDDES WHERE RIVN_NMRO_ITEM IN (7612528) ORDER BY RIVN_NMRO_ITEM, RIVN_FCHA_NVDAD asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_VGNTES_NVLOR WHERE RVNV_NMRO_ITEM IN (7612528) ORDER BY RVNV_NMRO_ITEM, RVNV_FCHA_NVDAD asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM RSGOS_RCBOS R WHERE R.RIR_NMRO_ITEM = 7612528;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AMPROS_SNSTROS where AMS_NMRO_ITEM = 7612528;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AMPROS_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/01/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/07/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
select * from lqdcnes where LQD_NMRO_SLCTUD   = 10261454 AND LQD_TPO_LQDCION = '04' AND LQD_PRDO = '032025';
;-- -. . -..- - / . -. - .-. -.--
select * from lqdcnes where LQD_NMRO_SLCTUD   = 10261454;
;-- -. . -..- - / . -. - .-. -.--
select * from lqdcnes_dtlle where lqt_nmro_slctud  = 10261454;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM AMNTOS_SNSTROS A WHERE A.AMN_SLCTUD=7541338;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE --SNA_NMRO_ITEM = 10220059
  --AND TRUNC(SNA_FCHA_SNSTRO) = TO_DATE('01/10/2023', 'DD/MM/YYYY') --P_FECHA_MORA
    POL_NMRO_PLZA = 145466
  AND SNA_NMRO_SNSTRO = AMS_NMRO_SNSTRO
  AND SNA_NMRO_PLZA = POL_NMRO_PLZA;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM AVSOS_SNSTROS, AMPROS_SNSTROS, PLZAS
WHERE --SNA_NMRO_ITEM = 10220059
  --AND TRUNC(SNA_FCHA_SNSTRO) = TO_DATE('01/10/2023', 'DD/MM/YYYY') --P_FECHA_MORA
    POL_NMRO_PLZA = 145466;
;-- -. . -..- - / . -. - .-. -.--
select * from ADMSISA.AVSOS_SNSTROS where SNA_NMRO_ITEM = 7613145;
;-- -. . -..- - / . -. - .-. -.--
select * from ADMSISA.AVSOS_SNSTROS where SNA_NMRO_ITEM = 10261454;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM ADMSISA.VLRES_PGO_EFCTDOS WHERE VPE_NMRO_SNSTRO = 2023087523;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PLZAS
where POL_NMRO_PLZA in (select SNA_NMRO_PLZA from ADMSISA.AVSOS_SNSTROS where SNA_NMRO_SNSTRO = 2025028054);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PLZAS
where POL_NMRO_PLZA in (select SNA_NMRO_PLZA from ADMSISA.AVSOS_SNSTROS where SNA_NMRO_SNSTRO = 2023087523);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM pgos_efctdos_snstros WHERE PES_NMRO_SNSTRO = 2023087523;
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003;
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003 and PGS_FCHA_PGO >= TO_DATE('21/03/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS;
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003 and PGS_FCHA_PGO >= TO_DATE('21/02/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT PAR_RFRNCIA FROM PRMTROS WHERE PAR_DSCRPCION='USER_CARGUE_SIMON';
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003 and PGS_FCHA_PGO >= TO_DATE('01/09/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 10377501
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-08-2025', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE('21-NOV-24'),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE('21-11-24'),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-08-2025', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 7328799
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-08-2025', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM POLIZAS_SIMON
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_RAMO = 486
  AND ESTADO_CARGUE_SIMON = 'C' -- LISTO PARA PASAR A SAI
  AND ESTADO_CARGUE_SAI IS NULL -- PENDIENTE DE CARGUE - T - CARGUE TERMINADO
ORDER BY SECUENCIA;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100013360, 50100022942,50100024859);
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon_HI t
where substr(t.poliza_simon, 0, 11) in (50100022942);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SIM_CARGA_ERRORES
WHERE SECUENCIA_ORIGEN in (69269);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM PLZAS WHERE POL_NMRO_PLZA = 145486;
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022882%';
;-- -. . -..- - / . -. - .-. -.--
SELECT owner, trigger_name, table_name
FROM all_triggers
WHERE owner = 'ADMSISA'
  AND trigger_name LIKE '%RGOS_RCBOS%';
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
INTO V_TIP_MOV
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON);
;-- -. . -..- - / . -. - .-. -.--
describe POLIZAS_SIMON;
;
;-- -. . -..- - / . -. - .-. -.--
DESC POLIZAS_SIMON;;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    DATA_LENGTH,
    DATA_PRECISION,
    DATA_SCALE,
    NULLABLE
FROM
    ALL_TAB_COLUMNS
WHERE
    TABLE_NAME = 'POLIZAS_SIMON'
ORDER BY
    COLUMN_ID;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO POLIZAS_SIMON (
    SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
    NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
    FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
    LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
    FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
    OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
    FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
    FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION
) VALUES (
             86945, 3, 37, 486, '2', 1, 1, 29828220078, 5010002294202, 'I',
             TO_DATE('14-07-2025', 'DD-MM-YYYY'), TO_DATE('23-07-2025', 'DD-MM-YYYY'),
             TO_DATE('23-07-2026', 'DD-MM-YYYY'), 2, 11146511, 'CL 19 N 9 50 P 3 AP 1004',
             25175, '75272', 11001, 0, 'C', 'E', TO_DATE('14-07-2025', 'DD-MM-YYYY'),
             TO_DATE('14-07-2025', 'DD-MM-YYYY'), 'SIMONWEBAPP', 37, 1, 'IN',
             'Fue actualizado Registro: 14/07/2025', NULL, 'CC', 1019009832, 5010002294201,
             NULL, NULL, NULL, 'N', NULL, TO_DATE('23-07-2025', 'DD-MM-YYYY'),
             TO_DATE('23-07-2026', 'DD-MM-YYYY'), 596400, 113316, NULL, NULL
         );
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO POLIZAS_SIMON (
    SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
    NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
    FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
    LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
    FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
    OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
    FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
    FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION
) VALUES (
             86304, 3, 37, 486, '3', 0, 1, 29828220078, 5010002294202, 'I',
             TO_DATE('27-06-2025', 'DD-MM-YYYY'), TO_DATE('23-07-2025', 'DD-MM-YYYY'),
             TO_DATE('23-07-2026', 'DD-MM-YYYY'), 2, 11146511, 'CL 19 N 9 50 P 3 AP 1004',
             25175, '75272', 11001, 0, 'C', 'E', TO_DATE('28-06-2025', 'DD-MM-YYYY'),
             TO_DATE('27-06-2025', 'DD-MM-YYYY'), 'OPS$B9143145', NULL, NULL, NULL,
             'Fue actualizado Registro: 27/06/2025', NULL, 'CC', 1019009832, 5010002294201,
             NULL, NULL, NULL, 'N', NULL, TO_DATE('23-07-2025', 'DD-MM-YYYY'),
             TO_DATE('23-07-2026', 'DD-MM-YYYY'), 567000, 107730, NULL, NULL
         );
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  --AND SNA_NMRO_ITEM = 7328799
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-08-2025', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 7345020
  AND NOT EXISTS ( SELECT 'X'
                   FROM SIM_CARGA_LIQUIDACIONES
                   WHERE NUM_SINI = SNA_SNSTRO_SIMON
                     AND FECHA_PAGO = TO_DATE('22-08-2025', 'DD-MM-YYYY'))
  AND NOT EXISTS (SELECT 'X'
                  FROM SIM_CARGA_SINIESTROS B
                  WHERE B.SECUENCIA IN (SELECT X.SECUENCIA_CAR_SINI
                                        FROM SIM_CARGA_VAR_SINIESTROS A
                                                 JOIN(SELECT A.SECUENCIA_CAR_SINI,
                                                             A.COD_CAMPO AS COD_CMPO2,
                                                             A.VALOR_CAMPO AS VLOR_CMPO2
                                                      FROM SIM_CARGA_VAR_SINIESTROS A
                                                      WHERE (A.COD_CAMPO = 'FECHA_PAGO'
                                                          AND (A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD-MON-YY')
                                                              OR A.VALOR_CAMPO = TO_char(TO_DATE(TO_DATE('22-08-2025', 'DD-MM-YYYY')),'DD/MM/YY'))))X
                                                     ON X.SECUENCIA_CAR_SINI = A.SECUENCIA_CAR_SINI
                                        WHERE A.COD_CAMPO = 'CONS_SAI'
                                          AND  A.VALOR_CAMPO = PES_NMRO_SNSTRO))
  AND PES_FCHA_PGO = TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010001149708);
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010001250704);
;-- -. . -..- - / . -. - .-. -.--
UPDATE POLIZAS_SIMON SET ESTADO_CARGUE_SAI = null where TIPO_MOVIMIENTO = '3' and SECUENCIA = 86304 and NUM_SECU_POL = 29828220078 and POLIZA_SIMON = 5010002294202;
;-- -. . -..- - / . -. - .-. -.--
UPDATE POLIZAS_SIMON
SET ESTADO_CARGUE_SAI = null
where TIPO_MOVIMIENTO = '2'
  and SECUENCIA = 86945
  and NUM_SECU_POL = 29828220078
  and POLIZA_SIMON = 5010002294202;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON WHERE TIPO_MOVIMIENTO = '3' AND TIPO_POLIZA = 'I';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON WHERE POLIZA_SIMON = 5010000005702;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON WHERE substr(poliza_simon, 0, 11) in (50100000057);
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  AND P.ESTADO_CARGUE_SAI IS NULL
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA =
      (SELECT MAX(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.POLIZA_SIMON = P.POLIZA_SIMON);
;-- -. . -..- - / . -. - .-. -.--
SELECT P.SECUENCIA,
       P.ESTADO_CARGUE_SAI
INTO P_SECUENCIA_ANT,
    L_EST_CARG_SAI
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON IN ('C','A')
  AND P.ESTADO_CARGUE_SAI IS NOT NULL
  AND P.POLIZA_SIMON LIKE T_POLIZA || '%'
  AND P.FECHA_CREACION IN ( SELECT MAX(A.FECHA_CREACION)
                            FROM POLIZAS_SIMON A
                            WHERE A.COD_CIA = 3
                              AND A.COD_SECC = 37
                              AND A.COD_RAMO = 486
                              AND A.ESTADO_CARGUE_SIMON IN ('C','A')
                              AND A.ESTADO_CARGUE_SAI IS NOT NULL
                              AND A.POLIZA_SIMON LIKE T_POLIZA || '%');
;-- -. . -..- - / . -. - .-. -.--
SELECT P.SECUENCIA,
       P.ESTADO_CARGUE_SAI
INTO P_SECUENCIA_ANT,
    L_EST_CARG_SAI
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON IN ('C','A')
  AND P.ESTADO_CARGUE_SAI IS NOT NULL
  AND P.POLIZA_SIMON LIKE '50100022942' || '%'
  AND P.FECHA_CREACION IN ( SELECT MAX(A.FECHA_CREACION)
                            FROM POLIZAS_SIMON A
                            WHERE A.COD_CIA = 3
                              AND A.COD_SECC = 37
                              AND A.COD_RAMO = 486
                              AND A.ESTADO_CARGUE_SIMON IN ('C','A')
                              AND A.ESTADO_CARGUE_SAI IS NOT NULL
                              AND A.POLIZA_SIMON LIKE '50100022942' || '%');
;-- -. . -..- - / . -. - .-. -.--
select * from PGOS_SNSTROS where PGS_NMRO_PLZA = 11003 and PGS_FCHA_PGO >= TO_DATE('01/08/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/04/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100022942)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT A.ESTADO_PAGO, A.ESTADO_SOLICITUD, A.FECHA_LIMITE_PAGO, A.POLIZA, A.COBRADOR, A.*
FROM OBLIGACIONES_PAGAR A
WHERE  A.ESTADO_SOLICITUD = 'V'
  AND A.ESTADO_PAGO = 'PE'
  --AND A.SECUENCIA in ('1565594','1565592','1565593','1565591','1565594','1565593','1565592','1565591')
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898
  AND A.TIPO_IDENTIFICACION = 'CC'
  AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE)
  AND A.ESTADO_SOLICITUD = 'V';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898
  AND A.TIPO_IDENTIFICACION = 'CC'
  AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898
  AND A.TIPO_IDENTIFICACION = 'CC'
  AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TO_DATE('01/09/2025', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898
 -- AND A.TIPO_IDENTIFICACION = 'CC'
  --AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TO_DATE('01/09/2025', 'DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/09/2025','DD/MM/YYYY');
;-- -. . -..- - / . -. - .-. -.--
select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/09/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100022640);
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  --and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100023037%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  --and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022942%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM POLIZAS_SIMON
WHERE COD_CIA = P_CIA
  AND COD_SECC = P_SECCION
  AND COD_RAMO = P_RAMO
  AND ESTADO_CARGUE_SIMON = 'C' -- LISTO PARA PASAR A SAI
  AND ESTADO_CARGUE_SAI IS NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM POLIZAS_SIMON
WHERE COD_CIA = 3
  AND COD_SECC = 37
  AND COD_RAMO = 486
  AND ESTADO_CARGUE_SIMON = 'C' -- LISTO PARA PASAR A SAI
  AND ESTADO_CARGUE_SAI IS NULL;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO COBERTURAS_SIMON (SECUENCIA, SECUENCIA_COBERTURA, NUM_SECU_POL, CODIGO_COBERTURA, VALOR_ASEGURADO,
                              VALOR_PRIMA, TASA, FECHA_CREACION, USUARIO_CREACION)
VALUES (86304, 310697, 29828220078, '716', 20200000.00, 567000.00, 3.50, TIMESTAMP '2025-06-27 23:48:28', 'SYS');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM COBERTURAS_SIMON WHERE NUM_SECU_POL in (29828220078, 29828220079);
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100023037);
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100023037%';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100022942%';
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where T.FECHA_CREACION >= TO_DATE('22-08-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where T.FECHA_CREACION >= TO_DATE('22-01-2025', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where T.FECHA_CREACION >= TO_DATE('22-01-2024', 'DD-MM-YYYY');
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t WHERE T.FECHA_CARGUE IS NULL;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100022942);
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT MIN(TIPO_MOVIMIENTO)
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
  AND P.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA IN
      (SELECT MIN(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.COD_CIA = 3
         AND A.COD_SECC = 37
         AND A.COD_RAMO = 486
         AND A.ESTADO_CARGUE_SIMON = 'C'
         -- AND A.ESTADO_CARGUE_SAI IS NULL
         AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
         AND A.SOLICITUD = 11146511);
;-- -. . -..- - / . -. - .-. -.--
SELECT MIN(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.COD_CIA = 3
         AND A.COD_SECC = 37
         AND A.COD_RAMO = 486
         AND A.ESTADO_CARGUE_SIMON = 'C'
         -- AND A.ESTADO_CARGUE_SAI IS NULL
         AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
         AND A.SOLICITUD = 11146511;
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_MOVIMIENTO
FROM POLIZAS_SIMON P
WHERE P.COD_CIA = 3
  AND P.COD_SECC = 37
  AND P.COD_RAMO = 486
  AND P.ESTADO_CARGUE_SIMON = 'C'
  -- AND P.ESTADO_CARGUE_SAI IS NULL
  AND (P.FECHA_CARGUE = TRUNC(SYSDATE) OR P.FECHA_CARGUE IS NULL)
  AND P.SOLICITUD = 11146511
  AND P.SECUENCIA IN
      (SELECT MIN(A.SECUENCIA)
       FROM POLIZAS_SIMON A
       WHERE A.COD_CIA = 3
         AND A.COD_SECC = 37
         AND A.COD_RAMO = 486
         AND A.ESTADO_CARGUE_SIMON = 'C'
         -- AND A.ESTADO_CARGUE_SAI IS NULL
         AND (A.FECHA_CARGUE = TRUNC(SYSDATE) OR A.FECHA_CARGUE IS NULL)
         AND A.SOLICITUD = 11146511);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CG_REF_CODES
WHERE RV_DOMAIN = 'ESTADO_SINIESPAGO';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM CG_REF_CODES
WHERE RV_DOMAIN='ESTADO_SINIESTRO';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%5010002376101%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM PGOS_EFCTDOS_SNSTROS,
     PLZAS,
     AVSOS_SNSTROS
WHERE PES_NMRO_PLZA = POL_NMRO_PLZA
  AND POL_TPOPLZA = 'I'
  AND NVL(PES_VLOR_PGDO, 0) > 0
  AND NVL(POL_POLIZA_SIMON, 0) != 0
  AND SNA_NMRO_SNSTRO = PES_NMRO_SNSTRO
  AND SNA_NMRO_ITEM = 11202600;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO POLIZAS_SIMON (SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
                           NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
                           FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
                           LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
                           FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
                           OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
                           FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
                           FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION)
VALUES (79543, 3, 37, 486, '1', 0, 1, 29820697177, 5010002563801, 'I', DATE '2025-02-14', DATE '2025-02-01',
        DATE '2026-02-01', 1, 7613324, 'CL 6 A 32 51', 11001, '75272', 11001, 0, 'C', 'T', DATE '2025-09-30',
        DATE '2025-02-14', 'SIMONWEBAPP', null, null, null, 'Fue actualizado Registro: 24/02/2025', null, 'CC',
        41401098, null, null, null, null, 'N', null, DATE '2025-02-01', DATE '2026-02-01', 1663200.00, 316008.00,
        DATE '2025-02-24', null);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO COBERTURAS_SIMON (SECUENCIA, SECUENCIA_COBERTURA, NUM_SECU_POL, CODIGO_COBERTURA, VALOR_ASEGURADO,
                              VALOR_PRIMA, TASA, FECHA_CREACION, USUARIO_CREACION)
VALUES (79543, 265874, 29820697177, '716', 50400000.00, 1663200.00, 3.00, DATE '2025-02-24', 'SYS');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO COBERTURAS_SIMON (SECUENCIA, SECUENCIA_COBERTURA, NUM_SECU_POL, CODIGO_COBERTURA, VALOR_ASEGURADO,
                              VALOR_PRIMA, TASA, FECHA_CREACION, USUARIO_CREACION)
VALUES (79543, 265875, 29820697177, '718', 2000000.00, 0.00, 5.00, DATE '2025-02-24', 'SYS');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON where ESTADO_CARGUE_SAI is null;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO TERCEROS_SIMON (SECUENCIA, SECUENCIA_TERCERO, NUM_SECU_POL, TIPO_TERCERO, TIPO_DEUDOR,
                                     TIPO_IDENTIFICACION, NUMERO_IDENTIFICACION, FECHA_CREACION, USUARIO_CREACION,
                                     NUM_END)
VALUES (79543, 4892928, 29820697177, '2', 'I', 'CC', 80065032, TIMESTAMP '2025-05-09 09:41:23', 'SYS', 0);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO TERCEROS_SIMON (SECUENCIA, SECUENCIA_TERCERO, NUM_SECU_POL, TIPO_TERCERO, TIPO_DEUDOR,
                                     TIPO_IDENTIFICACION, NUMERO_IDENTIFICACION, FECHA_CREACION, USUARIO_CREACION,
                                     NUM_END)
VALUES (79543, 4892926, 29820697177, '1', null, 'CC', 93376331, TIMESTAMP '2025-05-09 09:41:23', 'SYS', 0);
;-- -. . -..- - / . -. - .-. -.--
SELECT TIPO_IDENTIFICACION,
       NUMERO_IDENTIFICACION
FROM TERCEROS_SIMON
WHERE SECUENCIA = 79543
  AND TIPO_TERCERO = '1';
;-- -. . -..- - / . -. - .-. -.--
select distinct substr(e.erp_error,1,300), e.erp_codigo, e.erp_dpb_ejecucion,e.erp_dpb_cod_proceso, p.prp_nombre_param, p.prp_valor, e.*
from errores_proceso_batch e,detalle_procesos_batch d, Parametros_Proceso_Batch p
where  e.erp_dpb_ejecucion= d.dpb_ejecucion
  and e.erp_dpb_ejecucion= p.prp_dpb_ejecucion
  and e.erp_dpb_cod_proceso = p.prp_dpb_cod_proceso
  -- and d.dpb_objeto ='PRC_EXPEDICION_SIMON'
  and e.erp_error like '%50100025638%'
ORDER BY ERP_FECHA_CREA DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010002563801);
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),
       PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                      DAR_TPO_IDNTFCCION) PRS_NMBRE,
       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),
       PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                      DAR_TPO_IDNTFCCION) PRS_NMBRE,
       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         4,
         'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT DAR_NMRO_IDNTFCCION,
       DAR_TPO_IDNTFCCION,  --DAR_TPO_ARRNDTRIO,
       MAX(DAR_TPO_ARRNDTRIO),
       PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION,
                                      DAR_TPO_IDNTFCCION) PRS_NMBRE,
       'N' /*NVL(GRANDE_CONTRI,'N')*/,  --DAR_FCHA_MRA
       MAX(DAR_FCHA_MRA)
--              INTO :RCC_NMRO_IDNTFCCION,
--                   :RCC_TPO_IDNTFCCION,
--                   :DAR_TPO_ARRNDTRIO,
--                   :DAR_NMBRE,
--                   :GLOBAL.SI_RICA,
--                   FechaM
FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
       DAR_TPO_ARRNDTRIO IN ('I') AND
       DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
       DVA_FCHA_MRA = DAR_FCHA_MRA)
  AND EXISTS (SELECT *
              FROM DDAS_PLZAS
              WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                AND DDP_FCHA_MRA = DAR_FCHA_MRA)
  AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                      WHERE DAR_NMRO_SLCTUD = 7162936)
--      AND ROWNUM < 2
GROUP BY DAR_NMRO_IDNTFCCION,
         DAR_TPO_IDNTFCCION,
         PRS_NMBRE,
         'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    MAX(DAR_TPO_ARRNDTRIO),
    PRS_NMBRE, -- Usamos el resultado pre-calculado
    'N',
    MAX(DAR_FCHA_MRA)
FROM (
         -- ---- INICIO DE LA SUBCONSULTA ----
         -- Aquí se calcula la función UNA SOLA VEZ
         SELECT
             DAR_NMRO_IDNTFCCION,
             DAR_TPO_IDNTFCCION,
             DAR_TPO_ARRNDTRIO,
             PK_TERCEROS.F_NOMBRESACTIVIDAD(DAR_NMRO_IDNTFCCION, DAR_TPO_IDNTFCCION) AS PRS_NMBRE,
             DAR_FCHA_MRA
         FROM DDAS_ARRNDTRIOS, DDAS_VGNTES_ARRNDMNTOS, DDAS_PLZAS
         WHERE (DAR_NMRO_SLCTUD = 7162936 AND DVA_ESTDO = '01' AND
                DAR_TPO_ARRNDTRIO IN ('I') AND
                DVA_NMRO_SLCTUD = DAR_NMRO_SLCTUD AND
                DVA_FCHA_MRA = DAR_FCHA_MRA)
           AND EXISTS (SELECT 1
                       FROM DDAS_PLZAS
                       WHERE DDP_NMRO_PLZA = DAR_NMRO_PLZA
                         AND DDP_CLSE_PLZA = DAR_CLSE_PLZA
                         AND DDP_NMRO_SLCTUD = DAR_NMRO_SLCTUD
                         AND DDP_FCHA_MRA = DAR_FCHA_MRA)
           AND DAR_FCHA_MRA = (SELECT MAX(DAR_FCHA_MRA) FROM DDAS_ARRNDTRIOS
                               WHERE DAR_NMRO_SLCTUD = 7162936)
         -- ---- FIN DE LA SUBCONSULTA ----
     ) DATOS_PRECALCULADOS
GROUP BY
    DAR_NMRO_IDNTFCCION,
    DAR_TPO_IDNTFCCION,
    PRS_NMBRE, -- Agrupamos por el resultado que ya tenemos
    'N';
;-- -. . -..- - / . -. - .-. -.--
select a.FECHA_EXPEDICION, a.*
from AEW_DEUDORES a
where FECHA_EXPEDICION is not null;
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_FCHA_CRCION > to_date('2025-07-01', 'YYYY-MM-DD')
  and PRO_NMRO_CRTFCDO in (2175756,
                           2175786,
                           2175799,
                           2175889,
                           2175905,
                           2175913,
                           2176189,
                           2176192,
                           2173887,
                           2173892,
                           2173914,
                           2173927,
                           2173928,
                           2173960,
                           2174012,
                           2174114,
                           2174213,
                           2174250,
                           2174252,
                           2174275,
                           2170349,
                           2174344,
                           2174373,
                           2174424,
                           2174450,
                           2174508,
                           2174567,
                           2174579,
                           2174601,
                           2175455,
                           2175515,
                           2175524,
                           2175531,
                           2171536,
                           2175536,
                           2175540,
                           2171566,
                           2175566,
                           2171610,
                           2175610,
                           2175695,
                           2175205,
                           2175245,
                           2175315,
                           2175337,
                           2171343,
                           2175340,
                           2175417,
                           2174970,
                           2174996,
                           2175008,
                           2175010,
                           2175088
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from PRVSION_PRMAS
where PRO_NMRO_CRTFCDO in (2175756,
                           2175786,
                           2175799,
                           2175889,
                           2175905,
                           2175913,
                           2176189,
                           2176192,
                           2173887,
                           2173892,
                           2173914,
                           2173927,
                           2173928,
                           2173960,
                           2174012,
                           2174114,
                           2174213,
                           2174250,
                           2174252,
                           2174275,
                           2170349,
                           2174344,
                           2174373,
                           2174424,
                           2174450,
                           2174508,
                           2174567,
                           2174579,
                           2174601,
                           2175455,
                           2175515,
                           2175524,
                           2175531,
                           2171536,
                           2175536,
                           2175540,
                           2171566,
                           2175566,
                           2171610,
                           2175610,
                           2175695,
                           2175205,
                           2175245,
                           2175315,
                           2175337,
                           2171343,
                           2175340,
                           2175417,
                           2174970,
                           2174996,
                           2175008,
                           2175010,
                           2175088
    );
;-- -. . -..- - / . -. - .-. -.--
select * from ADMSISA.SBMDLOS
where SMD_DSCRPCION LIKE '%FACTURACION%SINIESTRO%';
;-- -. . -..- - / . -. - .-. -.--
SELECT F1.*
FROM FCHAS_PGO F1
WHERE F1.FPG_ESTDO = 'V'
  AND F1.MARCA_CIERRE_OPRCION = 'S';
;-- -. . -..- - / . -. - .-. -.--
select *
from PLZAS
where POL_NMRO_SLCTUD IN (7460532, 7679589, 7651704, 7096179, 10729874, 10874390, 7611439);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM RSGOS_VGNTES R
WHERE R.RVI_NMRO_ITEM = 5085913;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM RSGOS_VGNTES R
WHERE R.RVI_NMRO_ITEM = 10563845;
;-- -. . -..- - / . -. - .-. -.--
select *
from rsgos_vgntes r
where r.rvi_nmro_plza = 10160;
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- SUM(vlq_vlor * lqt_nmro_dias) Total_siniestros
FROM lqdcnes, lqdcnes_dtlle, vlres_lqdcion, avsos_snstros
WHERE lqd_nmro_slctud = 5085913
--  AND lqd_fcha_pgo = TO_DATE('28/05/25', 'DD/MM/YY')  -- :lqd_fcha_pgo
  AND lqd_nmro_slctud = lqt_nmro_slctud
  AND lqd_tpo_lqdcion = lqt_tpo_lqdcion
  AND lqd_prdo = lqt_prdo
  AND lqt_nmro_snstro = sna_nmro_snstro
  AND sna_estdo_snstro NOT IN ('04','06')
  AND lqt_nmro_slctud = vlq_nmro_slctud
  AND lqt_tpo_lqdcion = vlq_tpo_lqdcion
  AND lqt_prdo = vlq_prdo
  AND lqt_serie = vlq_serie
  AND vlq_cncpto_vlor IN ('01','02');
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- SUM(vlq_vlor * lqt_nmro_dias) Total_siniestros
FROM lqdcnes, lqdcnes_dtlle, vlres_lqdcion, avsos_snstros
WHERE lqd_nmro_slctud = 5085914
--  AND lqd_fcha_pgo = TO_DATE('28/05/25', 'DD/MM/YY')  -- :lqd_fcha_pgo
  AND lqd_nmro_slctud = lqt_nmro_slctud
  AND lqd_tpo_lqdcion = lqt_tpo_lqdcion
  AND lqd_prdo = lqt_prdo
  AND lqt_nmro_snstro = sna_nmro_snstro
  AND sna_estdo_snstro NOT IN ('04','06')
  AND lqt_nmro_slctud = vlq_nmro_slctud
  AND lqt_tpo_lqdcion = vlq_tpo_lqdcion
  AND lqt_prdo = vlq_prdo
  AND lqt_serie = vlq_serie
  AND vlq_cncpto_vlor IN ('01','02');
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- SUM(vlq_vlor * lqt_nmro_dias) Total_siniestros
FROM lqdcnes, lqdcnes_dtlle, vlres_lqdcion, avsos_snstros
WHERE lqd_nmro_slctud = 5085915
--  AND lqd_fcha_pgo = TO_DATE('28/05/25', 'DD/MM/YY')  -- :lqd_fcha_pgo
  AND lqd_nmro_slctud = lqt_nmro_slctud
  AND lqd_tpo_lqdcion = lqt_tpo_lqdcion
  AND lqd_prdo = lqt_prdo
  AND lqt_nmro_snstro = sna_nmro_snstro
  AND sna_estdo_snstro NOT IN ('04','06')
  AND lqt_nmro_slctud = vlq_nmro_slctud
  AND lqt_tpo_lqdcion = vlq_tpo_lqdcion
  AND lqt_prdo = vlq_prdo
  AND lqt_serie = vlq_serie
  AND vlq_cncpto_vlor IN ('01','02');
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- SUM(vlq_vlor * lqt_nmro_dias) Total_siniestros
FROM lqdcnes, lqdcnes_dtlle, vlres_lqdcion, avsos_snstros
WHERE lqd_nmro_slctud = 5085916
--  AND lqd_fcha_pgo = TO_DATE('28/05/25', 'DD/MM/YY')  -- :lqd_fcha_pgo
  AND lqd_nmro_slctud = lqt_nmro_slctud
  AND lqd_tpo_lqdcion = lqt_tpo_lqdcion
  AND lqd_prdo = lqt_prdo
  AND lqt_nmro_snstro = sna_nmro_snstro
  AND sna_estdo_snstro NOT IN ('04','06')
  AND lqt_nmro_slctud = vlq_nmro_slctud
  AND lqt_tpo_lqdcion = vlq_tpo_lqdcion
  AND lqt_prdo = vlq_prdo
  AND lqt_serie = vlq_serie
  AND vlq_cncpto_vlor IN ('01','02');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM avsos_snstros;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM avsos_snstros WHERE SNA_ESTDO_SNSTRO = '02' AND SNA_ESTDO_PGO = '01';
;-- -. . -..- - / . -. - .-. -.--
SELECT * -- SUM(vlq_vlor * lqt_nmro_dias) Total_siniestros
FROM lqdcnes, lqdcnes_dtlle, vlres_lqdcion, avsos_snstros
WHERE lqd_nmro_slctud = 5085917
--  AND lqd_fcha_pgo = TO_DATE('28/05/25', 'DD/MM/YY')  -- :lqd_fcha_pgo
  AND lqd_nmro_slctud = lqt_nmro_slctud
  AND lqd_tpo_lqdcion = lqt_tpo_lqdcion
  AND lqd_prdo = lqt_prdo
  AND lqt_nmro_snstro = sna_nmro_snstro
  AND sna_estdo_snstro NOT IN ('04','06')
  AND lqt_nmro_slctud = vlq_nmro_slctud
  AND lqt_tpo_lqdcion = vlq_tpo_lqdcion
  AND lqt_prdo = vlq_prdo
  AND lqt_serie = vlq_serie
  AND vlq_cncpto_vlor IN ('01','02');