----1 Causa de siniestros por compañia
select * from A7000200 WHERE COD_CIA = 3 AND TIPO_CAUSA = 1;
-----tipos de causa
--1 Aviso
--2 Baja
--3 Modificacion
--4 Reapertura
--5 Anulacion liquidacion
--6 Reintegros
----2 CAUSAS POR SECCION
select * from A7000210 WHERE COD_CIA = 3 AND COD_SECC = 1 AND TIPO_CAUSA = 1
----3 CAUSAS POR PRODUCTO
SELECT * FROM SIM_CAUSAS_PROD WHERE COD_CIA = 3 AND COD_SECC = 1

----4 CONSECUENCIAS POR COMPAÑIA A7000220   ->DE 1 A 4 CONSECUENCIAS EL USUARIO PUEDE PONER
SELECT * FROM A7000220 WHERE COD_CIA = 3;
----5 CONSECUENCIAS POR SECCION A7000230
SELECT * FROM A7000230 WHERE COD_CIA = 3 AND COD_SECC = 1;
----6 CONSECUENCIAS POR PRODUCTO SIM_CONSEC_PROD
SELECT * FROM SIM_CONSEC_PROD WHERE COD_CIA = 3 AND COD_SECC = 1 AND COD_PRODUCTO = 250;

----7 COBERTURAS DE LA COMPAÑIA A1002000

----8 COBERTURAS POR PRODUCTOS A1002100

-----DATOS FIJOS DEL SINIESTRO------
SELECT * FROM A7000900 WHERE COD_CIA = 3 AND COD_SECC = 23 AND COD_RAMO = 117 AND NUM_SINI = 10172301766;

----DATOS VARIABLES DEL SINIESTRO------
SELECT * FROM A7000025 WHERE NUM_SECU_SINI = 26923074400 ORDER BY COD_NIVEL, NUM_SECU;

------EXPEDIENTES SINIESTROS -----------------------------------
SELECT * FROM A7001000 WHERE NUM_SECU_SINI = 26588811660 ORDER BY NUM_SECU_EXPED, NRO_ORDEN_EXP;
---- TABLA DE RESERVA MOVIMIENTOS DE RESERVA----------RELACION UNO A UNO CORRESPONDER
SELECT * FROM A7001200 WHERE NUM_SECU_EXPED = 26541366737 ORDER BY NUM_SECU_EXPED, NRO_ORDEN_EXP;
----RESERVA PENDIENTE =  VALOR_ACTUAL-TOTAL_LIQ

----DATOS VARIABLES DEL EXPEDIENTE-------------------
SELECT * FROM A7001100 WHERE NUM_SECU_EXPED = 26541366737 ORDER BY NUM_SECU_EXPED, NRO_ORDEN_EXP;

----LIQUIDACION----
SELECT * FROM A3001700 WHERE COD_CIA = 3 AND COD_SECC = 1 AND NUM_SINI = 10000072006 AND NRO_EXPED = 1;
SELECT * FROM A3001800 WHERE NUM_SECU_LIQ IN (26556175693,26556810283);  ----DETALLE DE LA LIQUIDACION
SELECT * FROM A3001900; ----DATOS VARIABLES DE LA LIQUIDACION

----COBERTURAS POR SINIESTROS
SELECT * FROM A7001210 WHERE NUM_SECU_SINI = 26572474920;

----DATOS VARIABLES G7000025 SIM_G7000025 SINIESTRO------
SELECT * FROM SIM_G7000025;

----DATOS VARIABLES PARA EXPEDIENTE G7000020 SIM_G7000020 SINIESTRO------
SELECT * FROM SIM_G7000020 WHERE COD_CIA = 3 AND TIPO_EXPED = 'RSS' ---EJEMPLO DATOS SALVAMENTO;

----CAUSAS A7000200 POR COMPAÑIA
SELECT * FROM A7000200 WHERE COD_CIA = 3 ORDER BY TIPO_CAUSA;
----CAUSAS POR SECCION A7000210
SELECT * FROM A7000210 WHERE COD_CIA = 3 AND COD_SECC = 200;
----CAUSAS POR PRODUCTO
SELECT * FROM SIM_CAUSAS_PROD WHERE COD_CIA = 3 AND COD_SECC = 200 AND COD_PRODUCTO =690;

----CONSECUENCIAS
SELECT * FROM A7000220 WHERE COD_CIA = 3 ORDER BY  COD_CONS;
SELECT * FROM A7000230 WHERE COD_CIA = 3 AND COD_SECC = 200;
SELECT * FROM SIM_CONSEC_PROD;

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



