SELECT * FROM C9999909 WHERE COD_TAB = 'CLIENTE_CLV'

SELECT * FROM C9999909 WHERE COD_TAB = 'SERV_SCORE_RIESGO'


select * from C9999910 WHERE COD_TAB = 'SERV_SCORE_RIESGO'


DECLARE
    IP_TIPO_DOC A7000900.TDOC_TERCERO_ASEG%TYPE;
    IP_NUM_DOC  A7000900.COD_ASEG%TYPE;
    IP_COD_PROD A7000900.COD_PROD%TYPE;
    IP_NUM_POL A7000900.NUM_SECU_POL%TYPE;
    IP_COD_RIES A7000900.COD_RIES%TYPE;
    OP_ENDPOINT VARCHAR2(500);
    OP_REQUEST  VARCHAR2(500);
    IP_VALIDACION VARCHAR2(1);
    IP_PROCESO    SIM_TYP_PROCESO;
    OP_RESULTADO  NUMBER;
    OP_ARRERRORES SIM_TYP_ARRAY_ERROR;
BEGIN
    IP_PROCESO := NEW SIM_TYP_PROCESO();
    IP_TIPO_DOC := 'CC';
    IP_NUM_DOC := 79123456;
    IP_COD_PROD := 339;
    IP_NUM_POL := 5132022836304;
    IP_COD_RIES := 1;
    SIM_PCK_CONSULTA_PARGENSINI.PRC_SERVICIO_SCORE_RIESGO(IP_TIPO_DOC, IP_NUM_DOC, IP_COD_PROD,
                                                          IP_NUM_POL, IP_COD_RIES, OP_ENDPOINT, OP_REQUEST, IP_VALIDACION,
                                                          IP_PROCESO,  OP_RESULTADO, OP_ARRERRORES);
    dbms_output.put_line('Endpoint '|| OP_ENDPOINT);
    dbms_output.put_line('Request '|| OP_request);
END;


INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3,
                      USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4, COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4,
                      SECUENCIA, PROCESO)
VALUES ('SERV_SCORE_RIESGO', 1, null, null,
        'http://dev-lb-ft-793620190.us-east-1.elb.amazonaws.com/analitica/api/modelo_analitico/v1/predictMock', null,
        null, null, 999, 999, 3,
        TO_DATE('2020-10-29 14:29:36', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, 'B7959582', null, null, ' "parameters": {
        "authUserName": "H6NZfP6yPB9By6DNWgCqwAnV1WPoatwt",
        "serviceId": "Indemnizaciones_banca_hogar",
        "endpointId": "SimonWeb"
    },
    "explanations": {
        "enabled": false
    }', null, null, '0-0.25', '0.26-0.50', '0.51-1', default, null);


SELECT * FROM C9999909 WHERE COD_TAB = 'SERV_SCORE_RIESGO'