SELECT *
FROM CDGOS_RSLTDS C
WHERE  CRE_CDGO = '115';

SELECT *
           FROM cdgos_rsltds  C
           WHERE c.cre_tpo_rsltdo ='03'
             and c.CRE_CNSLTBLE='S';

SELECT decode(a.arr_tpo_arrndtrio,'I','INQUILINO','P','INQUILINO','DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
       a.arr_nmro_idntfccion  AS IDENTIFICACION,
       pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
       r.ret_nmro_slctud AS SOLICITUD,
       r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
       r.ret_obsrvcion   AS DESCRIPCION_RESULTADO
FROM arrndtrios a,rsltdo_estdio r,cg_ref_codes g
WHERE a.arr_ses_nmro    = 11318602
  and a.arr_estdo = 'V'
  and a.arr_nmro_slctud = r.ret_nmro_slctud
  and g.rv_low_value = r.ret_cdgo_rsltdo
  and g.rv_domain = 'RESULTADOS'
  and g.rv_high_value  ='A'
UNION
SELECT decode(a.arr_tpo_arrndtrio,'I','INQUILINO','P','INQUILINO','DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
       a.arr_nmro_idntfccion  AS IDENTIFICACION,
       pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
       r.ret_nmro_slctud AS SOLICITUD,
       r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
       r.ret_obsrvcion   AS DESCRIPCION_RESULTADO
FROM arrndtrios a, rsltdo_estdio r, cdgos_rsltds c
WHERE a.arr_ses_nmro    = 11420971
  and a.arr_estdo = 'V'
  and a.arr_nmro_slctud = r.ret_nmro_slctud
  and r.ret_cdgo_rsltdo = c.cre_cdgo
  --and c.cre_tpo_rsltdo = '03'
  and c.cre_cnsltble = 'S';


SELECT decode(a.arr_tpo_arrndtrio,'I','INQUILINO','P','INQUILINO','DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
       a.arr_nmro_idntfccion  AS IDENTIFICACION,
       pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
       r.ret_nmro_slctud AS SOLICITUD,
       r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
       r.ret_obsrvcion   AS DESCRIPCION_RESULTADO
FROM arrndtrios a,rsltdo_estdio r,cg_ref_codes g
WHERE a.arr_ses_nmro    = 7813481
  and a.arr_estdo = 'V'
  and a.arr_nmro_slctud = r.ret_nmro_slctud
  and g.rv_low_value = r.ret_cdgo_rsltdo
  and g.rv_domain = 'RESULTADOS'
  and g.rv_high_value  ='A'


SELECT
    DECODE(a.arr_tpo_arrndtrio, 'I', 'INQUILINO', 'P', 'INQUILINO', 'DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
    a.arr_nmro_idntfccion AS IDENTIFICACION,
    pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
    r.ret_nmro_slctud AS SOLICITUD,
    r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
    r.ret_obsrvcion AS DESCRIPCION_RESULTADO,
    c.cre_cnsltble
FROM arrndtrios a
         INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
         INNER JOIN cdgos_rsltds c ON r.ret_cdgo_rsltdo = c.cre_cdgo
WHERE a.arr_ses_nmro = 11318602
  AND a.arr_estdo = 'V'
 -- AND c.cre_tpo_rsltdo = '03'
  AND TRIM(c.cre_cnsltble) = 'S';


select * from arrndtrios where ARR_FCHA_ACTLZCION >= to_date('01/01/2024', 'dd/mm/yyyy');

select * from rsltdo_estdio where ret_cdgo_rsltdo in ('115');

--11318602  03 115
--10092255  01 115

select * from cg_ref_codes where rv_domain = 'RESULTADOS';

SELECT decode(a.arr_tpo_arrndtrio,'I','INQUILINO','P','INQUILINO','DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
       a.arr_nmro_idntfccion  AS IDENTIFICACION,
       pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
       r.ret_nmro_slctud AS SOLICITUD,
       r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
       r.ret_obsrvcion   AS DESCRIPCION_RESULTADO
FROM arrndtrios a,rsltdo_estdio r,cg_ref_codes g
WHERE a.arr_ses_nmro    = 11318602
  and a.arr_estdo = 'V'
  and a.arr_nmro_slctud = r.ret_nmro_slctud
  and g.rv_low_value = r.ret_cdgo_rsltdo
  and g.rv_domain = 'RESULTADOS'
  and g.rv_high_value  ='A'
UNION
SELECT
    DECODE(a.arr_tpo_arrndtrio, 'I', 'INQUILINO', 'P', 'INQUILINO', 'DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
    a.arr_nmro_idntfccion AS IDENTIFICACION,
    pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
    r.ret_nmro_slctud AS SOLICITUD,
    r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
    r.ret_obsrvcion AS DESCRIPCION_RESULTADO
FROM arrndtrios a
         INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
         INNER JOIN cdgos_rsltds c ON r.ret_cdgo_rsltdo = c.cre_cdgo
WHERE a.arr_ses_nmro = 11318602
  AND a.arr_estdo = 'V'
  AND c.cre_cnsltble = 'S'
  AND c.cre_tpo_rsltdo IN (SELECT r.ret_cdgo_rsltdo
                           FROM arrndtrios a
                                    INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
                                    INNER JOIN cg_ref_codes g ON g.rv_low_value = r.ret_cdgo_rsltdo
                           WHERE a.arr_ses_nmro = 11318602
                             AND a.arr_estdo = 'V'
                             AND g.rv_domain = 'RESULTADOS'
                             AND g.rv_high_value = 'A' group by r.ret_cdgo_rsltdo);



SELECT RET_NMRO_SLCTUD
FROM rsltdo_estdio
WHERE RET_CDGO_RSLTDO IN ('115', '03')
GROUP BY RET_NMRO_SLCTUD
HAVING COUNT(DISTINCT RET_CDGO_RSLTDO) = 2;

--11318602  03 115
--10092255  01 115
WITH codigos_validos AS (
    SELECT DISTINCT r.ret_cdgo_rsltdo
    FROM arrndtrios a
             INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
             INNER JOIN cg_ref_codes g ON g.rv_low_value = r.ret_cdgo_rsltdo
    WHERE a.arr_ses_nmro = 10092255
      AND a.arr_estdo = 'V'
      AND g.rv_domain = 'RESULTADOS'
      AND g.rv_high_value = 'A'
)
SELECT
    DECODE(a.arr_tpo_arrndtrio, 'I', 'INQUILINO', 'P', 'INQUILINO', 'DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
    a.arr_nmro_idntfccion AS IDENTIFICACION,
    pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
    r.ret_nmro_slctud AS SOLICITUD,
    r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
    r.ret_obsrvcion AS DESCRIPCION_RESULTADO
FROM arrndtrios a
         INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
         INNER JOIN cg_ref_codes g ON g.rv_low_value = r.ret_cdgo_rsltdo
WHERE a.arr_ses_nmro = 10092255
  AND a.arr_estdo = 'V'
  AND g.rv_domain = 'RESULTADOS'
  AND g.rv_high_value = 'A'
UNION ALL
SELECT
    DECODE(a.arr_tpo_arrndtrio, 'I', 'INQUILINO', 'P', 'INQUILINO', 'DEUDOR SOLIDARIO') AS TIPO_DEUDOR,
    a.arr_nmro_idntfccion AS IDENTIFICACION,
    pk_terceros.f_nombres(a.arr_nmro_idntfccion, a.arr_tpo_idntfccion) AS NOMBRE,
    r.ret_nmro_slctud AS SOLICITUD,
    r.ret_cdgo_rsltdo AS CODIGO_RESULTADO,
    r.ret_obsrvcion AS DESCRIPCION_RESULTADO
FROM arrndtrios a
         INNER JOIN rsltdo_estdio r ON a.arr_nmro_slctud = r.ret_nmro_slctud
         INNER JOIN cdgos_rsltds c ON r.ret_cdgo_rsltdo = c.cre_cdgo
         INNER JOIN codigos_validos v ON c.cre_tpo_rsltdo = v.ret_cdgo_rsltdo
WHERE a.arr_ses_nmro = 10092255
  AND a.arr_estdo = 'V'
  AND c.cre_cnsltble = 'S'


SELECT S.SES_NMRO AS SOLICITUD,
                   S.SES_NMRO_PLZA AS POLIZA,
                   A.ARR_NMRO_IDNTFCCION AS IDENTIFICACION_INQUILINO,
                   A.ARR_TPO_IDNTFCCION AS TIPO_IDENTIFICACION,
                   PK_TERCEROS.F_NOMBRES(A.ARR_NMRO_IDNTFCCION, A.ARR_TPO_IDNTFCCION) AS NOMBRE_INQUILINO,
                   DECODE(D.CORREO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,6),D.CORREO) AS CORREO_INQUILINO ,
                   DECODE(D.NUM_TELEFONO,NULL,PK_TERCEROS.FUN_RET_MEDIO_TERCERO(A.ARR_TPO_IDNTFCCION,A.ARR_NMRO_IDNTFCCION,NULL,4),D.NUM_TELEFONO) AS TELEFONO_INQUILINO,
                   D.INGRESOS,
                   D.FECHA_EXPEDICION,
                   S.SES_CNON_ARRNDMNTO AS CANON,
                   S.SES_CTA_ADMNSTRCION AS CUOTA,
                   DIR.DI_DIRECCION AS DIRECCION_INMUEBLE,
                   C.RV_MEANING AS DESTINO_INMUEBLE,
                   P.NOMBRE AS CIUDAD_INMUEBLE,
                   E.NOMBRE_ASESOR,
                   E.CORREO_ASESOR,
                   DECODE(RES.RET_CDGO_RSLTDO,'01','APROBADA','02','APLAZADA','03','NEGADA') AS ESTADO_GENERAL,
                   TO_CHAR(S.SES_FCHA_INGRSO,'DDMMYYYY HH:MM:SS') FECHA_RADICACION,
                   TO_CHAR(RES.RET_FCHA_RSLTDO,'DDMMYYYY HH:MM:SS') FECHA_RESULTADO
              FROM SLCTDES_ESTDIOS S
              LEFT JOIN AEW_DEUDORES D ON S.SES_NMRO = D.SOLICITUD AND D.TIPO = 'I'
              LEFT JOIN AEW_ESTUDIOS E ON S.SES_NMRO = E.SOLICITUD
              INNER JOIN DIRECCIONES DIR ON S.SES_NMRO = DIR.DI_SOLICITUD AND DIR.DI_TPO_DRCCION = 'E'
              INNER JOIN RSLTDO_ESTDIO RES ON (S.SES_NMRO = RES.RET_NMRO_SLCTUD AND RES.RET_CDGO_RSLTDO IN ('01','02','03'))
              INNER JOIN ARRNDTRIOS A ON (S.SES_NMRO = A.ARR_NMRO_SLCTUD)
              INNER JOIN DIVISION_POLITICAS P ON  DIR.DI_DIVPOL_CODIGO = P.CODIGO_CODAZZI
              INNER JOIN CG_REF_CODES C ON S.SES_DSTNO_INMBLE = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
              WHERE S.SES_NMRO_PLZA = P_POLIZA
                AND TRUNC(S.SES_FCHA_INGRSO) >= V_FECHA_DESDE
                AND TRUNC(S.SES_FCHA_INGRSO) <= V_FECHA_HASTA
            UNION
            SELECT W.SOLICITUD AS SOLICITUD,
                   W.COD_INMOBILIARIA AS POLIZA,
                   D.NUM_DOCUMENTO AS IDENTIFICACION_INQUILINO,
                   D.TIP_DOCUMENTO AS TIPO_IDENTIFICACION,
                   D.PNOMBRE||' '||D.SNOMBRE||' '||D.PAPELLIDO||' '||D.SAPELLIDO AS NOMBRE_INQUILINO,
                   D.CORREO AS CORREO_INQUILINO ,
                   D.NUM_TELEFONO AS TELEFONO_INQUILINO,
                   D.INGRESOS,
                   D.FECHA_EXPEDICION,
                   W.VLR_CANON AS CANON,
                   W.VLR_ADMIN AS CUOTA,
                   W.DIRECCION AS DIRECCION_INMUEBLE,
                   C.RV_MEANING AS DESTINO_INMUEBLE,
                   P.NOMBRE AS CIUDAD_INMUEBLE,
                   W.NOMBRE_ASESOR,
                   W.CORREO_ASESOR,
                   'APLAZADO-NUBE' AS ESTADO_GENERAL,
                   TO_CHAR(W.FEC_DILIGENCIA,'DDMMYYYY HH:MM:SS') FECHA_RADICACION,
                   TO_CHAR(W.FEC_MODIFICA,'DDMMYYYY HH:MM:SS') FECHA_RESULTADO
              FROM AEW_ESTUDIOS W
              LEFT JOIN AEW_DEUDORES D ON W.SOLICITUD = D.SOLICITUD AND D.TIPO = 'I'
              INNER JOIN DIVISION_POLITICAS P ON  W.CIUDAD = P.CODIGO_CODAZZI
              INNER JOIN CG_REF_CODES C ON W.DESTINO = C.RV_LOW_VALUE AND C.RV_DOMAIN ='DESTINO_INMUEBLE'
              WHERE W.COD_INMOBILIARIA = P_POLIZA
                AND TRUNC(W.FEC_DILIGENCIA) >= V_FECHA_DESDE
                AND TRUNC(W.FEC_DILIGENCIA) <= V_FECHA_HASTA
                AND NOT EXISTS (SELECT *
                FROM RSLTDOS_ARRNDTRIOS T
                WHERE T.REA_NMRO_SLCTUD = W.SOLICITUD
                AND T.REA_TPO_RSLTDO='D')
                AND NOT EXISTS (SELECT *
                FROM SLCTDES_ESTDIOS S
                WHERE S.SES_NMRO = W.SOLICITUD)
