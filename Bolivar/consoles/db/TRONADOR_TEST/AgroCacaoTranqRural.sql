select * from g2000020
where cod_ramo in (605);

SELECT * FROM SIM_G2000020 where cod_ramo in (605) AND componente = 'CO';

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
  and t.cod_ramo = 605;

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
  AND a.cod_secc = 39
  AND a.cod_ramo = 605
  AND a.num_end =
      (select max(w.num_end)
       from a2000030 w
       where w.num_secu_pol = a.num_secu_pol)
  AND nvl(a.mca_provisorio, 'N') = 'N'
  and NVL(a.mca_anu_pol, 'N') != 'S'
  --AND a.num_pol_ant is null
  AND nvl(a.mca_caduca, 'N') = 'N'
  AND nvl(a.mca_term_ok, 'N') = 'S'
  AND num_pol1 <> 0;

SELECT * FROM SIM_G2000020 where COMPONENTE = 'CO' AND COD_LISTA IS NOT NULL;

select * from G7000026 t where t.cod_campo = 'ACTIVIDAD_REG';

Select *
from sim_g2000020
where cod_cia = 3
  and cod_campo in (select cod_campo from g2000020 where cod_ramo = 690)
  and componente != 'TX'
order by cod_campo;

select * from G7000026 t where t.cod_campo = 'ZONA_CAFE';


select *  from C9999909 WHERE  COD_TAB  = 'TIPO_PRODUCTOR';


select * from g2000270 where cod_secc = 39 and COD_CAMPO in ('TIPO_DOC_BENEF', 'COD_BENEF');

SELECT
    P.NUM_POL1 AS POLIZA_NRO,
    P.NRO_DOCUMTO AS DOCUMENTO,
    S.NUM_SINI AS NUMERO_SINIESTRO,
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
    EP.DAT_OBS AS DETALLE_ESTADO_PAGO
FROM A7000900 S
         INNER JOIN A2000030 P ON S.NUM_SECU_POL = P.NUM_SECU_POL AND S.COD_CIA = P.COD_CIA AND S.COD_SECC = P.COD_SECC
         INNER JOIN A7001000 E ON S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI AND S.NUM_SECU_SINI = E.NUM_SECU_SINI
         INNER JOIN A7001200 R ON E.NUM_SECU_EXPED = R.NUM_SECU_EXPED AND E.NUM_SECU_SINI = R.NUM_SECU_SINI
         INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         LEFT OUTER JOIN A5021604 T ON L.COD_CIA = T.COD_CIA AND L.NUM_ORD_PAGO = T.NUM_ORD_PAGO
         INNER JOIN A7000200 C ON S.COD_CAUSA_SINI = C.COD_CAUSA AND S.COD_CIA = C.COD_CIA AND C.TIPO_CAUSA = 1
         LEFT OUTER JOIN (SELECT  a.dat_obs, a.dat_car FROM C9999909 A WHERE cod_tab like '%A5021604%') EP ON T.MCA_EST_PAGO = EP.DAT_CAR
WHERE
        S.COD_CIA = 3
  AND S.COD_SECC = 39
  AND S.COD_RAMO = 602
  AND P.NUM_POL1 = 1004000000301
  --AND S.COD_RIES = :Ip_riesgo
           AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
           AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)


select * from A2000030 where NRO_DOCUMTO = 70813391;

select A.NRO_DOCUMTO, A.* from A2000030 A where NUM_SECU_POL = 29732571725;

SELECT * FROM C9999909 WHERE COD_TAB = 'MODRIESGO_NROMAX' and COD_SECC = 39;

--POL NUEVA
select * from a2000030 where COD_RAMO = 605 and NUM_END > 1 and num_pol1 = 1004000003701;
--POL ANTIGUA NUEVO ENDOSO
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol = 29804140142;

---datos variables polizas
select a.*
from a2000020 a
where
  COD_CAMPO = 'COD_BENEF'
        and
        num_secu_pol = 29732571725;


select a.*
from a2000020 a
where
    num_secu_pol = 29732571725 AND
    COD_RIES = 74;

select a.*
from a2000020 a
where
    num_secu_pol = 29732571725 AND COD_RIES IS NULL;


select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol in (select a.NUM_SECU_POL
                                                                          from a2000020 a
                                                                          where
                                                                                  COD_CAMPO = 'DESC_RIES' and
                                                                                  COD_RIES = 1000) and a.COD_RAMO in (605,602);

--1004000009601 602
--1004000010001 602
--1004000039101 605



SELECT *
FROM ALL_DEPENDENCIES
WHERE REFERENCED_NAME = 'SIM_TYP_AGRO_SINIESTRO'
  AND REFERENCED_TYPE = 'TYPE';

SELECT *
FROM ALL_DEPENDENCIES
WHERE REFERENCED_NAME = 'SIM_TYP_AGRO_POLIZA'
  AND REFERENCED_TYPE = 'TYPE';

SELECT
    P.NUM_POL1 AS POLIZA_NRO,
    P.NUM_SECU_POL,
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
  --AND P.NUM_POL1 = 1004000025801  --602
   AND P.NUM_POL1 = 1004000025801
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);

SELECT FOR_PAGO
FROM A5021604
WHERE cod_cia = 3
  GROUP BY FOR_PAGO
  AND num_ord_pago = 70162019004566;


SELECT *
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 70162019004566;

SELECT S.*, L.* FROM A7000900 S
                  INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         WHERE S.NUM_SINI = 10040006475 AND S.COD_RAMO in (602, 605);

SELECT S.*, L.* FROM A7000900 S
                         INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
WHERE S.NUM_POL1 = 1004007022101 AND S.COD_RAMO in (602, 605);

select  a.num_pol1
     , a.NRO_DOCUMTO
     , a.num_end
     , a.num_secu_pol
     , a.FECHA_EMI
     , a.FECHA_EMI_END
     , a.fecha_venc_pol
     , a.fecha_venc_end
     , a.cod_ramo
     , a.RENOVADA_POR
     , a.MCA_RENOV
     , a.NUM_POL_ANT
     , a.*
from a2000030 a
where COD_SECC = 39
  and COD_RAMO in (602, 605)
  and num_pol1 = 1004000025801;

SELECT a.num_pol1
     , a.NRO_DOCUMTO
     , a.num_end
     , a.num_secu_pol
     , a.FECHA_EMI
     , a.FECHA_EMI_END
     , a.fecha_venc_pol
     , a.fecha_venc_end
     , a.cod_ramo
     , a.RENOVADA_POR
     , a.MCA_RENOV
     , a.NUM_POL_ANT
     , a.*
FROM a2000030 a
WHERE a.cod_cia = 3
  AND a.cod_secc = 39
  AND a.cod_ramo = 602
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
  and NRO_DOCUMTO not in (900258841);

---datos variables polizas
select a.*
from a2000020 a
where

        num_secu_pol = 29861482072;


select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_ASEG'
  and
        VALOR_CAMPO = '41890369';


SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29708361299;

SELECT *
FROM g9001100
WHERE  COD_USR LIKE 'B1030596%';

SELECT *
FROM g9001100
WHERE  COD_USR LIKE 'B8085964%';

select r.VALOR_CAMPO                                     nro_doc_benef,
       t.tdoc_tercero                                    tipo_doc_tomador,
       t.nro_documto                                     nro_doc_tomador,
       OPS$PUMA.Fnc_Nombre_Tercero(t.tdoc_tercero, t.nro_documto) nombre_tomador,
       max(t.num_secu_pol)                               num_secu_pol,
       max(t.cod_ramo)                                   cod_ramo,
       max(t.num_pol1)                                   numero_poliza,
       max(t.fecha_vig_pol)                              fecha_vig_pol,
       max(t.fecha_venc_pol)                             fecha_venc_pol,
       max(t.cod_ramo)                                   cod_prod
from a2000030 t
         INNER JOIN A2000020 r
                    ON t.NUM_SECU_POL = r.NUM_SECU_POL AND r.MCA_VIGENTE = 'S' AND r.COD_CAMPO = 'COD_BENEF' AND
                       r.VALOR_CAMPO IN
                       (1259120, 51646836, 901251613, 800250255, 890984843, 13501083, 900614125, 890801106, 901128535, 890801626)
where t.cod_secc = 39
  and t.cod_ramo in (605, 602, 923)
  and t.fecha_venc_pol >= SYSDATE
  and t.fecha_emi <= SYSDATE
  AND t.FECHA_VENC_POL = FECHA_VENC_PER
  AND NVL(t.MCA_PROVISORIO, 'N') = 'N'
  AND NVL(t.MCA_CADUCA, 'N') = 'N'
  AND t.COD_COA != 3
  AND NVL(t.MCA_COTIZACION, 'N') = 'N'
  AND t.NUM_END = (SELECT MAX(B.NUM_END)
                   FROM A2000030 B
                   WHERE B.NUM_SECU_POL = t.NUM_SECU_POL)
  and nvl(t.tipo_end, 'XX') <> 'AT'
group by r.VALOR_CAMPO, t.tdoc_tercero, t.nro_documto;