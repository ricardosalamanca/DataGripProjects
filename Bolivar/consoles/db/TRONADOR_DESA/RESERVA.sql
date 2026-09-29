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
