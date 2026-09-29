PROCEDURE PRC_RECAUDOS_HOGAR IS
  CURSOR C_RECIBOS (FECHA_DESDE DATE, FECHA_HASTA DATE)IS
SELECT SUBSTR(C.CDR_RFRNCIA,15,10) CERTIFICADO, SUM(C.CDR_VLOR) VALOR
FROM RCBOS_CJA R, CNCPTOS_DTLLE_RCBOS C
WHERE R.RCC_CIA_CDGO = '40'
  AND R.RCC_ESTDO_RCBO = 'I'
  AND TRUNC(R.RCC_FCHA_RCBO) >= FECHA_DESDE
  AND TRUNC(R.RCC_FCHA_RCBO) <= FECHA_HASTA
  AND R.RCC_NMRO_RCBO= C.CDR_NMRO_RCBO
  AND R.RCC_CIA_CDGO = C.CDR_CDGO_CIA
  AND R.RCC_TPO_RCBO = C.CDR_TPO_RCBO
  AND C.CDR_CDGO_CNCPTO = 'ASIS'
  AND NOT EXISTS (SELECT * FROM RECIBOS_REPORTADOS RR
                  WHERE RR.RECIBO = R.RCC_NMRO_RCBO
                    AND RR.ESTADO ='E')
GROUP BY SUBSTR(C.CDR_RFRNCIA,15,10);

CURSOR C_DETALLE_RECIBOS (FECHA_DESDE DATE, FECHA_HASTA DATE, P_CERTIFICADO NUMBER) IS
SELECT R.RCC_NMRO_RCBO RECIBO, C.CDR_VLOR VALOR
FROM RCBOS_CJA R, CNCPTOS_DTLLE_RCBOS C
WHERE R.RCC_CIA_CDGO = '40'
  AND R.RCC_ESTDO_RCBO = 'I'
  AND TRUNC(R.RCC_FCHA_RCBO) >= FECHA_DESDE
  AND TRUNC(R.RCC_FCHA_RCBO) <= FECHA_HASTA
  AND R.RCC_NMRO_RCBO= C.CDR_NMRO_RCBO
  AND R.RCC_CIA_CDGO = C.CDR_CDGO_CIA
  AND R.RCC_TPO_RCBO = C.CDR_TPO_RCBO
  AND C.CDR_CDGO_CNCPTO = 'ASIS'
  AND SUBSTR(C.CDR_RFRNCIA,15,10)  = P_CERTIFICADO
  AND NOT EXISTS (SELECT * FROM RECIBOS_REPORTADOS RR
                  WHERE RR.RECIBO = R.RCC_NMRO_RCBO
                    AND RR.ESTADO ='E');

LINEBUF            		  VARCHAR2(4000);
LINELOG            		  VARCHAR2(500);
OUT_FILE_LOG      	    TEXT_IO.FILE_TYPE;
OUT_FILE_DAT            TEXT_IO.FILE_TYPE;
NOMBRE_ARCHIVO					VARCHAR2(500);
V_AMPARO								AMPROS_PRDCTO.APR_CDGO_AMPRO%TYPE;
V_RAMO_TRON							AMPROS_PRDCTO.APR_RAMO%TYPE;
V_SECCION								AMPROS_PRDCTO.APR_SECCION%TYPE;
V_SUBPRODUCTO						AMPROS_PRDCTO.APR_SUBPRODUCTO%TYPE;
V_POLIZA_TRONADOR				POLIZAS_ANEXOS.POLIZA_TRONADOR%TYPE;
V_FACTURA_TRONADOR			POLIZAS_ANEXOS.FACTURA%TYPE;
V_VALOR									NUMBER;
V_CERTIFICADO						NUMBER;
V_FECHA_DESDE						DATE;
V_FECHA_HASTA 					DATE;
MES_ANTERIOR						VARCHAR2(6);
FECHA_PAGO_ANTERIOR			DATE;
V_IVA										NUMBER;
V_TOTAL									NUMBER;
V_VALOR_FACTURA_TRONADOR NUMBER;
V_PORC_IVA							NUMBER;

R_REC										C_RECIBOS%ROWTYPE;
R_DET_REC  							C_DETALLE_RECIBOS%ROWTYPE;

-- ESTNOCORE-558: Declaracion de variables
-- Valores de factura tronador
V_IMP_MONEDA_LOCAL NUMBER; -- Valor concepto de factura
V_IMP_IMPTOS_MON_LOCAL NUMBER; -- Valor IVA de factura
V_NUM_FACTURA NUMBER; -- consecuttivo de factura para la poliza
V_PAGO_CONCEPTO NUMBER;
-- Valores de abonos a factura tronador
V_ABONO_TOTAL NUMBER;
V_ABONO_IMP_MONEDA_LOCAL NUMBER; -- Valor sumatoria abonos a concepto de factura
V_ABONO_IMP_IMPTOS_MON_LOCAL NUMBER; -- Valor sumatoria abonos a IVA de facturaAL NUMBER;
-- Valores saldos factura tronador
V_SALDO_CONCEPTO NUMBER; -- Valor saldo deuda concepto factura
V_SALDO_IMPUESTO NUMBER; -- Valor saldo deuda impuesto IVA factura
V_SALDO_TOTAL NUMBER;
BEGIN


    -- Trae el porcentaje de IVA definido
    BEGIN
        SELECT PAR_VLOR2
        INTO V_PORC_IVA
        FROM PRMTROS
        WHERE PAR_CDGO = '4'
          AND PAR_MDLO = '6'
          AND PAR_VLOR1 = '01'
          AND PAR_FCHA_CREACION = (SELECT MAX(PAR_FCHA_CREACION)
                                   FROM PRMTROS
                                   WHERE PAR_VLOR1 = '01'
                                     AND PAR_MDLO = '6'
                                     AND PAR_CDGO = '4');
    EXCEPTION
        WHEN OTHERS THEN
            MOSTRAR_MENSAJE('NO ENCUENTRA EL PARAMETRO DEL IVA ','E',TRUE);
    END;

    -- TRAE LOS PARAMETROS PARA ENVIAR EN EL ARCHIVO DE RECAUDOS DEL ANEXO DE HOGAR .SPPC. 25/10/2012
    BEGIN
        SELECT A.APR_CDGO_AMPRO, A.APR_RAMO,A.APR_SECCION,A.APR_SUBPRODUCTO
        INTO V_AMPARO,V_RAMO_TRON,V_SECCION,V_SUBPRODUCTO
        FROM AMPROS_PRDCTO A
        WHERE A.APR_TRFCION_EXTRNA ='S';
    EXCEPTION
        WHEN OTHERS THEN
            MOSTRAR_MENSAJE('NO HAY PARAMETRIZACIÓN PARA HOGAR','E',TRUE);
    END;




    -- NOMBRE ARCHIVO CIA(2)||SECCION(3)||PRODUCTO(3)||DDMMYYYYEXP.DAT
    NOMBRE_ARCHIVO    := :PARAMETER.PATH ||LPAD(TO_CHAR(3),2,'0') || LPAD(TO_CHAR(V_SECCION),3,'0')||LPAD(TO_CHAR(V_RAMO_TRON),3,'0')|| TO_CHAR(:FPG_FCHA_PGO,'DDMMYYYY')||'REC';
    --OUT_FILE_CTL      := TEXT_IO.FOPEN(NOMBRE_ARCHIVO || '.dat','A');
    :NOMBRE_ARCHIVO_R := NOMBRE_ARCHIVO;
    OUT_FILE_DAT      := TEXT_IO.FOPEN(NOMBRE_ARCHIVO || '.txt','W');
    OUT_FILE_LOG      := TEXT_IO.FOPEN(NOMBRE_ARCHIVO || '.log','W');


    HOST('DEL ' || NOMBRE_ARCHIVO||'.log',NO_SCREEN);
    HOST('DEL ' || NOMBRE_ARCHIVO||'.txt',NO_SCREEN);


    -- trae las fechas para obtener los recaudos de Hogar.
    -- BUSCA EL MES ANTERIOR DE LA FECHA DE PAGO.
    MES_ANTERIOR := TO_CHAR(ADD_MONTHS(:FPG_FCHA_PGO,-1),'MMYYYY');

    -- ACTUALIZA EL NÚMERO Y POLIZA DE TRONADOR DE LO QUE SE HAYA EMITIDO PARA EL PERÍODO PASADO.
    -- SE REPITE EL PROCESO PARA QUE ACTUALICE LAS QUE FALTARON POR PROCESAR.
    -- AL FINAL DE MES EN EL CIERRE CONTABLE SE GENERA EL PROCESO DE ACTUALIZACION DE PÓLIZAS. SPPC. 09/01/2012.
    BEGIN
        pkg_interface_tronador.prc_actualiza_periodo(MES_ANTERIOR);
        COMMIT;
    Exception when others then
        :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
        LINELOG := 'Error en la actualización de la póliza y factura de Tronador. '||sqlerrm;
        TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
    END;

    BEGIN
        SELECT F.FPG_FCHA_PGO
        INTO FECHA_PAGO_ANTERIOR
        FROM FCHAS_PGO F
        WHERE  TO_CHAR(F.FPG_FCHA_PGO,'MMYYYY') = MES_ANTERIOR
          AND F.MARCA_CIERRE_OPRCION = 'S';
    EXCEPTION
        WHEN OTHERS THEN
            :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
            MOSTRAR_MENSAJE('No se encuentra fecha de pago del mes anterior','E',TRUE);
    END;



    BEGIN
        SELECT TRUNC(P.PAR_FCHA_ACTLZCION)
        INTO V_FECHA_DESDE
        FROM PRMTROS P
        WHERE PAR_CDGO ='FHOG';
    EXCEPTION
        WHEN OTHERS THEN
            :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
            MOSTRAR_MENSAJE('No se encuentra la fecha de proceso del mes anterior','E',TRUE);
    END;

    BEGIN
        SELECT MAX(DISTINCT TRUNC(P.PGS_FCHA_MDFCCION))
        INTO V_FECHA_HASTA
        FROM PGOS_SNSTROS P
        WHERE P.PGS_FCHA_PGO = :FPG_FCHA_PGO;
    EXCEPTION
        WHEN OTHERS THEN
            :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
            MOSTRAR_MENSAJE('No se encuentra la fecha hasta del mes actual.','E',TRUE);
    END;
    --v_fecha_desde := to_date('01/11/2012','dd/mm/yyyy');

    --SPPC SE CAMBIA PARA QUE LOS RECUADOS DEL MES QUE SE VAN A GENERAR LAS EXPEDICIONES
    -- NO SE VAYAN. 27/11/2023.

    -- se pone en comentario porque salen todos los recaudos del mes y hasta ahora este mes
    -- en este proceso se envía la creación de las pólizas de Tronador, luego tendrían que irse hasta el otro mes.

    --V_FECHA_HASTA := TRUNC(sysdate);

    -- Se pone para que tome los recaudos generados hasta un día antes de la fecha de cierre de operación. ESTCORE-9280 - SPPC.01/12/2023
    V_FECHA_HASTA := :FPG_FCHA_PGO-1;


    open C_RECIBOS(V_FECHA_DESDE,V_FECHA_HASTA);
    loop
        fetch C_RECIBOS into R_REC;
        exit when C_RECIBOS%notfound;

        V_IVA              := 0;
        V_POLIZA_TRONADOR  := 0;
        V_FACTURA_TRONADOR := 0;
        V_PAGO_CONCEPTO := R_REC.VALOR;
        V_TOTAL :=  ROUND(R_REC.VALOR * (1+(V_PORC_IVA/100)),0);
        V_IVA := V_TOTAL - ROUND(R_REC.VALOR,0);

        BEGIN
            -- TRAE LA POLIZA Y FACTURA DE TRONADOR.
            BEGIN
                SELECT P.POLIZA_TRONADOR, P.FACTURA
                INTO V_POLIZA_TRONADOR,V_FACTURA_TRONADOR
                FROM POLIZAS_ANEXOS P
                WHERE P.CERTIFICADO = R_REC.CERTIFICADO;


                IF V_POLIZA_TRONADOR  != 0 THEN  -- AND V_FACTURA_TRONADOR != 0 THEN GGM 21/06/2016 CONTROL DE CAMBIOS 586
                -- ESTNOCORE-558: Consulta valor de factura en tronador
                    BEGIN
                        -- obtiene valores totales de la factura
                        SELECT IMP_MONEDA_LOCAL, IMP_IMPTOS_MON_LOCAL, (IMP_MONEDA_LOCAL + IMP_IMPTOS_MON_LOCAL)
                        INTO V_IMP_MONEDA_LOCAL, V_IMP_IMPTOS_MON_LOCAL, V_VALOR_FACTURA_TRONADOR
                        FROM A2990700@PSAI_PTRON_TRON.WORLD -- Factura tronador
                        WHERE COD_CIA=3 AND COD_SECC=23 AND COD_RAMO=127 AND NUM_POL1= V_POLIZA_TRONADOR AND NUM_FACTURA=V_FACTURA_TRONADOR;

                        -- Obtiene abonos aplicados a factura en tronador
                        SELECT SUM(IMP_MONEDA_LOCAL)*-1, SUM(IMP_IMPTOS_MON_LOCAL)*-1, (sum(IMP_MONEDA_LOCAL) + sum(IMP_IMPTOS_MON_LOCAL))*-1 --, RECIBO
                        INTO V_ABONO_IMP_MONEDA_LOCAL, V_ABONO_IMP_IMPTOS_MON_LOCAL, V_ABONO_TOTAL
                        FROM A5020301@PSAI_PTRON_TRON.WORLD
                        WHERE COD_CIA=3 AND COD_SECC=23 AND NUM_POL1 = V_POLIZA_TRONADOR AND NUM_FACTURA=V_FACTURA_TRONADOR;

                        V_SALDO_CONCEPTO := V_IMP_MONEDA_LOCAL - V_ABONO_IMP_MONEDA_LOCAL; -- Valor saldo deuda concepto factura
                        V_SALDO_IMPUESTO := V_IMP_IMPTOS_MON_LOCAL - V_ABONO_IMP_IMPTOS_MON_LOCAL; -- Valor saldo deuda impuesto IVA factura
                        V_SALDO_TOTAL := V_VALOR_FACTURA_TRONADOR - V_ABONO_TOTAL;

                        --	MOSTRAR_MENSAJE('FACTURA TRONADOR V_IMP_MONEDA_LOCAL: ' || V_IMP_MONEDA_LOCAL || ' V_IMP_IMPTOS_MON_LOCAL: ' || V_IMP_IMPTOS_MON_LOCAL,'E',FALSE);
                        --	MOSTRAR_MENSAJE('ABONO TRONADOR V_ABONO_IMP_MONEDA_LOCAL: ' || V_ABONO_IMP_MONEDA_LOCAL || ' V_ABONO_IMP_IMPTOS_MON_LOCAL: ' || V_ABONO_IMP_IMPTOS_MON_LOCAL,'E',FALSE);

                        IF V_TOTAL > V_SALDO_TOTAL THEN -- V_TOTAL=RECAUDO A APLICAR >  SALDO FACTURA
                        -- Informa en archivo el valor del saldo para no superar los montos de tesoreria y evitar que se rechace el recaudo.
                            V_TOTAL := V_SALDO_TOTAL;
                            V_PAGO_CONCEPTO := V_SALDO_CONCEPTO;
                            V_IVA := V_SALDO_IMPUESTO;
                        END IF;

                    EXCEPTION
                        WHEN OTHERS THEN
                            :ESTADO_O  := 'Error en generacion archivo recaudo. Consulte el archivo de log.';
                            LINELOG := 'Error obteneiendo datos de la factura y abonos de tronador. CERTIFICADO '|| R_REC.CERTIFICADO||' - POLIZA: '|| V_POLIZA_TRONADOR ||' ERR: '||sqlerrm;
                            TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
                    END;
                    -- ESTNOCORE-558


                    LINEBUF := '03'||LPAD(TO_CHAR(V_SECCION),3,'0')||LPAD(TO_CHAR(V_RAMO_TRON),3,'0')||LPAD(TO_CHAR(V_POLIZA_TRONADOR),13,'0');
                    LINEBUF := LINEBUF||LPAD(TO_CHAR(V_FACTURA_TRONADOR),5,'0')||LPAD(TO_CHAR(round(V_PAGO_CONCEPTO,0)),15,'0')||LPAD(TO_CHAR(V_IVA),15,'0')||'P';

                    TEXT_IO.PUT_LINE(OUT_FILE_DAT,LINEBUF);

                    BEGIN
                        UPDATE POLIZAS_ANEXOS P
                        SET P.VALOR_ABONOS_HOGAR = P.VALOR_ABONOS_HOGAR + V_TOTAL
                        WHERE P.CERTIFICADO = R_REC.CERTIFICADO;

                        BEGIN
                            OPEN C_DETALLE_RECIBOS(V_FECHA_DESDE,V_FECHA_HASTA,R_REC.CERTIFICADO);
                            LOOP
                                fetch C_DETALLE_RECIBOS into R_DET_REC;
                                exit when C_DETALLE_RECIBOS%notfound;
                                BEGIN
                                    V_TOTAL :=  ROUND(R_DET_REC.VALOR * (1+(V_PORC_IVA/100)),0);
                                    V_IVA := V_TOTAL - ROUND(R_DET_REC.VALOR,0);

                                    INSERT INTO RECIBOS_REPORTADOS
                                    (RECIBO,VALOR_HOGAR,VALOR_IVA,VALOR_TOTAL,FECHA_ENVIO,ESTADO,USUARIO_CREACION,FECHA_CREACION,CERTIFICADO)
                                    VALUES(R_DET_REC.RECIBO, R_DET_REC.VALOR,V_IVA,V_TOTAL,SYSDATE,'E',USER,SYSDATE,R_REC.CERTIFICADO);

                                END;
                            END LOOP;
                            CLOSE C_DETALLE_RECIBOS;

                        END;
                    EXCEPTION
                        WHEN OTHERS THEN
                            :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
                            LINELOG := 'No pudo actualizar el abono en la tabla de hogar.  '|| R_REC.CERTIFICADO||sqlerrm;
                            TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
                    END;


                ELSE
                    :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
                    LINELOG := 'No hay datos de la póliza y la factura en Tronador.  '|| R_REC.CERTIFICADO||sqlerrm;
                    TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
                END IF;

            EXCEPTION
                WHEN OTHERS THEN
                    :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
                    LINELOG := 'No hay datos de la póliza y la factura en Tronador.  '|| R_REC.CERTIFICADO||sqlerrm;
                    TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
            END;
            COMMIT;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
            WHEN OTHERS THEN
                :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
                LINELOG := 'No hay datos de la póliza y la factura en Tronador.  '||sqlerrm;
                TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
        END;



    end loop;
    close C_RECIBOS;
    TEXT_IO.FCLOSE(OUT_FILE_DAT);
    TEXT_IO.FCLOSE(OUT_FILE_LOG);

EXCEPTION

    WHEN OTHERS THEN
        :ESTADO_O  := 'Existen errores en la generación del archivo de Recaudo. Consulte el archivo de log.';
        LINELOG := 'Problemas en la generación del archivo plano de Recaudos de Hogar.   '||sqlerrm;
        TEXT_IO.PUT_LINE(OUT_FILE_LOG,LINELOG);
        TEXT_IO.FCLOSE(OUT_FILE_DAT);
        TEXT_IO.FCLOSE(OUT_FILE_LOG);

END;