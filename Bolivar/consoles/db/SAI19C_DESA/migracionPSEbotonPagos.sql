SELECT P."NIT COMPANIA", P.* FROM PAGOS_LINEA_LIBERTADOR P;

SELECT * FROM DETALLES_PAGO;

SELECT A.ESTADO_PAGO, A.ESTADO_SOLICITUD, A.FECHA_LIMITE_PAGO, A.POLIZA, A.COBRADOR, A.*
FROM OBLIGACIONES_PAGAR A
WHERE  A.ESTADO_SOLICITUD = 'V'
  AND A.ESTADO_PAGO = 'PE'
  --AND A.SECUENCIA in ('1565594','1565592','1565593','1565591','1565594','1565593','1565592','1565591')
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE);

select f_telefono_suc(2103, 99) from dual;

SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'OBLIGACIONES_PAGAR';

SELECT  B.NUMERO_LIQUIDACION LIQUIDA, B.CODIGO_BARRAS, B.SECUENCIA
FROM OBLIGACIONES_PAGAR A, LIQUIDACIONES_OBLIGACION B
WHERE A.SECUENCIA = B.SECUENCIA
  AND B.SECUENCIA in (1558144);
 -- AND B.NUMERO_LIQUIDACION = 180003415
--AND B.CODIGO_BARRAS IS NOT NULL;


SELECT C.CODIGO_CONCEPTO,
       C.DESCRIPCION_CONCEPTO,
       TO_CHAR(C.FECHA_DESDE_CONCEPTO, 'DD-MM-YYYY') F_DESDE,
       TO_CHAR(C.FECHA_HASTA_CONCEPTO, 'DD-MM-YYYY') F_HASTA,
       C.VALOR_CONCEPTO VALOR
FROM CONCEPTOS_LIQUIDACION C
---WHERE C.SECUENCIA = V_SECUENCIA;  jdcb  julio 30 2013
WHERE C.NUMERO_LIQUIDACION = 504601039;
--OBLIGACIONES_PAGAR
--LIQUIDACIONES_OBLIGACION

SELECT B.VALOR, B.*
FROM CODIGO_BARRAS B
WHERE NUMERO_LIQUIDACION = 504601038
  AND SECUENCIA = 1558144
 AND IDENTIFICADOR = 415;

SELECT * FROM PARAMETRIZACION WHERE NOMBRE in ('COD_RECAUDO_PADRE', 'COD_RECAUDO_HIJO');

SELECT * FROM prmtros where PAR_RFRNCIA in ('COD_RECAUDO_PADRE', 'COD_RECAUDO_HIJO');

SELECT * FROM prmtros where PAR_RFRNCIA LIKE 'COD_RECAUDO_PADRE%';

SELECT * FROM prmtros where PAR_RFRNCIA LIKE 'COD_RECAUDO_HIJO%';


SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION' AND COD_RAMO = 777;

/*
INSERT INTO ADMSISA.PAGOS_LINEA_LIBERTADOR (SECUENCIA_PAGO, FECHA_INSERCION, VALOR_A_PAGAR, VALOR_IVA,
                                            CODIGO_TRANSACCION, ESTADO_TRANSACCION, FECHA_TRANSACCION,
                                            TIPO_IDENTIFICACION, NUMERO_IDENTIFICACION, "NIT COMPANIA", NOMBRE_COMPANIA,
                                            CODIGO_PRODUCTO, DESCRIPCION_PRODUCTO, CICLO_TRANSACCION, USUARIO,
                                            FECHA_CREACION, REFERENCIA)
VALUES (V_CONSECUTIVO, TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDD')), V_TOTAL_PAGO, 0, NULL, 'PENDING', NULL, P_TIP_IDEN,
        P_IDENT, '8600359771', 'INVESTIGACIONES Y COBRANZAS EL LIBERTADOR', V_COD_RECAUDO_PADRE,
        V_DESC_PROD, NULL, NULL, SYSDATE, NULL);
*/
SELECT SEQ_LOG_PAGOS_LINEA_LIBERTADOR.NEXTVAL
FROM DUAL;

SELECT A.SOLICITUD,
       B.NUMERO_LIQUIDACION LIQUIDA,
       B.VALOR_LIQUIDACION,
       B.IDENTIFICACION,
       B.SECUENCIA,
       A.NUMERO_IDENTIFICACION,
       A.TIPO_IDENTIFICACION
       ,B.*
FROM OBLIGACIONES_PAGAR A, LIQUIDACIONES_OBLIGACION B
WHERE A.SECUENCIA = B.SECUENCIA
    --AND B.SECUENCIA IN ('1565594','1565592','1565593','1565591','1565594','1565593','1565592','1565591')
    --AND A.NUMERO_IDENTIFICACION = 1017133252
   AND A.NUMERO_IDENTIFICACION = 900329205
   AND A.TIPO_IDENTIFICACION = 'NT'
  AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE)
  AND A.ESTADO_SOLICITUD = 'V'
ORDER BY B.COMPANIA;


SELECT J.DIGITO_CHEQUEO, J.*
FROM JURIDICOS J
WHERE NUMERO_DOCUMENTO IN ('860002180','860035977');


SELECT SEQ_PAGOS_LINEA_LIBERTADOR.NEXTVAL
FROM DUAL;

SELECT * FROM PAGOS_LINEA_LIBERTADOR WHERE CODIGO_TRANSACCION = -1;

SELECT * FROM DETALLES_PAGO;

--ALTER TABLE PAGOS_LINEA_LIBERTADOR RENAME COLUMN NIT_COMPANIA TO  "NIT COMPANIA" ;


select * from cmpnias;
'42'

TIPO_PAGO = 'O', 'P'

DELETE FROM PRMTROS
WHERE PAR_CDGO = '1'
  AND PAR_MDLO = '14'
  AND PAR_VLOR1 = 777005
  AND PAR_SUC_CDGO = '2501'
  AND PAR_SUC_CIA_CDGO = '40'
  AND PAR_RFRNCIA = 'COD_RECAUDO_PADRE_O';
INSERT INTO PRMTROS (PAR_CDGO, PAR_MDLO, PAR_VLOR1, PAR_SUC_CDGO, PAR_SUC_CIA_CDGO, PAR_TPO_PRMTRO,
                     PAR_DSCRPCION, PAR_VLOR2, PAR_VLOR_RFRNCIA, PAR_RFRNCIA, PAR_USRIO, PAR_FCHA_ACTLZCION,
                     PAR_FCHA_CREACION)
VALUES ('1', '14', 777005, '2501', '40', 'U',
        'recaudos de obligaciones', null, null, 'COD_RECAUDO_PADRE_O',
        'ADMSISA', SYSDATE, SYSDATE);

DELETE FROM PRMTROS
WHERE PAR_CDGO = '1'
  AND PAR_MDLO = '14'
  AND PAR_VLOR1 = 7006
  AND PAR_SUC_CDGO = '2501'
  AND PAR_SUC_CIA_CDGO = '40'
  AND PAR_RFRNCIA = 'COD_RECAUDO_PADRE_P';
INSERT INTO PRMTROS (PAR_CDGO, PAR_MDLO, PAR_VLOR1, PAR_SUC_CDGO, PAR_SUC_CIA_CDGO, PAR_TPO_PRMTRO,
                     PAR_DSCRPCION, PAR_VLOR2, PAR_VLOR_RFRNCIA, PAR_RFRNCIA, PAR_USRIO, PAR_FCHA_ACTLZCION,
                     PAR_FCHA_CREACION)
VALUES ('1', '14', 7006, '2501', '40', 'U',
        'recaudos de primas', null, null, 'COD_RECAUDO_PADRE_P',
        'ADMSISA', SYSDATE, SYSDATE);

COMMIT;

SELECT * FROM prmtros where PAR_RFRNCIA LIKE 'COD_RECAUDO_PADRE%';

select * from v_transacciones_historicas;

select * from LOG_PAGOS_LINEA_LIBERTADOR;


SELECT COUNT(A.SOLICITUD),
       A.NUMERO_IDENTIFICACION
FROM OBLIGACIONES_PAGAR A, LIQUIDACIONES_OBLIGACION B
WHERE A.SECUENCIA = B.SECUENCIA
  --AND B.SECUENCIA IN ('1565594','1565592','1565593','1565591','1565594','1565593','1565592','1565591')
  --AND A.NUMERO_IDENTIFICACION = 1017133252
  --AND A.NUMERO_IDENTIFICACION = 900329205
  --AND A.TIPO_IDENTIFICACION = 'NT'
  --AND A.ESTADO_PAGO = 'PE'
  --AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE)
  AND A.ESTADO_SOLICITUD = 'V'
GROUP BY A.NUMERO_IDENTIFICACION;


SELECT
       A.*
FROM OBLIGACIONES_PAGAR A
WHERE
 A.NUMERO_IDENTIFICACION = 16077528
  AND A.TIPO_IDENTIFICACION = 'CC'
  AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE)
  AND A.ESTADO_SOLICITUD = 'V';

select * from TIPOS_DOCUMENTO;


----------------------------consults resultado pago----------------------------
select *
from pagos_linea_libertador p
where p.secuencia_pago = 40 ;

select *
from detalles_pago d
where d.secuencia_pago=40;


select *
from liquidaciones_obligacion l
where l.secuencia =1565731;


select *
from rcbos_cja r
where r.rcc_nmro_rcbo in (504742128, 504742129);

select *
from cncptos_dtlle_rcbos c
where c.cdr_nmro_rcbo


select * from a5021113 a
where a.NUM_LIQUIDACION in (504742128, 504742129);


select *
from a5021115 b
where b.NUM_LIQUIDACION in (504742128, 504742129);


select *
from rlcion_rcbos_cja r
where r.rlr_nmro_rcbo_invesa = 504742129


select * from obligaciones_pagar o
where o.secuencia=1565891 for update;

update pagos_linea_libertador p
set p.estado_transaccion = 'INICIO'
where p.secuencia_pago = 30 ;

select i.inc_fcha_cntble, i.inc_cnta_cntble, i.inc_dbto, i.inc_crdto
from intrfaz_cntble i
where i.inc_dcmnto = '504742129';

select *
from fctras f
where f.fac_nmro_fctra = 544210
  and f.fac_suc_cdgo = '2501';

select *
from factura_electronica_libertador f
where f.nro_factura_sai =  544210
  and f.sucursal = '2501';
----------------------------------------------------------------------------------------------------------

SELECT *
FROM USER_DEPENDENCIES
WHERE REFERENCED_NAME = 'TYPE_PAGOS_LINEA';

SELECT * FROM PAGOS_LINEA_LIBERTADOR;

select * from intrfaz_cntble;

SELECT *
FROM OBLIGACIONES_PAGAR
WHERE NUMERO_IDENTIFICACION = 900204407
  AND TIPO_IDENTIFICACION = 'NT'
  --AND SOLICITUD = P_SOLICITUD
  AND ESTADO_PAGO = 'PE'
  AND TRUNC(FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE) --IMPORTANTE COMENTADO PARA PRUEBAS
  AND ESTADO_SOLICITUD = 'V'
  AND ORIGEN_RECAUDO <> 'P';

SELECT DB_LINK, USERNAME, HOST
FROM ALL_DB_LINKS;

SELECT t.*
FROM V_EXTRACTO_CUENTA t
where trunc(t.FECHA_LIMITE) > trunc(sysdate)
  --and to_char(t.FECHA_PAGO,'mm/yyyy') >= '09/2024'
  and trunc(t.FECHA_PAGO) >= to_date('01/07/2024', 'dd/mm/yyyy')
  and deuda > 0;

select * from PARAMETRO_SAI t WHERE ID = 'IMPR';


SELECT
    p.secuencia_pago,
    p.estado_transaccion,
    O.SECUENCIA,
    o.tipo_identificacion,
    o.numero_identificacion,
    PK_TERCEROS.F_NOMBRES(O.NUMERO_IDENTIFICACION, O.TIPO_IDENTIFICACION),
    o.solicitud,
    o.valor,
    o.estado_solicitud,
    o.estado_pago,
    d.secuencia_obligacion
--BULK COLLECT INTO C_OBLIGACIONES
FROM pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o
where p.ESTADO_TRANSACCION = 'APROBADO'
  and p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia;

SELECT lote, cod_cajero
FROM a5020037
WHERE cod_cia = 3
  AND tipo_cajero = 'P'
  AND mca_ultimo = 'S'
  AND mca_estado = 'A';

select P.SECUENCIA_PAGO secuencia,
       p.estado_transaccion,
       p.fecha_creacion,
       p.fecha_transaccion,
       P.BANCO,
       P.METODO_PAGO,
       p.codigo_transaccion,
       r.rcc_nmro_rcbo,
       r.rcc_cia_cdgo,
       r.rcc_tpo_rcbo,
       r.rcc_fcha_rcbo,
       r.rcc_vlor_rcbo,
       r.rcc_estdo_rcbo,
       a.MCA_ESTADO,
       a.FEC_ASIENTO,
       a.DOCUMENTO
from pagos_linea_libertador p,
     detalles_pago d,
     obligaciones_pagar o,
     liquidaciones_obligacion l,
     rcbos_cja r,
     a5021113@PSAI_PTRON_TRON.WORLD a
where p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia = l.secuencia
  and l.numero_liquidacion = r.rcc_nmro_rcbo
  and l.compania = r.rcc_cia_cdgo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION;

select o.ESTADO_PAGO, O.SECUENCIA, r.rcc_estdo_rcbo, l.*
from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113@PSAI_PTRON_TRON.WORLD a
where p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia = l.secuencia
  and p.estado_transaccion = 'APROBADO'
  and l.numero_liquidacion= r.rcc_nmro_rcbo
  and l.compania = r.rcc_cia_cdgo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION
  and a.documento is null;

SELECT *
FROM LIQUIDACIONES_TESORERIA
WHERE LIQUIDACION = 504621919
  and FECHA_CREACION >= TO_DATE('13/01/2025 13:00:00', 'DD/MM/YYYY HH24:MI:SS');


select * from MSJAPI_MENSAJERIA;

select * from FCHAS_PGO;