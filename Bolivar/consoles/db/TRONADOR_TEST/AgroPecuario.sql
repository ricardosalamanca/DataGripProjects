---tabla de comisiones por convenios
select * from a1001701
where cod_cob in (11,13,12,28,51,625,735,938);

select * from g2000020
where cod_ramo in (600,601,603,605); --- and COD_CAMPO like '%anima%'

-----simon 3.0 ES producto 923
select * from g2000020
where cod_ramo in (923);

select *
from g2000010
where COD_CIA IN (2,3)
  and cod_campo like 'DESC_RIES%';


select *
from g2000010
where COD_CIA IN (2,3)
  and cod_campo in  ('COD_ASEG',
                     'COD_PROV',
                     'CPOS_RIES',
                     'DESC_RIES',
                     'TIPO_DOC_ASEG',
                     'NRO_STELLENT',
                     'NRO_SIAR',
                     'PORC_SUBS_PRIM',
                     'CORREO',
                     'TIPO_DOC_BENEF',
                     'COD_BENEF',
                     'VEREDA',
                     'FINCA_PREDIO',
                     'AREA_UND_ASEG',
                     'DIRECC_RIES',
                     'COORD_LATITU_A',
                     'COORD_LONGIT_A',
                     'VLR_ANIMAL',
                     'NRO_ANIMALES',
                     'PRODUC_CULTIVO',
                     'RAZA_ANIM',
                     'AREA_TOTAL_ASE',
                     'VLR_ASEGURADO',
                     'VALOR_TASA',
                     'ACT_AGRO',
                     'RAZ_SOC_BENEF',
                     'TEL_BENEF',
                     'FECHA_SIAR',
                     'TIPO_PRODUCTOR',
                     'NRO_LOTE1',
                     'DESC_RIES1',
                     'NUMERO_LOTE',
                     'ID_UBICACION',
                     'PRODUC_CULTI2') ;

UPDATE g2000010 SET TXT_TITULO = 'NRO DE UND ASEGURADAS' where COD_CIA IN (2,3) AND COD_CAMPO = 'NRO_ANIMALES'
UPDATE g2000010 SET TXT_TITULO = 'VALOR DE UND ASEGURADA' where COD_CIA IN (2) AND COD_CAMPO = 'VLR_ANIMAL'

DELETE g2000010 WHERE COD_CAMPO = 'NUMERO_LOTE';


select *
from g2000020
where cod_ramo in (922, 923, 601)
  and cod_campo in ('COD_ASEG',
                    'COD_PROV',
                    'CPOS_RIES',
                    'DESC_RIES',
                    'TIPO_DOC_ASEG',
                    'NRO_STELLENT',
                    'NRO_SIAR',
                    'PORC_SUBS_PRIM',
                    'CORREO',
                    'TIPO_DOC_BENEF',
                    'COD_BENEF',
                    'VEREDA',
                    'FINCA_PREDIO',
                    'AREA_UND_ASEG',
                    'DIRECC_RIES',
                    'COORD_LATITU_A',
                    'COORD_LONGIT_A',
                    'VLR_ANIMAL',
                    'NRO_ANIMALES',
                    'PRODUC_CULTIVO',
                    'RAZA_ANIM',
                    'AREA_TOTAL_ASE',
                    'VLR_ASEGURADO',
                    'VALOR_TASA',
                    'ACT_AGRO',
                    'RAZ_SOC_BENEF',
                    'TEL_BENEF',
                    'FECHA_SIAR',
                    'TIPO_PRODUCTOR',
                    'NRO_LOTE1',
                    'DESC_RIES1',
                   'NUMERO_LOTE',
                    'ID_UBICACION',
                    'PRODUC_CULTI2') ;






SELECT * from g2000020 WHERE COD_REGLA = '922PCI001';

---update g2000020 set COD_NIVEL = 2 where cod_ramo in (923, 922) and cod_campo = 'VLR_ASEGURADO';

--update SIM_g2000020 set TITULO = 'Número unidades aseguradas' where cod_ramo in (922) and cod_campo = 'NRO_ANIMALES'

--update SIM_g2000020 set TITULO = 'Valor de unidad asegurada' where cod_ramo in (922) and cod_campo = 'VLR_ANIMAL'

select *
from SIM_g2000020
where cod_ramo in (923,922)
  and cod_campo in ('COD_ASEG',
                    'COD_PROV',
                    'CPOS_RIES',
                    'DESC_RIES',
                    'TIPO_DOC_ASEG',
                    'NRO_STELLENT',
                    'NRO_SIAR',
                    'PORC_SUBS_PRIM',
                    'CORREO',
                    'TIPO_DOC_BENEF',
                    'COD_BENEF',
                    'VEREDA',
                    'FINCA_PREDIO',
                    'AREA_UND_ASEG',
                    'DIRECC_RIES',
                    'COORD_LATITU_A',
                    'COORD_LONGIT_A',
                    'VLR_ANIMAL',
                    'NRO_ANIMALES',
                    'PRODUC_CULTIVO',
                    'RAZA_ANIM',
                    'AREA_TOTAL_ASE',
                    'VLR_ASEGURADO',
                    'VALOR_TASA',
                    'ACT_AGRO',
                    'RAZ_SOC_BENEF',
                    'TEL_BENEF',
                    'FECHA_SIAR',
                    'TIPO_PRODUCTOR',
                    'NRO_LOTE1',
                        'DESC_RIES1',
                    'NUMERO_LOTE',
                    'ID_UBICACION',
                    'PRODUC_CULTI2');


select * from SIM_g2000020 where componente = 'CO';
select * from SIM_g2000020 where cod_campo = 'TIPO_PRODUCTOR';
--DELETE g2000020 WHERE COD_CAMPO IN ('NRO_ANIMALES') AND COD_RAMO IN( 922,923) AND TITULO = 'NUMERO DEL LOTE';



----update g2000010 set TIPO_CAMPO = 'A' where cod_cia in(2,3) and cod_campo = 'ID_UBICACION'

--update SIM_g2000020 set titulo = 'Numero Del Lote' where cod_ramo in (923,922) and cod_campo = 'NRO_LOTE1';

---DEPARTAMENTO_CIUDAD
select * from simapi_estrategias  where id_estrategia in (67,88,84);

select * from  SIMAPI_ESTRATEGIA_ENT  where  id_estrategia in (67) and url_contenido is not null; --and  id_estrategia=67;

/*
UPDATE SIMAPI_ESTRATEGIA_ENT
SET MCA_AUTORIZACION           = 'A',
    FEC_ENVIO_AUTORIZACION     = TO_DATE('2022-05-18 17:07:14', 'YYYY-MM-DD HH24:MI:SS'),
    USUARIO_ENVIO_AUTORIZACION = '51938035',
    FECHA_AUTORIZACION         = TO_DATE('2022-05-18 17:07:46', 'YYYY-MM-DD HH24:MI:SS'),
    USUARIO_AUTORIZACION       = '51938035',
    OBSERVACIONES              = 'AUTORIZACION CAMBIOS'
where id_estrategia=67 and sim_version_est = 9;
*/


----DELETE simapi_datvar_bien_est_ent WHERE COD_CIA IN (2,3) AND COD_CAMPO IN ('NRO_LOTE1','NUMERO_LOTE') AND ID_BIEN = 76;

--update simapi_datvar_bien set NUM_SECU = 42 where id_bien = 76 AND cod_campo = 'RAZ_SOC_BENEF'

select * from simapi_datvar_bien
where cod_cia  = 3
  and cod_ramo = 923
  and id_bien  = 84
  and cod_campo = 'VLR_ASEGURADO';

select * from simapi_datvar_bien
where cod_cia  = 2
  and cod_ramo = 922
  and id_bien  = 33
  and cod_campo = 'VLR_ASEGURADO';

select * from simapi_datvar_bien_est_ent where id_estrategia = 67;

---delete from simapi_datvar_bien where cod_ramo = 923 and cod_campo = 'VLR_ASEGURADO' and id_bien = 84
--UPDATE SIMAPI_DATVAR_BIEN SET COD_RAMO = 923, REQUERIDO = 'S', MCA_REASEGURO = 'S' WHERE ID_BIEN = 76 AND COD_CAMPO IN ('VALOR_TASA', 'VLR_ANIMAL', 'VLR_ASEGURADO');
/*
INSERT INTO SIMAPI_DATVAR_BIEN_EST (COD_CIA, COD_RAMO, COD_CAMPO, ID_BIEN, ID_PLANTILLA_ESTRATEGIA, AFECTA_TARIFA,
                                    ESTADO, VISIBLE, REQUERIDO, FECHA_CREACION, USUARIO_CREACION, VR_DEFAULT,
                                    FECHA_MODIFICACION, USUARIO_MODIFICACION)
VALUES (3, 922, 'VLR_ASEGURADO', 84, 305, 'S', 'A', 'S', 'S', TO_DATE('2021-11-03', 'YYYY-MM-DD HH24:MI:SS'),
        '51938035', null, null, null);
INSERT INTO SIMAPI_DATVAR_BIEN_EST (COD_CIA, COD_RAMO, COD_CAMPO, ID_BIEN, ID_PLANTILLA_ESTRATEGIA, AFECTA_TARIFA,
                                    ESTADO, VISIBLE, REQUERIDO, FECHA_CREACION, USUARIO_CREACION, VR_DEFAULT,
                                    FECHA_MODIFICACION, USUARIO_MODIFICACION)
VALUES (3, 922, 'VALOR_TASA', 84, 305, 'S', 'A', 'S', 'S', TO_DATE('2021-11-03', 'YYYY-MM-DD HH24:MI:SS'), '51938035',
        null, null, null);
*/

SELECT d.*
FROM simapi_cob_opc_bien_est_ent d, a1002100 c
WHERE d.entidad_colocadora           = 0
  AND d.id_estrategia                = 88
  AND d.sim_version_est              = 20
  AND d.cod_opcion                   in (1)
  AND d.id_bien                      = 84
  --AND d.cod_cob                      = 28
  AND d.cod_cob                      = c.cod_cob
  AND d.cod_cia                      = c.cod_cia
  AND decode(d.cod_cia,2,922,3,923)  = c.cod_ramo;

select * from  SIMAPI_ESTRATEGIA_ENT  where id_estrategia in (67)
                                        and entidad_colocadora=0
                                        and sim_version_est=12;

select * from  SIMAPI_ESTRATEGIA_ENT  where id_estrategia in (88)
                                        and entidad_colocadora=0
                                        and sim_version_est=16;

select * from simapi_datvar_bien where id_bien in (84,76) order by  id_bien;
select * from simapi_datvar_bien_est where id_bien in (76) AND ESTADO = 'A';
select * from simapi_datvar_bien_est_ent where id_estrategia IN (88,67) and  COD_CAMPO in ('VLR_ASEGURADO','VALOR_TASA') and  sim_version_est > 7 and id_bien = 80 and entidad_colocadora=0 AND cod_ramo in (923,922)          and COD_CAMPO='COD_PROV';

SELECT MAX(SIM_VERSION_EST) from simapi_datvar_bien_est_ent where id_estrategia IN (88) and estado = 'A';

select * from simapi_datvar_bien_est_ent where id_estrategia IN (62) and estado = 'A' AND SIM_VERSION_EST = (SELECT MAX(SIM_VERSION_EST) from simapi_datvar_bien_est_ent where id_estrategia IN (62) and estado = 'A');
select * from simapi_datvar_bien_est where id_bien in (67) AND ESTADO = 'A' AND ID_PLANTILLA_ESTRATEGIA = 283;
select * from simapi_datvar_bien where id_bien in (67) AND ESTADO = 'A';
---Delete from simapi_datvar_bien_est_ent where id_estrategia=88 and cod_ramo = 923 and  COD_CAMPO in ('VLR_ASEGURADO','VALOR_TASA')

--UPDATE SIMAPI_DATVAR_BIEN SET REQUERIDO = 'S', AFECTA_TARIFA = 'S', MCA_REASEGURO = 'S' where id_bien=84 and cod_ramo = 922 and  COD_CAMPO in ('VLR_ASEGURADO','VALOR_TASA');

--update simapi_datvar_bien_est_ent set AFECTA_TARIFA = 'S' where id_estrategia=88 AND COD_RAMO IN(923,922) AND COD_CAMPO IN ('VLR_ASEGURADO','VALOR_TASA')
/*
INSERT INTO SIMAPI_DATVAR_BIEN_EST_ENT (COD_CIA, COD_RAMO, COD_CAMPO, ID_BIEN, ENTIDAD_COLOCADORA, ID_ESTRATEGIA,
                                        SIM_VERSION_EST, AFECTA_TARIFA, ESTADO, REQUERIDO, VISIBLE, FECHA_CREACION,
                                        USUARIO_CREACION, VR_DEFAULT, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                                        MCA_IMP_OBL)
VALUES (3, 923, 'VLR_ASEGURADO', 84, 0, 88, 15, 'S', 'A', 'S', 'S',
        TO_DATE('2022-02-02 11:43:07', 'YYYY-MM-DD HH24:MI:SS'), '51938035', null, null, null, 'N');
INSERT INTO SIMAPI_DATVAR_BIEN_EST_ENT (COD_CIA, COD_RAMO, COD_CAMPO, ID_BIEN, ENTIDAD_COLOCADORA, ID_ESTRATEGIA,
                                        SIM_VERSION_EST, AFECTA_TARIFA, ESTADO, REQUERIDO, VISIBLE, FECHA_CREACION,
                                        USUARIO_CREACION, VR_DEFAULT, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                                        MCA_IMP_OBL)
VALUES (3, 923, 'VALOR_TASA', 84, 0, 88, 15, 'S', 'A', 'S', 'S',
        TO_DATE('2022-02-02 11:43:07', 'YYYY-MM-DD HH24:MI:SS'), '51938035', null, null, null, 'N');
*/

--update simapi_datvar_bien_est_ent set AFECTA_TARIFA = 'S' where id_estrategia IN (88,67) AND COD_RAMO IN(923,922) AND COD_CAMPO IN ('VLR_ASEGURADO') AND sim_version_est = 8  AND AFECTA_TARIFA = 'N'

select * from simapi_datvar_bien_est where id_estrategia=67 and sim_version_est = 9

--UPDATE simapi_datvar_bien_est_ent SET SIM_VERSION_EST = 6  where ID_BIEN = 76  AND COD_CAMPO IN ('TEL_BENEF','RAZ_SOC_BENEF');

select * from simapi_datvarsini_bien_est_ent where id_estrategia=67

----coberturas nivel de ramo
select * from a1002100 where cod_cob in (11,12,13,28,51,735,539,938) and cod_ramo = 923;
---coberturas nivel de compañia
select * from a1002000 where cod_cob in (11,12,13,28,51,735,539,938) and cod_ramo = 923;

select * from a1002100 where cod_cob in (347,801,802) and cod_ramo = 923;

select * from SIMAPI_COBERTURAS_BIEN  where id_bien IN (76,84);

select * from SIMAPI_COBERTURAS_BIEN where cod_cob = 539 and rownum = 1;

Select substr(f.desc_opcion,1,50)
from  simapi_opc_bien_est_ent f
where id_estrategia = 67
  and entidad_colocadora = 0
  -- and sim_version_est = ip_Oferta.VERSION
  and cod_opcion = 3
  and id_bien = 76;

select * from SIMAPI_OPC_BIEN_EST where id_bien  in(76) AND ID_PLANTILLA_ESTRATEGIA = 290;
select * from SIMAPI_OPC_BIEN_EST_ENT where id_bien  in(76) and id_estrategia = 67 and sim_version_est = 13
select * from SIMAPI_COB_OPC_BIEN_EST where id_bien IN (76)  AND ID_PLANTILLA_ESTRATEGIA = 290 and estado = 'A';
select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien  in(76) AND ID_ESTRATEGIA IN(67)  AND SIM_VERSION_EST = 13;

select *
from simapi_datvar_bien_est_ent
where id_estrategia IN (88)
  and estado = 'A'
  AND SIM_VERSION_EST =
      (SELECT MAX(SIM_VERSION_EST) from simapi_datvar_bien_est_ent where id_estrategia IN (88) and estado = 'A');


select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien = 84 AND ID_ESTRATEGIA = 88 AND COD_COB = 539

UPDATE SIMAPI_COB_OPC_BIEN_EST_ENT SET MCA_ASISTENCIA = 'N', COMTOT_COM = 15, COMTOT_COM_RENOV = 15 WHERE ID_BIEN = 76 AND ID_ESTRATEGIA = 67 AND COD_COB = 539;


select * from SIMAPI_COB_OPC_BIEN_EST_SERV where id_bien  in(76,84);

select * from SIMAPI_DV_COB_OPC_BIEN_EST_ENT where id_bien  in(76,84);
select * from SIMAPI_DV_COB_OPC_BIEN_EST where id_bien  in(76,84);


---valores maximos controles facultativos por coberturas
select * from SIMAPI_COB_OPC_BIEN_EST where id_bien = 76 and COD_COB = 28 AND DESC_OPCION = 'BASICA' AND ID_PLANTILLA_ESTRATEGIA = 290;
select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien = 76 AND SIM_VERSION_EST = 13 AND COD_COB = 28;
--update SIMAPI_COB_OPC_BIEN_EST SET SUMA_ASEG_HASTA = 45000000000 where id_bien = 76 and COD_COB = 28 AND DESC_OPCION = 'BASICA';
--UPDATE  SIMAPI_COB_OPC_BIEN_EST_ENT SET SUMA_ASEG_HASTA = 45000000000 where id_bien = 76  AND COD_COB = 28 AND SIM_VERSION_EST = 17;

select * from simapi_cob_opc_bien_est_ent  where COD_COB IN (28,840) AND ID_ESTRATEGIA IN (51,67) AND PROC_CALC_TARIFA IS NOT NULL;

---UPDATE simapi_cob_opc_bien_est_ent SET VISIBLE = 'N' where COD_COB IN (28)

select * from simapi_cob_opc_bien_est_ent  where  proc_calc_tarifa like '%CalculaPrima_2_75%';

select * from sim_campos_tarifa where COD_SECC = 923 AND COD_RAMO in (923,922) AND  cod_cob = 28;


select * from SIM_TIPOTARIFA_COB;

select * from sim_campos_tarifa WHERE cod_ramo in (923,922) and SIM_ESTRATEGIAS in (67);

select ops$puma.SIM_SEQ_CAMPOMOTOR.nextval from dual;

insert into sim_campos_tarifa (SEQ_CAMPO_MOTOR, COD_CIA, COD_SECC, COD_RAMO, ID_GRUPO, CODIGO_CAMPO, NOMBRE_ETIQUETA, ORDEN_CAMPO, LONGITUD, TIPO_DATO, ENVIADO_REQUEST, MODIFICA_PRIMA, DESCRIPCION, RECUPERA_INFO, PARAMETROS, VALORXDEFECTO, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_MODIFICACION, FECHA_MODIFICACION, SIM_ESTRATEGIAS, SIM_ENTIDAD_COLOCADORA, SIM_BIEN_ASEGURADO, SIM_OPCION, COD_COB)
values (ops$puma.SIM_SEQ_CAMPOMOTOR.nextval, 3, 923, 923, 1, 'VLR_ASEGURADO', 'VLR_ASEGURADO', 70, 17, 'N', 'S', 'S', 'TUSEGURO', 'call sim_pck_funcion_gen.FUN_RESCATA_X2000020(''$codigocampo'',''$numsecupol'',''$codries'') INTO :out', null, null, 'A', '51938035', to_date('12-03-2022 10:44:52', 'dd-mm-yyyy hh24:mi:ss'), null, null, 88, 0, 84, 1, 539);

insert into sim_campos_tarifa (SEQ_CAMPO_MOTOR, COD_CIA, COD_SECC, COD_RAMO, ID_GRUPO, CODIGO_CAMPO, NOMBRE_ETIQUETA, ORDEN_CAMPO, LONGITUD, TIPO_DATO, ENVIADO_REQUEST, MODIFICA_PRIMA, DESCRIPCION, RECUPERA_INFO, PARAMETROS, VALORXDEFECTO, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_MODIFICACION, FECHA_MODIFICACION, SIM_ESTRATEGIAS, SIM_ENTIDAD_COLOCADORA, SIM_BIEN_ASEGURADO, SIM_OPCION, COD_COB)
values (ops$puma.SIM_SEQ_CAMPOMOTOR.nextval, 3, 923, 923, 1, 'VALOR_TASA', 'VALOR_TASA', 71, 7, 'N', 'S', 'S', 'TUSEGURO', 'call sim_pck_funcion_gen.FUN_RESCATA_X2000020(''$codigocampo'',''$numsecupol'',''$codries'') INTO :out', null, null, 'A', '51938035', to_date('12-03-2022 10:44:52', 'dd-mm-yyyy hh24:mi:ss'), null, null, 88, 0, 84, 1, 539);

select *
from SIM_g2000020 WHERE cod_ramo in (922,923) and cod_campo in ('COD_ASEG',
                                                                'COD_PROV',
                                                                'CPOS_RIES',
                                                                'DESC_RIES',
                                                                'TIPO_DOC_ASEG',
                                                                'NRO_STELLENT',
                                                                'NRO_SIAR',
                                                                'PORC_SUBS_PRIM',
                                                                'CORREO',
                                                                'TIPO_DOC_BENEF',
                                                                'COD_BENEF',
                                                                'VEREDA',
                                                                'FINCA_PREDIO',
                                                                'AREA_UND_ASEG',
                                                                'DIRECC_RIES',
                                                                'COORD_LATITU_A',
                                                                'COORD_LONGIT_A',
                                                                'VLR_ANIMAL',
                                                                'NRO_ANIMALES',
                                                                'PRODUC_CULTIVO',
                                                                'RAZA_ANIM',
                                                                'AREA_TOTAL_ASE',
                                                                'VLR_ASEGURADO',
                                                                'VALOR_TASA',
                                                                'ACT_AGRO',
                                                                'RAZ_SOC_BENEF',
                                                                'TEL_BENEF',
                                                                'FECHA_SIAR',
                                                               'TIPO_PRODUCTOR');
--UPDATE SIMAPI_OPC_BIEN_EST_ENT SET SIM_VERSION_EST = 4 where id_bien = 76;

--UPDATE simapi_datvar_bien_est_ent SET SIM_VERSION_EST = 4 where id_estrategia=67 and entidad_colocadora=0 AND cod_ramo = 923

select * from A1000100 where COD_POSTAL = 14000;

select *  from C9999909 WHERE  COD_TAB  = 'SIMAPI_TARIFACOB_1_0';

select * from simapi_datvar_bien where  COD_CAMPO IN ('REF_CELULAR','ITEM_CELULAR')

Select *
from C9999909
where cod_tab = 'LISTA_CIUDAD';

--UPDATE C9999909 SET COD_RAMO = 922, COD_SECC = 922, COD_CIA = 2 WHERE COD_TAB = 'LISTA_CIUDAD' AND CODIGO = 67;


select * from C9999910 where cod_tab = 'LISTA_CIUDAD';

select *
from SIM_g2000020 WHERE COD_LISTA = 'TS_TIPO_CULTIVO' AND COD_RAMO = 923;

select *
from SIM_g2000020 WHERE COD_LISTA = 'TS_TIPO_CULTIV02' AND COD_RAMO = 923;

--UPDATE SIM_G2000020 SET COD_LISTA = 'TS_TIPO_CULTIVO' WHERE COD_LISTA = 'AGRICOLA_RANGOCULTIVO' AND COD_RAMO = 923;

select *
from SIM_g2000020 WHERE cod_campo IN ('TIPO_DOC_ASEG', 'TIPO_DOC_BENEF') AND COD_RAMO = 923;

--UPDATE SIM_G2000020 SET COMPONENTE = 'CO', COD_LISTA='TIPOS_DOCUMENTOS' WHERE cod_campo = 'TIPO_DOC_BENEF' AND COD_RAMO = 923;

/*
UPDATE  simapi_datvar_bien SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';
UPDATE  simapi_datvar_bien_est SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';
UPDATE  simapi_datvar_bien_est_ent SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';
*/


select * from sim_log
where trunc(Fecha) > to_date('28-mar-2022','dd-mon-yyyy')
 -- and secuencia > 1270223142
  and columna like '%Helman - CIUDADES%';


SELECT A.COD_PROV , A.COD_POSTAL , PCK999_TERCEROS.fnc_convierte_codazzi(A.COD_POSTAL) CODAZZI, null, null,
       SIM_PCK_LISTAS_EMISION.fun_CiudadNombre(923,a.cod_postal)||'-'|| SIM_PCK_LISTAS_EMISION.fun_DeptoNombre(A.COD_POSTAL)
                                                                                       CIUDAD, null , null , null , null,
       null  , null , null , null , null
FROM A1000100  A WHERE  A.COD_PROV = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_PROV,'XXXXXXXXXX')
                   AND A.COD_POSTAL = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_POSTAL,'XXXXXXXXXX')
                   AND A.COD_POSTAL <> '0'  and a.NOMB_PROV like '%%' ORDER BY A.NOMB_PROV;

select * from simapi_iva_oferta;

select * from CREGLAS where cdreg = '239PVV101';

select * from CREGLAS where cdreg = '239PVV112';

select * from CREGLAS where cdreg = '922PCC001';

select * from CREGLAS where cdreg = '922PCI002';

select * from CREGLAS where cdreg = '239PVV104';

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2' ;

select *  from C9999910 WHERE  COD_TAB  = 'TIPO_CULTIVO' ;

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';


select *
from SIM_g2000020 WHERE COD_LISTA LIKE 'TS_TIPO_CU%' AND COD_RAMO = 923;

select *
from SIM_g2000020 WHERE COD_LISTA LIKE 'TS_TIPO_CULTIVO2' AND COD_RAMO = 923;

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';

select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';
---delete C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2' and codigo = 2;

--update C9999909 set COD_CAMPO = 'PRODUC_CULTIVO' where COD_TAB  = 'TIPO_CULTIVO';

----TABLA DETALLE DEL NOMBRE DE LAS COBERTURAS
select * from a1002100 where cod_ramo in (923,922) and COD_COB IN (938,735,12,13,28,11,51);

select * from a1002100 where txt_cob like '%INTERR%';

update a1002100 set  MCA_CONSULTA = 'S' where cod_ramo = 923 and txt_cob like '%INTERR%';
--mca_baj_stral = 'N', mca_reaseguro = 'S', BASICA = 'S',

select * from a1002100 where cod_ramo = 922 and COD_COB = 52;


INSERT INTO A1002100 (COD_CIA, COD_RAMO, COD_COB, NUM_SECU, TXT_COB, MCA_IMP_OBL, COD_COB_RELAC, COD_COB_INF,
                      MCA_SUMA_ILIM, MCA_BAJ_STRAL, COD_SELECC, COD_REG_VAL, COD_REG_CAL, COD_REG_PRE, COD_TEXTO,
                      SUB_COD_TEXTO, AFECTA_CONSORC, MCA_CAPITAL, CAPITAL_UNIDAD, MCA_SERVICIO, MCA_FRANQUICIA,
                      MCA_REASEGURO, COD_TABLA_TARI, OPERADOR_TARI, PORC_INCIDENC, COD_EXCLUSIVO, COD_AGRUP_CONT,
                      COD_AGRUP_BOP, COD_USR, CLAUSULAS, REG_SELECC, NOMINA, TIPO_NOMINA, MCA_REPOS_AUT, CLASE_COB,
                      TIPO_FRANQ, MCA_VALOR_ABLE, MCA_VAL_SINI, MCA_BAJA_PRIMA, TXT_CESION, BASICA, SUMA_A_REAS,
                      MCA_SUMA_ASEG, TXT_COB_AMP, MCA_EXCLU_XL, MCA_CONSULTA)
VALUES (3, 923, 938, 919, 'INTERRUPCION DEL NEGOCIO', 'S', null, null, 'N', 'N', null, '922PCV001', '922PCC001',
        '922PCI002', null, null, null, null, null, null, 'N', 'S', null, null, null, null, '923039923', null,
        'INTASI12', null, '922PCI001', null, null, 'N', '1', null, 'N', 'ASEG', 'N', 'INTERR. DEL NEGOCIO', 'S', 'N',
        null, 'INTERR. DEL NEGOCIO', 'N', 'S');



select max(NUM_SECU) from a1002100;

select * from a1002100 where cod_cia = 2 and cod_cob = 938;


-----LOG SERVICIOS SIMON VENTAS----
select max(ID_SIMLOGWS)  from SIM_LOG_WEBSERVICES
where trunc(FECHA_INICIO) > to_date('11-04-2022','dd-mm-yyyy');

select * from SIM_LOG_WEBSERVICES where ID_SIMLOGWS > 38801863 order by ID_SIMLOGWS desc;

select * from a2990700 where num_pol1 = 1520000062201


select max(secuencia) from sim_log
where trunc(Fecha) > to_date('31-05-2022','dd-mm-yyyy');

select * from sim_log
where trunc(Fecha) > to_date('12-09-2022','dd-mm-yyyy')
  and secuencia > 1651772584 and COLUMNA like 'Proc_PreCob_67_76->Tasa%';
select * from sim_log
where trunc(Fecha) > to_date('12-09-2022','dd-mm-yyyy')
  and secuencia > 1651772584 and COLUMNA like 'Proc_PreCob_67_76->Suma%';
select * from sim_log
where trunc(Fecha) > to_date('12-09-2022','dd-mm-yyyy')
  and secuencia > 1651772584 and COLUMNA like 'Proc_PreCob_67%';

select * from sim_log
where trunc(Fecha) > to_date('12-09-2022','dd-mm-yyyy')
  and secuencia > 1651772584 and COLUMNA like 'SIM_PCK_TARIFA_PRODUCTO Proc_Precob%';




select a.dat_car2, a.*
from c9999909 a
where a.cod_secc  = 923
  and a.cod_ramo  in (999,923)
  and a.cod_campo = 'PRODUC_CULTI2'
  and a.codigo   = 1
  and a.fecha_baja is null
  and rownum = 1;

select a.codigo1 , a.*
from c9999909 a
where
     --a.cod_tab   = 'TIPO_CULTIVO'
   a.cod_campo = 'PRODUC_CULTI2'
  and    a.cod_secc  = 923
  and a.cod_ramo  = 923
  and a.codigo    = 1
  and a.fecha_baja is null
  and rownum = 1;

select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';

select * from sim_log
where trunc(Fecha) > to_date('28-08-2022','dd-mm-yyyy')
  and secuencia > 1634153693 and COLUMNA like 'PROCESO PKG239_AGRICOLA-%';

select * from sim_log
where trunc(Fecha) > to_date('17-10-2022','dd-mm-yyyy')
  and secuencia > 1443277971 and COLUMNA like 'Proc_CalculaPrima_67_76%';

select * from sim_log
where trunc(Fecha) > to_date('17-10-2022','dd-mm-yyyy')
  and secuencia > 1443277971 and COLUMNA like 'SIM_PCK_TARIFA_PRODUCTO%';


select * from sim_log
where trunc(Fecha) > to_date('17-10-2022','dd-mm-yyyy')
  and secuencia > 1443277971 and COLUMNA like 'Oferta Contex prc.Tarifa%';


SELECT A.COD_PROV , A.COD_POSTAL , PCK999_TERCEROS.fnc_convierte_codazzi(A.COD_POSTAL) CODAZZI, null, null,
       SIM_PCK_LISTAS_EMISION.fun_CiudadNombre(922,a.cod_postal)||'-'|| SIM_PCK_LISTAS_EMISION.fun_DeptoNombre(A.COD_POSTAL)
                                                                                       CIUDAD, null , null , null , null,
       null  , null , null , null , null
FROM A1000100  A WHERE  A.COD_PROV = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_PROV,'XXXXXXXXXX')
                   AND A.COD_POSTAL = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_POSTAL,'XXXXXXXXXX')
                   AND A.COD_POSTAL <> '0'  and a.NOMB_PROV like '%%' ORDER BY A.NOMB_PROV


select * from CREGLAS where cdreg = '239CTT167';


select * from g2000200
where cod_secc = 923
  and  cod_ramo = 923
  and cdreg = '239CTT167';


/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO,
                      COD_SECC, COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA,
                      DAT_OBS2, RANGO4, COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, SECUENCIA, PROCESO)
VALUES ('AGRO_VIG', 67, null, null, null, 'S', null, null, 922, 922, 3,
        TO_DATE('2022-04-20', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null, null,
        null, null, default, null);
 */

-------tabla facturas
-----las cuatro facturas solo se generan con 1 riesgo
select * from a2990700 where num_pol1 = 1520000031901

select * from a2990700 where num_pol1 = 1520000032101

----IMPRESION----
SELECT *
FROM simapi_poliza_agrupada a
WHERE ((a.num_pol1_pers = 1520000017701 AND
        923 = 922) OR
       (a.num_pol1_comer = 1520000017701 AND
        923 = 923) OR
       (a.num_pol_cotiz = 1520000017701 AND
        923 IN (923, 922)))
  AND NVL(a.mca_cotizacion, 'N') = 'S'
  AND rownum = 1;

SELECT *
FROM simapi_poliza_agrupada WHERE num_pol1_comer = 1520000017701 OR num_pol1_pers = 1520000017701;

SELECT * FROM A2000030 WHERE NUM_POL1 = 1520000022001 and cod_secc = 923

select * from a2000030 where sim_estrategias = 88;

SELECT * FROM A2000030 WHERE NUM_POL1 = 1520000024501 and cod_secc = 923
-------FACTURA AGRO-----------------
select * from fact_especial WHERE COD_TAB = 'FACTSECC_DISTRIB';

select * from CREGLAS where cdreg = '239CTT109';

select * from CREGLAS where cdreg = '239CTT167';



select X.*
from a2000020 X
where
        num_secu_pol = 29861214223;


SELECT FECHA_CREACION,
           FECHA_EMI,
    FECHA_EMI_END,
    FECHA_VIG_POL,
    FECHA_VIG_END,
    FECHA_VENC_POL,
    FECHA_VENC_END
    FROM A2000030
WHERE COD_CIA                = 3 AND
        COD_SECC               = 923 AND
        NUM_POL1               = 1520000022001 AND
        NUM_SECU_POL = 29861143968;


select * from CREGLAS where cdreg = '204PVV025';
---ANTES
/*
SELECT VALOR_CAMPO_EN
INTO            :B99.NTVALORCAMPOEN
FROM X2000020
WHERE
        NUM_SECU_POL = :B99.NUMSECUPOL AND
        COD_CAMPO = 'COD_ASEG'  AND
        :B99.NTVALORCAMPOEN IS NULL
 */

select * from CREGLAS where cdreg = '922PCI001';

select * from CREGLAS where cdreg = '204PVV025';


select * from CREGLAS where cdreg = '922PVV006';

SELECT r.nomb_prov
FROM a1000100 r

select num_secu_pol from a2000030 where NUM_POL1 = 1520000026201 and cod_secc = 923;

select X.*
from a2000020 X
where
        num_secu_pol = 29861147840;

Select *
From   a2000020 k
Where k.num_secu_pol = 29861147840
  And  k.cod_ries     = 1
  And  k.cod_campo    = 'API_OPCION'

select X.*
from x2000020 X
where
        num_secu_pol = 29861192742;

Select max(num_secu_pol)
From X2000040
Where  num_secu_pol = 29861192742
  --cod_cob = 28
  --and cod_selecc = 'S';



Select a.prima_anio_cons,    a.sim_tasa_total_orig, a.suma_aseg_cons, a.tarifa, a.*
From X2000040 a
Where num_secu_pol = 29861192617
  and    cod_cob = 28

select * from X2000040 where suma_aseg = 21000000  and    cod_cob = 28;


SELECT COUNT(0)
FROM C9999909 C
WHERE C.COD_TAB = 'LIQHOGARTIENDA'


Select g.cod_campo CAMPO, nvl(m.clausulas, m.valor_campo_en) descri, h.num_secu
From simapi_datvar_bien_est_ent g
   , simapi_datvar_bien h
   , x2000020 m
Where g.id_bien = 76
  And  g.id_bien = h.id_bien
  And  g.entidad_colocadora  = 0
  And  g.id_estrategia = 67
  And  g.sim_version_est = 8
  And  g.mca_imp_obl = 'S'
  And  g.cod_campo = h.cod_campo
  And  g.cod_campo = m.cod_campo
  And  h.estado = 'A'
  And  m.num_secu_pol = 29861147840
  And  m.cod_ries = 1
  And nvl(m.clausulas, m.valor_campo_en) Is Not Null
Order By h.num_secu ;

SELECT r.nomb_prov INTO L_DESC_AUX
FROM a1000100 r
WHERE r.cod_postal = j.descri;

SELECT *
FROM C9999909 C
WHERE C.COD_TAB = 'LIQHOGARTIENDA'
  AND C.CODIGO    = 67
  AND C.CODIGO1   = 76;

select valor_campo_en||'-'||clausulas, '1'

from x2000020
where num_secu_pol = 29861147840
  and cod_ries = 1
  and cod_campo = 'COD_ASEG';

/*
INSERT INTO SIMAPI_IVA_OFERTA (COD_CIA, COD_RAMO, SIM_ESTRATEGIA, PORC_IVA, ESTADO, FECHA_CREACION, USUARIO_CREACION,
                               FECHA_MODIFICACION, USUARIO_MODIFICACION)
VALUES (3, 923, 88, 5.00, 'A', TO_DATE('2022-02-01', 'YYYY-MM-DD HH24:MI:SS'), 'INTASI12', null, null);

INSERT INTO FACT_ESPECIAL (COD_TAB, COD_CIA, COD_SECC, COD_RAMO, DAT_CAR, DAT_NUM, DAT_NUM2, DESCRIPCION, FECHA_BAJA)
VALUES ('FACTSECC_DISTRIB', 3, 923, 923, 'S', 88, null,
        'Abre la factura de acuerdo al porcentaje de distribucion-AB100277', null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_CONTROL_TOPE', 88, null, null, null, 'S', 101.00, null, 923, 923, 3,
        TO_DATE('2022-05-06', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null, null,
        null, null, null);
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_CONTROL_TOPE', 88, null, null, null, 'S', 101.00, null, 922, 922, 2,
        TO_DATE('2022-05-01', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null, null,
        null, null, null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_VIG', 88, null, null, null, 'S', null, null, 923, 923, 3, TO_DATE('2022-04-20', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_VIG', 88, null, null, null, 'S', null, null, 922, 922, 3, TO_DATE('2022-04-20', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, null, null, null, null, null, null, null, null, null, null, null);

*/


select *  from C9999909 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';

----parametrizacion pendientes por oferta----------------------------------------------
select *
from   SIMAPI_IVA_OFERTA
where  cod_cia  = 3
  and    cod_ramo = 923
  and    sim_estrategia =  67
  and    estado = 'A';
select * from fact_especial WHERE COD_TAB = 'FACTSECC_DISTRIB' AND COD_SECC = 923 AND COD_RAMO = 923;
select *  from C9999909 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';
select *  from C9999909 WHERE  COD_TAB  = 'AGRO_VIG';
select * from sim_campos_tarifa WHERE cod_ramo in (923,922) and SIM_ESTRATEGIAS in (88,67);
---------------------------------------------------------------------------
select *  from C9999910 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';
select *  from C9999910 WHERE  COD_TAB  = 'AGRO_VIG';


select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';
select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';
select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';


---PARAMETRIZACION POR OFERTA

/*
INSERT INTO C9999910 (COD_TAB, DESCRIPCION, USUARIO, FECHA_CREACION, OBLIGATORIO, PARAMETRO_SISTEMA, TIPO_USO,
                      FECHA_MODIFICA, FECHA_BAJA, USUARIO_MODIFICA, USUARIO_BAJA, OBSERVACIONES, PROGRAMA_PROCESO,
                      ESTADO, MODULO)
VALUES ('AGRO_CONTROL_TOPE', 'ACTIVACION DE CONTROL DE TOPE PARA TIPOS DE ACTIVIDAD', 'B7946915',
        TO_DATE('2022-05-06 13:32:46', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null,
        'A', '7');

INSERT INTO C9999910 (COD_TAB, DESCRIPCION, USUARIO, FECHA_CREACION, OBLIGATORIO, PARAMETRO_SISTEMA, TIPO_USO,
                      FECHA_MODIFICA, FECHA_BAJA, USUARIO_MODIFICA, USUARIO_BAJA, OBSERVACIONES, PROGRAMA_PROCESO,
                      ESTADO, MODULO)
VALUES ('AGRO_VIG', 'VALOR MAXIMO DE VIGENCIA POLIZAS AGRO PÓR OFERTA PARA SIMON 3.0', 'B7946915',
        TO_DATE('2022-05-06 13:32:46', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null,
        'A', '7');
*/

/*
INSERT INTO SIMAPI_IVA_OFERTA (COD_CIA, COD_RAMO, SIM_ESTRATEGIA, PORC_IVA, ESTADO, FECHA_CREACION, USUARIO_CREACION,
                               FECHA_MODIFICACION, USUARIO_MODIFICACION)
VALUES (3, 923, 62, 5.00, 'A', TO_DATE('2022-02-01', 'YYYY-MM-DD HH24:MI:SS'), 'INTASI12', null, null);

INSERT INTO FACT_ESPECIAL (COD_TAB, COD_CIA, COD_SECC, COD_RAMO, DAT_CAR, DAT_NUM, DAT_NUM2, DESCRIPCION, FECHA_BAJA)
VALUES ('FACTSECC_DISTRIB', 3, 923, 923, 'S', 62, null,
        'Abre la factura de acuerdo al porcentaje de sistribucion - AB100277', null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_CONTROL_TOPE', 62, null, null, null, 'S', 101.00, null, 923, 923, 3,
        TO_DATE('2022-05-06 13:32:46', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null,
        null, null, null, null);
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_CONTROL_TOPE', 62, null, null, null, 'S', 101.00, null, 922, 922, 2,
        TO_DATE('2022-05-06 13:32:46', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, null, null, null, null, null,
        null, null, null, null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_VIG', 62, null, null, null, 'S', null, null, 923, 923, 3, TO_DATE('2022-04-20', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('AGRO_VIG', 62, null, null, null, 'S', null, null, 922, 922, 3, TO_DATE('2022-04-20', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, null, null, null, null, null, null, null, null, null, null, null);


-------------------------------------------------------------------------------------------------------------






select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';
select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';

/*
INSERT INTO FACT_ESPECIAL (COD_TAB, COD_CIA, COD_SECC, COD_RAMO, DAT_CAR, DAT_NUM, DAT_NUM2, DESCRIPCION, FECHA_BAJA)
VALUES ('FACTSECC_DISTRIB', 3, 923, 923, 'S', 78, null,
        'Abre la factura de acuerdo al porcentaje de sistribucion - AB100277', null);
*/


select * from a2990700 where num_pol1 = 1520000027601;


select a.num_secu_pol, a.* from a2000030 a where num_pol1 = 1520000027501;


SELECT Distinct a.nro_documto, a.tdoc_tercero, a.cod_secc,
                a.sim_estrategias, a.sim_entidad_colocadora
FROM   a2000030 a
WHERE  a.num_secu_pol  =  29861148807
  AND    a.num_end       =
         (SELECT  MAX(b.num_end)
          FROM    a2000030 b
          WHERE   b.num_secu_pol  =  a.num_secu_pol
            AND     b.num_end      <=  NVL(0,99999));




SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_RAMOS_AUTORZA' and cod_ramo = 923;

SELECT rango3, rango4 --intasi3131072015

FROM   C9999909 c9
WHERE  c9.cod_tab = v_CodTab
  AND    c9.cod_cia = 3
  AND    c9.cod_secc = 923
  AND    c9.cod_ramo = 923
  AND    c9.rango1 = p_reg.TipoCargue
  AND    c9.rango2 = p_reg.TipoPlano;


select * from A2990050 WHERE NOMBRPT = 'CB299212.pco';


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab in ('TIPO_CULTIVO', 'ACT_AGRO', 'AGRO_VIG','AGRO_CONTROL_TOPE','TIPO_CULTIVO2');



--select * from g2000210;


select *
from G2000010 WHERE cod_cia in (2,3) and cod_campo in (
                                                       'ACT_AGRO',
                                                       'COD_ASEG',
                                                       'COD_PROV',
                                                       'CPOS_RIES',
                                                       'DESC_RIES',
                                                       'DESC_RIES1',
                                                       'TIPO_DOC_ASEG',
                                                       'NRO_STELLENT',
                                                       'NRO_SIAR',
                                                       'FECHA_SIAR',
                                                       'TIPO_PRODUCTOR',
                                                       'PORC_SUBS_PRIM',
                                                       'CORREO',
                                                       'TIPO_DOC_BENEF',
                                                       'COD_BENEF',
                                                       'RAZ_SOC_BENEF',
                                                       'TEL_BENEF',
                                                       'VEREDA',
                                                       'FINCA_PREDIO',
                                                       'AREA_UND_ASEG',
                                                       'DIRECC_RIES',
                                                       'NRO_LOTE1',
                                                       'COORD_LATITU_A',
                                                       'COORD_LONGIT_A',
                                                       'VLR_ANIMAL',
                                                       'NRO_ANIMALES',
                                                       'PRODUC_CULTIVO',
                                                       'RAZA_ANIMAL1',
                                                       'AREA_TOTAL_ASE',
                                                       'VLR_ASEGURADO',
                                                       'VALOR_TASA');



select cod_ramo,cod_campo,cod_nivel,mca_visible,reg_pre_field,cod_regla
from g2000020 WHERE cod_ramo in (922,923) and cod_campo in ('COD_ASEG',
                                                            'ACT_AGRO',
                                                            'COD_PROV',
                                                            'CPOS_RIES',
                                                            'DESC_RIES',
                                                            'DESC_RIES1',
                                                            'TIPO_DOC_ASEG',
                                                            'NRO_STELLENT',
                                                            'NRO_SIAR',
                                                            'FECHA_SIAR',
                                                            'TIPO_PRODUCTOR',
                                                            'PORC_SUBS_PRIM',
                                                            'CORREO',
                                                            'TIPO_DOC_BENEF',
                                                            'COD_BENEF',
                                                            'RAZ_SOC_BENEF',
                                                            'TEL_BENEF',
                                                            'VEREDA',
                                                            'FINCA_PREDIO',
                                                            'AREA_UND_ASEG',
                                                            'DIRECC_RIES',
                                                            'NRO_LOTE1',
                                                            'COORD_LATITU_A',
                                                            'COORD_LONGIT_A',
                                                            'VLR_ANIMAL',
                                                            'NRO_ANIMALES',
                                                            'PRODUC_CULTIVO',
                                                            'RAZA_ANIMAL1',
                                                            'AREA_TOTAL_ASE',
                                                            'VLR_ASEGURADO',
                                                            'VALOR_TASA');


select cod_ramo,cod_campo,estado,categoria,nivel,componente,titulo,cod_lista
from SIM_g2000020 WHERE cod_ramo in (922,923) and cod_campo in ('COD_ASEG',
                                                                'ACT_AGRO',
                                                                'COD_PROV',
                                                                'CPOS_RIES',
                                                                'DESC_RIES',
                                                                'DESC_RIES1',
                                                                'TIPO_DOC_ASEG',
                                                                'NRO_STELLENT',
                                                                'NRO_SIAR',
                                                                'FECHA_SIAR',
                                                                'TIPO_PRODUCTOR',
                                                                'PORC_SUBS_PRIM',
                                                                'CORREO',
                                                                'TIPO_DOC_BENEF',
                                                                'COD_BENEF',
                                                                'RAZ_SOC_BENEF',
                                                                'TEL_BENEF',
                                                                'VEREDA',
                                                                'FINCA_PREDIO',
                                                                'AREA_UND_ASEG',
                                                                'DIRECC_RIES',
                                                                'NRO_LOTE1',
                                                                'COORD_LATITU_A',
                                                                'COORD_LONGIT_A',
                                                                'VLR_ANIMAL',
                                                                'NRO_ANIMALES',
                                                                'PRODUC_CULTIVO',
                                                                'RAZA_ANIMAL1',
                                                                'AREA_TOTAL_ASE',
                                                                'VLR_ASEGURADO',
                                                                'VALOR_TASA');


SELECT a.id_bien
     ,a.mca_multiregistro
     ,a.limite_riesgos
     ,a.tomador_es_aseg
FROM   simapi_bienes_estrategia_ent a
WHERE  a.entidad_colocadora  =  0
  AND    a.id_estrategia       =  78
  AND    a.id_bien             =  a.id_bien
  AND    a.sim_version_est     =
         (SELECT MAX(b.sim_version_est)
          FROM   simapi_bienes_estrategia_ent b
          WHERE  b.entidad_colocadora  =  a.entidad_colocadora
            AND    b.id_estrategia       =  a.id_estrategia
            AND    b.id_bien             =  a.id_bien
            AND  ((17         IS NOT NULL
              AND    b.sim_version_est     =  17)
              OR    (17         IS NULL)))

  AND    estado              =  'A';


select * from simapi_bienes_estrategia_ent   where id_estrategia=78

select cod_job
from g9000900
where cod_job like '%AJDDES%'



----TABLAS CARGE MASIVO

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_RGTRO' AND COD_RAMO = 500;

SELECT * FROM C9999930;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 7;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_RGTRO' AND COD_RAMO = 923;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_PRCSO' AND COD_RAMO = 923;
/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, SECUENCIA, PROCESO)
VALUES ('INTBANCA_PRMTR_PRCSO', 0, 0.000, 0.000, 'PARAMETROS POR CADA TIPO DE PROCESO', '0', 0.00, null, 923, 923, 3,
        TO_DATE('2022-07-12 16:36:51', 'YYYY-MM-DD HH24:MI:SS'), 0, 67, 2, 'INTASI12', null, null, null, null, null,
        null, null, null, SEQ_C9999909.NEXTVAL, null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, SECUENCIA, PROCESO)
VALUES ('INTBANCA_PRMTR_PRCSO', 0, 0.000, 0.000, 'PARAMETROS POR CADA TIPO DE PROCESO', '0', 0.00, null, 923, 923, 3,
        TO_DATE('2022-07-12 16:36:51', 'YYYY-MM-DD HH24:MI:SS'), 0, 88, 2, 'INTASI12', null, null, null, null, null,
        null, null, null, SEQ_C9999909.NEXTVAL, null);
*/
SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_CAUSA_CANCE' AND COD_RAMO = 500;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_CODIGOERROR' AND COD_RAMO = 500;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_DTOVAR_RAMO' AND COD_RAMO = 500;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_LMTES_CALCU' AND COD_RAMO = 500;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_RGTRO_PRODU' AND COD_RAMO = 500;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_TIPO_RGTRO' ;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'RETROACTPROD' ;

select * from c9999908;

select * from C9999040;

SELECT cod_campo CodCampo, dat_obs DescCampo, dat_car TipoDato,
       -- N-numerico,F-echa,C-aracter
       dat_num LongDato,
       -- longitud del dato
       rango3 Obligatorio,
       codigo1,
       n.*
FROM   c9999909 n
WHERE  cod_tab = 'INTBANCA_DATOS_RGTRO';

select * from C2990035;



SELECT --*
       codigo1 TipoRegistro, dat_num Niveldato, dat_car DatoVariable,
       -- nombre del campo que va a la tabla c22990035
       codigo orden, rango1 CodTabla,
       -- 1=a2010030,2=a2000030,3=a2010020
       dat_car2 CampoTabla,
       N.*
FROM   c9999909 N
WHERE  cod_tab = 'INTBANCA_MAPEO_RGTRO'
  -- AND    cod_cia = Gb_CodCia
  --AND    cod_secc = Gb_CodSecc
  -- AND    cod_ramo = Gb_CodRamo
  -- AND    codigo1 = Gb_TipoRegistro
--  AND    cod_campo = p_CodCampo
  --AND    dat_car IS NOT NULL
  AND COD_RAMO = 923
ORDER  BY codigo;

----table ejecucion de coboles parametros guardados de cada ejecucion
SELECT * FROM A2990050 WHERE NOMBRPT = 'CB299220.pco';



SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_RAMOS_AUTORZA';

/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, RANGO4, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_RAMOS_AUTORZA', 44, null, null, 'RAMOS AUTORIZADOS PARA CARGUE BATCH', null, null, null, 923, 923, 3, 3,
        SYSDATE, 3, 2, 0, 'INTASI12', null, null,
        'PCK299_CARGUEBATCH_PRC', null, null, null, null, null);
*/

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_CAMPO_RGTRO' and codigo1 = 8;

/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_CAMPO_RGTRO', 1, 1, 20, 'ESTRATEGIA O OFERTA', 'N', 15, 'SIM_ESTRATEGIAS', 923, 923, 3,
        SYSDATE, 1, 1, null, 'INTASI12', null, null, ' ', 1, null,
        'COLNUM14', 'SIM_ESTRATEGIAS', 'N', null);

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_CAMPO_RGTRO', 1, 1, 21, 'ENTIDAD COLOCADORA', 'N', 15, 'SIM_ENTIDAD_COLOCADORA', 923, 923, 3,
        SYSDATE, 1, 1, null, 'INTASI12', null, null, ' ', 1, null,
        'COLNUM15', 'SIM_ENTIDAD_COLOCADORA', 'N', null);
*/

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_TIPREG_RAMO';




SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_TIPREG_RAMO'
  and COD_RAMO = 923
  --and dat_num = 67
  and codigo = 0;
SELECT a.*
FROM c9999909 a
WHERE cod_tab ='CBATCH_RAMOS_AUTORZA'
  and cod_ramo = 923
  and rango4 = 3
  and rango1 = 3;
SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923
ORDER BY CODIGO1;


/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_CAMPO_RGTRO', 1, 4.000, 50, 'OPCION QUE TIENE ATADA LAS COBERTURAS', 'N', 3, 'API_OPCION', 923, 923, 3,
        TO_DATE('2022-06-19 08:17:47', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 76, 'INTASI12', null, null, null, 2, 67,
        'COLNUM19', 'API_OPCION', 'N', null);

*/
---update c9999909 set DAT_CAR2 = 'COLNUM19' WHERE  cod_tab = 'CBATCH_CAMPO_RGTRO' and COD_RAMO = 923 and cod_campo = 'API_OPCION';

SELECT a.*
FROM c9999909 a
WHERE cod_tab ='CBATCH_RAMOS_AUTORZA'
  and cod_ramo = 923
  and rango4 = 3
  and rango1 = 3;


----update c9999909 set dat_num = 67 WHERE  cod_tab = 'CBATCH_TIPREG_RAMO' and COD_RAMO = 923 and codigo1 in (0,1,3,4);


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 760 ---and cod_campo like '%cob%'
 and codigo1 = 3
and codigo = 0
ORDER BY CODIGO1;


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923 ---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;



SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_TIPREG_RAMO'
  and COD_RAMO = 923
  and dat_num = 67;



SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_TIPO_RGTRO';

/*
delete C9999909 WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
    and COD_RAMO = 923 ---and cod_campo like '%cob%'
    and codigo1 = 3
    and codigo = 0;

*/


----verificar nombre job----
select * from A2990050_JN
where nombrpt = 'CB299220.pco';


select *
from c1990015 -- cabecera de la póliza
where cod_ramo = 923
  and fecha_envio > to_date('20/07/2022');

select *
from c2990800
where cod_ramo = 923
  and fecha_envio > to_date('04/05/2022')




SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 501 ---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923 ---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;

SELECT * FROM C9999930;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 1;


SELECT * FROM C9999930;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 17;

---TABLA DE COBERTURAS
SELECT * FROM A1002100 WHERE COD_RAMO = 501;


select *
from c1990015 -- cabecera de la póliza
where cod_ramo = 501
  and fecha_envio > to_date('20/07/2022');

select *
from c2990800
where cod_ramo = 501
  and fecha_envio > to_date('20/07/2022')


SELECT * FROM C9999931 WHERE RCD_RM_ID = 18



SELECT INSTR('PEPE PEREZ','PER') FROM DUAL;

select SUBSTR('TS_TIPO_CULTIVO', 4) from dual;

select substr(null,1,1) from dual;


select * from a1002000
where cod_cob in (11,12,13,28,51,735,938,539)
  and cod_cia = 3;

select * from a7000100
where cod_cob in (11,12,13,28,51,735,938,539)
  and cod_cia = 3;



--ok unico
select * from c9999909
WHERE  cod_tab =
'CBATCH_RAMOS_AUTORZA'
and cod_ramo = 923
and rango4  = 3
and rango1 = 3;

--ok unico datnum = 0
select * from C9999909
where cod_tab = 'CBATCH_DOMINIOS'
and cod_secc = 923
and cod_ramo = 923
and dat_num = 0;

---ok unico codigo = 0
select * from C9999909
where COD_TAB = 'CBATCH_TIPREG_RAMO'
  and cod_ramo = 923
  and codigo = 0;

---unico tipo de proceso codigo = 0  --el de osacar marriaga en tipo de proceso 1
select * from C9999909
WHERE  cod_tab =
       'CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923
  and codigo = 0
ORDER BY CODIGO1, codigo2;

select * from sim_procesos
where descripcion like '%OFERTA%'

SELECT * FROM SIM_PROCESOS_PRODUCTO where id_producto = 923;

UPDATE C9999933 SET RM_ESTRATEGIA = 88 WHERE RM_ID = 22;

--DELETE C9999933 WHERE RM_ID = 22;
SELECT * FROM C9999931;

----nuevas tablas parametrizacion inicial de cargue txt
SELECT * FROM C9999933;
----nuevas tablas parametrizacion inicial de cargue txt
SELECT *
FROM C9999934
where RCD_RM_ID = 22
  --AND RCD_TIPO_REG_S = 4
order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;

SELECT C9999934_SEQ.nextval FROM DUAL;


SELECT TO_DATE(SUBSTR('03923923008809092022OFEREXP',13, 8),   --PECUARIO
               'ddmmyyyy')  FROM DUAL;

SELECT TO_NUMBER(SUBSTR('03923923008809092022OFEREXP', 9, 4)) FROM DUAL;

--DELETE C9999934 where RCD_RM_ID = 22 AND RCD_TIPO_REG_S = 4  AND RCD_LABEL_S IN ('COD_ASEG', 'TIPO_DOC_ASEG');

--RAZA_ANIMAL1
--TIPO_PRODUCTOR PQUEÑO MEDIANO GRANDE
--API_OPCION
--NRO_LOTE1
--API_ESTRATEGIA
--BIEN_ASEGURADO
--FECHA_SIAR

--NOM_BENEF
--COD_ASEG
--TIPO_DOC_ASEG

select *
from c9999909
where cod_tab   = 'CBATCH_DATVAR_RAMO'
  and cod_secc  = 923
  and cod_ramo  = 923
  and rango4 = 88;

-----------------CBATCH_DATVAR_RAMO  166 DATO VARIABLE NO ESTA PARAMETRIZADO EN BANCASEGUROS PARA ESTE RAMO

INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, RANGO4, COD_RAMO,
                      COD_SECC, COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_DATVAR_RAMO', 16, 3.000, 100.000, 'PRODUC_CULTIVO3', ' ', null, 'PRODUC_CULTIVO3', 67, 923, 923, 3,
        TO_DATE('2022-07-23 11:27:15', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, 'INTASI12', null, null, null, null,
        null, null, null, null);


---DELETE C9999934 where RCD_RM_ID = 22 AND RCD_LABEL_S = 'FECHA_SIAR';

DELETE c9999909 where cod_tab   = 'CBATCH_DATVAR_RAMO'
    and cod_secc  = 923
    and cod_ramo  = 923 AND COD_CAMPO IN ('PRODUC_CULTIVO3') AND RANGO4='67';


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  AND CODIGO = 0
  and COD_RAMO = 923 ---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;

select * from naturales where numero_documento in (1078994669,
                                                   1078994670,
                                                   1078994671
    );

select * from DIVISION_POLITICAS WHERE CODIGO_CODAZZI = 11001;
select * from DIVISION_POLITICAS WHERE CODIGO_CODAZZI = 05001;
select * from MEDIOS_COMUNICACION where nat_secuencia = 36208282;

select * from DIVISION_POLITICAS where codigo = 05001;

19611001000

                  select * from naturales where numero_documento in (1030321706);

select * from DIRECCIONES where nat_secuencia = 36256492;

select *
from a1000100 a ---order by cod_postal desc
where a.cod_postal=11001;

select substr('19605001000',4,5) from dual;

SELECT rtrim(cadena) CadenaRegistro
     ,substr(cadena, 1, 1) TipoRegistro
     ,substr(cadena, 2, 17) NroTransaccion
     ,num_reg ConsRegPlano
     ,substr(cadena, 20, 2) TipoProceso
     ,substr(cadena, 19, 1) TipoNegocio
     ,substr(cadena, 23, 7) TotalNovedades
FROM   c9999908
WHERE  cod_usr = 'BNCSGR03923923006702092022OFEREXP_CSV'
ORDER  BY NUM_REG;

select * from sim_log
where Fecha > to_date('16-NOV-2022 09:00:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like ':CARGUERIC->%';

SELECT d.rcd_entrada
     ,d.rcd_orden_e
     ,d.rcd_longitud_s
     ,DECODE(d.rcd_label_s
    ,NULL
    ,NULL
    ,rpad(d.rcd_label_s, 14, ' ')) rcd_label_s
     , -- b7937333 07/02/2014
    d.rcd_default_s rcd_default_s
     ,d.rcd_nom_campo
     --
     ,d.rcd_multi_reg rcd_salto_linea
FROM   c9999933 m, c9999934 d
WHERE  d.rcd_rm_id = m.rm_id
  AND    lpad(m.rm_cod_seccion, 3, '0') ||
         lpad(m.rm_cod_producto, 3, '0') ||
         lpad(m.rm_estrategia, 4, '0') = '9239230088'
  AND    d.rcd_salida = 'S'
  --AND    d.rcd_tipo_reg_s = p_nivel
ORDER  BY d.rcd_tipo_reg_s, d.rcd_orden_s;


SELECT d.rcd_orden_e

FROM   c9999933 m, c9999934 d
WHERE  d.rcd_rm_id = m.rm_id
  AND    lpad(m.rm_cod_seccion, 3, '0') ||
         lpad(m.rm_cod_producto, 3, '0') ||
         lpad(m.rm_estrategia, 4, '0')   =
         SUBSTR('03923923008809092022OFEREXP', 3, 10)  --pecuario
  AND    d.rcd_salida = 'S'
  AND    d.rcd_nom_campo = 'NUMERO RIESGO'
  AND    rownum = 1;

SELECT d.rcd_entrada
     ,d.rcd_orden_e
     ,d.rcd_longitud_s
     ,DECODE(d.rcd_label_s
    ,NULL
    ,NULL
    ,rpad(d.rcd_label_s, 14, ' ')) rcd_label_s
     , -- b7937333 07/02/2014
    d.rcd_default_s rcd_default_s
     ,d.rcd_nom_campo
     --
     ,d.rcd_multi_reg rcd_salto_linea
FROM   c9999933 m, c9999934 d
WHERE  d.rcd_rm_id = m.rm_id
  AND    lpad(m.rm_cod_seccion, 3, '0') ||
         lpad(m.rm_cod_producto, 3, '0') ||
         lpad(m.rm_estrategia, 4, '0') = SUBSTR('03923923008809092022OFEREXP', 3, 10)
  AND    d.rcd_salida = 'S'
  AND    d.rcd_tipo_reg_s = 1
ORDER  BY d.rcd_tipo_reg_s, d.rcd_orden_s;


SELECT e.cadena
FROM   c9999908 e
WHERE  e.cod_usr = 'CAP_E_' || '03923923008809092022OFEREXP'
ORDER  BY e.num_reg;


SELECT rtrim(cadena) CadenaRegistro
     ,substr(cadena, 1, 1) TipoRegistro
     ,substr(cadena, 2, 17) NroTransaccion
     ,num_reg ConsRegPlano
     ,substr(cadena, 20, 2) TipoProceso
     ,substr(cadena, 19, 1) TipoNegocio
     ,substr(cadena, 23, 7) TotalNovedades
FROM   c9999908
WHERE  cod_usr = 'BNCSGR03923923008802092022OFEREXP_CSV'
ORDER  BY NUM_REG;



SELECT DISTINCT d.rcd_tipo_reg_s
FROM   c9999933 m, c9999934 d
WHERE  d.rcd_rm_id = m.rm_id
  AND    lpad(m.rm_cod_seccion, 3, '0') ||
         lpad(m.rm_cod_producto, 3, '0') ||
         lpad(m.rm_estrategia, 4, '0') = SUBSTR('03923923008802092022OFEREXP', 3, 10)
  AND    d.rcd_salida = 'S'
  AND    d.rcd_tipo_reg_s != 0
ORDER  BY d.rcd_tipo_reg_s;

select * from c9999908 where  FECHA_EQUIPO > to_date('2022-12-21 10:28:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr LIKE 'CAP_E_03923923008802092022%';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-12-21 10:28:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr = 'BNCSGR03923923008802092022OFEREXP_CSV';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-12-21 10:28:00', 'YYYY-MM-DD HH24:MI:SS') AND COD_USR LIKE 'CAP_S_03923923008802092022%';

select * from c9999908 where FECHA_EQUIPO > to_date('2023-06-09 14:28:00', 'YYYY-MM-DD HH24:MI:SS') AND COD_USR LIKE 'CAP_E_%';

----nuevas tablas parametrizacion inicial de cargue txt
SELECT * FROM C9999933;
----nuevas tablas parametrizacion inicial de cargue txt
SELECT * FROM C9999934 where RCD_RM_ID = 22 order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;


delete c9999908 where FECHA_EQUIPO > to_date('2022-12-21 10:28:00', 'YYYY-MM-DD HH24:MI:SS') AND COD_USR LIKE 'BNCSGR03923923008802092022OFEREXP_CSV';

----TABLAS FINALES CARGUE
select * from C2990030 where cod_ramo = 923 AND FECHA_CREACION >= TO_DATE('2023-06-22','YYYY-MM-DD')
select * from C2990035 where  CONSECUTIVO IN ('16735646','16735647') AND COD_CAMPO = 'API_ESTRATEGIA';

select * from a2000030 where num_secu_pol = 29861370858
---select * from C9999040 WHERE USUARIO LIKE 'BNCSGR03923923006706092022EXP_CSV';
---datos variables polizas
select a.*  from a2000030 a
where num_secu_pol = 29861304774;

select a.*  from A2000020 a
where num_secu_pol = 29861370858;

----coberturas
Select  a.*
From A2000040 a
Where num_secu_pol = 29861370858;

Select  a.*
From x2000040 a
Where num_secu_pol = 39745164521;

---marcas reaseguros
Select  a.COD_SECC_REAS, a.NUM_BLOQUE_REAS, a.MCA_REASEGURO, a.COD_COB, a.*
From A2000040 a
Where num_secu_pol = 29861304774;
----------
Select a.*
From A2000040 a
Where num_secu_pol = 39745161820;

Select  a.*
From x2000040 a
Where num_secu_pol = 39745160331;




DELETE from C2990030 where cod_ramo = 923 AND FECHA_CREACION = TO_DATE('2023-06-23','YYYY-MM-DD');
DELETE from c1990015
where cod_ramo = 923
  and FECHA_CREACION = to_date('2023-06-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS') ;
DELETE from c2990800
where cod_ramo = 923
  and  fecha > to_date('2023-09-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS') and entidad_colocadora = 0;

select * from c9999908 where  FECHA_EQUIPO > to_date('2022-09-27 09:30:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr = 'CAP_E_03923923006719102022EXP';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-09-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr = 'BNCSGR03923923006719102022EXP_CSV';


select *
from c1990015
where cod_ramo = 923
  and FECHA_CREACION = to_date('2022-09-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

select *
from c1990015
where cod_ramo = 923
  and FECHA_EQUIPO > to_date('2022-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

select *
from c1990015
where cod_ramo = 923
  and FECHA_EQUIPO > to_date('2023-08-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

    select *
    from c2990800
    where cod_ramo = 923
    ---  AND FECHA_ENVIO = to_date('2022-09-09', 'YYYY-MM-DD')
      and fecha > to_date('2023-09-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

select * from C2990030 where cod_ramo = 923 AND FECHA_CREACION >= TO_DATE('2023-06-23','YYYY-MM-DD');
select * from C2990030 where cod_ramo = 923 AND CONSECUTIVO IN ('16732417');
select * from C2990035 where  CONSECUTIVO IN ('16735005','16735006');
select * from C2990030 where cod_ramo = 923 AND FECHA_CREACION = to_date('2022-09-06', 'YYYY-MM-DD');

select * from sim_log
where Fecha > to_date('16-NOV-2022 15:15:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1347225274 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Ric_paula_segui%';

SELECT NVL(ENTIDAD_COLOCADORA,0)

FROM C1990015
WHERE SEC_C2990030 = 16732417;
SELECT NVL(SISTEMA_ORIGEN,0),0
FROM C1990003
WHERE ENTIDAD_COLOCADORA = P_ENTCOLOCADORA;

select * from CREGLAS where regla_completa like '%API_AGREGADOR%';

select * from CREGLAS where cdreg = '922PVV007';
select * from CREGLAS where cdreg = '922PVV003';
select * from ops$puma.CREGLAS where cdreg = '922PVV018';
select * from CREGLAS where cdreg = '922PVV023';
select * from ops$puma.CREGLAS where cdreg = '922PVV012';
select * from g2000020 where REG_PRE_FIELD in ('922PVV012','922PVV023');
--update C2990030 set fecha_creacion = to_date('2022-09-01', 'YYYY-MM-DD') where cod_ramo = 923 AND FECHA_CREACION = to_date('2022-09-06', 'YYYY-MM-DD');

select a.* from a2000020 a
where num_secu_pol IN ('29861211210','29861211211','29861211209') AND COD_CAMPO in ('API_OPCION');

select a.num_tarjeta, a.* from a2000030 a
where NUM_SECU_POL in ('29861229550','29861229551','29861229549')
  and cod_ramo = 923;

select * from c9999910
where COD_TAB = 'FACTURACION_ELEC';

select * from c9999909
where COD_TAB = 'FACTURACION_ELEC'
  AND DAT_CAR2 = 'PRODUCTOS_NO_ENVIAR'
  AND COD_CIA = 3
  AND COD_SECC = 923;


select * from sim_campos_tarifa WHERE cod_ramo = 923 and SIM_ESTRATEGIAS = 67;

select * from creglas where cdreg like '922PCV002';


SELECT * FROM A2000030 WHERE NUM_POL1 = 1520000024501 and cod_secc = 923

Select a.prima_anio_cons,    a.sim_tasa_total_orig, a.suma_aseg_cons, a.tarifa, a.*
From X2000040 a
Where num_secu_pol = 29861206497
  and    cod_cob = 28;


Select  a.*
From A2000040 a
Where num_secu_pol = 29861235019

select * from a2000030
where cod_ramo = 602
  and fecha_vig_pol > to_date('12-may-2022','dd-mon-yyyy')

select * from a2000020
where num_secu_pol = 29861235019

select * from a2000020
where num_secu_pol = 29861220127


select * from sim_log
where Fecha > to_date('28-09-2022 10:00:00','dd-mm-yyyy HH24:MI:SS')
  and secuencia > 1651772584 and COLUMNA like 'simapi298611%';

select * from c9999909
where COD_TAB = 'FACTURACION_ELEC'
  AND DAT_CAR2 = 'PRODUCTOS_NO_ENVIAR'
  AND COD_CIA = 3
  AND COD_SECC = 923;


SELECT *
FROM
    sim_homologa_campos_tarifa
WHERE
 cod_campo_origen in ('VALOR_TASA','VLR_ASEGURADO','B99_COEFCOB')
and cod_prod in (922,923);




select a.COD_SITUACION, a.* from A2990700 a WHERE  NUM_POL1  = 1520000038701 AND COD_SECC = 923;

select * from A2990701 WHERE  NUM_POL1  = 1520000038701 AND COD_SECC = 923;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1520000051301 AND COD_SECC = 923;

----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745075338;

----4 facturas
select * from A2990700 WHERE  NUM_POL1  = 1520000114101 AND COD_SECC = 923;

select * from A2990700 WHERE  NUM_POL1  in (1520000114301, 1520000114401) AND COD_SECC = 923;

select * from naturales where numero_documento in (1030321407);


SELECT (substr('03923923006709082022OFEREXP', 1, 2))
     ,(substr('03923923006709082022OFEREXP', 3, 3))
     ,(substr('03923923006709082022OFEREXP', 6, 3))
     ,(substr('03923923006709082022OFEREXP', 9, 4))
     ,to_date(substr('03923923006709082022OFEREXP', 13, 8), 'ddmmyyyy')

FROM   dual;



SELECT INSTR('03923923006702092022OFEREXP','OFER') FROM DUAL;






Select m.cod_cob, m.end_suma_Aseg, k.titulo_cob, 'N', m.num_secu, m.END_PRIMA_COB, k.Mca_Asistencia
From a2000040 m, simapi_cob_opc_bien_est_ent k
Where m.num_secu_pol =  29861211211
  And m.num_end =    0
  And m.tipo_reg = 'T'   --And Ip_McaTuSeguro = 'N'
  And m.cod_ries = 1
  And k.entidad_colocadora = 0
  And k.id_estrategia = 67
  And k.sim_version_est = 13
  And k.cod_cob = m.cod_cob
  And nvl(k.mca_imp_cob,'N') = 'S'
  And k.id_bien = 76
  And k.cod_opcion = 3
Order By  5;


select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien = 76 AND SIM_VERSION_EST = 13 AND COD_COB = 28;


Select  a.*
From A2000040 a
Where num_secu_pol = 29861211209;

select * from SIM_RIESGO_POLIZA;


select * from SIM_RIESGO_POLIZA where NUM_SECU_POL in ('29861214223','29861214224');

SELECT a.*,a.num_tarjeta , a.num_pol1         ,a.num_end         ,a.tdoc_tercero
     ,a.nro_documto      ,a.cod_prod        ,a.fecha_emi
     ,a.fecha_emi_end    ,a.fecha_vig_pol   ,a.fecha_vig_end
     ,a.fecha_venc_pol   ,a.fecha_venc_end  ,a.cod_mon
     ,a.num_secu_pol     ,a.for_cobro       ,a.desc_pol
     ,a.cod_end          ,a.sub_cod_end     ,a.tipo_end
     ,a.fec_anu_pol      ,a.fec_anu_end     ,a.mca_mod_dcobro
     ,a.cod_usr          ,a.fecha_vig_per   ,a.fecha_venc_per
     ,a.periodo_fact     ,a.num_pol_flot    ,a.num_end_flot
     ,a.mca_cotizacion   ,a.num_pol_cotiz   ,a.sec_tercero
     ,a.sim_subproducto  ,a.sim_canal       ,a.sim_sistema_origen
     ,a.mca_provisorio   ,a.sim_estrategias
     ,a.Sim_Entidad_Colocadora
FROM   a2000030 a
WHERE  a.NUM_POL1 in ('1520000063001','1520000063101')
  AND    NVL(a.mca_cotizacion,'N')  =  'N'
  --  AND    NVL(a.mca_provisorio,'N')  =  'N'
  AND    NVL(a.mca_term_ok,'S')     =  'S'
  AND    a.num_end                  =  0
  and a.cod_ramo = 923;


select a.nro_documto, a.tdoc_tercero, a.sim_estrategias, a.*
from a2000030 a
where cod_cia = 3
  and cod_secc = 923
  and sim_estrategias in (88, 62)
  and tdoc_tercero = 'NT';


SELECT OPS$PUMA.C9999934_SEQ.nextval FROM DUAL;

grant ALL on OPS$PUMA.C9999933_SEQ to PUBLIC;

-----CAMPOS VARIABLES DE LOS COBOLES
select * from g2990050
where cod_campo in ('OFERTA','COD_ESTRATEGIA','COD_ENTI_COLOCA');


INSERT INTO G2990050 (COD_CAMPO, TXT_TITULO, LONG_CAMPO, TIPO_CAMPO, COD_REGLA, MCA_BAJA, ACEPTA_NULL, PGM_HELP,
                      LISTA_VALORES, TEXTO_ERROR, VALOR_DEFECTO, TXT_HELP, COD_USER)
VALUES ('COD_ESTRATEGIA', 'CODIGO DE LA ESTRATEGIA', 5, 'N', '999WWV978', null, 'S', null, null, 'ESTRATEGIA NO EXISTE',
        null, 'INGRESE EL CODIGO DE LA ESTRATEGIA', 'INTASI07');



SELECT
    regexp_substr('5c39e2c7687b2322fe53eba6', 'd/', 5)
FROM DUAL;

select t.*, rowid
from sim_borrado_automatico t
where t.cod_cia = 3
  and t.cod_secc = 66
  and t.cod_ramo = 778;

INSERT INTO sim_borrado_automatico(ID_CONTROL, COD_CIA, COD_SECC, COD_RAMO, SUB_RAMO, COLECTIVO, AGENCIA, AGENTE,
                                   VAL_NUMPOL_ANT, CANAL_ORIGEN, ES_COTIZ, DIAS_VIGENCIA, FECHA_VIGENCIA, FECHA_BAJA,
                                   FECHA_ACTUALIZA, FECHA_CREACION, USUARIO_ACTUALIZA, USUARIO_CREACION, ESTADO,
                                   ID_TIPO)
VALUES (95, 3, 66, 778, 999, null, 9999, 99999, null, null, 'S', 30, TO_DATE('2023-04-30', 'YYYY-MM-DD HH24:MI:SS'),
        null, null, TO_DATE('2023-04-30', 'YYYY-MM-DD HH24:MI:SS'), null, 'PDDASI03', 'A', '1');




