----Problemas multiples coberturas reserva automatica
SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 173
                                            and DE.COD_CONS = 34
                                            and de.cod_cob = 1
                                            and de.cod_causa = 25;

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 173
                                            and DE.COD_CONS = 24
                                            and de.cod_cob = 1
                                            and de.cod_causa = 25;


UPDATE SIM_EXPED_RVA_AUTOMATICA SET MCA_UNICO = 'N' WHERE COD_CIA = 3
                                                      AND COD_SECC = 66
                                                      AND COD_PRODUCTO = 173
                                                      and COD_CONS = 24
                                                      and cod_cob = 1
                                                      and cod_causa = 25
                                                      AND ID_TIPO_RESERVA = 849;

SELECT * FROM SIM_EXPED_RVA_AUTOMATICA de WHERE  DE.COD_CIA = 3
                                            AND    DE.COD_SECC = 66
                                            AND    DE.COD_PRODUCTO = 173
                                            and DE.COD_CONS = 34
                                            and de.cod_cob = 1
                                            and de.cod_causa = 25;


UPDATE SIM_EXPED_RVA_AUTOMATICA SET MCA_UNICO = 'N' WHERE COD_CIA = 3
                                                      AND COD_SECC = 66
                                                      AND COD_PRODUCTO = 173
                                                      and COD_CONS = 34
                                                      and cod_cob = 1
                                                      and cod_causa = 25
                                                      AND ID_TIPO_RESERVA = 611;

select * from sim_tipo_rva_automatica
order by id_tipo_reserva;



SELECT SUM(DP.VALOR_INDEMNIZAR) VALOR, DE.DATO_VARIABLE
--SELECT DP.* , DE.*
FROM   SIM_PREAVISO_DET_SINIESTROS DP, SIM_EXPED_RVA_AUTOMATICA DE
WHERE
      DP.SECUENCIA_PREAVISO = 21083 AND
      DE.COD_CIA = 3
  AND    DE.COD_SECC = 12
  AND    DE.COD_PRODUCTO = 136
  AND    DE.COD_CAUSA = 50
  AND    DE.DATO_VARIABLE IS NOT NULL
  AND    DE.COD_CONS = DP.COD_CONS_SINI
  AND    DE.COD_COB = DP.COD_COB_SINI
GROUP BY DE.DATO_VARIABLE;


SELECT DP.* , DE.*
FROM   SIM_PREAVISO_DET_SINIESTROS DP, SIM_EXPED_RVA_AUTOMATICA DE
WHERE
   ---     DP.SECUENCIA_PREAVISO = 21083 AND
        DE.COD_CIA = 3
  AND    DE.COD_SECC = 12
  AND    DE.COD_PRODUCTO = 136
  AND    DE.COD_CAUSA = 50
  AND    DE.DATO_VARIABLE IS NOT NULL
  AND    DE.COD_CONS = DP.COD_CONS_SINI
  AND    DE.COD_COB = DP.COD_COB_SINI;
--GROUP BY DE.DATO_VARIABLE;

select * from SIM_CARGA_VAR_SINIESTROS where proceso = 70 and cod_cia = 3 and num_sini = 28101200468;

---TABLA SINIESTROS
select * from a7000900 where NUM_SINI = 10106600329;

----TABLA PRODUCTOS
select * from A2000030 where COD_CIA = 3 AND COD_SECC = 66 AND COD_RAMO = 173 AND NUM_eND = 0;

SELECT G.COD_NIVEL
FROM   G7000025 G
WHERE  G.COD_CIA = 3
  AND    G.COD_SECC = 12
  AND    G.COD_RAMO = 136
  AND    G.COD_CAMPO = 'VR_RESERVA';


select * from A7000025 where num_secu_sini = 29034517885

select * from x7000025 where num_secu_sini = 29034517885

select *
from a7001000
where NUM_SECU_SINI = 29034517885

select *
from x7001000
where NUM_SECU_SINI = 29034517885

select * from all_source where text like '%COD_CONS2%';


select * from all_source where text like '%prc_crear_expediente%';


SELECT   distinct r.id_tipo_reserva, r.tipo_exped, r.prioridad,  b.cod_cob codcob,
                  b.cod_causa, b.cod_cons, r.cod_concep_rva,
                  r.id_exprvaaut, r.mca_unico
FROM    A7000100 B , A7001210 X, SIM_EXPED_RVA_AUTOMATICA r
WHERE   B.COD_CIA          =  3
  AND     B.COD_SECC         =  12
  AND     B.COD_CAUSA        =  50
  AND     B.TIPO_EXPED      IS  NULL
  AND     B.COD_COB          =  X.COD_COB
  AND     r.cod_cia          =  B.COD_CIA
  AND     r.cod_secc         =  B.COD_SECC
  AND     r.cod_producto     =  136
-- Inicio marca modificacion 2
  AND     NVL(r.id_subproducto,-1)   =  NVL(NULL,-1)
-- Fin marca modificacion 2
  AND     r.cod_causa        =  B.COD_CAUSA
  AND     r.cod_cons         =  B.COD_CONS
  AND     r.cod_cob          =  B.COD_COB
  AND     r.estado           =  'A'
  AND     X.NUM_SECU_SINI    =  29034517885
  AND     B.COD_CONS        IN
          ( SELECT TO_NUMBER(NVL(VALOR_CAMPO,'0'))
            FROM   A7000025
            WHERE  NUM_SECU_SINI          =  29034517885
            --  AND    NRO_ORDEN_SINI         =  p_NroOrdenSini
              AND    COD_NIVEL              =  '2'
              AND    NVL(VALOR_CAMPO,'0')  !=  '99'
              AND    VALOR_CAMPO           IS  NOT NULL   )
ORDER BY r.prioridad, r.tipo_exped, B.COD_CONS, B.COD_COB;


SELECT TO_NUMBER(NVL(VALOR_CAMPO,'0'))
FROM   A7000025
WHERE  NUM_SECU_SINI          =  29034517885
  --  AND    NRO_ORDEN_SINI         =  p_NroOrdenSini
  AND    COD_NIVEL              =  '2'
  AND    NVL(VALOR_CAMPO,'0')  !=  '99'
  AND    VALOR_CAMPO           IS  NOT NULL



SELECT   distinct r.id_tipo_reserva, r.tipo_exped, r.prioridad,  b.cod_cob codcob,
                  b.cod_causa, b.cod_cons, r.cod_concep_rva,
                  r.id_exprvaaut, r.mca_unico
FROM    A7000100 B , A7001210 X, SIM_EXPED_RVA_AUTOMATICA r
WHERE   B.COD_CIA          =  3
  AND     B.COD_SECC         =  66
  AND     B.COD_CAUSA        =  25
  AND     B.TIPO_EXPED      IS  NULL
  AND     B.COD_COB          =  X.COD_COB
  AND     r.cod_cia          =  B.COD_CIA
  AND     r.cod_secc         =  B.COD_SECC
  AND     r.cod_producto     =  173
-- Inicio marca modificacion 2
   AND     NVL(r.id_subproducto,-1)   =  NVL(null,-1)
-- Fin marca modificacion 2
  AND     r.cod_causa        =  B.COD_CAUSA
  AND     r.cod_cons         =  B.COD_CONS
  AND     r.cod_cob          =  B.COD_COB
  AND     r.estado           =  'A'
  AND     X.NUM_SECU_SINI    =  29034510395
  AND     B.COD_CONS        IN
          ( SELECT TO_NUMBER(NVL(VALOR_CAMPO,'0'))
            FROM   A7000025
            WHERE  NUM_SECU_SINI          =  29034510395
              AND    NRO_ORDEN_SINI         =  0
              AND    COD_NIVEL              =  '2'
              AND    NVL(VALOR_CAMPO,'0')  !=  '99'
              AND    VALOR_CAMPO           IS  NOT NULL   )
ORDER BY r.prioridad, r.tipo_exped, B.COD_CONS, B.COD_COB;

---datos variables
select * from A7000025 where  NUM_SECU_SINI = 29034510395;


SELECT *
FROM C9999909
WHERE COD_TAB  = 'EXPED_NO_TOMADOR'
  AND   COD_CIA  = e_cod_cia
  AND   COD_SECC = e_cod_secc
  AND   COD_RAMO = e_cod_producto
  AND   DAT_CAR  = e_TipoDoc
  AND   CODIGO   = e_NroDoc
  AND   DAT_CAR2 = e_TipoExped;


select *  from A7001210 where NUM_SECU_SINI = 29034517885;

select *  from A7000100 where COD_CIA = 3 AND COD_SECC = 12 AND COD_CAUSA = 50 AND COD_CONS = 51 AND COD_COB IN (216,775,776,777)

SELECT COD_CIA,
       COD_SECC,
       COD_PRODUCTO,
       ID_SUBPRODUCTO,
       COD_CAUSA,
       COD_COB,
       PRIORIDAD,
       TIPO_EXPED,
       ID_TIPO_RESERVA,
       TIPO_EXPED,
       COD_CONCEP_RVA,
       MAX(ID_EXPRVAAUT),
       MCA_UNICO,
       ESTADO
FROM SIM_EXPED_RVA_AUTOMATICA
WHERE COD_CIA = 3
  AND COD_SECC = 12
  AND COD_CAUSA = 50
  AND COD_CONS IN (51, 50)
GROUP BY COD_CIA, COD_SECC, COD_PRODUCTO, ID_SUBPRODUCTO, COD_CAUSA, COD_COB, PRIORIDAD, TIPO_EXPED, ID_TIPO_RESERVA,
         TIPO_EXPED, COD_CONCEP_RVA, MCA_UNICO, ESTADO;


SELECT * FROM SIM_EXPED_RVA_AUTOMATICA;


SELECT   distinct r.id_tipo_reserva, r.tipo_exped, r.prioridad,  b.cod_cob codcob,
                  b.cod_causa, b.cod_cons, r.cod_concep_rva,
                  r.id_exprvaaut, r.mca_unico
FROM    A7000100 B , A7001210 X, (SELECT COD_CIA,
                                         COD_SECC,
                                         COD_PRODUCTO,
                                         ID_SUBPRODUCTO,
                                         COD_CAUSA,
                                         COD_COB,
                                         PRIORIDAD,
                                         ID_TIPO_RESERVA,
                                         TIPO_EXPED,
                                         COD_CONCEP_RVA,
                                         MAX(ID_EXPRVAAUT) ID_EXPRVAAUT,
                                         MCA_UNICO,
                                         ESTADO,
                                         MAX(cod_cons) COD_CONS
                                  FROM SIM_EXPED_RVA_AUTOMATICA
                                  WHERE COD_CIA = 3
                                    AND COD_SECC = 12
                                    AND COD_CAUSA = 50
                                    AND COD_CONS IN ( SELECT TO_NUMBER(NVL(VALOR_CAMPO,'0'))
                                                      FROM   A7000025
                                                      WHERE  NUM_SECU_SINI          =  29034517885
                                                        --  AND    NRO_ORDEN_SINI         =  p_NroOrdenSini
                                                        AND    COD_NIVEL              =  '2'
                                                        AND    NVL(VALOR_CAMPO,'0')  !=  '99'
                                                        AND    VALOR_CAMPO           IS  NOT NULL  )
                                  GROUP BY COD_CIA, COD_SECC, COD_PRODUCTO, ID_SUBPRODUCTO, COD_CAUSA, COD_COB, PRIORIDAD, ID_TIPO_RESERVA,
                                           TIPO_EXPED, COD_CONCEP_RVA, MCA_UNICO, ESTADO) r
WHERE   B.COD_CIA          =  3
  AND     B.COD_SECC         =  12
  AND     B.COD_CAUSA        =  50
  AND     B.TIPO_EXPED      IS  NULL
  AND     B.COD_COB          =  X.COD_COB
  AND     r.cod_cia          =  B.COD_CIA
  AND     r.cod_secc         =  B.COD_SECC
  AND     r.cod_producto     =  136
-- Inicio marca modificacion 2
  AND     NVL(r.id_subproducto,-1)   =  NVL(NULL,-1)
-- Fin marca modificacion 2
  AND     r.cod_causa        =  B.COD_CAUSA
  AND     r.cod_cons         =  B.COD_CONS
  AND     r.cod_cob          =  B.COD_COB
  AND     r.estado           =  'A'
  AND     X.NUM_SECU_SINI    =  29034517885
  AND     B.COD_CONS        IN
          ( SELECT TO_NUMBER(NVL(VALOR_CAMPO,'0'))
            FROM   A7000025
            WHERE  NUM_SECU_SINI          =  29034517885
              --  AND    NRO_ORDEN_SINI         =  p_NroOrdenSini
              AND    COD_NIVEL              =  '2'
              AND    NVL(VALOR_CAMPO,'0')  !=  '99'
              AND    VALOR_CAMPO           IS  NOT NULL   )
ORDER BY r.prioridad, r.tipo_exped, B.COD_CONS, B.COD_COB;
