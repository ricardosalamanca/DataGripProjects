SELECT 3 CIA, 1 SECCION, 250 PRODUCTO, ccc.cod_cob, cb.txt_cob DESCR_COBERTURA,
       ccc.cod_causa, cau.desc_causa, ccc.cod_cons, con.desc_cons
FROM A7000100 ccc, a1002100 cb, A7000200 cau, A7000220 con
WHERE ccc.COD_CIA    = 3
  AND   ccc.COD_SECC   = 1
  AND   cb.cod_cia = ccc.COD_CIA AND cb.cod_ramo = 250
  AND   ccc.COD_COB    IN (SELECT DISTINCT COD_COB FROM a1002100 WHERE COD_CIA = ccc.COD_CIA AND COD_RAMO = cb.cod_ramo)
  AND   ccc.cod_causa  IN (SELECT DISTINCT COD_CAUSA FROM SIM_CAUSAS_PROD WHERE COD_CIA = ccc.COD_CIA
                                                                            AND COD_SECC = ccc.COD_SECC AND COD_PRODUCTO = cb.cod_ramo AND TIPO_CAUSA = 1)
  AND   ccc.cod_cons IN (SELECT DISTINCT cs.COD_CONSECUENCIA FROM SIM_CONSEC_PROD cs
                         WHERE cs.COD_CIA = ccc.COD_CIA AND cs.COD_SECC = ccc.COD_SECC AND COD_PRODUCTO = cb.cod_ramo)
  AND   cb.cod_cob      = ccc.cod_cob
  AND   cau.cod_cia     = ccc.COD_CIA
  AND   cau.tipo_causa  = 1
  AND   cau.cod_causa   = ccc.cod_causa
  AND   con.cod_cia     = ccc.COD_CIA
  AND   con.cod_cons    = ccc.cod_cons
ORDER BY ccc.cod_cob, ccc.cod_causa, ccc.cod_cons;

SELECT * FROM SIM_PRODUCTOS WHERE COD_CIA = 3 AND COD_SECC = 1 AND COD_PRODUCTO = 250

SELECT * FROM A1002100 WHERE COD_CIA = 3 AND COD_RAMO = 250;

SELECT * FROM SIM_PRODUCTOS WHERE COD_CIA = 3 AND COD_PRODUCTO = 250;
SELECT * FROM SIM_SUBPRODUCTOS WHERE ID_PRODUCTO = 420;

---DATOS fIJOS
SELECT * FROM X7000900 WHERE NUM_SECU_POL = 29741277705;

---dATOS VARIABLES
SELECT * FROM X7000025 WHERE NUM_SECU_SINI = 26985967419;

---DEFINICION PLANTILLA DATOS VARIABLES
SELECT * FROM G7000025 WHERE COD_CIA = 3 AND COD_SECC = 1 AND COD_RAMO = 999 and COD_CAMPO like '%LES%';
SELECT * FROM SIM_G7000025 WHERE COD_CIA = 3 AND COD_SECC = 1 AND COD_RAMO = 999;
SELECT * FROM G7000025 WHERE COD_CIA = 3 AND COD_SECC = 1 AND COD_RAMO = 999 ORDER BY COD_NIVEL, NUM_SECU;

select * from OPS$PUMA.A2040100;

----
select * from OPS$PUMA.SIM_EXPED_RVA_AUTOMATICA where COD_CIA = 3 and COD_SECC = 1 and COD_PRODUCTO = 250;
select * from OPS$PUMA.SIM_CAUSAS_PROD;

---causas
select * from OPS$PUMA.A7000200;

----consecuencias
select * from OPS$PUMA.A7000220;



----1	64969	378	MOVILIDAD POR DIAS	420
---¿cuales son las coberturas para ese subproducto 378 ?