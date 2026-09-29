-----reporte cyberscout---------

SELECT 'CYBER_SEG_BOLIVAR' AS PARTNER_CODE ,
       PP.NUM_POL1 ,
       PP.NRO_DOCUMTO ,
       TO_CHAR(PP.FECHA_VIG_POL,'DD-MM-YYYY')   FECHA_VIG_POL ,
       'A' AS ESTADO ,
       'CYBP0001' AS PACKAGE_CODE ,
       DECODE(A20D.VALOR_CAMPO,'F','FULL','BÁSICO') CYBER_RISK ,
       PP.TDOC_TERCERO ,
       PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES ,
       NN.TIPO_DOCUMTO ,
       NN.NRO_DOCUMTO  DOC_BENEF ,
       NN.NOMBRE || ' ' || NN.APELLIDO NOM_BENEF ,
       TO_CHAR(PP.FECHA_VENC_POL,'DD-MM-YYYY')  FECHA_VENC_POL ,
       A20D.COD_RIES
FROM A2000020 A20D,
     A2000030 PP,
     A9990100 NN
WHERE PP.NUM_SECU_POL = A20D.NUM_SECU_POL
  AND   A20D.NUM_SECU_POL = NN.NUM_SECU_POL
  AND PP.NUM_POL1      IS NOT NULL
  AND A20D.COD_CAMPO    = 'CYBER_RISK'
  AND NN.NOMINA         ='DAVI'
  AND NVL(MCA_BAJA,'N') = 'N'
  AND A20D.COD_RIES     = NN.COD_RIES
  AND PP.FECHA_EMI_END BETWEEN TO_DATE('14-12-2021','DD-MM-YYYY') AND TO_DATE('15-12-2021','DD-MM-YYYY')
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 23
  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1,
         A20D.COD_RIES;




SELECT 'CYBER_SEG_BOLIVAR' AS PARTNER_CODE ,
       PP.NUM_POL1 ,
       PP.NRO_DOCUMTO ,
       TO_CHAR(PP.FECHA_VIG_POL,'DD-MM-YYYY')   FECHA_VIG_POL ,
       'A' AS ESTADO ,
       'CYBP0001' AS PACKAGE_CODE ,
       DECODE(A20D.VALOR_CAMPO,'F','FULL','BÁSICO') CYBER_RISK ,
       PP.TDOC_TERCERO ,
       PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES ,
       NN.TIPO_DOCUMTO ,
       NN.NRO_DOCUMTO  DOC_BENEF ,
       NN.NOMBRE || ' ' || NN.APELLIDO NOM_BENEF ,
       TO_CHAR(PP.FECHA_VENC_POL,'DD-MM-YYYY')  FECHA_VENC_POL ,
       A20D.COD_RIES
FROM A2000020 A20D,
     A2000030 PP,
     A9990100 NN
WHERE PP.NUM_SECU_POL = A20D.NUM_SECU_POL
  AND   A20D.NUM_SECU_POL = NN.NUM_SECU_POL
  AND PP.NUM_POL1      IS NOT NULL
  AND A20D.COD_CAMPO    = 'CYBER_RISK'
  AND NN.NOMINA         ='DAVI'
  AND NVL(MCA_BAJA,'N') = 'N'
  AND A20D.COD_RIES     = NN.COD_RIES
  AND PP.NUM_END      = ( SELECT MAX(C.NUM_END) FROM A2000030 C
                          WHERE C.NUM_SECU_POL = PP.NUM_SECU_POL)

  AND NN.NUM_END      = (SELECT MAX(NUM_END) FROM A9990100
                         WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                           AND COD_RIES =  A20D.COD_RIES
                           AND NOMINA   = 'DAVI'
                           AND NVL(MCA_BAJA,'N') = 'N')

  AND A20D.NUM_END      = (SELECT MAX(NUM_END) FROM A2000020
                           WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                             AND COD_RIES =  A20D.COD_RIES
                             AND COD_CAMPO = 'CYBER_RISK'
                             AND NVL(VALOR_CAMPO,'Z') <> 'Z')

  AND A20D.VALOR_CAMPO  IN ('B','F')
  AND PP.NUM_END        =
      (SELECT MAX(SA.NUM_END)
       FROM A2000030 SA
       WHERE SA.NUM_POL1 = PP.NUM_POL1
         AND SA.COD_CIA    = PP.COD_CIA
         AND SA.COD_SECC   = PP.COD_SECC
         AND SA.COD_RAMO   = PP.COD_RAMO
      )
  AND PP.FECHA_EMI_END BETWEEN TO_DATE(?FECHA_INI,'DD-MM-YYYY') AND TO_DATE(?FECHA_FIN,'DD-MM-YYYY')
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 23
  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1,
         A20D.COD_RIES;

----------------------------------------------------cyber CUMULOS--------------------------------

Select *
From C9999909 a
Where
    ---a.Cod_Cia = 3
    a.Cod_Tab = 'SMASEGMAXATGC';


select * from a2000220
where num_secu_pol in (29861124992,29861125122,29861125239,29861125249)




Select *
From G2000210 a
Where Cod_Cia = 3 AND DESC_ERROR LIKE '%CUMU%';



SELECT MIN(DECODE(cod_campo1,'TOPE_CUMULO',valor1,''))
INTO l_LimCumulo
FROM c9999919 a
WHERE NVL(a.fecha_baja, TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE)
  AND a.fecha_vig  = (SELECT MAX(fecha_vig)
                      FROM c9999919 b
                      WHERE NVL(a.fecha_baja, TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE)
                        AND b.cod_campo1 = a.cod_campo1
                        AND fecha_vig   <= TRUNC(SYSDATE)
                        AND b.cod_cia    = Ip_CodCia
                        AND b.cod_secc   = Ip_CodSecc
                        AND b.cod_subpro = Ip_Subprodto  --c_SubProdHog
                        AND b.cod_ramo   = Ip_CodRamo
                        AND b.cod_tab    =  l_CodTab)
  AND a.cod_cia    = Ip_CodCia
  AND a.cod_secc   = Ip_CodSecc
  AND a.cod_subpro = Ip_Subprodto  --c_SubProdHog
  AND a.cod_ramo   = Ip_CodRamo
  AND a.cod_tab    = l_CodTab;


SELECT MIN(DECODE(cod_campo1,'TOPE_CUMULO',valor1,''))
FROM c9999919 a
WHERE NVL(a.fecha_baja, TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE)
  AND a.fecha_vig  = (SELECT MAX(fecha_vig)
                      FROM c9999919 b
                      WHERE NVL(a.fecha_baja, TRUNC(SYSDATE) + 1) > TRUNC(SYSDATE)
                        AND b.cod_campo1 = a.cod_campo1
                        AND fecha_vig   <= TRUNC(SYSDATE)
                        AND a.cod_cia    = 3
                        AND a.cod_secc   = 23
                        AND a.cod_subpro = 1  --c_SubProdHog
                        AND a.cod_ramo   = 109
                        AND a.cod_tab    = 'GNRALDELEGA')
  AND a.cod_cia    = 3
  AND a.cod_secc   = 23
  AND a.cod_subpro = 1  --c_SubProdHog
  AND a.cod_ramo   = 109
  AND a.cod_tab    = 'GNRALDELEGA';

select * from sim_log
where trunc(Fecha) > to_date('23-mar-2022','dd-mon-yyyy')
  and COLUMNA like 'MPG en InsCtrl X coderror%';


SELECT MIN(DECODE(cod_campo,'PRODUCTOS',valor_campo_en,''))
FROM x2000020
WHERE num_secu_pol = 29861125249;


SELECT NVL(SUM(NVL(b.suma_aseg, 0) * NVL(a.tc_promed, 0)), 0)
FROM a2000030 a
   ,a2000040 b
WHERE a.cod_secc     = 23
  AND a.nro_documto  = 71737784
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




SELECT 'CYBER_SEG_BOLIVAR' AS PARTNER_CODE ,
       PP.NUM_POL1 ,
       PP.NRO_DOCUMTO ,
       TO_CHAR(PP.FECHA_VIG_POL,'DD-MM-YYYY')   FECHA_VIG_POL ,
       'A' AS ESTADO ,
       'CYBP0001' AS PACKAGE_CODE ,
       DECODE(A20D.VALOR_CAMPO,'F','FULL','BÁSICO') CYBER_RISK ,
       PP.TDOC_TERCERO ,
       PCK999_TERCEROS.FUN_RETORNA_NOMBRES(PP.NRO_DOCUMTO,TDOC_TERCERO,NULL) NOMBRES ,
       NN.TIPO_DOCUMTO ,
       NN.NRO_DOCUMTO  DOC_BENEF ,
       NN.NOMBRE || ' ' || NN.APELLIDO NOM_BENEF ,
       TO_CHAR(PP.FECHA_VENC_POL,'DD-MM-YYYY')  FECHA_VENC_POL ,
       A20D.COD_RIES
FROM A2000020 A20D,
     A2000030 PP,
     A9990100 NN
WHERE PP.NUM_SECU_POL = A20D.NUM_SECU_POL
  AND   A20D.NUM_SECU_POL = NN.NUM_SECU_POL
  AND PP.NUM_POL1      IS NOT NULL
  AND A20D.COD_CAMPO    = 'CYBER_RISK'
  AND NN.NOMINA         ='DAVI'
  AND NVL(MCA_BAJA,'N') = 'N'
  AND A20D.COD_RIES     = NN.COD_RIES
  AND PP.NUM_END      = ( SELECT MAX(C.NUM_END) FROM A2000030 C
                          WHERE C.NUM_SECU_POL = PP.NUM_SECU_POL)

  AND NN.NUM_END      = (SELECT MAX(NUM_END) FROM A9990100
                         WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                           AND COD_RIES =  A20D.COD_RIES
                           AND NOMINA   = 'DAVI'
                           AND NVL(MCA_BAJA,'N') = 'N')

  AND A20D.NUM_END      = (SELECT MAX(NUM_END) FROM A2000020
                           WHERE NUM_SECU_POL = PP.NUM_SECU_POL
                             AND COD_RIES =  A20D.COD_RIES
                             AND COD_CAMPO = 'CYBER_RISK'
                             AND NVL(VALOR_CAMPO,'Z') <> 'Z')

  AND A20D.VALOR_CAMPO  IN ('B','F')
  AND PP.NUM_END        =
      (SELECT MAX(SA.NUM_END)
       FROM A2000030 SA
       WHERE SA.NUM_POL1 = PP.NUM_POL1
         AND SA.COD_CIA    = PP.COD_CIA
         AND SA.COD_SECC   = PP.COD_SECC
         AND SA.COD_RAMO   = PP.COD_RAMO
      )
  AND PP.FECHA_EMI_END BETWEEN TO_DATE(?FECHA_INI,'DD-MM-YYYY') AND TO_DATE(?FECHA_FIN,'DD-MM-YYYY')
  AND PP.COD_CIA  = 3
  AND PP.COD_SECC = 23
  AND PP.COD_RAMO = 109
ORDER BY PP.NUM_POL1,
         A20D.COD_RIES


