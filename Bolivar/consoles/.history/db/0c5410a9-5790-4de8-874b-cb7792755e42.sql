select a.*
from a2000020 a
where
  --COD_CAMPO = 'TIPO_PROD_AGRO'
        COD_RIES is not null and
        num_secu_pol = 29861435187;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  --COD_CAMPO = 'TIPO_PROD_AGRO'
        COD_RIES is not null and
        num_secu_pol = 29785087992;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  --COD_CAMPO = 'TIPO_PROD_AGRO'
        COD_RIES is not null and
        num_secu_pol = 29787256001;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  --COD_CAMPO = 'TIPO_PROD_AGRO'
        COD_RIES is not null and
        num_secu_pol = 29787262854;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  --COD_CAMPO = 'TIPO_PROD_AGRO'
        COD_RIES is not null and
        num_secu_pol = 29861146538;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'DESC_RIES' and
        COD_RIES > 1000;
;-- -. . -..- - / . -. - .-. -.--
select * from a2000030 where  num_secu_pol = 29707428053;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'DESC_RIES' and
        COD_RIES = 1000;
;-- -. . -..- - / . -. - .-. -.--
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol = 29744967197;
;-- -. . -..- - / . -. - .-. -.--
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol = (select a.NUM_SECU_POL
                                                                          from a2000020 a
                                                                          where
                                                                                  COD_CAMPO = 'DESC_RIES' and
                                                                                  COD_RIES = 1000);
;-- -. . -..- - / . -. - .-. -.--
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol in (select a.NUM_SECU_POL
                                                                          from a2000020 a
                                                                          where
                                                                                  COD_CAMPO = 'DESC_RIES' and
                                                                                  COD_RIES = 1000);
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'DESC_RIES'
        and
        num_secu_pol = 1004000047601;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'DESC_RIES'
        and
        num_secu_pol = 29744967197;
;-- -. . -..- - / . -. - .-. -.--
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol in (select a.NUM_SECU_POL
                                                                          from a2000020 a
                                                                          where
                                                                                  COD_CAMPO = 'DESC_RIES' and
                                                                                  COD_RIES = 1000) and a.COD_RAMO in (605,602);
;-- -. . -..- - / . -. - .-. -.--
select a.COD_SECC, a.COD_RAMO, a.* from a2000030 a where  num_secu_pol = 29804140142;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM ALL_DEPENDENCIES
WHERE REFERENCED_NAME = 'SIM_TYP_AGRO_SINIESTRO'
  AND REFERENCED_TYPE = 'TYPE';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM ALL_DEPENDENCIES
WHERE REFERENCED_NAME = 'SIM_TYP_AGRO_POLIZA'
  AND REFERENCED_TYPE = 'TYPE';
;-- -. . -..- - / . -. - .-. -.--
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
  AND P.NUM_POL1 = 1004000040801  --602
  -- AND P.NUM_POL1 = 1010000006201
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);;
;-- -. . -..- - / . -. - .-. -.--
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
  AND P.NUM_POL1 = 1004000040801  --602
  -- AND P.NUM_POL1 = 1010000006201
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
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
  and num_pol1 = 1004000009601;
;-- -. . -..- - / . -. - .-. -.--
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
  and num_pol1 = 1004000010001;
;-- -. . -..- - / . -. - .-. -.--
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
  AND num_pol1 <> 0
  and NRO_DOCUMTO not in (900258841);
;-- -. . -..- - / . -. - .-. -.--
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
  and num_pol1 = 1004000039101;
;-- -. . -..- - / . -. - .-. -.--
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
  AND P.NUM_POL1 = 1004000025801  --602
  -- AND P.NUM_POL1 = 1010000006201
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'COD_BENEF'
        and
        num_secu_pol = 29861482072;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_BENEF'
  and
        num_secu_pol = 29861482072;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_ASEG'
  and
        VALOR_CAMPO = 1090411856;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_ASEG'
  and
        VALOR_CAMPO = '1090411856';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29861436380;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29861436515;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29747314517;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29861496825;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where

        num_secu_pol = 29861482072;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM g9001100
WHERE  COD_USR LIKE 'b8085964%';
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO G9001100 (COD_USR, COD_CIA, COD_DIV_REG, COD_OFI_COMER, COD_AGENCIA, COD_PROD, COD_SECC, COD_SIST, COD_SUBS)
VALUES ('B8085964', 9, 99, 999, 9999, 99999, 999, '9', '99');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM g9001100
WHERE  COD_USR LIKE 'B1030596%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM g9001100
WHERE  COD_USR LIKE 'B8085964%';
;-- -. . -..- - / . -. - .-. -.--
select r.VALOR_CAMPO                                     nro_doc_benef,
       t.tdoc_tercero                                    tipo_doc_tomador,
       t.nro_documto                                     nro_doc_tomador,
       --Fnc_Nombre_Tercero(t.tdoc_tercero, t.nro_documto) nombre_tomador,
       max(t.num_secu_pol)                               num_secu_pol,
       max(t.cod_ramo)                                   cod_ramo,
       max(t.num_pol1)                                   numero_poliza,
       max(t.fecha_vig_pol)                              fecha_vig_pol,
       max(t.fecha_venc_pol)                             fecha_venc_pol,
       max(t.cod_prod)                                   cod_prod
from a2000030 t
         INNER JOIN A2000020 r
                    ON t.NUM_SECU_POL = r.NUM_SECU_POL AND r.MCA_VIGENTE = 'S' AND r.COD_CAMPO = 'COD_BENEF' AND
                       r.VALOR_CAMPO IN
                       (890802621, 51646836, 901251613, 800250255, 890984843, 13501083, 900614125, 890801106, 901128535, 890801626)
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
;-- -. . -..- - / . -. - .-. -.--
select r.VALOR_CAMPO                                     nro_doc_benef,
       t.tdoc_tercero                                    tipo_doc_tomador,
       t.nro_documto                                     nro_doc_tomador,
       Fnc_Nombre_Tercero(t.tdoc_tercero, t.nro_documto) nombre_tomador,
       max(t.num_secu_pol)                               num_secu_pol,
       max(t.cod_ramo)                                   cod_ramo,
       max(t.num_pol1)                                   numero_poliza,
       max(t.fecha_vig_pol)                              fecha_vig_pol,
       max(t.fecha_venc_pol)                             fecha_venc_pol,
       max(t.cod_prod)                                   cod_prod
from a2000030 t
         INNER JOIN A2000020 r
                    ON t.NUM_SECU_POL = r.NUM_SECU_POL AND r.MCA_VIGENTE = 'S' AND r.COD_CAMPO = 'COD_BENEF' AND
                       r.VALOR_CAMPO IN
                       (890802621, 51646836, 901251613, 800250255, 890984843, 13501083, 900614125, 890801106, 901128535, 890801626)
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
;-- -. . -..- - / . -. - .-. -.--
select r.VALOR_CAMPO                                     nro_doc_benef,
       t.tdoc_tercero                                    tipo_doc_tomador,
       t.nro_documto                                     nro_doc_tomador,
       OPS$PUMA.Fnc_Nombre_Tercero(t.tdoc_tercero, t.nro_documto) nombre_tomador,
       max(t.num_secu_pol)                               num_secu_pol,
       max(t.cod_ramo)                                   cod_ramo,
       max(t.num_pol1)                                   numero_poliza,
       max(t.fecha_vig_pol)                              fecha_vig_pol,
       max(t.fecha_venc_pol)                             fecha_venc_pol,
       max(t.cod_prod)                                   cod_prod
from a2000030 t
         INNER JOIN A2000020 r
                    ON t.NUM_SECU_POL = r.NUM_SECU_POL AND r.MCA_VIGENTE = 'S' AND r.COD_CAMPO = 'COD_BENEF' AND
                       r.VALOR_CAMPO IN
                       (890802621, 51646836, 901251613, 800250255, 890984843, 13501083, 900614125, 890801106, 901128535, 890801626)
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
;-- -. . -..- - / . -. - .-. -.--
select r.VALOR_CAMPO                                     nro_doc_benef,
       t.tdoc_tercero                                    tipo_doc_tomador,
       t.nro_documto                                     nro_doc_tomador,
       OPS$PUMA.Fnc_Nombre_Tercero(t.tdoc_tercero, t.nro_documto) nombre_tomador,
       max(t.num_secu_pol)                               num_secu_pol,
       max(t.cod_ramo)                                   cod_ramo,
       max(t.num_pol1)                                   numero_poliza,
       max(t.fecha_vig_pol)                              fecha_vig_pol,
       max(t.fecha_venc_pol)                             fecha_venc_pol,
       max(t.cod_prod)                                   cod_prod
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
  and  t.cod_campo like '%DESC_RIES%';
;-- -. . -..- - / . -. - .-. -.--
select t.cod_cia,
       t.cod_ramo,
       t.num_secu,
       t.cod_campo,
       g.txt_titulo,
       t.cod_nivel,
       g.txt_help,
       g.*
from G2000020 t, G2000010 g
where t.cod_cia = g.cod_cia
  and t.cod_campo = g.cod_campo
  and t.cod_cia = 3
  and  t.cod_campo like '%DESC_RIES%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND NUM_SECU_POL in ( '39745249384','39745257583')
  AND COLCAR15 like '%.(778PUC016).ORA-01722%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM C9999040
WHERE USUARIO = 'RENOVADORAUT'
  --AND COLNUM02 IS NOT NULL
 -- AND COLCAR01 = '2024'
  -- AND NUM_SECU_POL in ( 39745258455, 39745256690);
  AND COLCAR03 IN ('23/09/2024');
;-- -. . -..- - / . -. - .-. -.--
SELECT TEXT
FROM ALL_SOURCE
WHERE NAME = 'PKG239_AGRICOLA'
  AND TYPE = 'PACKAGE BODY'
ORDER BY LINE;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where NUM_POL1 in (5010001793002);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM C9999909 WHERE  COD_TAB  LIKE 'MOVILIZACION' AND COD_RAMO = 777;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM sim_grupo_endoso_seccion
WHERE cod_cia = 3
  --AND cod_secc = 66
  AND cod_end = 900
  --AND sub_cod_end = 89
  -- AND codigo_grupo = l_RegionAgente
  AND modificable = 'S';
;-- -. . -..- - / . -. - .-. -.--
select * from sim_endosos_exentosxprodto where COD_SECC in (66);
;-- -. . -..- - / . -. - .-. -.--
select t.*
from sim_codigos_endoso_seccion t
where cod_secc        IN (66,999);
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM sim_endosos_seccion_usu se
WHERE cod_cia = 3
  AND cod_secc = 66;
;-- -. . -..- - / . -. - .-. -.--
select t.*, rowid
from sim_codigos_endoso_seccion t
where cod_end = 900
  and sub_cod_end in (89,90)
  and cod_cia = 3;
;-- -. . -..- - / . -. - .-. -.--
select t.*, rowid
from sim_grupo_endoso_seccion t
where cod_end = 900
  and cod_secc = 66
  and cod_cia = 3;
;-- -. . -..- - / . -. - .-. -.--
select t.*, rowid
from sim_grupo_datos_endoso_secc t;
;-- -. . -..- - / . -. - .-. -.--
select t.*, rowid
from sim_grupo_datos_endoso_secc t
where t.secuencia_sges in
      (select t2.secuencia_sges
       from SIM_GRUPO_ENDOSO_SECCION t2
       where t2.cod_end = 661
         --and t2.sub_cod_end = 3
         and t2.secuencia_sges = t.secuencia_sges);
;-- -. . -..- - / . -. - .-. -.--
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
  AND P.NUM_POL1 = 1004000025801  --602
  -- AND P.NUM_POL1 = 1010000006201
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
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
  --AND P.NUM_POL1 = 1004000025801  --602
   AND P.NUM_POL1 = 1004000000301
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
  COD_CAMPO = 'COD_BENEF'
        and
        num_secu_pol = 29732571725;
;-- -. . -..- - / . -. - .-. -.--
select * from A2000030 where NRO_DOCUMTO = 29732571725;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
    COD_CAMPO = 'COD_BENEF'
  and
    num_secu_pol = 29732571725 AND
    COD_RIES = 74;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
    num_secu_pol = 29732571725 AND
    COD_RIES = 74;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
    num_secu_pol = 29732571725 AND COD_RIES IS NULL;
;-- -. . -..- - / . -. - .-. -.--
select * from A2000030 where NUM_SECU_POL = 29732571725;
;-- -. . -..- - / . -. - .-. -.--
select A.NRO_DOCUMTO, A.* from A2000030 A where NUM_SECU_POL = 29732571725;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A7000900 WHERE NUM_SINI = 10040006475;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A7000900 S
                  INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         WHERE NUM_SINI = 10040006475 AND S.COD_RAMO in (602, 605);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A7000900 S
                  INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         WHERE S.NUM_SINI = 10040006475 AND S.COD_RAMO in (602, 605);
;-- -. . -..- - / . -. - .-. -.--
SELECT fecha_pago, FOR_PAGO
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 70162019004566;
;-- -. . -..- - / . -. - .-. -.--
SELECT FOR_PAGO
FROM A5021604
WHERE cod_cia = 3
  GROUP BY FOR_PAGO;
;-- -. . -..- - / . -. - .-. -.--
select * from naturales where numero_documento = 32145740;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where NUM_POL1 in (5010002045201);
;-- -. . -..- - / . -. - .-. -.--
select  * from SIM_CARGA_SINIESTROS
WHERE SECUENCIA IN (1511738);
;-- -. . -..- - / . -. - .-. -.--
select  * from SIM_CARGA_SINIESTROS
WHERE NUM_POL1 IN (5010002045201);
;-- -. . -..- - / . -. - .-. -.--
select  * from SIM_CARGA_SINIESTROS;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM SIM_CARGA_ERRORES WHERE SECUENCIA_ORIGEN  = 1523584;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES where SECUENCIA_CAR_SINI = 1523578;
;-- -. . -..- - / . -. - .-. -.--
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
   AND P.NUM_POL1 = 1004000000301
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
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
   AND P.NUM_POL1 = 1004007022101
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
select * from A2000030 where NRO_DOCUMTO = 70813391;
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_ASEG'
  and
        VALOR_CAMPO = '70813391';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM A2000030 WHERE NUM_SECU_POL = 29708361299;
;-- -. . -..- - / . -. - .-. -.--
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
   AND P.NUM_POL1 = 2590200977801
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
select a.*
from a2000020 a
where
        COD_CAMPO = 'COD_ASEG'
  and
        VALOR_CAMPO = '41890369';
;-- -. . -..- - / . -. - .-. -.--
SELECT S.*, L.* FROM A7000900 S
                  INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
         WHERE S.NUM_SINI = 10040006475 AND S.COD_RAMO in (602, 605);
;-- -. . -..- - / . -. - .-. -.--
SELECT S.*, L.* FROM A7000900 S
                         INNER JOIN A3001700 L ON S.NUM_SINI = L.NUM_SINI AND S.COD_CIA = L.COD_CIA AND S.COD_SECC = L.COD_SECC
WHERE S.NUM_POL1 = 1004007022101 AND S.COD_RAMO in (602, 605);
;-- -. . -..- - / . -. - .-. -.--
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
   AND P.NUM_POL1 = 1004000039101
  -- AND P.NUM_POL1 = 1004000039101
  -- AND S.NUM_SINI = 10100000002
--AND S.COD_RIES = :Ip_riesgo
  AND P.NUM_END = (SELECT MAX(B.NUM_END) FROM A2000030 B WHERE B.NUM_SECU_POL = P.NUM_SECU_POL)
  AND E.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001000 E WHERE S.COD_CIA = E.COD_CIA AND S.COD_SECC = E.COD_SECC AND S.NUM_SECU_SINI = E.NUM_SECU_SINI)
  AND R.Nro_Orden_Exp = (SELECT MAX(Nro_Orden_Exp) FROM A7001200 R WHERE S.NUM_SECU_SINI = R.NUM_SECU_SINI);
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT  a.dat_obs, a.dat_car FROM C9999909 A WHERE cod_tab like '%A5021604%';
;-- -. . -..- - / . -. - .-. -.--
SELECT FOR_PAGO
FROM A5021604
WHERE cod_cia = 3
  GROUP BY FOR_PAGO
  AND num_ord_pago = 70162019004566;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 154096000064;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 92482024023050;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM A5021604
WHERE cod_cia = 3
  AND num_ord_pago = 70162019004566;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where substr(t.num_pol1, 0, 11) in (50100019992);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where substr(a.num_pol1, 0, 11) in (50100019992);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where substr(a.num_pol1, 0, 11) in ('50100019992');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t
where T.ID_COTIZACION = 'asasd1405b5cddgb1004';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM OPS$PUMA.SIM_LOG_MOTORTARIFA_PYMES t where FECHA_INICIO > to_date('2025-03-06 10:00:00', 'YYYY-MM-DD HH24:MI:SS');
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100017895, 50100020753, 50100011711, 50100021552, 50100011156)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101;
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  --AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100011711)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where a.num_pol1 in (5010001999201, 5010001999202);
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001999201
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-02','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-02','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171102
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-02','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-02','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-27','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-02-27','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155201
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-27','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-02-27','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171103
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171101
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171102
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010001171104
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2024-01-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2024-01-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT w.SOLICITUD Solicitud, w.FEC_DILIGENCIA Fecha_radicacion, rcb.rcc_nmro_rcbo Liquidacion, e.fecha_factura Fecha_liquidacion
     , r.RLR_NMRO_RCBO recibo_caja_tronador, r.RLR_FCHA_RCBOS Fecha_recibo_caja, r.RLR_VLOR_RCBO valor_recibo, r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado Estado_cierre, e.nro_factura_dian factura_DIAN, e.SUCURSAL sucursal
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/01/2025', 'dd/mm/yyyy');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155201
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-05','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-02-05','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
 -- AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-05','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-02-05','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-05','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
  AND    NVL(P.MCA_ANU_POL,'N') = 'N';
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_DET_LIQUIDACIONES where SECUENCIA_CAR_LIQ = 590179;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_DET_LIQUIDACIONES;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where SECUENCIA_CAR_EXPE = 1772482;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_EXPEDIENTES where SECUENCIA_CAR_SINI = 1523578;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_EXPEDIENTES;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_EXPEDIENTES where SECUENCIA_CAR_SINI = 1536395;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where SECUENCIA_CAR_EXPE = 1536395;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_EXPEDIENTES where SECUENCIA_CAR_SINI = 303258;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES where SECUENCIA_CAR_SINI IS NOT NULL;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_DET_LIQUIDACIONES where SECUENCIA_CAR_LIQ = 2474458;
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-02-05','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-02-05','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002155202;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where NUM_POL1 in (5010002045202);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where substr(a.num_pol1, 0, 11) in ('50100020452');
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where NUM_POL1 in (5010002045201, 5010002045202, 5010002045203);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where NUM_POL1 in (5010001443301,5010001443302);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_END, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where NUM_POL1 in (5010001443301,5010001443302);
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_END, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.*
from a2000030 a
where NUM_POL1 in (5010001443301,5010001443302) AND COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT  P.SECUENCIA, P.POLIZA_SIMON, P.NUM_SECU_POL, P.SOLICITUD, P.NUM_END, P.TIPO_MOVIMIENTO
     ,C.CODIGO_COBERTURA, C.VALOR_ASEGURADO, C.VALOR_PRIMA, C.TASA
     , P.FECHA_MOVIMIENTO, P.FECHA_CREACION, P.FECHA_VIG_END, P.FECHA_VENC_END
FROM POLIZAS_SIMON P
         INNER JOIN COBERTURAS_SIMON C ON  (C.SECUENCIA = P.SECUENCIA)
WHERE substr(P.poliza_simon, 0, 11) = 50100020753
ORDER BY P.SECUENCIA, P.NUM_END, C.SECUENCIA_COBERTURA ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SIM_OPCIONES_COBERTURAS
WHERE COD_SECC = 37
  AND COD_RAMO = 486
  AND COD_CIA = 3;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SIM_OPCIONES_COBERTURAS
WHERE COD_SECC = 37
  AND COD_RAMO = 486
  AND COD_CIA = 3
  AND OPCION_COBERTURA =
      (6,4);
;-- -. . -..- - / . -. - .-. -.--
select * from A7000900 where num_sini = 50100002642;
;-- -. . -..- - / . -. - .-. -.--
select * from a2000020 where NUM_SECU_POL = 29810794316;
;-- -. . -..- - / . -. - .-. -.--
select * from CREGLAS;
;-- -. . -..- - / . -. - .-. -.--
select * from CREGLAS where CDREG = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.* from CREGLAS R where CDREG = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.* from CREGLAS R where DSSUCCES = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSSUCCES = '300LTF001';
;-- -. . -..- - / . -. - .-. -.--
SELECT *  FROM G2000020 WHERE COD_CIA = 3 AND COD_SECC = 37 AND COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 127;
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE REG_PRE_FIELD = '300LTF001';
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE REG_PRE_FIELD = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE COD_REGLA = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE COD_REGLA = '300LTF001';
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 23
  AND    G.COD_RAMO = 109;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM G7000020 WHERE COD_CIA = 3 AND COD_RAMO = 486 and COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM G7000020 WHERE COD_CIA = 3 AND COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM G7000020 WHERE COD_CIA = 3;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM G7000020 WHERE COD_REGLA = '300LTF001';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSSUCCES = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSFAILUR = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV013', '237PVV028', '237PVV031', '237PVV029', '237PVV030');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004', '237PVV006');
;-- -. . -..- - / . -. - .-. -.--
elect * from G2000200 where COD_CIA = 3 and COD_RAMO = 486 AND COD_SECC = 37;;
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where CDREG IN ('300LTF001', '300LTI002');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R WHERE REGLA_COMPLETA LIKE '%PRC_REGLA_300LTI001%';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R WHERE REGLA_COMPLETA LIKE '%300LTI001%';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R WHERE REGLA_COMPLETA LIKE '%300LTI%';
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_G7000025 WHERE COD_CIA = 3 AND COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
SELECT *  FROM SIM_G2000020 WHERE COD_CIA = 3 AND COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004', '237PVV006','237PVV005');
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where COD_CIA = 3 and COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where COD_CIA = 3  AND COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTI002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSFAILUR = '300LTF001';
;-- -. . -..- - / . -. - .-. -.--
select * from A2000220 where NUM_SECU_POL in (27308703910);
;-- -. . -..- - / . -. - .-. -.--
select * from g2000210 where cod_error=302;
;-- -. . -..- - / . -. - .-. -.--
select * from g2000210 where cod_error=302 AND COD_CIA=3;
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where COD_CIA = 3 and COD_RAMO = 486 AND COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.* from CREGLAS R where CDREG IN ('300LTI002', '300LTF001');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004', '237PVV006','237PVV005' '300LTV001', '300LTV002', '300LTV003', '300LTV004', '300LTV005', '300LTV006', '300LTV007', '300LTV008');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004', '237PVV006','237PVV005', '300LTV001', '300LTV002', '300LTV003', '300LTV004', '300LTV005', '300LTV006', '300LTV007', '300LTV008');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSFAILUR = '300LTV002';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('210PVV200', '220PVV258', '223GVV003', '237PVV001', '237PVV003', '237PVV005', '237PVV005', '237PVV009',
                '237PVV009', '237PVV010', '237PVV011', '237PVV015', '237PVV016', '237PVV018', '237PVV020', '237PVV020',
                '237PVV033', '299GVV010', '299PVV012');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('220PVV263','223GVV004','223PVV098','237PVV004','237PVV005','237PVV008','237PVV008','237PVV021','299GVV007');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('205PVV142','220PVV425','223PVV099','237PVV004','237PVV006';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('205PVV142','220PVV425','223PVV099','237PVV004','237PVV006');
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV005';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV004';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV002';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM G7000020 WHERE COD_REGLA = '300LTF002';
;-- -. . -..- - / . -. - .-. -.--
select * from G2000210 where COD_ERROR IN (702,706,714,721,728,302) and COD_CIA = 3;
;-- -. . -..- - / . -. - .-. -.--
select * from A2000220 WHERE COD_ERROR IN (702,706,714,721,728,302);
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTI110';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV006';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTI001';
;-- -. . -..- - / . -. - .-. -.--
select * from G7000025 WHERE COD_CIA = 3 AND COD_RAMO = 486 and COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_G7000025 WHERE COD_CIA = 3 AND COD_RAMO = 486 and COD_SECC = 37;
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where CDREG IN ('300LTV006');
;-- -. . -..- - / . -. - .-. -.--
SELECT *  FROM G2000020 WHERE COD_CIA = 3 AND COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
SELECT *  FROM G2000020 where COD_REGLA = '300LTV006';
;-- -. . -..- - / . -. - .-. -.--
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where CDREG IN ('300LTI002', '300LTF001');
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM SIM_OPCIONES_COBERTURAS
WHERE COD_SECC = 37
  AND COD_RAMO = 486
  AND COD_CIA = 3
  AND OPCION_COBERTURA in (6,4);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM a2000040 WHERE num_secu_pol = 29819564430;
;-- -. . -..- - / . -. - .-. -.--
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.FOR_COBRO, a.NUM_SECU_POL, a.COD_RAMO, a.MCA_ANU_POL, a.MCA_EXCLUSIVO, a.*
from a2000030 a
where NUM_POL1 in (5010002045201, 5010002045202, 5010002045203, 5010002045204);
;-- -. . -..- - / . -. - .-. -.--
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
  -- AND NUM_SECU_POL in ('39745256690')
  AND RENOVADA_POR IS NULL
  AND nvl(a.fecha_venc_pol, a.fecha_venc_end) < ADD_MONTHS(SYSDATE, 1);
;-- -. . -..- - / . -. - .-. -.--
SELECT * from g2000020 WHERE COD_REGLA = '922PCI001';
;-- -. . -..- - / . -. - .-. -.--
select * from simapi_estrategias  where id_estrategia in (67,88,84);
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
     COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
    NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
    FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
    LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
    FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
    OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
    FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
    FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION
) VALUES (
             3, 37, 486, '2', 1, 1, 29828220078, 5010002294202, 'I',
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
select * from A2000220 where NUM_SECU_POL in (5010002485901);
;-- -. . -..- - / . -. - .-. -.--
select * from A7000900 where num_sini = 50100002976;
;-- -. . -..- - / . -. - .-. -.--
select * from A7000900 where MCA_TRANSIT = 'S';
;-- -. . -..- - / . -. - .-. -.--
SELECT L.*
FROM SIM_CARGA_LIQUIDACIONES L
WHERE L.COD_CIA=3 AND L.COD_SECC=37 AND L.COD_RAMO=486;
;-- -. . -..- - / . -. - .-. -.--
SELECT L.*
FROM SIM_CARGA_LIQUIDACIONES L
WHERE L.COD_CIA=3 AND L.COD_SECC=37 AND L.COD_RAMO=486
  AND L.FECHA_PAGO >= TO_DATE('01/01/2025', 'DD/MM/YYYY')
  AND (MCA_PROCESO<>'S' OR MCA_PROCESO IS NULL );
;-- -. . -..- - / . -. - .-. -.--
select D.* FROM SIM_CARGA_DET_LIQUIDACIONES D
WHERE D.SECUENCIA_CAR_LIQ IN (
    SELECT L.SECUENCIA
    FROM SIM_CARGA_LIQUIDACIONES L
    WHERE L.COD_CIA=3 AND L.COD_SECC=37 AND L.COD_RAMO=486
      AND L.FECHA_PAGO >= TO_DATE('01/01/2025', 'DD/MM/YYYY')
      AND (MCA_PROCESO<>'S' OR MCA_PROCESO IS NULL )
) AND (MCA_PROCESO<>'S' OR MCA_PROCESO IS NULL );
;-- -. . -..- - / . -. - .-. -.--
select * from A7000900 where NUM_SINI = '50100002989';
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100022265)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002226502
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-05-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-05-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
SELECT max(P.NUM_POL1)
FROM   A2000030 P,
       A2000030 P1
WHERE  (P.NUM_POL1 = P1.NUM_POL_ANT OR P.NUM_POL1 = P1.NUM_POL1 OR P1.NUM_POL1 = P.NUM_POL_ANT)
  AND    P.COD_CIA = P1.COD_CIA
  AND    P.COD_SECC = P1.COD_SECC
  AND    P.COD_CIA = 3
  AND    P.COD_SECC = 37
  AND    P1.NUM_POL1 = 5010002226501
  AND    NVL(P.MCA_ANU_POL,'N') = 'N'
  AND    P.FECHA_VIG_END <= TO_DATE('2025-05-01','YYYY-MM-DD')
  AND    P.FECHA_VENC_END >= TO_DATE('2025-05-01','YYYY-MM-DD');
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100021552)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select A.NUM_SECU_SINI, A.* from A7000900 A where  A.NUM_SINI IN (50100002989);
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100003153)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000020
where num_secu_pol IN ('29776337000' );
;-- -. . -..- - / . -. - .-. -.--
select * from A9990100;
;-- -. . -..- - / . -. - .-. -.--
SELECT  P.SECUENCIA, P.POLIZA_SIMON, P.NUM_SECU_POL, P.SOLICITUD, P.NUM_END, P.TIPO_MOVIMIENTO
     ,C.CODIGO_COBERTURA, C.VALOR_ASEGURADO, C.VALOR_PRIMA, C.TASA
     , P.FECHA_MOVIMIENTO, P.FECHA_CREACION, P.FECHA_VIG_END, P.FECHA_VENC_END
FROM POLIZAS_SIMON P
         INNER JOIN COBERTURAS_SIMON C ON  (C.SECUENCIA = P.SECUENCIA)
WHERE substr(P.poliza_simon, 0, 11) = 50100003153
ORDER BY P.SECUENCIA, P.NUM_END, C.SECUENCIA_COBERTURA ASC;
;-- -. . -..- - / . -. - .-. -.--
select * from A9990100 where NUM_SECU_POL = 29776337000;
;-- -. . -..- - / . -. - .-. -.--
select *
from polizas_simon t
where substr(t.poliza_simon, 0, 11) in (50100025638);
;-- -. . -..- - / . -. - .-. -.--
select * from A7000900 where NUM_SINI = '50100003024';
;-- -. . -..- - / . -. - .-. -.--
select * from G2000210 where COD_ERROR IN (702,706,714,721,728) and COD_CIA = 3;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where SECUENCIA_CAR_EXPE = 1796999;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES where SECUENCIA_CAR_SINI = 1541978;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES where SECUENCIA_CAR_SINI = 1537523;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_DET_LIQUIDACIONES where SECUENCIA_CAR_LIQ = 1537523;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where NRO_EXPED is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_LIQUIDACIONES where NRO_EXPED is not null;
;-- -. . -..- - / . -. - .-. -.--
UPDATE SIM_CARGA_RESERVAS
SET     MCA_PROCESO   = NULL,
        FECHA_PROCESO = NULL,
        SECUENCIA_CAR_EXPE = 1556393
WHERE  SECUENCIA_CAR_EXPE IN (1842794);
;-- -. . -..- - / . -. - .-. -.--
UPDATE SIM_CARGA_LIQUIDACIONES
SET    MCA_PROCESO   = NULL,
       FECHA_PROCESO = NULL,
       SECUENCIA_CAR_EXPE = 1556393
WHERE  SECUENCIA        IN (2912901, 2912902);
;-- -. . -..- - / . -. - .-. -.--
UPDATE SIM_CARGA_DET_LIQUIDACIONES
SET     MCA_PROCESO   = NULL,
        FECHA_PROCESO = NULL
WHERE SECUENCIA_CAR_LIQ IN (2912901, 2912902);
;-- -. . -..- - / . -. - .-. -.--
UPDATE SIM_CARGA_RESERVAS
SET     MCA_PROCESO   = NULL,
        FECHA_PROCESO = NULL,
        SECUENCIA_CAR_EXPE = 1556393
WHERE  SECUENCIA_CAR_EXPE IN (1796999);
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where  SECUENCIA_CAR_EXPE = 1556393;
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_EXPEDIENTES where SECUENCIA = '1796999';
;-- -. . -..- - / . -. - .-. -.--
select * from SIM_CARGA_RESERVAS where  SECUENCIA_CAR_EXPE = 1796999;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO OPS$PUMA.POLIZAS_SIMON (SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES, NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA, FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE, LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE, FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON, OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR, FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END, FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION) VALUES (79543, 3, 37, 486, '1', 0, 1, 29820697177, 5010002563801, 'I', DATE '2025-02-14', DATE '2025-02-01', DATE '2026-02-01', 1, 7613324, 'CL 6 A 32 51', 11001, '75272', 11001, 0, 'C', 'T', DATE '2025-09-30', DATE '2025-02-14', 'SIMONWEBAPP', null, null, null, 'Fue actualizado Registro: 24/02/2025', null, 'CC', 41401098, null, null, null, null, 'N', null, DATE '2025-02-01', DATE '2026-02-01', 1663200.00, 316008.00, DATE '2025-02-24', null);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO OPS$PUMA.POLIZAS_SIMON (COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
                                    NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
                                    FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
                                    LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
                                    FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
                                    OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
                                    FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
                                    FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION)
VALUES (3, 37, 486, '1', 0, 1, 29820697177, 5010002563801, 'I', DATE '2025-02-14', DATE '2025-02-01',
        DATE '2026-02-01', 1, 7613324, 'CL 6 A 32 51', 11001, '75272', 11001, 0, 'C', 'T', DATE '2025-09-30',
        DATE '2025-02-14', 'SIMONWEBAPP', null, null, null, 'Fue actualizado Registro: 24/02/2025', null, 'CC',
        41401098, null, null, null, null, 'N', null, DATE '2025-02-01', DATE '2026-02-01', 1663200.00, 316008.00,
        DATE '2025-02-24', null);
;-- -. . -..- - / . -. - .-. -.--
delete POLIZAS_SIMON where SECUENCIA = 79543;
;-- -. . -..- - / . -. - .-. -.--
SELECT max(SECUENCIA) FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010002563801);
;-- -. . -..- - / . -. - .-. -.--
SELECT max(SECUENCIA) FROM POLIZAS_SIMON;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO OPS$PUMA.POLIZAS_SIMON (SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
                                    NUM_SECU_POL, POLIZA_SIMON, TIPO_POLIZA, FECHA_MOVIMIENTO, FECHA_INICIO_VIGENCIA,
                                    FECHA_FINAL_VIGENCIA, ANUALIDAD, SOLICITUD, DIRECCION_RIESGO, CIUDAD, CLAVE,
                                    LOCALIDAD, VALOR_GASTOS, ESTADO_CARGUE_SIMON, ESTADO_CARGUE_SAI, FECHA_CARGUE,
                                    FECHA_CREACION, USUARIO_CREACION, COD_END, SUB_COD_END, TIPO_END, OBSERVACION_SIMON,
                                    OBSERVACION_SAI, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NUM_POL_ANT, RENOVADA_POR,
                                    FEC_ANU_POL, FEC_ANU_END, MCA_PROVISORIO, FECHA_EMI_END, FECHA_VIG_END,
                                    FECHA_VENC_END, VALOR_PRIMA, VALOR_IVA, FECHA_MODIFICACION, NUM_POL_COTIZACION)
VALUES (86946, 3, 37, 486, '1', 0, 1, 29820697177, 5010002563801, 'I', DATE '2025-02-14', DATE '2025-02-01',
        DATE '2026-02-01', 1, 7613324, 'CL 6 A 32 51', 11001, '75272', 11001, 0, 'C', 'T', DATE '2025-09-30',
        DATE '2025-02-14', 'SIMONWEBAPP', null, null, null, 'Fue actualizado Registro: 24/02/2025', null, 'CC',
        41401098, null, null, null, null, 'N', null, DATE '2025-02-01', DATE '2026-02-01', 1663200.00, 316008.00,
        DATE '2025-02-24', null);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO OPS$PUMA.POLIZAS_SIMON (SECUENCIA, COD_CIA, COD_SECC, COD_RAMO, TIPO_MOVIMIENTO, NUM_END, COD_RIES,
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
UPDATE POLIZAS_SIMON
SET
    COD_CIA = 3,
    COD_SECC = 37,
    COD_RAMO = 486,
    TIPO_MOVIMIENTO = '1',
    NUM_END = 0,
    COD_RIES = 1,
    NUM_SECU_POL = 29820697177,
    POLIZA_SIMON = 5010002563801,
    TIPO_POLIZA = 'I',
    FECHA_MOVIMIENTO = DATE '2025-02-14',
    FECHA_INICIO_VIGENCIA = DATE '2025-02-01',
    FECHA_FINAL_VIGENCIA = DATE '2026-02-01',
    ANUALIDAD = 1,
    SOLICITUD = 7613324,
    DIRECCION_RIESGO = 'CL 6 A 32 51',
    CIUDAD = 11001,
    CLAVE = '75272',
    LOCALIDAD = 11001,
    VALOR_GASTOS = 0,
    ESTADO_CARGUE_SIMON = 'C',
    ESTADO_CARGUE_SAI = 'T',
    FECHA_CARGUE = DATE '2025-09-30',
    USUARIO_CREACION = 'SIMONWEBAPP',
    OBSERVACION_SIMON = 'Fue actualizado Registro: 24/02/2025',
    TIPO_DOCUMENTO = 'CC',
    NUMERO_DOCUMENTO = 41401098,
    MCA_PROVISORIO = 'N',
    FECHA_VIG_END = DATE '2025-02-01',
    FECHA_VENC_END = DATE '2026-02-01',
    VALOR_PRIMA = 1663200.00,
    VALOR_IVA = 316008.00,
    FECHA_MODIFICACION = SYSDATE
WHERE SECUENCIA = 79543;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM COBERTURAS_SIMON
WHERE NUM_SECU_POL = 29820697177;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM POLIZAS_SIMON
WHERE POLIZA_SIMON IN (5010002563801);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    p.num_pol1,
    p.num_end,
    p.num_secu_pol,
    c.cod_cob,
    c.prima_cob,
    c.end_prima_cob,
    c.descuent_prima,
    c.porc_rebaja,
    c.mca_prima_inf,
    (c.prima_cob + NVL(c.end_prima_cob, 0)) as prima_total_cobertura
FROM a2000030 p
         INNER JOIN a2000040 c ON c.num_secu_pol = p.num_secu_pol
WHERE p.cod_cia = 3
  AND p.cod_secc = 37
  AND p.cod_ramo = 486
  AND p.renovada_por IS NOT NULL
  AND p.fecha_equipo > SYSDATE - 30  -- últimos 30 días
  AND ((c.prima_cob + NVL(c.end_prima_cob, 0)) < 0
    OR c.descuent_prima >= 100
    OR c.porc_rebaja >= 100)
ORDER BY p.fecha_equipo DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    p.num_pol1,
    p.num_end,
    p.num_secu_pol,
    c.cod_cob,
    c.prima_cob,
    c.end_prima_cob,
    c.descuent_prima,
    c.porc_rebaja,
    c.mca_prima_inf,
    (c.prima_cob + NVL(c.end_prima_cob, 0)) as prima_total_cobertura
FROM a2000030 p
         INNER JOIN a2000040 c ON c.num_secu_pol = p.num_secu_pol
WHERE p.cod_cia = 3
  AND p.cod_secc = 37
  AND p.cod_ramo = 486
  AND p.renovada_por IS NOT NULL
  AND p.fecha_equipo > SYSDATE - 360  -- últimos 30 días
  AND ((c.prima_cob + NVL(c.end_prima_cob, 0)) < 0
    OR c.descuent_prima >= 100
    OR c.porc_rebaja >= 100)
ORDER BY p.fecha_equipo DESC;
;-- -. . -..- - / . -. - .-. -.--
select *
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100018132)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select t.NUM_END, t.*
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100018132)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select * from a2000040;
;-- -. . -..- - / . -. - .-. -.--
select * from A1002100;
;-- -. . -..- - / . -. - .-. -.--
select * from A1002100 where cod_cia = 3 and COD_RAMO = 486;
;-- -. . -..- - / . -. - .-. -.--
select * from a2000040 where NUM_SECU_POL = 29808990497;
;-- -. . -..- - / . -. - .-. -.--
select * from a7001000;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM c9999909 d
WHERE d.cod_tab = 'TIP_EXP'
  AND d.cod_ramo = 3
  AND d.cod_secc = 37
  AND d.cod_cia = 486;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM c9999909 d
WHERE d.cod_tab = 'TIP_EXP';
;-- -. . -..- - / . -. - .-. -.--
SELECT nvl(mca_unico, 'N')
FROM g7000100
WHERE cod_cia = 3
  AND cod_secc = 37
  AND cod_ramo = 486;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM g7000100
WHERE cod_cia = 3
  AND cod_secc = 37
  AND cod_ramo = 486;
;-- -. . -..- - / . -. - .-. -.--
select t.NUM_END, t.NUM_SECU_POL, t.*
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100018132)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select * from a2000040 where NUM_SECU_POL IN (select t.NUM_SECU_POL
                                              from a2000030 t
                                              where substr(t.num_pol1, 0, 11) in (50100018132)
                                                and cod_secc = 37);
;-- -. . -..- - / . -. - .-. -.--
select * from POLIZAS_SIMON where POLIZA_SIMON=5010001692705;
;-- -. . -..- - / . -. - .-. -.--
select * from sim_procesos;
;-- -. . -..- - / . -. - .-. -.--
select * from sim_procesos where id_proceso = 771;
;-- -. . -..- - / . -. - .-. -.--
select * from sim_procesos where id_proceso in (771,772);
;-- -. . -..- - / . -. - .-. -.--
select t.NUM_END, t.NUM_SECU_POL, t.*
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100014792)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select t.NUM_END, t.NUM_SECU_POL, t.MCA_ANU_POL, t.DESC_POL , t.*
from a2000030 t
where substr(t.num_pol1, 0, 11) in (50100014792)
  and cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE cod_secc = 999
  AND TIPO_EXPED = 'DYF';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.cod_secc, a.cod_causa, a.cod_cons, a.cod_cob, a.cod_concep_rva, a.TIPO_EXPED, a.*
FROM a7000100 a
WHERE cod_secc = 37;
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_RESERVAS
where PROCESO = 70
  and COD_SECC = 37
  and cod_ramo = 486
  and TIPO_EXPED = 'ARR'
  AND COD_COB IN (716, 717);
;-- -. . -..- - / . -. - .-. -.--
select *
from SIM_CARGA_RESERVAS_HI
where PROCESO = 70
  and COD_SECC = 37
  and cod_ramo = 486
  and TIPO_EXPED = 'ARR'
  AND COD_COB IN (716, 717);
;-- -. . -..- - / . -. - .-. -.--
select A.NUM_SECU_SINI, A.* from A7000900 A where  A.NUM_POL1 IN (5010002485901);
;-- -. . -..- - / . -. - .-. -.--
select A.NUM_SECU_SINI, A.* from A7000900 A where  A.NUM_POL1 IN (5010002376101);
;-- -. . -..- - / . -. - .-. -.--
select A.NUM_SECU_SINI, A.* from A7000900 A where  A.NUM_POL1 IN (5010001544902, 5010001930901, 5010002001401);
;-- -. . -..- - / . -. - .-. -.--
select * from CREGLAS where cdreg = '799STV002';
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200;
;-- -. . -..- - / . -. - .-. -.--
select * from G2000200 where CDREG = '799STV002';