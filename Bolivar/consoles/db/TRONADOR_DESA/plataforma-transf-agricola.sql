select * from TIPOS_MEDIOS_COMUNICACION;


select * from MEDIOS_COMUNICACION where nat_secuencia = 23971156;
---3214275638

select * from MEDIOS_COMUNICACION where TIPMEDCOM_CODIGO = 10;

select * from HISTORICO_MEDIOS_COMUNICACION where medcom_secuencia = 99935581245;

SELECT * FROM NATURALES WHERE SECUENCIA = 23971156

SELECT * FROM NATURALES WHERE NUMERO_DOCUMENTO = 456456546

----polizas----
SELECT *
FROM a2000030 a
   ,a2000040 b
WHERE
     COD_CIA=3 AND
   cod_ramo in (600,601,603,605)
  and COD_SECC = 39
  AND b.num_secu_pol = a.num_secu_pol
  AND b.num_end = (SELECT MAX(nvl(z.num_end, 0))
                   FROM a2000040 z
                   WHERE z.num_secu_pol = a.num_secu_pol)
  AND NVL(a.num_end, 0)          = NVL(b.num_end, 0)
  AND NVL(a.mca_anu_pol, 'N')    = 'N'
  AND NVL(a.mca_cotizacion, 'N') = 'N'
  AND a.fecha_venc_pol           > TRUNC(SYSDATE)
  AND NVL(b.mca_vigente, 'S')    = 'S'
  AND NVL(b.mca_baja_ries, 'N')  = 'N';

select * from g2000020 where cod_ramo in (600,601,603,605)

select * from g2000020 where cod_ramo in (605)


select * from a2000030 a
where a.cod_secc = 39
  and a.fecha_vig_pol > to_date('01-nov-2021','dd-mon-yyyy')
  and nvl(a.mca_provisorio,'N') = 'N'
  and nvl(a.mca_provisorio,'N') = 'N'
  and 5 > (select max(b.cod_ries)  from a2000020 b
           where b.num_secu_pol = a.num_secu_pol
             and b.cod_campo = 'COD_ASEG'
             and b.mca_vigente = 'S')



select * from a2000030 a
where a.cod_secc = 39
  and a.fecha_vig_pol > to_date('01-01-2021','dd-mm-yyyy')
  and nvl(a.mca_provisorio,'N') = 'N'
  and nvl(mca_anu_pol,'N')  = 'N'
  and 15 > (select max(b.cod_ries)  from a2000020 b
            where b.num_secu_pol = a.num_secu_pol
              and b.cod_campo = 'COD_ASEG'
              and b.mca_vigente = 'S')
  --and a.num_end = 0
  and a.NUM_POL1 = 1004000000901;


select * from a2000030 where NUM_POL1 = 1004000014001;

select * from A9990100 where NUM_SECU_POL = 29744851142

select * from sim_log
where trunc(Fecha) > to_date('29-mar-2022','dd-mon-yyyy')
  and secuencia > 1275102010
  and columna like '%Proc_ConsultaPolizasJSON%';

select substr('Ejemplo%', 1, length('Ejemplo%') - 1) from dual;

select max(b.cod_ries)  from a2000020 b
where b.num_secu_pol = 29738940075
 -- and b.cod_campo = 'COD_ASEG'
 -- and b.mca_vigente = 'S'

select * from a2000020 b
where b.num_secu_pol = 29738940075


INSERT INTO url_reporte_ricardo (SELECT * FROM url_reporte where grupo =2);

select * from a2000030 where NUM_POL1 = 1004000003001 AND COD_SECC = 39;


SELECT D.NUM_SECU_POL,
       D.NUM_END,
       D.COD_RIES,
       D.OP_COD_BENEF,
       D.OP_DESCRIPCION,
       D.OP_TDOCBENEF
FROM (
         SELECT A.NUM_SECU_POL,
                A.NUM_END,
                A.COD_RIES,
                DECODE(A.COD_CAMPO, 'COD_BENEF', A.VALOR_CAMPO, '')      OP_COD_BENEF,
                DECODE(A.COD_CAMPO, 'DESC_RIES', A.VALOR_CAMPO, '')      OP_DESCRIPCION,
                DECODE(A.COD_CAMPO, 'TIPO_DOC_BENEF', A.VALOR_CAMPO, '') OP_TDOCBENEF

         FROM A2000020 A
         WHERE A.NUM_SECU_POL = (select MAX(NUM_SECU_POL) from a2000030 where NUM_POL1 = 1004000003001 AND COD_SECC = 39 )
           AND A.COD_CAMPO = 'DESC_RIES'
           AND DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '') IS NOT NULL
           AND DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '') IS NOT NULL
           AND DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '') IS NOT NULL
           AND COD_RIES IS NOT NULL
           AND (A.COD_RIES, A.NUM_END) IN
               (SELECT B.COD_RIES, MAX(B.NUM_END)
                FROM A2000020 B
                WHERE B.NUM_SECU_POL = A.NUM_SECU_POL
                  AND ((NVL(0, 0) = 0 AND NVL(B.COD_RIES, 0) > 0) OR
                       (NVL(0, 0) > 0 AND
                        NVL(B.COD_RIES, 0) = 0))
                  AND B.COD_CAMPO = A.COD_CAMPO
                  AND ((1 IS NOT NULL AND
                        ((B.NUM_END <= 1 AND 'S' = 'S') OR
                         (B.NUM_END = 1 AND 'N' = 'N'))) OR
                       (1 IS NULL))
                GROUP BY B.COD_RIES
               )
         UNION
         SELECT C.NUM_SECU_POL,
                C.NUM_END,
                C.COD_RIES,
                MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, ''))      OP_COD_BENEF,
                MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, ''))      OP_DESCRIPCION,
                MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
         FROM A2000020 C
         WHERE C.NUM_SECU_POL = (select MAX(NUM_SECU_POL) from a2000030 where NUM_POL1 = 1004000003001 AND COD_SECC = 39)
         GROUP BY C.NUM_SECU_POL, C.NUM_END, C.COD_RIES) D
WHERE D.OP_COD_BENEF IS NOT NULL
  AND D.OP_DESCRIPCION IS NOT NULL
  AND OP_TDOCBENEF IS NOT NULL;



SELECT D.NUM_SECU_POL,
       D.NUM_END,
       D.COD_RIES,
       D.OP_COD_BENEF,
       D.OP_DESCRIPCION,
       D.OP_TDOCBENEF
FROM (
         SELECT A.NUM_SECU_POL,
                A.NUM_END,
                A.COD_RIES,
                DECODE(A.COD_CAMPO, 'COD_BENEF', A.VALOR_CAMPO, '')      OP_COD_BENEF,
                DECODE(A.COD_CAMPO, 'DESC_RIES', A.VALOR_CAMPO, '')      OP_DESCRIPCION,
                DECODE(A.COD_CAMPO, 'TIPO_DOC_BENEF', A.VALOR_CAMPO, '') OP_TDOCBENEF
         FROM A2000020 A
         WHERE A.NUM_SECU_POL = 29738940075
           AND A.COD_CAMPO = 'DESC_RIES'
           AND DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '') IS NOT NULL
           AND DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '') IS NOT NULL
           AND DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '') IS NOT NULL
           AND COD_RIES IS NOT NULL
           AND (A.COD_RIES, A.NUM_END) IN
               (SELECT B.COD_RIES, MAX(B.NUM_END)
                FROM A2000020 B
                WHERE B.NUM_SECU_POL = A.NUM_SECU_POL
                  AND ((NVL(IP_CODRIES, 0) = 0 AND NVL(B.COD_RIES, 0) > 0) OR
                       (NVL(IP_CODRIES, 0) > 0 AND
                        NVL(B.COD_RIES, 0) = IP_CODRIES))
                  AND B.COD_CAMPO = A.COD_CAMPO
                  AND ((IP_NUMEND IS NOT NULL AND
                        ((B.NUM_END <= IP_NUMEND AND IP_MCAVIGENTE = 'S') OR
                         (B.NUM_END = IP_NUMEND AND IP_MCAVIGENTE = 'N'))) OR
                       (IP_NUMEND IS NULL))
                GROUP BY B.COD_RIES
               )
         UNION
         SELECT C.NUM_SECU_POL,
                C.NUM_END,
                C.COD_RIES,
                MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, ''))      OP_COD_BENEF,
                MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, ''))      OP_DESCRIPCION,
                MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
         FROM A2000020 C
         WHERE C.NUM_SECU_POL = 29738940075
         GROUP BY C.NUM_SECU_POL, C.NUM_END, C.COD_RIES) D
WHERE D.OP_COD_BENEF IS NOT NULL
  AND D.OP_DESCRIPCION IS NOT NULL
  AND OP_TDOCBENEF IS NOT NULL;



SELECT MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '')) OP_COD_BENEF,
       MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '')) OP_DESCRIPCION,
       MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
FROM A2000020 A
WHERE A.NUM_SECU_POL = 29738940075
  AND (NVL(A.COD_RIES, 0), A.COD_CAMPO, A.NUM_END) IN
      (SELECT NVL(B.COD_RIES, 0), B.COD_CAMPO, MAX(B.NUM_END)
       FROM A2000020 B
       WHERE B.NUM_SECU_POL    = 29738940075
         AND NVL(B.COD_RIES,0) IN (2, 0)
         AND B.COD_CAMPO       IN ('DESC_RIES',
                                   'COD_BENEF',
                                   'TIPO_DOC_BENEF')
         AND B.NUM_END         <= 1
       GROUP BY NVL(B.COD_RIES, 0), B.COD_CAMPO
      );




select * from a2000030 a
where a.cod_secc = 39
  and a.fecha_vig_pol > to_date('01-01-2022','dd-mm-yyyy')
  and nvl(a.mca_provisorio,'N') = 'N'
  and nvl(mca_anu_pol,'N')  = 'N'
  and fecha_venc_pol > to_date('01-12-2022','dd-mm-yyyy');
  /*
  and 15 > (select max(b.cod_ries)  from a2000020 b
            where b.num_secu_pol = a.num_secu_pol
              and b.cod_campo = 'COD_ASEG'
              and b.mca_vigente = 'S')
  --and a.num_end = 0
  and a.NUM_POL1 = 1004000000901;
*/


SELECT PP.NUM_SECU_POL,
       PP.NUM_POL1 ,
       PP.NRO_DOCUMTO ,
       PP.COD_RAMO,
       pp.NUM_END,
       TO_CHAR(PP.FECHA_VIG_POL,'DD-MM-YYYY')   FECHA_VIG_POL ,
       'A' AS ESTADO ,
     --  'CYBP0001' AS PACKAGE_CODE ,

       PP.TDOC_TERCERO ,
     --  PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES ,

       TO_CHAR(PP.FECHA_VENC_POL,'DD-MM-YYYY')  FECHA_VENC_POL
FROM
     A2000030 PP
WHERE
--  AND   A20D.NUM_SECU_POL = NN.NUM_SECU_POL
   PP.NUM_POL1      IS NOT NULL
 -- AND A20D.COD_CAMPO    = 'CYBER_RISK'
 -- AND NN.NOMINA         ='DAVI'
 -- AND NVL(MCA_BAJA,'N') = 'N'
 -- AND A20D.COD_RIES     = NN.COD_RIES


  AND PP.NUM_POL1 = 1004000002901
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 39
--  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1

SELECT A.NUM_SECU_POL, A.NUM_END, Mca_anu_pol, FECHA_VENC_POL, MCA_PROVISORIO, A.*
FROM A2000030 A
WHERE A.NUM_POL1 = 1004000002901
  AND NVL(A.COD_SECC, 0) = 39
  AND A.NUM_END =
      (SELECT MAX(NUM_END)
       FROM A2000030
       WHERE NUM_SECU_POL = A.NUM_SECU_POL);



SELECT MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '')) OP_COD_BENEF,
       MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '')) OP_DESCRIPCION,
       MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
FROM A2000020 A
WHERE A.NUM_SECU_POL = 29744851142
  AND (NVL(A.COD_RIES, 0), A.COD_CAMPO, A.NUM_END) IN
      (SELECT NVL(B.COD_RIES, 0), B.COD_CAMPO, MAX(B.NUM_END)
       FROM A2000020 B
       WHERE B.NUM_SECU_POL    = 29744851142
         AND NVL(B.COD_RIES,0) IN ( 0)
         AND B.COD_CAMPO       IN ('DESC_RIES',
                                   'COD_BENEF',
                                   'TIPO_DOC_BENEF')
         AND B.NUM_END         <= 0
       GROUP BY NVL(B.COD_RIES, 0), B.COD_CAMPO
      );


SELECT A.NUM_SECU_POL, A.NUM_END, A.Mca_anu_pol,
       A.FECHA_VENC_POL, A.MCA_PROVISORIO,
       A.NUM_POL1, A.NRO_DOCUMTO,A.TDOC_TERCERO
FROM A2000030 A
WHERE A.NUM_POL1 = 1004000003001
  AND NVL(A.COD_SECC, 0) = 39
  AND A.NUM_END =
      (SELECT MAX(NUM_END)
       FROM A2000030
       WHERE NUM_SECU_POL = A.NUM_SECU_POL);

select * from A2000030 where NUM_POL1 = 1520000020601;


update a2000030
set fecha_venc_pol = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_vig_pol  = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_venc_end = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_vig_end = TO_DATE('01-AGO-2023', 'DD-MON-RRRR')
where NUM_POL1 = 1004000002201
  AND COD_SECC = 39;


----------------------------------------------------------


select a.tipdoc_codigo,
       a.numero_documento,
       a.primer_nombre,
       a.segundo_nombre,
       a.primer_apellido,
       a.segundo_apellido,
       b.fecha_periodo,
       a.secuencia
from naturales a,
     estados_financieros b
where b.nat_secuencia = a.secuencia
  and b.fecha_periodo between to_date('01-may-1990', 'dd-mon-yyyy') and to_date('01-feb-1999', 'dd-mon-yyyy');


select min(b.fecha_periodo) from naturales a,
                               estados_financieros b
where b.nat_secuencia = a.secuencia;

--CREATE TABLE estados_financieros_back_ric
--AS (SELECT * FROM estados_financieros);

/*
UPDATE estados_financieros
SET fecha_periodo = to_date('15-jun-2022', 'dd-mon-yyyy')
where SECUENCIA = (select max(SECUENCIA)
                   from estados_financieros
                   where nat_secuencia = (select distinct secuencia
                                          from naturales
                                          where numero_documento = 1111111111
                                          group by secuencia));
*/

select * from estados_financieros where nat_secuencia = 4304;

--CREATE TABLE estados_financieros_back_ric
--  AS (SELECT * FROM estados_financieros);


select count(*) from estados_financieros_back_ric;

---cedulas nit juridico
select * from juridicos;

SELECT TEXT
FROM ALL_SOURCE
WHERE NAME = 'PKG239_AGRICOLA'
  AND TYPE = 'PACKAGE BODY'
ORDER BY LINE;

---permiso de borrado de endosos para seccion 39
select * from sim_borrado_automatico where id_tipo = 4 and COD_SECC = 39;

SELECT
    P.NUM_POL1 AS POLIZA_NRO,
    P.NRO_DOCUMTO AS DOCUMENTO,
    S.NUM_SINI AS NUMERO_SINIESTRO,
    -- P.*,
    S.COD_RIES AS RIESGO,
    S.FECHA_SINI AS FECHA_OCURRENCIA,
    S.FEC_DENU_SINI AS FECHA_AVISO,
    S.COD_CAUSA_SINI,
    C.DESC_CAUSA AS CAUSA,
    T.IMP_MON_PAIS  AS VR_PAGADO,
    (CASE
         WHEN T.FOR_PAGO = 1 THEN 'Transferencia'
         WHEN T.FOR_PAGO = 2 THEN 'Tarjeta de Credito'
         WHEN T.FOR_PAGO = 3 THEN 'Daviplata'
         WHEN T.FOR_PAGO = 4 THEN 'TRANFERENCIA'
         WHEN T.FOR_PAGO = 5 THEN 'Bancolombia Ventanilla'
         WHEN T.FOR_PAGO = 6 THEN 'Tranferencia Bancolombia'
         WHEN T.FOR_PAGO IS NULL THEN 'Cheque'
         ELSE TO_CHAR(T.FOR_PAGO )
        END) AS FORMA_DE_PAGO,
    (CASE
         WHEN S.MCA_EST_SINI = 'P' THEN 'PENDIENTE'
         WHEN S.MCA_EST_SINI = 'T' THEN 'TERMINADO'
         WHEN S.MCA_EST_SINI IS NULL THEN 'N/D'
         ELSE S.MCA_EST_SINI
        END) AS ESTADO_SINIESTRO,
    T.MCA_EST_PAGO AS ESTADO_PAGO,
    EP.DAT_OBS AS DETALLE_ESTADO_PAGO,
    FUN_RESCATA_A2000020('TIPO_DOC_BENEF', P.NUM_SECU_POL, S.COD_RIES ) AS TIPO_DOC_BENEF,
    FUN_RESCATA_A2000020('COD_BENEF', P.NUM_SECU_POL, S.COD_RIES ) AS COD_BENEF,
    FUN_RESCATA_A2000020('DESC_RIES', P.NUM_SECU_POL, S.COD_RIES ) AS DESC_RIES,
    L.NUM_ORD_PAGO  AS ORDEN_DE_PAGO,
    L.FECHA_PAGO,
    T.FECHA_PAGO,
    LPAD(SUBSTR(B.NUMERO_CTA_DESTINO, -4), LENGTH(B.NUMERO_CTA_DESTINO), '*') AS NUMERO_CUENTA,
    B.COD_ENTIDAD_DESTINO AS COD_ENTIDAD,
    A.NOM_ENTIDAD,
    T.CAUSAL_RECHAZO,
    C.DESCRIPCION   AS DESCRIP_RECHAZO
FROM A7000900 S
         INNER JOIN A2000030 P ON S.NUM_SECU_POL = P.NUM_SECU_POL AND S.COD_CIA = P.COD_CIA AND S.COD_SECC = P.COD_SECC
         INNER JOIN A7001000 E ON S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI AND S.NUM_SECU_SINI = E.NUM_SECU_SINI
         INNER JOIN A7001200 R ON E.NUM_SECU_EXPED = R.NUM_SECU_EXPED AND E.NUM_SECU_SINI = R.NUM_SECU_SINI
         INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         LEFT OUTER JOIN A5021604 T ON L.COD_CIA = T.COD_CIA AND L.NUM_ORD_PAGO = T.NUM_ORD_PAGO
         INNER JOIN A7000200 C ON S.COD_CAUSA_SINI = C.COD_CAUSA AND S.COD_CIA = C.COD_CIA AND C.TIPO_CAUSA = 1
         LEFT OUTER JOIN (SELECT  a.dat_obs, a.dat_car FROM C9999909 A WHERE cod_tab like '%A5021604%') EP ON T.MCA_EST_PAGO = EP.DAT_CAR
         LEFT OUTER JOIN a5021106 C ON T.CAUSAL_RECHAZO = C.COD_RECHAZO
         LEFT OUTER JOIN a5021104 B ON T.NUM_ORD_PAGO = B.NUM_ORD_PAGO
         LEFT OUTER JOIN (SELECT DISTINCT num_entidad, nom_entidad
                          FROM a5020900
                          WHERE ach = 'S'
                            AND  num_entidad != 34) A ON B.COD_ENTIDAD_DESTINO = A.NUM_ENTIDAD
WHERE
    S.COD_CIA = 3
  AND S.COD_SECC = 39
  AND S.COD_RAMO in (602, 605)
-- AND T.FOR_PAGO = 6
--AND P.NUM_POL1 = 1004000040801  --602
  AND P.NUM_POL1 = 1010000006201
  --AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);

SELECT *
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 154096000064;

SELECT fecha_pago
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 70162019004440;
