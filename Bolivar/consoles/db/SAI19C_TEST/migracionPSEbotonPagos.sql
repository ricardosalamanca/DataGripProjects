
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
  AND B.SECUENCIA in (1565888);
 -- AND B.NUMERO_LIQUIDACION = 180003415
--AND B.CODIGO_BARRAS IS NOT NULL;

SELECT  A.*
FROM OBLIGACIONES_PAGAR A
WHERE A.SECUENCIA in (1565888);

-----Rcibo para  91109568 ORTIZ BARRAGAN GIOVANNI  ******RECIBO POR HONORARIOS COSTAS Soy TEXTO LIBERTADOR !"#$%&& ÁÉÍÓÚ


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

SELECT SEQ_PAGOS_LINEA_LIBERTADOR.NEXTVAL FROM DUAL;

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
    AND B.SECUENCIA IN ('1565594','1565592','1565593','1565591','1565594','1565593','1565592','1565591')
    AND A.NUMERO_IDENTIFICACION = 1017133252
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

SELECT * FROM PAGOS_LINEA_LIBERTADOR;

SELECT * FROM DETALLES_PAGO;

--ALTER TABLE PAGOS_LINEA_LIBERTADOR RENAME COLUMN NIT_COMPANIA TO  "NIT COMPANIA" ;


select * from cmpnias;
'42'

TIPO_PAGO = 'O', 'P'



COMMIT;

SELECT * FROM prmtros where PAR_RFRNCIA LIKE 'COD_RECAUDO_PADRE%';

select * from v_transacciones_historicas;

select * from LOG_PAGOS_LINEA_LIBERTADOR;

SELECT
    A.*
FROM OBLIGACIONES_PAGAR A
WHERE
    A.NUMERO_IDENTIFICACION = 901158898
 -- AND A.TIPO_IDENTIFICACION = 'CC'
  --AND A.ESTADO_PAGO = 'PE'
  AND TRUNC(A.FECHA_LIMITE_PAGO) >= TO_DATE('01/09/2025', 'DD/MM/YYYY');
  AND A.ESTADO_SOLICITUD = 'V';

select * from FCHAS_PGO where FPG_FCHA_PGO >= TO_DATE('01/09/2025','DD/MM/YYYY') AND TIPO_CIERRE='A';

SELECT P."NIT COMPANIA", P.* FROM PAGOS_LINEA_LIBERTADOR P;

select * from LOG_PAGOS_LINEA_LIBERTADOR;

SELECT
       O.SECUENCIA,
       o.tipo_identificacion,
       o.numero_identificacion,
       o.solicitud,
       o.valor,
       o.estado_solicitud,
       o.estado_pago
FROM pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o
where p.secuencia_pago = 26
  and p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia;


SELECT * FROM PAGOS_LINEA_LIBERTADOR;

----------------------------consults resultado pago----------------------------
select *
from pagos_linea_libertador p
where p.secuencia_pago = 58 ;

select *
from detalles_pago d
where d.secuencia_pago=58;


select *
from liquidaciones_obligacion l
where l.secuencia in ('1565833','1565895');


select *
from rcbos_cja r
where r.rcc_nmro_rcbo in (504742454,504742455,500374705,504742734);

select *
from cncptos_dtlle_rcbos c
where c.cdr_nmro_rcbo


select * from a5021113 a
where a.NUM_LIQUIDACION  in (504742454,504742455,500374705,504742734);


select *
from a5021115 b
where b.NUM_LIQUIDACION  in (504742454,504742455,500374705,504742734);


select *
from rlcion_rcbos_cja r
where r.rlr_nmro_rcbo_invesa = 500374705


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

SELECT POL_FCTRA_MNSUAL
FROM PLZAS
WHERE POL_NMRO_PLZA = 1021
  AND POL_CDGO_CLSE = '00'
  AND POL_RAM_CDGO = '12';

SELECT O.ESTADO_PAGO
FROM LIQUIDACIONES_OBLIGACION L, OBLIGACIONES_PAGAR O
WHERE L.NUMERO_LIQUIDACION = 500374705
  AND L.SECUENCIA = O.SECUENCIA;

select * from LIQUIDACIONES_OBLIGACION where NUMERO_LIQUIDACION = 500374705;

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
where p.secuencia_pago = 58
  and p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia;

select * from pagos_linea_libertador where secuencia_pago = 58;

select * from obligaciones_pagar where secuencia in (1566094);


SELECT *
FROM USER_DEPENDENCIES
WHERE REFERENCED_NAME = 'TYPE_PAGOS_LINEA';

----buscar nit para procesar
select o.solicitud, o.secuencia, o.valor, o.fecha_limite_pago, o.numero_identificacion, o.tipo_identificacion, o.nombre_obligado,  pk_terceros.f_nombres(o.numero_identificacion, o.tipo_identificacion) nombre
from obligaciones_pagar o
--, liquidaciones_obligacion lDATE ESTADO_PAGO = 'PA' WHERE

where o.estado_solicitud = 'V'
  and o.estado_pago = 'PE'
  and trunc(o.fecha_generacion) >= to_date('01/09/2024','dd/mm/yyyy');

SELECT i.inc_cmpnia, i.inc_agncia, i.inc_dcmnto, i.inc_fcha_cntble, i.inc_cnta_cntble, i.inc_dbto, i.inc_crdto
FROM INTRFAZ_CNTBLE i
WHERE i.INC_FCHA_CNTBLE >= TO_DATE('01/11/2024', 'DD/MM/YYYY')
  and i.inc_asnto = 'RAR'
  and i.inc_dcmnto in ('504743128') -- Aquí va el número de todas las liquidaciones
ORDER BY i.inc_dcmnto, INC_FCHA_CNTBLE DESC;

SELECT *
FROM OBLIGACIONES_PAGAR
WHERE NUMERO_IDENTIFICACION = 900204407
  AND TIPO_IDENTIFICACION = 'NT'
  --AND SOLICITUD = P_SOLICITUD
  AND ESTADO_PAGO = 'PE'
  AND TRUNC(FECHA_LIMITE_PAGO) >= TRUNC(SYSDATE) --IMPORTANTE COMENTADO PARA PRUEBAS
  AND ESTADO_SOLICITUD = 'V'
  AND ORIGEN_RECAUDO <> 'P';


select * from a5021115
where NUM_LIQUIDACION IN (504743258,504743259,
                          504743260,
                          504743261,
                          504743262,
                          504743263,504743269,
                          504743312);

select * from a5021113
where NUM_LIQUIDACION  IN (504743258,504743259,
                           504743260,
                           504743261,
                           504743262,
                           504743263,504743269,
                           504743312);

select * from a5021115
where NUM_LIQUIDACION IN (504743291);

select * from a5021113
where NUM_LIQUIDACION  IN (504743291);

SELECT  A.*
FROM OBLIGACIONES_PAGAR A
WHERE ESTADO_PAGO            = 'PA';


select * from INCONSISTENCIAS_PAGOS where NUMERO_LIQUIDACION in (504743258,504743259,
                                                                504743260,
                                                                504743261,
                                                                504743262,
                                                                504743263,504743269,
                                                                504743312);

select * from LOG_PAGOS_LINEA_LIBERTADOR where FECHA_ERROR >= TO_DATE('25/11/2024', 'DD/MM/YYYY');

SELECT DB_LINK, USERNAME, HOST
FROM ALL_DB_LINKS;

SELECT t.*
FROM V_EXTRACTO_CUENTA t
where trunc(t.FECHA_LIMITE) > trunc(sysdate)
  --and to_char(t.FECHA_PAGO,'mm/yyyy') >= '09/2024'
  and trunc(t.FECHA_PAGO) >= to_date('01/07/2024', 'dd/mm/yyyy')
  and deuda > 0;

select * from PARAMETRO_SAI t WHERE ID = 'IMPR';

UPDATE PARAMETRO_SAI SET VALOR = 'https://botonpse.ellibertador.co/liquidacion/' WHERE ID = 'IMPR';

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


select  p.secuencia_pago, o.ESTADO_PAGO, O.SECUENCIA, p.estado_transaccion, r.rcc_estdo_rcbo, l.*
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
  and FECHA_CREACION >= TO_DATE('31/12/2024 13:50:00', 'DD/MM/YYYY HH24:MI:SS');

select * from obligaciones_pagar where secuencia in (1566214, 1566173, 1566225, 1566214);


select *
from pagos_linea_libertador p
where p.codigo_transaccion IN (11497288, 74564, 11499452);

SELECT *
FROM DETALLES_PAGO
WHERE SECUENCIA_PAGO IN (select SECUENCIA_PAGO
                         from pagos_linea_libertador p
                         where p.codigo_transaccion IN (11497288, 74564, 11499452));

select p.secuencia_pago, p.estado_transaccion, p.fecha_transaccion, p.valor_a_pagar, r.rcc_nmro_rcbo, r.rcc_estdo_rcbo, r.rcc_fcha_rcbo, a.MCA_ESTADO, a.DOCUMENTO
from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
where p.codigo_transaccion IN (11497288, 74564, 11499452)
  and p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia= l.secuencia
  and l.numero_liquidacion = r.rcc_nmro_rcbo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION;

select * from registro_pagos_davivienda where referencia1 like '%11497288%';
select * from registro_pagos_davivienda where referencia1 like '%74564%';
select * from registro_pagos_davivienda where referencia1 like '%11499452%';

----------------validacion de facturas
select p.secuencia_pago,p.codigo_transaccion, p.estado_transaccion, p.fecha_transaccion, p.valor_a_pagar, r.rcc_nmro_rcbo, r.rcc_estdo_rcbo, r.rcc_suc_cdgo, r.rcc_fcha_rcbo, a.MCA_ESTADO, a.DOCUMENTO
from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
where p.numero_identificacion = 1035438031
--p.codigo_transaccion IN (11497288, 74564, 11499452)
  and  p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia= l.secuencia
  and l.numero_liquidacion = r.rcc_nmro_rcbo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION;
select *
from rlcion_rcbos_cja r
where r.rlr_nmro_rcbo_invesa = 505044577;
select *
from fctras f
where f.fac_nmro_fctra = 587518
  and f.fac_suc_cdgo ='0513';
select e.nro_factura_dian, e.fecha_factura, e.estado
from factura_electronica_libertador e
where e.nro_factura_sai =587518
  and e.sucursal = '0513';


select *
from fctras f
where f.fac_nmro_fctra in (select RLR_NMRO_FCTRA
                           from rlcion_rcbos_cja r
                           where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                            from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
                                                            where p.numero_identificacion = 1035438031
                                                              and  p.secuencia_pago = d.secuencia_pago
                                                              and d.secuencia_obligacion = o.secuencia
                                                              and o.secuencia= l.secuencia
                                                              and l.numero_liquidacion = r.rcc_nmro_rcbo
                                                              and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION))
  and f.fac_suc_cdgo ='0513';
select e.nro_factura_dian, e.fecha_factura, e.estado, e.*
from factura_electronica_libertador e
where e.nro_factura_sai in (select RLR_NMRO_FCTRA
                            from rlcion_rcbos_cja r
                            where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo, r.*, l.*
                                                             from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
                                                             where p.numero_identificacion = 1035438031
                                                               and  p.secuencia_pago = d.secuencia_pago
                                                               and d.secuencia_obligacion = o.secuencia
                                                               and o.secuencia= l.secuencia
                                                               and l.numero_liquidacion = r.rcc_nmro_rcbo
                                                               and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION))
  and e.sucursal = '0513';



select *
from aew_deudores a
WHERE A.NUM_DOCUMENTO in (72190930, 45451443);
  -- A.FECTERMS_CONDICIONES >= to_date('01/01/2024', 'dd/mm/yyyy');
select *
from aew_estudios w
where w.solicitud IN (select SOLICITUD
                      from aew_deudores a
                      WHERE A.NUM_DOCUMENTO in (72190930, 45451443));

select w.NMRO_LIQUIDACION, w.*
from aew_estudios w
where w.NMRO_LIQUIDACION is not null
      and w.FECHA_LIQUIDACION >= to_date('01/01/2024', 'dd/mm/yyyy');

select *
from rlcion_rcbos_cja r
where r.rlr_nmro_rcbo_invesa = 505044577;

select p.secuencia_pago, p.estado_transaccion, p.fecha_transaccion, p.valor_a_pagar, r.rcc_nmro_rcbo, r.rcc_estdo_rcbo, r.rcc_fcha_rcbo, a.MCA_ESTADO, a.DOCUMENTO
from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
where  p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia= l.secuencia
  and l.numero_liquidacion in (select w.NMRO_LIQUIDACION
                               from aew_estudios w
                               where w.solicitud in (select SOLICITUD
                                                     from aew_deudores a
                                                     WHERE A.NUM_DOCUMENTO in (72190930, 45451443)))
  and l.numero_liquidacion = r.rcc_nmro_rcbo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION;



select *
from fctras f
where f.fac_nmro_fctra in (select RLR_NMRO_FCTRA
                           from rlcion_rcbos_cja r
                           where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                            from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
                                                            where  p.secuencia_pago = d.secuencia_pago
                                                              and d.secuencia_obligacion = o.secuencia
                                                              and o.secuencia= l.secuencia
                                                              and l.numero_liquidacion in (select w.NMRO_LIQUIDACION
                                                                                           from aew_estudios w
                                                                                           where w.solicitud in (select SOLICITUD
                                                                                                                 from aew_deudores a
                                                                                                                 WHERE A.NUM_DOCUMENTO in (72190930, 45451443)))
                                                              and l.numero_liquidacion = r.rcc_nmro_rcbo
                                                              and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION));
select e.nro_factura_dian, e.fecha_factura, e.estado
from factura_electronica_libertador e
where e.nro_factura_sai in (select RLR_NMRO_FCTRA
                            from rlcion_rcbos_cja r
                            where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                             from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
                                                             where  p.secuencia_pago = d.secuencia_pago
                                                               and d.secuencia_obligacion = o.secuencia
                                                               and o.secuencia= l.secuencia
                                                               and l.numero_liquidacion in (select w.NMRO_LIQUIDACION
                                                                                            from aew_estudios w
                                                                                            where w.solicitud in (select SOLICITUD
                                                                                                                  from aew_deudores a
                                                                                                                  WHERE A.NUM_DOCUMENTO in (72190930, 45451443)))
                                                               and l.numero_liquidacion = r.rcc_nmro_rcbo
                                                               and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION));



select r.rcc_nmro_rcbo
from pagos_linea_libertador p, detalles_pago d, obligaciones_pagar o, liquidaciones_obligacion l, rcbos_cja r, a5021113 a
where  p.secuencia_pago = d.secuencia_pago
  and d.secuencia_obligacion = o.secuencia
  and o.secuencia= l.secuencia
  and l.numero_liquidacion in (210004289)
  and l.numero_liquidacion = r.rcc_nmro_rcbo
  and r.rcc_nmro_rcbo = a.NUM_LIQUIDACION;

select *
from liquidaciones_obligacion l,
     rcbos_cja r
where l.numero_liquidacion = r.rcc_nmro_rcbo
  and l.numero_liquidacion in (505044576);

select * from liquidaciones_obligacion where numero_liquidacion in (210004289);

select c.rlr_nmro_fctra
from rlcion_rcbos_cja c
where c.rlr_nmro_rcbo_invesa = 210004289;
select f.nro_factura_dian, f.estado, f.fecha_factura
from factura_electronica_libertador f
where f.nro_factura_sai = 17180
  and f.sucursal = '5178';


select *
from fctras f
where f.fac_nmro_fctra in (select RLR_NMRO_FCTRA
                           from rlcion_rcbos_cja r
                           where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                            from liquidaciones_obligacion l,
                                                                 rcbos_cja r
                                                            where l.numero_liquidacion = r.rcc_nmro_rcbo
                                                              and l.numero_liquidacion in (505044576, 505044577)));


SELECT f.*, r.*, l.*
FROM fctras f
         JOIN rlcion_rcbos_cja r ON f.fac_nmro_fctra = r.rlr_nmro_fctra
         JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
WHERE l.numero_liquidacion IN (505044576, 505044577);

select e.nro_factura_dian, e.fecha_factura, e.estado
from factura_electronica_libertador e
where e.nro_factura_sai in (select RLR_NMRO_FCTRA
                            from rlcion_rcbos_cja r
                            where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                             from liquidaciones_obligacion l,
                                                                  rcbos_cja r
                                                             where l.numero_liquidacion = r.rcc_nmro_rcbo
                                                               and l.numero_liquidacion in (505044576, 505044577)));

SELECT p.codigo_transaccion Solicitud, p.ESTADO_TRANSACCION Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE l.numero_liquidacion in (505044576, 505044577)
  and rcb.RCC_ESTDO_RCBO = 'I';

SELECT p.codigo_transaccion Solicitud, p.FECHA_TRANSACCION Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
       , rcb.RCC_NMRO_LQDC recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
       , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy')
  and o.FECHA_GENERACION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_FCHA_MDFCCION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and r.RLR_FCHA_RCBOS >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I'
  and p.codigo_transaccion is not null
  and p.codigo_transaccion <> '-1';

SELECT count(1)
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura between to_date('01/01/2025', 'dd/mm/yyyy')   and to_date('31/01/2025', 'dd/mm/yyyy')
  --and o.FECHA_GENERACION >= to_date('01/01/2025', 'dd/mm/yyyy')
  --and rcb.RCC_FCHA_MDFCCION >= to_date('01/01/2025', 'dd/mm/yyyy')
  --and r.RLR_FCHA_RCBOS >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';

select *
from aew_estudios w
where w.FEC_DILIGENCIA >= to_date('01/01/2025', 'dd/mm/yyyy');

select count(*) from aew_estudios;
select count(*) from liquidaciones_obligacion;
select count(*) from obligaciones_pagar;
select count(*) from rcbos_cja;
select count(*) from rlcion_rcbos_cja;
select count(*) from pagos_linea_libertador;
select * from rcbos_cja;
select * from rlcion_rcbos_cja;

select a.* from liquidaciones_obligacion o
    join aew_estudios a on o.numero_liquidacion = a.NMRO_LIQUIDACION
    where a.FEC_DILIGENCIA >= to_date('01/01/2025', 'dd/mm/yyyy');

select e.nro_factura_dian, e.fecha_factura, e.estado
from factura_electronica_libertador e
where e.nro_factura_sai in (select RLR_NMRO_FCTRA
                            from rlcion_rcbos_cja r
                            where r.rlr_nmro_rcbo_invesa in (select r.rcc_nmro_rcbo
                                                             from  liquidaciones_obligacion l, rcbos_cja r
                                                             where l.numero_liquidacion in (select w.NMRO_LIQUIDACION
                                                                                            from aew_estudios w
                                                                                            where w.SOLICITUD in (10162180,10165140,10178344))
                                                               and l.numero_liquidacion = r.rcc_nmro_rcbo));

SELECT w.SOLICITUD Solicitud, w.FEC_DILIGENCIA Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');

-----------------------------------------------------------------------------------------------------------------------
SELECT CER_NMRO_PLZA, MIN(CER_FCHA_PRDCCION) FECHA
FROM CRTFCDOS, PLZAS
WHERE CER_VLOR_SLDO NOT BETWEEN - 2 AND 2
  AND CER_FCHA_PRDCCION >= to_date('01/12/2024', 'dd/mm/yyyy')
  AND CER_FCHA_PRDCCION <= to_date('31/12/2024', 'dd/mm/yyyy')
  AND POL_TPOPLZA = 'C'
  AND CER_ESTDO_PRDCCION NOT IN ('00','70','80')
  AND CER_RAM_CDGO = POL_RAM_CDGO
  AND CER_CLSE_PLZA = POL_CDGO_CLSE
  AND CER_NMRO_PLZA = POL_NMRO_PLZA
  AND CER_FCHA_PRDCCION < to_date('31/12/2024', 'dd/mm/yyyy') - 75
GROUP BY CER_NMRO_PLZA
UNION
SELECT CER_NMRO_PLZA, MIN(CER_FCHA_PRDCCION) FECHA
FROM PLZAS,CRTFCDOS
WHERE CER_VLOR_SLDO BETWEEN - 2 AND 2
  AND CER_FCHA_PRDCCION >= to_date('01/12/2024', 'dd/mm/yyyy')
  AND CER_FCHA_PRDCCION <= to_date('31/12/2024', 'dd/mm/yyyy')
  AND ((CER_NMRO_CRTFCDO, CER_NMRO_PLZA) IN
       (SELECT A.EST_SLCTUD, A.EST_PLZA
        FROM ESTADO_CTA_RCBOS A
        WHERE A.EST_ESTDO_RCBO = 'I'
          AND A.EST_ORGEN_RCDO = 'P'
          AND A.EST_FCHA_MRA IS NULL
          AND A.EST_FCHA_MVTO > to_date('31/12/2024', 'dd/mm/yyyy')))
  AND POL_TPOPLZA = 'C'
  AND CER_ESTDO_PRDCCION NOT IN ('00','70','80')
  AND CER_RAM_CDGO = POL_RAM_CDGO
  AND CER_CLSE_PLZA = POL_CDGO_CLSE
  AND CER_NMRO_PLZA = POL_NMRO_PLZA
  AND CER_FCHA_PRDCCION < to_date('31/12/2024', 'dd/mm/yyyy') - 75
GROUP BY CER_NMRO_PLZA
ORDER BY CER_NMRO_PLZA;
--01/12/2024 y 31/12/2024
SELECT *
FROM CRTFCDOS, PLZAS
WHERE CER_VLOR_SLDO NOT BETWEEN - 2 AND 2
  AND CER_FCHA_PRDCCION >= to_date('01/10/2024', 'dd/mm/yyyy')
  AND CER_FCHA_PRDCCION <= to_date('31/12/2024', 'dd/mm/yyyy')
  AND POL_TPOPLZA = 'C'
  AND CER_ESTDO_PRDCCION NOT IN ('00','70','80')
  AND CER_RAM_CDGO = POL_RAM_CDGO
  AND CER_CLSE_PLZA = POL_CDGO_CLSE
  AND CER_NMRO_PLZA = POL_NMRO_PLZA
  AND CER_FCHA_PRDCCION < to_date('31/12/2024', 'dd/mm/yyyy') - 75
select to_date('31/12/2024', 'dd/mm/yyyy') - 75 from dual;
-----------------------------------------------------------------------------------------------------------------------


SELECT p.codigo_transaccion Solicitud, p.FECHA_TRANSACCION Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy')
  --and o.FECHA_GENERACION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_FCHA_MDFCCION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and r.RLR_FCHA_RCBOS >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I'
  and p.codigo_transaccion is not null
  and p.codigo_transaccion <> '-1';


SELECT NVL(TO_CHAR(p.codigo_transaccion), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(p.FECHA_TRANSACCION, 'YYYY-MM-DD HH24:MI:SS'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.rcc_nmro_rcbo), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.fecha_factura, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.RCC_NMRO_LQDC), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_FCHA_RCBOS, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO, '999999999.99'), '0') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO_INVESA, '999999999.99'), '0') || ';' ||
       NVL(e.estado, 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.nro_factura_dian), 'SIN_DATO') AS CSV_Export
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy')
  and o.FECHA_GENERACION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_FCHA_MDFCCION >= to_date('01/01/2025', 'dd/mm/yyyy')
  and r.RLR_FCHA_RCBOS >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';

SELECT COUNT(*) from POLIZAS_CIERRES where FECHA_CIERRE >= to_date('01/01/2025', 'dd/mm/yyyy');
SELECT * from POLIZAS_CIERRES where FECHA_CIERRE >= to_date('01/01/2025', 'dd/mm/yyyy');


SELECT NVL(TO_CHAR(p.codigo_transaccion), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(p.FECHA_TRANSACCION, 'YYYY-MM-DD HH24:MI:SS'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.rcc_nmro_rcbo), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.fecha_factura, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(rcb.RCC_NMRO_LQDC), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_FCHA_RCBOS, 'YYYY-MM-DD'), 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO, '999999999.99'), '0') || ';' ||
       NVL(TO_CHAR(r.RLR_VLOR_RCBO_INVESA, '999999999.99'), '0') || ';' ||
       NVL(e.estado, 'SIN_DATO') || ';' ||
       NVL(TO_CHAR(e.nro_factura_dian), 'SIN_DATO') AS CSV_Export
FROM rcbos_cja rcb
         INNER JOIN rlcion_rcbos_cja r ON rcb.rcc_nmro_rcbo = r.rlr_nmro_rcbo_invesa
         INNER JOIN factura_electronica_libertador e ON r.rlr_nmro_fctra = e.nro_factura_sai
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE rcb.RCC_FCHA_RCBO >= to_date('01/01/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';


SELECT * FROM rcbos_cja;
select * from factura_electronica_libertador;

SELECT w.SOLICITUD            Solicitud
     , w.FEC_DILIGENCIA       Fecha_radicacion
     , rcb.rcc_nmro_rcbo      Liquidacion
     , rcb.RCC_FCHA_RCBO      Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC      recibo_caja_tronador
     , rcb.RCC_VLOR_RCBO      valor_recibo
     , r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado               Estado_cierre
     , e.fecha_factura
     , e.nro_factura_dian     factura_DIAN
     , e.SUCURSAL             sucursal
     , e.TDOC_TERCERO         tipo_documento
     , e.NRO_DOCUMTO          numero_documento
     , o.CODIGO_TRANSACCION_PSE
     , l.CODIGO_BARRAS
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');

select * from liquidaciones_obligacion;
select * from ADMSISA.OBLIGACIONES_PAGAR;
select * from factura_electronica_libertador;

SELECT A.ESTADO_PAGO, A.ESTADO_SOLICITUD, A.FECHA_LIMITE_PAGO, A.POLIZA, A.COBRADOR, A.*
FROM OBLIGACIONES_PAGAR A
WHERE  A.ESTADO_SOLICITUD = 'V'
  AND A.ESTADO_PAGO = 'PE'
  AND A.POLIZA = 13002;