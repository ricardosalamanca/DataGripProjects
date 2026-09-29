select * from TIPOS_MEDIOS_COMUNICACION;


select * from MEDIOS_COMUNICACION where nat_secuencia = 23971156;
---3214275638

select * from MEDIOS_COMUNICACION where TIPMEDCOM_CODIGO = 10;

select * from HISTORICO_MEDIOS_COMUNICACION where medcom_secuencia = 99935581245;

SELECT * FROM NATURALES WHERE SECUENCIA = 23971156

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
  and a.num_end = 0


select * from g2000020 where cod_ramo in (605);

select * from sim_g2000020
where cod_ramo = 605;


select * from MEDIOS_COMUNICACION where nat_secuencia = 2272;


SELECT * FROM NATURALES WHERE SECUENCIA = 23971156;


SELECT * FROM NATURALES WHERE SECUENCIA = 2272;

SELECT *
FROM a2000030 where NUM_POL1 = 5132005119601  and cod_secc = 39;

select * from A2000020 where NUM_SECU_POL    = 29861131385 AND NUM_END = 0 AND COD_CAMPO in ('DESC_RIES', 'COD_BENEF','TIPO_DOC_BENEF') ;

SELECT MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '')) OP_COD_BENEF,
       MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '')) OP_DESCRIPCION,
       MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
FROM A2000020 A
WHERE A.NUM_SECU_POL = 29861131385
  AND (NVL(A.COD_RIES, 0), A.COD_CAMPO, A.NUM_END) IN
      (SELECT NVL(B.COD_RIES, 0), B.COD_CAMPO, MAX(B.NUM_END)
       FROM A2000020 B
       WHERE B.NUM_SECU_POL    = 29861131385
       --  AND NVL(B.COD_RIES,0) IN (0, 0)
         AND B.COD_CAMPO       IN ('DESC_RIES',
                                   'COD_BENEF',
                                   'TIPO_DOC_BENEF')
         AND B.NUM_END         <= 0
       GROUP BY NVL(B.COD_RIES, 0), B.COD_CAMPO
      );

SELECT *
FROM a2000030 where NUM_POL1 = 1004000002901  and cod_secc = 39;

select * from A2000020 where NUM_SECU_POL    = 29744851142 AND NUM_END = 0 AND COD_CAMPO in ('DESC_RIES', 'COD_BENEF') ;

SELECT MIN(DECODE(COD_CAMPO, 'COD_BENEF', VALOR_CAMPO, '')) OP_COD_BENEF,
       MIN(DECODE(COD_CAMPO, 'DESC_RIES', VALOR_CAMPO, '')) OP_DESCRIPCION,
       MIN(DECODE(COD_CAMPO, 'TIPO_DOC_BENEF', VALOR_CAMPO, '')) OP_TDOCBENEF
FROM A2000020 A
WHERE A.NUM_SECU_POL = 29744851142
  AND (NVL(A.COD_RIES, 0), A.COD_CAMPO, A.NUM_END) IN
      (SELECT NVL(B.COD_RIES, 0), B.COD_CAMPO, MAX(B.NUM_END)
       FROM A2000020 B
       WHERE B.NUM_SECU_POL    = 29744851142
         --  AND NVL(B.COD_RIES,0) IN (0, 0)
         AND B.COD_CAMPO       IN ('DESC_RIES',
                                   'COD_BENEF',
                                   'TIPO_DOC_BENEF')
         AND B.NUM_END         <= 0
       GROUP BY NVL(B.COD_RIES, 0), B.COD_CAMPO
      );



select max(b.cod_ries)  from a2000020 b
where b.num_secu_pol = 29738940075;

select a.mca_Anu_pol, a.* from a2000030 a where NUM_POL1 = 1520000020601 AND COD_SECC = 39;

/*
update a2000030
set fecha_venc_pol = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_vig_pol  = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_venc_end = TO_DATE('01-AGO-2023', 'DD-MON-RRRR'),
    fecha_vig_end = TO_DATE('01-AGO-2023', 'DD-MON-RRRR')
where NUM_POL1 = 1004000002701
  AND COD_SECC = 39;
*/

select A.NUM_END,
       A.COD_SECC,
       A.COD_RAMO,
       A.fecha_venc_pol,
       A.fecha_vig_pol,
       A.fecha_venc_end,
       A.fecha_vig_end,
       A.*
from a2000030 A
WHERE NUM_POL1 = 5132005124001;


-----TABLA NATURALES TERCEROS
select tipdoc_codigo,numero_documento,primer_nombre,segundo_nombre,
       primer_apellido,segundo_apellido  from naturales;

----anterior tabla sarlaft
select * from ESTADOS_FINANCIEROS;

--select * from financie

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
  and b.fecha_periodo > to_date('01-may-2022', 'dd-mon-yyyy');

--CREATE TABLE estados_financieros_back_ric
--AS (SELECT * FROM estados_financieros);

----codigo DANE
select * from division_politicas where DIVPOL_CODIGO = 91536;
select codigo_codazzi,nombre,codigo_tronador
from division_politicas dv
where dv.codigo_codazzi=11001;
select codigo_codazzi,nombre,codigo_tronador
from division_politicas dv
where dv.codigo_codazzi=91536;

---cedulas nit juridico
select * from juridicos;


                  UPDATE NATURALES SET sexo = null
WHERE SECUENCIA IN ('28439336','29824554','27743882','27603956','27768296','28035472','28043798','28502238','29391972','28973994', '28083562')

select * from NATURALES WHERE SECUENCIA IN ('28439336','29824554','27743882','27603956','27768296','28035472','28043798','28502238','29391972','28973994', '28083562')


UPDATE NATURALES SET sexo = null
WHERE SECUENCIA = '28439336';


select * from a2000030 a
where a.cod_secc = 39
  and a.fecha_vig_pol > to_date('01-nov-2022','dd-mon-yyyy')
  and nvl(a.mca_provisorio,'N') = 'N'
  and nvl(a.mca_provisorio,'N') = 'N'
  and  cod_ramo in (602);

SELECT TEXT
FROM ALL_SOURCE
WHERE NAME = 'PKG239_AGRICOLA'
  AND TYPE = 'PACKAGE BODY'
ORDER BY LINE;
