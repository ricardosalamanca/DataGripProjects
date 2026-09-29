select t.num_secu_pol,
       t.num_end,
       t.cod_secc,
       t.cod_ramo,
       t.sim_subproducto,
       t.sim_sistema_origen,
       t.sim_canal,
       t.sim_entidad_colocadora,
       t.id_proceso,
       ps.desc_proceso,
       t.num_pol_provisorio,
       t.num_pol_definitivo,
       t.estado,
       t.desc_estado,
       t.fecha_creacion,
       t.ciclo,
       t.fecha_ciclo,
       t.usuario_creacion,
       t.usuario_modificacion,
       t.fecha_modificacion
from ops$puma.sim_traza_proc_formaliza t, ops$puma.sim_procesos_seguimiento ps
where t.id_proceso = ps.id_proceso
  AND TRUNC (t.fecha_creacion) BETWEEN TO_DATE (?, 'DD-MM-YYYY') AND TO_DATE (?, 'DD-MM-YYYY')
  --AND TRUNC (t.fecha_creacion) BETWEEN TO_DATE (?FECHA_INICIAL, 'DD-MM-YYYY') AND TO_DATE (?FECHA_FINAL, 'DD-MM-YYYY')
  --and trunc(t.fecha_creacion) between to_date('25-03-2021','dd-mm-yyyy') and to_date('25-03-2021','dd-mm-yyyy')
  --and t.num_secu_pol = 29744854301--29744854170--29744854121 --29744810574
order by t.num_secu_pol,id_proceso;


SELECT T.NUM_SECU_POL,
       T.NUM_END,
       T.COD_SECC,
       T.COD_RAMO,
       T.SIM_SUBPRODUCTO,
       T.SIM_SISTEMA_ORIGEN,
       T.SIM_CANAL,
       T.SIM_ENTIDAD_COLOCADORA,
       T.ID_PROCESO,
       PS.DESC_PROCESO,
       T.NUM_POL_PROVISORIO,
       T.NUM_POL_DEFINITIVO,
       T.ESTADO,
       T.DESC_ESTADO,
       T.FECHA_CREACION,
       T.CICLO,
       T.FECHA_CICLO,
       T.USUARIO_CREACION,
       T.USUARIO_MODIFICACION,
       T.FECHA_MODIFICACION
FROM SIM_TRAZA_PROC_FORMALIZA T, OPS$PUMA.SIM_PROCESOS_SEGUIMIENTO PS
WHERE T.ID_PROCESO = PS.ID_PROCESO
  --AND TRUNC(T.FECHA_CREACION) BETWEEN TO_DATE(?FECHA_INI,'DD-MM-YYYY') AND TO_DATE(?FECHA_FIN,'DD-MM-YYYY')
  and trunc(t.fecha_creacion) between to_date('25-03-2021','dd-mm-yyyy') and to_date('25-03-2021','dd-mm-yyyy');

SELECT T.NUM_SECU_POL,
       T.NUM_END,
       T.COD_SECC,
       T.COD_RAMO,
       T.SIM_SUBPRODUCTO,
       T.SIM_SISTEMA_ORIGEN,
       T.SIM_CANAL,
       T.SIM_ENTIDAD_COLOCADORA,
       T.ID_PROCESO,
       PS.DESC_PROCESO,
       T.NUM_POL_PROVISORIO,
       T.NUM_POL_DEFINITIVO,
       T.ESTADO,
       T.DESC_ESTADO,
       T.FECHA_CREACION,
       T.CICLO,
       T.FECHA_CICLO,
       T.USUARIO_CREACION,
       T.USUARIO_MODIFICACION,
       T.FECHA_MODIFICACION
FROM SIM_TRAZA_PROC_FORMALIZA T, OPS$PUMA.SIM_PROCESOS_SEGUIMIENTO PS
WHERE T.ID_PROCESO = PS.ID_PROCESO
  AND TRUNC(T.FECHA_CREACION) BETWEEN TO_DATE(?FECHA_INI,'DD-MM-YYYY') AND TO_DATE(?FECHA_FIN,'DD-MM-YYYY')




SELECT P.COD_CIA,
       P.COD_SECC,
       P.COD_RAMO,
       DECODE(P.NUM_POL1,NULL,P.NUM_POL_COTIZ,P.NUM_POL1) AS NUM_POL1,
       DT.NUM_SECU_POL,
       DT.NUM_END,
       DT.COD_RIES,
       DT.GRUPO,
       DT.TIPO,
       DECODE(DT.SERVICIO,'SE','SERVICIO EMISION','SERVICIO MODIFICACION') AS SERVICIO,
       DT.COD_CAMPO,
       DT.VALOR_CAMPO,
       DT.COD_COB,
       DT.ID_SIMLOG,
       DT.COEF_COB,
       MT.FECHA_INICIO,
       MT.FECHA_FINAL,
       DT.ID_LOGDET
FROM SIM_LOG_DET_MOTORTARIFA DT,
     SIM_LOG_MOTORTARIFA MT,
     A2000030 P
WHERE MT.ID_SIMLOG          = DT.ID_SIMLOG
  AND P.NUM_SECU_POL          = DT.NUM_SECU_POL
  AND P.NUM_END               = DT.NUM_END
  AND DT.NUM_SECU_POL         = P.NUM_SECU_POL
  AND DT.NUM_END              = P.NUM_END
  AND P.NUM_POL1              = ?POLIZA
AND P.COD_CIA               = ?CIA
AND P.COD_SECC              = ?SECCION
AND P.COD_RAMO              = ?RAMO
AND P.NUM_END               = ?ENDOSO
AND DT.COD_RIES             = ?RIESGO
AND DT.SERVICIO     =
  CASE ?SERVICIO
    WHEN '0'
    THEN DT.SERVICIO
    ELSE ?SERVICIO
  END
AND TRUNC (MT.FECHA_INICIO) BETWEEN TO_DATE (?FECHA_INICIAL, 'DD-MM-YYYY') AND TO_DATE (?FECHA_FINAL, 'DD-MM-YYYY')
UNION
SELECT P.COD_CIA,
       P.COD_SECC,
       P.COD_RAMO,
       DECODE(P.NUM_POL1,NULL,P.NUM_POL_COTIZ,P.NUM_POL1) AS NUM_POL1,
       DT.NUM_SECU_POL,
       DT.NUM_END,
       DT.COD_RIES,
       DT.GRUPO,
       DT.TIPO,
       DECODE(DT.SERVICIO,'SE','SERVICIO EMISION','SERVICIO MODIFICACION') AS SERVICIO,
       DT.COD_CAMPO,
       DT.VALOR_CAMPO,
       DT.COD_COB,
       DT.ID_SIMLOG,
       DT.COEF_COB,
       MT.FECHA_INICIO,
       MT.FECHA_FINAL,
       DT.ID_LOGDET
FROM SIM_LOG_DET_MOTORTARIFA DT,
     SIM_LOG_MOTORTARIFA MT,
     A2000030 P
WHERE MT.ID_SIMLOG          = DT.ID_SIMLOG
  AND P.NUM_SECU_POL          = DT.NUM_SECU_POL
  AND P.NUM_END               = DT.NUM_END
  AND DT.NUM_SECU_POL         = P.NUM_SECU_POL
  AND DT.NUM_END              = P.NUM_END
  AND P.NUM_POL_COTIZ         = ?POLIZA
AND P.COD_CIA               = ?CIA
AND P.COD_SECC              = ?SECCION
AND P.COD_RAMO              = ?RAMO
AND P.NUM_END               = ?ENDOSO
AND DT.COD_RIES             = ?RIESGO
AND DT.SERVICIO     =
  CASE ?SERVICIO
    WHEN '0'
    THEN DT.SERVICIO
    ELSE ?SERVICIO
  END
AND TRUNC (MT.FECHA_INICIO) BETWEEN TO_DATE (?FECHA_INICIAL, 'DD-MM-YYYY') AND TO_DATE (?FECHA_FINAL, 'DD-MM-YYYY')
ORDER BY ID_SIMLOG,
    ID_LOGDET

