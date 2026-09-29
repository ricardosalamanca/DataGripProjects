select * from g2000020
where cod_ramo in (600,601,603,605); --- and COD_CAMPO like '%anima%'


select *
from g2000010
where COD_CIA IN (2,3)
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

select * from g2000020 where cod_ramo in (922, 923) and COD_CAMPO like 'MOD%'

-----simon 3.0 ES producto 923
select *
from g2000020
where cod_ramo in (922, 923)
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

select * from CREGLAS where cdreg = '239PVV104';



select *
from g2000010
where COD_CIA = 3
  and cod_campo in ('COD_ASEG',
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
                    'VALOR_TASA',
                    'ID_UBICACION',
                    'PRODUC_CULTI2');

SELECT * FROM G2000010 WHERE COD_CIA = 3 AND COD_CAMPO IN ('ID_UBICACION', 'PRODUC_CULTI2');

--UPDATE G2000010 SET  TXT_TITULO = 'NRO DE UND ASEGURADAS', TXT_HELP = 'INGRESE EL NUMERO DE UNIDADES ASEGURADAS' WHERE COD_CIA = 3 AND COD_CAMPO = 'NRO_ANIMALES';

---UPDATE G2000010 SET  TXT_TITULO = 'VALOR DE UND ASEGURADA', TXT_HELP = 'INGRESE EL VALOR DE LA UNIDAD ASEGURADA' WHERE COD_CIA = 3 AND COD_CAMPO = 'VLR_ANIMAL';
/*
INSERT INTO G2000010 (COD_CIA, COD_CAMPO, TXT_TITULO, LONG_CAMPO, TIPO_CAMPO, COD_NIVEL_SIST, COD_TIPO_DATO, MCA_SINI,
                      COD_REGLA, COD_USER, MCA_BAJA, NUM_SECU, ACEPTA_NULL, OBLIGATORIO, TABLA_VAL, PGM_HELP,
                      LISTA_VALORES, REG_PRE_FIELD, TEXTO_ERROR, VALOR_DEFECTO, OPERADOR, TXT_HELP, MCA_DENUNCIA,
                      MCA_VALIDA, MCA_PPAL)
VALUES (3, 'NRO_LOTE', 'NUMERO DEL LOTE', 4, 'N', '6', '2', null, null, 'OMAR', null, null, 'N', 'S', null, null, null,
        null, null, null, null, '* DIGITE EL NUMERO DE LOTE DEL SALVAMENTO *', 'N', null, null);

*/





select *
from SIM_g2000020 WHERE COD_RAMO IN (600, 601);

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
                    'NRO_LOTE',
                    'ID_UBICACION',
                    'PRODUC_CULTI2');

select *
from sim_g2000020
where cod_ramo in (923,922)
  and cod_campo in (
                    'ID_UBICACION',
                    'PRODUC_CULTI2');




select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';

select * from A1000100 where COD_POSTAL = 14000;

select *
from SIM_g2000020 WHERE COD_LISTA in ('TS_CLASE_VEHICULO', 'TS_TIPO_CULTIVO', 'TS_ENTIDAD_COLOCADORA_API');

select *
from SIM_g2000020 WHERE cod_campo IN ('TIPO_DOC_ASEG', 'TIPO_DOC_BENEF') AND COD_RAMO = 923;


select * from simapi_estrategias  where id_estrategia = 47;
select * from  SIMAPI_ESTRATEGIA_ENT  where id_estrategia=67 and entidad_colocadora=0   and sim_version_est=2;
select * from simapi_bienes_estrategia_ent   where id_estrategia=67 and entidad_colocadora=0

select * from simapi_datvar_bien where cod_ramo in (923,922) and id_bien = 76;

select * from simapi_datvar_bien where  COD_CAMPO = 'PRODUC_CULTIVO';

select *
from SIM_g2000020 WHERE cod_ramo = 923 and COD_CAMPO = 'PRODUC_CULTIVO';

select * from OPS$PUMA.SIMAPI_BIENES where ID_BIEN in (67,75,76,77,78)

select * from simapi_datvar_bien where  id_bien = 76 order by  id_bien;

select * from simapi_datvar_bien_est where id_bien = 76 ;



select * from simapi_datvar_bien_est where COD_CAMPO = 'PRODUC_CULTIVO';




select * from sim_campos_tarifa WHERE cod_ramo = 923 and SIM_ESTRATEGIAS = 67;


select * from simapi_datvar_bien_est_ent where id_estrategia=67 and cod_ramo in (923,922) and entidad_colocadora=0 and COD_CAMPO = 'CPOS_RIES'      and sim_version_est=3;


select distinct cod_cob
From Simapi_Cob_Opc_Bien_Est_Ent
where entidad_colocadora = 0
  and id_estrategia = 67
union
Select distinct cod_cob_inf from a1002100
where cod_cia = 3
  and cod_ramo = 923
  and cod_cob_inf is not null


select * from SIMAPI_OPC_BIEN_EST where id_bien  in(76) AND ID_PLANTILLA_ESTRATEGIA = 290;
select * from SIMAPI_OPC_BIEN_EST_ENT where id_bien  in(76) and id_estrategia = 67
select * from SIMAPI_COB_OPC_BIEN_EST where id_bien IN (76)  AND ID_PLANTILLA_ESTRATEGIA = 290 and estado = 'A';
select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien  in(76) AND ID_ESTRATEGIA IN(67)  AND SIM_VERSION_EST = 5;

select * from simapi_datvarsini_bien_est_ent where id_estrategia=67 ;

select * from SIMAPI_COBERTURAS_BIEN  where id_bien in (76,58);
select * from SIMAPI_COB_OPC_BIEN_EST where id_bien = 76;
select * from SIMAPI_OPC_BIEN_EST where id_bien = 76;
select * from  SIMAPI_COB_OPC_BIEN_EST_ENT  where id_bien = 76;



select * from SIMAPI_COB_OPC_BIEN_EST_SERV where id_bien = 76;


select * from SIMAPI_DV_COB_OPC_BIEN_EST_ENT where sim_version_est = 2;
select * from SIMAPI_DV_COB_OPC_BIEN_EST where id_bien = 58;

select * from SimApi_Estrategia_Ent where id_estrategia = 67;

select * from SIMAPI_PROCESO_EST_ENT where id_estrategia = 67;

SELECT * FROM SimApi_Dctos_Opc_Bien_Est_Ent where id_estrategia = 67;


select *  from G7000026 where cod_campo LIKE '%RAZA%';

SELECT  h.codigo               ,null,null,null,null,
        h.dat_car descripcion  ,null,null,null,null,
        null                   ,null,null,null,null
FROM  C9999909  h WHERE  COD_TAB  = 'COD_TIPO' AND CODIGO = Decode(0,0,CODIGO,0) ORDER BY 1;

select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';


--update C9999909 set COD_CAMPO = 'PRODUC_CULTIVO' where COD_TAB  = 'TIPO_CULTIVO';

select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';

select * from CREGLAS where cdreg = '239PVV112';

select * from CREGLAS where cdreg = '239CTT109';


select *  from C9999909 WHERE  COD_TAB  like 'TS_CLASE_VEHICULO';





Select *
from C9999909
where CODIGO = 61

Select *
from C9999909
where cod_tab = 'LISTA_CIUDAD'
  and codigo = Ip_estrategia
  and codigo1 = Ip_entidad
  and codigo2 = ip_proceso.p_sistema_origen
having count(1) > 0;

-------------------------------------------------------------------------------------
/*
select * from simapi_datvar_bien where cod_ramo = 923 and id_bien = 76 order by  id_bien;
UPDATE  simapi_datvar_bien SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';

select * from simapi_datvar_bien_est where id_bien = 76  ;
UPDATE  simapi_datvar_bien_est SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';

select * from simapi_datvar_bien_est_ent where id_estrategia=67 and entidad_colocadora=0 AND cod_ramo = 923;
UPDATE  simapi_datvar_bien_est_ent SET COD_CAMPO = 'VLR_ASEGURADO'
where cod_ramo = 923 and id_bien = 76 AND COD_CAMPO = 'VASEG_AGRICOLA';
*/


SELECT UNIQUE ms.id_grupo,
              ms.codigo_campo,
              ms.nombre_etiqueta,
              ms.valorxdefecto,
              ms.tipo_dato,
              ms.recupera_info
FROM
    sim_campos_tarifa ms
WHERE
        ms.enviado_request = 'S'
  AND ms.cod_cia = 3
  AND ms.cod_secc = 923
  AND ms.cod_ramo = 923
  AND ms.cod_cob = 28
  --AND ms.codigo_campo = codcampo
  AND ms.sim_estrategias = 67
  AND ms.sim_entidad_colocadora = 0
  AND ms.sim_bien_asegurado = 76
  AND ms.sim_opcion = 1

select * from sim_campos_tarifa ms where ms.cod_ramo = 923;

select * from sim_campos_tarifa WHERE cod_ramo in (923,922) and SIM_ESTRATEGIAS in (67);

11,12,51,735,539,938



------------------------------------------------------------------------------------------------------------------------------------------




insert into sim_campos_tarifa (SEQ_CAMPO_MOTOR, COD_CIA, COD_SECC, COD_RAMO, ID_GRUPO, CODIGO_CAMPO, NOMBRE_ETIQUETA,
                               ORDEN_CAMPO, LONGITUD, TIPO_DATO, ENVIADO_REQUEST, MODIFICA_PRIMA, DESCRIPCION,
                               RECUPERA_INFO, PARAMETROS, VALORXDEFECTO, ESTADO, USUARIO_CREACION, FECHA_CREACION,
                               USUARIO_MODIFICACION, FECHA_MODIFICACION, SIM_ESTRATEGIAS, SIM_ENTIDAD_COLOCADORA,
                               SIM_BIEN_ASEGURADO, SIM_OPCION, COD_COB)
values (ops$puma.SIM_SEQ_CAMPOMOTOR.nextval, 3, 923, 923, 1, 'VLR_ASEGURADO', 'VLR_ASEGURADO', 70, 17, 'N', 'S', 'S',
        'TUSEGURO',
        'call sim_pck_funcion_gen.FUN_RESCATA_X2000020(''$codigocampo'',''$numsecupol'',''$codries'') INTO :out', null,
        null, 'A', '51938035', to_date('12-03-2022 10:44:52', 'dd-mm-yyyy hh24:mi:ss'), null, null, 88, 0, (select id_bien from SIMAPI_COBERTURAS_BIEN where cod_cob = 539 and rownum = 1), 1, 11);

insert into sim_campos_tarifa (SEQ_CAMPO_MOTOR, COD_CIA, COD_SECC, COD_RAMO, ID_GRUPO, CODIGO_CAMPO, NOMBRE_ETIQUETA,
                               ORDEN_CAMPO, LONGITUD, TIPO_DATO, ENVIADO_REQUEST, MODIFICA_PRIMA, DESCRIPCION,
                               RECUPERA_INFO, PARAMETROS, VALORXDEFECTO, ESTADO, USUARIO_CREACION, FECHA_CREACION,
                               USUARIO_MODIFICACION, FECHA_MODIFICACION, SIM_ESTRATEGIAS, SIM_ENTIDAD_COLOCADORA,
                               SIM_BIEN_ASEGURADO, SIM_OPCION, COD_COB)
values (ops$puma.SIM_SEQ_CAMPOMOTOR.nextval, 3, 923, 923, 1, 'VALOR_TASA', 'VALOR_TASA', 71, 7, 'N', 'S', 'S',
        'TUSEGURO',
        'call sim_pck_funcion_gen.FUN_RESCATA_X2000020(''$codigocampo'',''$numsecupol'',''$codries'') INTO :out', null,
        null, 'A', '51938035', to_date('12-03-2022 10:44:52', 'dd-mm-yyyy hh24:mi:ss'), null, null, 88, 0, (select id_bien from SIMAPI_COBERTURAS_BIEN where cod_cob = 539 and rownum = 1), 1, 11);

SELECT *
FROM
    sim_homologa_campos_tarifa
WHERE

 cod_campo_origen like '%COEF%';
/*
INSERT INTO OPS$PUMA.SIM_HOMOLOGA_CAMPOS_TARIFA (COD_CAMPO_ORIGEN, COD_HOMOLOGADO, SIM_SISTEMA_ORIGEN, SIM_CANAL,
                                                 COD_CIA, COD_SECC, COD_PROD, ESTADO, FECHA_CREACION, USUARIO_CREACION,
                                                 FECHA_MODIFICACION, USUARIO_MODIFICACION, TIPO_OPERACION)
VALUES ('B99_COEFCOB', 'COEFCOB', 1, 99, 3, 923, 923, 'A', TO_DATE('2020-05-29 17:17:14', 'YYYY-MM-DD HH24:MI:SS'),
        'INTASI12', TO_DATE('2022-03-01 10:09:31', 'YYYY-MM-DD HH24:MI:SS'), '40046225', 'T');

*/

SELECT *
FROM
    sim_homologa_campos_tarifa
WHERE

    --  cod_campo_origen like '%COEF%'


        sim_sistema_origen = 1
  AND sim_canal IN(99)
  AND cod_cia = 3
  AND cod_secc IN(923)
  AND cod_prod IN(923)
  --AND tipo_operacion IN('T')
  AND estado = 'A'
ORDER BY cod_homologado;


select max(secuencia) from sim_log
where trunc(Fecha) > to_date('22-mar-2022','dd-mon-yyyy')

select * from sim_log
where trunc(Fecha) > to_date('22-mar-2022','dd-mon-yyyy')
  and secuencia > 1272233048 and COLUMNA like 'Lista-TIPO_CULTIVO%';




select * from sim_log
where trunc(Fecha) > to_date('16-mar-2022','dd-mon-yyyy')
  and secuencia > 1270223142 and COLUMNA like '%simapi Homologa%';

select * from sim_log
where trunc(Fecha) > to_date('16-mar-2022','dd-mon-yyyy')
  and secuencia > 1270223142 and COLUMNA like '%homologa_tarifa%';



select * from sim_log
where trunc(Fecha) > to_date('16-mar-2022','dd-mon-yyyy')
    and secuencia > 1270223142
    and columna like '%Proc_PreCob_67_76->%';
---or variable like '%Tasa de salida%';



/*
 sim_homologa_campos_tarifa
sim_tipotarifa_cob
sim_campos_tarifa
 */

select * from sim_log
where trunc(Fecha) > to_date('29-mar-2022','dd-mon-yyyy')
   and secuencia > 1275632930
  and columna like '%PROC_CALCULA_IMPUESTO%';



SELECT A.COD_PROV , A.COD_POSTAL , PCK999_TERCEROS.fnc_convierte_codazzi(A.COD_POSTAL) CODAZZI, null, null,
       SIM_PCK_LISTAS_EMISION.fun_CiudadNombre(922,a.cod_postal)||'-'|| SIM_PCK_LISTAS_EMISION.fun_DeptoNombre(A.COD_POSTAL)
                                                                                       CIUDAD, null , null , null , null,
       null  , null , null , null , null
FROM A1000100  A WHERE  A.COD_PROV = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_PROV,'XXXXXXXXXX')
                   AND A.COD_POSTAL = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_POSTAL,'XXXXXXXXXX')
                   AND A.COD_POSTAL <> '0'  and a.NOMB_PROV like '%%' ORDER BY A.NOMB_PROV


SELECT A.COD_PROV , A.COD_POSTAL , PCK999_TERCEROS.fnc_convierte_codazzi(A.COD_POSTAL) CODAZZI, null, null,
       SIM_PCK_LISTAS_EMISION.fun_CiudadNombre(0,a.cod_postal)||'-'|| SIM_PCK_LISTAS_EMISION.fun_DeptoNombre(A.COD_POSTAL)
                                                                                       CIUDAD, null , null , null , null,
       null  , null , null , null , null
FROM A1000100  A WHERE  A.COD_PROV = Decode('XXXXXXXXXX','XXXXXXXXXX',A.COD_PROV,'XXXXXXXXXX')
                   AND A.COD_POSTAL = Decode('14208','XXXXXXXXXX',A.COD_POSTAL,'14208')
                   AND A.COD_POSTAL <> '0'  and a.NOMB_PROV like '%%' ORDER BY A.NOMB_PROV


select * from CREGLAS where cdreg = '239PVV112';

select * from CREGLAS where cdreg = '239CTT109';

----regla zona cafe
--select * from CREGLAS where cdreg = '239PVV202';

--select * from CREGLAS where cdreg = '922PCV003'
select * from CREGLAS where cdreg = '239CTT167';

select *
from c9999909 a
where a.cod_tab = 'AGRICOLA_RANGOLISTAS'
  and COD_SECC = 39
  and cod_ramo = 605
  and COD_CAMPO = 'VASEG_AGRICOLA';

UPDATE c9999909 SET RANGO2 = '9999999999999' where cod_tab = 'AGRICOLA_RANGOLISTAS'
                                               and COD_SECC = 39
                                               and cod_ramo = 605
                                               and COD_CAMPO = 'VASEG_AGRICOLA';



select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';

select * from sim_log
where trunc(Fecha) > to_date('28-mar-2022','dd-mon-yyyy')
  and secuencia > 1275102010
  and columna like '%Fun_NbreParametro%';


SELECT  *
FROM X2000040
WHERE --NUM_SECU_POL =  :B99.NUMSECUPOL
 -- AND COD_RIES = :B99.CODRIES
  COD_COB = 28
  AND NVL( COD_SELECC,'N') = 'S'
  AND TAB_CALC_CAMPO IS NOT NULL
  AND TABLA_CORRECT IS NOT NULL;

select * from X2000040;

select * from SIMAPI_COB_OPC_BIEN_EST_ENT where id_bien = 76;

----TABLA DE COMISIONES
select *  from a1001701
where cod_ramo=923
  and cod_secc = 923
  and cod_cob in (28,11,12,13,625,51,735);

select *  from a1001700;


SELECT * FROM SIMAPI_IVA_OFERTA WHERE COD_CIA = 3 AND COD_RAMO = 923

----tabla de coberturas
select * from a1002100 where COD_RAMO = 923;

select * from a1002000 where cod_cob in (11,12,13,28,51,735,938);


---IVA---
select * from a1001000 where COD_SECC = 39;


select max(secuencia) from sim_log
where trunc(Fecha) > to_date('23-05-2022','dd-mm-yyyy');

select * from sim_log
where trunc(Fecha) > to_date('23-05-2022','dd-mm-yyyy')
  and secuencia > 1299258068 and COLUMNA like '%PROCESO PKG239_AGRICOLA%';

---TABLA DE CONTROLES TECNICOS
SELECT * FROM A2000220 WHERE NUM_SECU_POL = 39744983418

select * from sim_log
where trunc(Fecha) > to_date('04-05-2022','dd-mm-yyyy')
  and secuencia > 1292318771 and COLUMNA like 'PROCESO SIMAPI_PCK_CONTROLES_TECNICOS%';

select * from sim_log
where trunc(Fecha) > to_date('11-04-2022','dd-mm-yyyy')
  and secuencia > 1298703580 and COLUMNA like 'PROC_CALCULA_IMPTO%';


select * from sim_log
where trunc(Fecha) > to_date('11-04-2022','dd-mm-yyyy')
  and secuencia > 1283684401 and COLUMNA like 'PROCESO PKG239_AGRICOLA%';
-------FACTURA AGRO-----------------
select * from fact_especial WHERE COD_TAB = 'FACTSECC_DISTRIB';

---polizas
select A.NUM_SECU_POL, A.* from a2000030 A where NUM_POL_COTIZ = 1520000000101 AND COD_RAMO = 923;

select A.NUM_SECU_POL, A.* from a2000030 A where NUM_POL1 in (1520000000101, 1520000000201) AND COD_RAMO = 923;
---datos variables polizas
select cod_campo,valor_campo  from a2000020
where num_secu_pol IN  ('29791948649','29791948667');


select porc_iva,'S'
from   SIMAPI_IVA_OFERTA
where  cod_cia  = 3
  and    cod_ramo = 923
  and    sim_estrategia =  67
  and    estado = 'A';

select *  from C9999909 WHERE  COD_TAB  = 'AGRO_VIG';

---TABLA DE CONTROLES TECNICOS
SELECT * FROM A2000220 WHERE NUM_SECU_POL = 39744977878

---tabla ligado de reglas
select * from g2000200
where cod_secc = 923
  and  cod_ramo = 923
  and cdreg = '239CTT167';

select * from CREGLAS where cdreg = '922PTV005';

INSERT INTO G2000200 (COD_CIA, COD_AGENCIA, COD_SECC, COD_RAMO, COD_SIST, CDREG, DSNIVEL, COD_USR_CT, COD_USR,
                      SIM_USUARIO_CREACION, SIM_FECHA_CREACION, SECUENCIA)
VALUES (3, 9999, 923, 923, '2', '239CTT109', 'C', null, 'INTASI12', null, null, default);


select *  from C9999909 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';

----TABLA DE MENSAJES DE CONTROLES TECNICOS
select * from g2000210 where cod_error in ('289','329');
select * from g2000200;


Select a.*
from SIMAPI_CTROLTEC_BIEN_EST_ENT a
where entidad_colocadora = 0
  and id_estrategia = 67;



select X.*, nvl(X.valor_campo_en,0)  valor, X.cod_ries
from x2000020 X
where
      num_secu_pol = 39744981437 AND
   cod_campo = 'VLR_ANIMAL' AND
   nvl(valor_campo_en,0) <> 0

SELECT * FROM X2000220 WHERE NUM_SECU_POL = 39744981437


----FACTURAS
select * from a2990700 where NUM_SECU_POL = 39744983139;

---VALOR TOTAL DE LA PRIMA
select * from a2000160 where NUM_SECU_POL = 39744983139;

----impuestos
select * from x2000190 where NUM_SECU_POL = 39744983139;
select * from a2000190 where NUM_SECU_POL = 39744983139;


----verificacion de impuestos por numsecupol
select * from x2000040
where num_secu_pol = 39744983258 ;--39744983159 --39744983139
select * from a2990700
where num_secu_pol = 39744983258; --39744983139
select * from a2000160
where num_secu_pol = 39744983258; --39744983139
select * from a2000190
where num_secu_pol = 39744983258; --39744983139

select * from G2000210;

INSERT INTO G2000210 (COD_CIA, COD_ERROR, DESC_ERROR, COD_RECHAZO, COD_USER_SECRE, COD_USR, NIVEL_AUT, ID_PROCESO, TIPO_CONTROL)
VALUES (3, 289, 'VALOR ASEGURADO SUPERA LIMITE POR ACTIVIDAD', 2, 'INTASI12', 'INTASI12', 2, null, 'T');

--602 ramo --39 secc


select X.*
from a2000020 X
where
        num_secu_pol = 29861145591



select a.num_secu_pol, a.* from a2000030 a where num_pol1 = 1520000005901;

SELECT Distinct a.nro_documto, a.tdoc_tercero, a.cod_secc,
                a.sim_estrategias, a.sim_entidad_colocadora
FROM   a2000030 a
WHERE  a.num_secu_pol  =  39744992378
  AND    a.num_end       =
         (SELECT  MAX(b.num_end)
          FROM    a2000030 b
          WHERE   b.num_secu_pol  =  39744992378
            AND     b.num_end      <=  NVL(0,99999));


---UPDATE SIMAPI_DATVAR_BIEN_EST_ENT SET VISIBLE = 'S' WHERE COD_RAMO IN (923,922) AND COD_CAMPO = 'NRO_LOTE';


Select * from sim_categorias_dv_producto
where cod_prod = 605 and id_categoria <100



SELECT *--cod_campo CodCampo, dat_obs DescCampo, dat_car TipoDato
       -- N-numerico,F-echa,C-aracter
    --   dat_num LongDato,
       -- longitud del dato
    --   rango3 Obligatorio -- indica si le dato es obligatorio en el plano 1=obligatorio,0=no
     --   ,cod_tab
    --    ,round(codigo1) as TipoRegistro
       -- ,codigo

        --   ,DAT_CAR2
FROM   c9999909
WHERE  cod_tab = 'INTBANCA_DATOS_RGTRO'
  --AND    codigo1 = TipoReg
  --      and codigo != 999
ORDER  BY codigo;



SELECT --*
codigo1 TipoRegistro, dat_num Niveldato, dat_car DatoVariable,
       -- nombre del campo que va a la tabla c22990035
       codigo orden, rango1 CodTabla,
       -- 1=a2010030,2=a2000030,3=a2010020
       dat_car2 CampoTabla,
       COD_CIA, COD_SECC, COD_RAMO, cod_campo
FROM   c9999909
WHERE  cod_tab = 'INTBANCA_MAPEO_RGTRO'
 -- AND    cod_cia = Gb_CodCia
  --AND    cod_secc = Gb_CodSecc
  AND    cod_ramo = 923
 -- AND    codigo1 = Gb_TipoRegistro
--  AND    cod_campo = p_CodCampo
  AND    dat_car IS NOT NULL
ORDER  BY codigo;


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_EXCLUYEVALI'
 --- AND    nvl(dat_num, 0) = 1



SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_RAMOS_AUTORZA'

select * from A2990050 WHERE NOMBRPT = 'CB299220.pco'

select * from A2990050 WHERE NOMBRPT = 'CB299239.pco'

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_PRCSO'


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_DOMINIOS' AND COD_RAMO = 923;

select nvl(rtrim(0),'N') from dual;


select a.COD_RAMO,
       a.NUM_SECU_POL,
       a.COD_END,
       a.COD_COA,
       a.SUB_COD_END,
       a.FECHA_VIG_END,
       a.TIPO_END,
       a.num_secu_pol,
       a.num_end,
       a.num_end_flot,
       a.mca_provisorio,
       a.desc_pol,
       a.*
from a2000030 a
where a.num_pol1 in (1003000004201)
AND COD_RAMO = 923;


SELECT a.id_bien
     ,a.mca_multiregistro
     ,a.limite_riesgos
     ,a.tomador_es_aseg
FROM   simapi_bienes_estrategia_ent a
WHERE  a.entidad_colocadora  =  0
  AND    a.id_estrategia       =  67
  AND    a.id_bien             =  a.id_bien
  AND    a.sim_version_est     =
         (SELECT MAX(b.sim_version_est)
          FROM   simapi_bienes_estrategia_ent b
          WHERE  b.entidad_colocadora  =  a.entidad_colocadora
            AND    b.id_estrategia       =  a.id_estrategia
            AND    b.id_bien             =  a.id_bien
            AND  ((3         IS NOT NULL
              AND    b.sim_version_est     =  3)
              OR    (3         IS NULL)))

  AND    estado              =  'A';



----TABLAS CARGE MASIVO

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_RGTRO' AND COD_RAMO = 500;

SELECT * FROM C9999930;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 16;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_RGTRO' AND COD_RAMO = 923;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_PRCSO' AND COD_RAMO = 923; /***************

/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('INTBANCA_PRMTR_PRCSO', 0, 0.000, 0.000, 'PARAMETROS POR CADA TIPO DE PROCESO', '0', 0.00, null, 923, 923, 3,
        SYSDATE, 0, 67, 2, 'INTASI12', null, null, null, null, null, null,
        null, null, null);
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
WHERE  cod_tab = 'RETROACTPROD' AND COD_RAMO = 923;
/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('RETROACTPROD', 0, null, null, 'PERIODO DE RETROACTIVIDAD EN DIAS', 'R', 1200.00, null, 923, 923, 3,
        SYSDATE, null, null, null, 'INTASI12', null, null, null, null,
        null, 67, 0, 76, null);
*/
select * from c9999908;

SELECT cod_campo CodCampo, dat_obs DescCampo, dat_car TipoDato,
       -- N-numerico,F-echa,C-aracter
       dat_num LongDato,
       -- longitud del dato
       rango3 Obligatorio,
       codigo1,
       n.*
FROM   c9999909 n
WHERE  cod_tab = 'INTBANCA_DATOS_RGTRO' and codigo1 = 3;
/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO,
                      COD_SECC, COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA,
                      DAT_OBS2, RANGO4, COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('INTBANCA_DATOS_RGTRO', 9, 0.000, null, 'CODIGO DE LA OFERTA', 'N', 5, 'SIM_ESTRATEGIA', 999, 999, 9,
        SYSDATE, null, null, 1, 'INTASI12',
        SYSDATE, null, null, null, null, 'COLNUM08', null, null,
        null);
*/

select * from C2990035;

SELECT --*
       DAT_CAR2 estrategia, DAT_CAR3 ENTIDAD, DAT_CAR4 BIEN,
       codigo1 TipoRegistro, dat_num Niveldato, dat_car DatoVariable,
       -- nombre del campo que va a la tabla c22990035
       codigo orden, rango1 CodTabla,
       -- 1=a2010030,2=a2000030,3=a2010020
       COD_CAMPO CampoTabla,
       N.*
FROM   c9999909 N
WHERE  cod_tab = 'INTBANCA_MAPEO_RGTRO'
  -- AND    cod_cia = Gb_CodCia
  --AND    cod_secc = Gb_CodSecc
  -- AND    cod_ramo = Gb_CodRamo
  -- AND    codigo1 = Gb_TipoRegistro
--  AND    cod_campo = p_CodCampo
  --AND    dat_car IS NOT NULL
  AND COD_RAMO = 923 and DAT_CAR2 = '67'
ORDER  BY codigo;




----table ejecucion de coboles parametros guardados de cada ejecucion
SELECT * FROM A2990050 WHERE NOMBRPT IN ('CB299220.pco', 'CB299212.pco', 'CB299221.pco');

select *

from C2990030
where fecha_creacion =
    to_date('17082022','ddmmyyyy')
  and mca_term_ok='N'
  and cod_cia    = 3
  and cod_secc   = 923
  and cod_ramo   = 923
order by consecutivo



SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'CBATCH_CAMPO_RGTRO' and COD_RAMO = 923;



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
WHERE  cod_tab = 'CBATCH_CAMPO_RGTRO' and COD_RAMO = 923;

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
WHERE  cod_tab = 'CBATCH_TIPREG_RAMO'
  and COD_RAMO = 923
  and dat_num = 67;


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

---update c9999909 set DAT_CAR2 = 'COLNUM19' WHERE  cod_tab = 'CBATCH_CAMPO_RGTRO' and COD_RAMO = 923 and cod_campo = 'API_OPCION';


/*
INSERT INTO C9999909 (COD_TAB, CODIGO, CODIGO1, CODIGO2, DAT_OBS, DAT_CAR, DAT_NUM, COD_CAMPO, COD_RAMO, COD_SECC,
                      COD_CIA, FECHA_ACT, RANGO1, RANGO2, RANGO3, USUARIO, FECHA_BAJA, FECHA_ALTA, DAT_OBS2, RANGO4,
                      COD_AGENCIA, DAT_CAR2, DAT_CAR3, DAT_CAR4, PROCESO)
VALUES ('CBATCH_CAMPO_RGTRO', 1, 4.000, 50, 'OPCION QUE TIENE ATADA LAS COBERTURAS', 'N', 3, 'API_OPCION', 923, 923, 3,
        TO_DATE('2022-06-19 08:17:47', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 76, 'INTASI12', null, null, null, 2, 67,
        'COLNUM19', 'API_OPCION', 'N', null);
*/



/*
delete C9999909 WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
                  and COD_RAMO = 923 ---and cod_campo like '%cob%'
                  and codigo1 = 3
                  and codigo = 0;
*/

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  --and COD_RAMO = 923 ---and cod_campo like '%cob%'
  and codigo1 = 4
  and codigo = 0
ORDER BY CODIGO1, codigo2;

SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923 ---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;

SELECT * FROM C9999930;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 17 order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;

SELECT * FROM C9999931 WHERE RCD_RM_ID = 18 order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;

---DELETE C9999931 WHERE RCD_RM_ID = 17;


SELECT * FROM C9999934;

--SELECT C9999931_SEQ.nextval FROM DUAL;


--SELECT * FROM C9999931_COPY_RCD17;




select * from A2990050 WHERE NOMBRPT = 'CB299212.pco'


--SELECT C9999930_SEQ.nextval FROM DUAL;



select * from c9999908 where FECHA_EQUIPO > to_date('04/08/2022')and (COD_USR = 'CAP_E_03923923006704082022EXP' OR COD_USR = 'CAP_S_03923923006704082022EXP');

select * from c9999908 where cod_usr = 'PLANO_CARGUEBATCH_BANCASEGUROS';

 CREATE TABLE C9999933
AS (SELECT * FROM C9999930);


select *
from c1990015
where cod_ramo = 923
  and FECHA_EQUIPO > to_date('2022-08-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

select *
from c2990800
where cod_ramo = 923
  and fecha > to_date('2022-08-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

select max(secuencia) from sim_log
where trunc(Fecha) > to_date('13-SEP-2022','dd-mon-yyyy');

select round((op_Cobertura.PRIMA_COB * l_Descuento_prima)/100) from dual;

select * from sim_log
where Fecha > to_date('07-OCT-2022 15:30:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Ric_paula_segui2%';

select * from sim_log
where Fecha > to_date('07-OCT-2022 15:30:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Genera factura%';

select * from sim_log
where Fecha > to_date('04-OCT-2022 12:00:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'simapi Consultarecupera%';

select * from sim_log
where Fecha > to_date('26-OCT-2022 10:30:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Tar-Sim_pck_tarifa%';

select * from sim_log
where Fecha > to_date('23-NOV-2022 11:00:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1368656827 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like ':CARGUERIC-%';


select substr(a.cadena,1,1), a.*
from c9999908 a
where a.cod_usr = 'BNCSGR03923923006702092022OFEREXP_CSV'
  and substr(a.cadena,1,1) = 5;

select * from sim_log
where trunc(Fecha) > to_date('09-AGO-2022 10:26:00','dd-mon-yyyy HH24:MI:SS')
  --and secuencia > 1324548432 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Seguimiento IVANFA%';

select n.SISTEMA_ORIGEN, n.SIM_SISTEMA_ORIGEN, n.* from X2000030 n where NUM_SECU_POL = 39745070058;

SELECT DISTINCT A.Cod_campo, A.Cod_nivel
FROM G2000020 A, C2990035 C
WHERE A.Cod_cia = 3
  AND A.Cod_ramo = 923
  AND C.Cod_campo = A.Cod_campo
  AND C.Consecutivo = 16514993
  AND C.Cod_nivel = 3
ORDER BY A.Cod_campo;

SELECT DISTINCT X.Cod_ries

FROM C2990035 X
WHERE X.Consecutivo = 16514993
  AND X.Cod_campo = 'API_OPCION'
  AND X.Cod_ries = 1;

SELECT * FROM C2990035;

select * from X2000020 where NUM_SECU_POL = 39745066199;


SELECT COD_CAMPO, LONG_CAMPO,
       TIPO_CAMPO, COD_REG_VAL1,
       COD_REG_VAL2, ACEPTA_NULL,
       OBLIGATORIO, '',
       REG_PRE_FIELD, VALOR_CAMPO_EN,
       VALOR_CAMPO_EN, INCLUYE,
       INCLUYE

FROM X2000020
WHERE NUM_SECU_POl = 39745057569
  AND COD_RIES     IS NULL
  AND NVL(MCA_VISIBLE,'S') = 'S'
  AND MCA_TIPO_UTIL = '1'
  AND (REG_PRE_FIELD IS NOT NULL OR
    COD_REG_VAL1 IS NOT NULL)
ORDER BY NUM_SECU

select *
from X2000020
where NUM_SECU_POL = 39745053698
      and COD_RIES = 1


SELECT *
FROM X2000020
WHERE NUM_SECU_POL = 39745053698
  AND COD_RIES = 1
  --AND VALOR_CAMPO_EN IS NOT NULL
  AND COD_CAMPO NOT IN
      (SELECT COD_CAMPO
       FROM SIMAPI_DATVAR_BIEN_EST_ENT
       WHERE ID_BIEN = (SELECT TO_NUMBER(VALOR_CAMPO_EN)
                        FROM X2000020
                        WHERE NUM_SECU_POL = 39745053698
                          AND COD_RIES = 1
                          AND COD_CAMPO = 'BIEN_ASEGURADO')
         AND ID_ESTRATEGIA = (SELECT TO_NUMBER(SIM_ESTRATEGIAS)
                              FROM X2000030
                              WHERE NUM_SECU_POL = 39745053698
                                AND COD_RAMO = 923
                                AND COD_CIA = 3)
         AND COD_RAMO = 923
         AND COD_CIA = 3)
  AND VALOR_CAMPO_EN IS NULL;




select * from SIMAPI_DATVAR_BIEN_EST_ENT where ID_ESTRATEGIA = 67
                                                   and id_bien = 76
                                                   and COD_RAMO = 923;

select *
from c9999909
where cod_tab   = 'CBATCH_DOMINIOS'
  and cod_secc  = 923
  and cod_ramo  = 923
  and cod_campo = 'TIPO_PROCESO'
  and codigo    = 1
  and dat_num   = p_ValorParametro;


SELECT a.*
FROM c9999909 a
WHERE cod_tab ='CBATCH_RAMOS_AUTORZA'
  AND cod_cia = 3
  and cod_ramo = 923
  AND COD_SECC = 923
  and rango1 = 1
  and rango2 = 2
  AND dat_num IS NULL;





select substr('BNCSGR03923923006709082022EXP_CSV', 7, 23) from dual;


select a.codigo1,  --Usa cobros flotantes 0=NO 1=SI
       a.codigo2,  --ubicacion del cobro 0=NO APLICA 1=ANTES 2=DESPUES
       a.dat_car,  -- Valida Si Existe La Poliza 0=No, 1=Si
       a.dat_num,  -- Valida Poliza Vigente 0=Noaplica, 1=Vigente, 2=Anulada
       a.rango1,   -- Valida Fechas Vcia Poliza 0=No, 1=Si
       a.rango2,   -- valida que la poliza sea de 12 meses 0=no,1=si
       a.rango4    -- valida anualidad de la poliza 0=no,1=si

from c9999909 a
where a.cod_tab  = 'CBATCH_VALID_PROCESO'
  and a.cod_secc = 923
  and a.cod_ramo = 923
  and a.codigo   = 0
  and nvl(a.rango3,999) in (999,P_REG.SubProducto)


select *

from c9999909 a
where a.cod_tab  = 'CBATCH_VALID_PROCESO'




SELECT a.cod_campo CodCampo
     ,a.dat_obs DescCampo
     ,a.dat_car TipoDato
     , -- N-numerico,F-echa,C-aracter
    a.dat_num LongDato
     , -- longitud del dato
    a.rango1 EnPlano
     , -- viene en el plano 1=SI,0=NO
    a.rango2 Obligatorio
     , -- Obligatorio 1=SI,0=NO
    a.dat_obs2 ValorDefecto
     ,a.dat_car2 MapeoC9040
     ,nvl(a.dat_car4, 'N') ValidaPPal,
    a.codigo1, a.codigo, a.codigo2
FROM   c9999909 a, c9999909 b
WHERE  a.cod_tab = 'CBATCH_CAMPO_RGTRO'
  AND    a.cod_cia = 3
  AND    a.cod_secc = 923
  AND    a.cod_ramo = 923
  AND    a.codigo1 = 7
  AND    a.codigo = 0
  AND    b.cod_tab = 'CBATCH_TIPREG_RAMO'
  AND    b.cod_secc = 923
  AND    b.cod_ramo = 923
  AND    b.codigo = a.codigo -- tipo de proceso
  AND    b.codigo1 = a.codigo1
 AND    b.codigo2 = 1 -- solo los registros que vienen en el,plano
ORDER  BY a.codigo2;

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

SELECT count (1)
FROM   c9999908
WHERE  cod_usr = 'BNCSGR03923923006702092022OFEREXP_CSV'
and substr(cadena, 1, 1)  = 7
and INSTR(cadena,'2343423', 1, 1) <> 0
ORDER  BY NUM_REG;

SELECT INSTR('MATARATAS LARATA','werer', 3, 1) "Prueba" FROM DUAL;

SELECT a.cod_campo CodCampo
     ,a.dat_obs DescCampo
     ,a.dat_car TipoDato
     , -- N-numerico,F-echa,C-aracter
    a.dat_num LongDato
     , -- longitud del dato
    a.rango1 EnPlano
     , -- viene en el plano 1=SI,0=NO
    a.rango2 Obligatorio
     , -- Obligatorio 1=SI,0=NO
    a.dat_obs2 ValorDefecto
     ,a.DAT_CAR3 MapeoC2990035
     ,nvl(a.dat_car4, 'N') ValidaPPal
FROM   c9999909 a, c9999909 b
WHERE  a.cod_tab = 'CBATCH_CAMPO_RGTRO'
  AND    a.cod_cia = 3
  AND    a.cod_secc = 923
  AND    a.cod_ramo = 923
  AND    a.codigo1 = 3
  AND    a.codigo = 0
  AND    b.cod_tab = 'CBATCH_TIPREG_RAMO'
  AND    b.cod_secc = 923
  AND    b.cod_ramo = 923
  AND    b.codigo = a.codigo
  AND    b.codigo1 = a.codigo1
  AND    b.codigo2 = 1 -- solo los registros que vienen en el,plano
ORDER  BY a.codigo2;



select *
from g2000020 where COD_RAMO = 923;


SELECT substr('BNCSGR03923923006709082022EXP_CSV', 7, 23) FROM DUAL ;


SELECT (substr('03923923006709082022EXP', 1, 2))
     ,(substr('03923923006709082022EXP', 3, 3))
     ,(substr('03923923006709082022EXP', 6, 3))
     ,(substr('03923923006709082022EXP', 9, 4))
     ,to_date(substr('03923923006709082022EXP', 13, 8), 'ddmmyyyy')
FROM   dual;

SELECT (substr('03923923006225042023OFEREXP', 1, 2))
     ,(substr('03923923006225042023OFEREXP', 3, 3))
     ,(substr('03923923006225042023OFEREXP', 6, 3))
     ,(substr('03923923006225042023OFEREXP', 9, 4))
     ,to_date(substr('03923923006225042023OFEREXP', 13, 8), 'ddmmyyyy')
FROM   dual;

SELECT LENGTH('03923923006709082022EXP') FROM DUAL;

select * from CREGLAS where cdreg = '922PVV012';
select * from g2000020 where REG_PRE_FIELD = '922PVV012';

select * from C9999909
where COD_TAB = 'CBATCH_TIPREG_RAMO'
  and cod_ramo = 923
  and codigo = 0;


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab ='CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923
      and codigo = 0
  -- and codigo1 = 4---and cod_campo like '%cob%'
ORDER BY CODIGO1, codigo2;

select * from c9999908 where  FECHA_EQUIPO > to_date('2022-10-26 11:50:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr LIKE 'CAP_E_03923923006702092022%';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-10-26 11:50:00', 'YYYY-MM-DD HH24:MI:SS') and cod_usr = 'BNCSGR03923923006702092022OFEREXP_CSV';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-10-26 11:50:00', 'YYYY-MM-DD HH24:MI:SS') AND COD_USR LIKE 'CAP_S_%';

select * from c9999908 where FECHA_EQUIPO > to_date('2022-10-26 11:50:00', 'YYYY-MM-DD HH24:MI:SS') AND COD_USR LIKE 'CAP_E_%';
SELECT * FROM OPS$PUMA.C9999931 WHERE RCD_RM_ID = 14 order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;
SELECT * FROM OPS$PUMA.C9999930;
----nuevas tablas parametrizacion inicial de cargue txt
SELECT * FROM C9999933;
----nuevas tablas parametrizacion inicial de cargue txt
SELECT * FROM C9999934 where RCD_RM_ID = 22 order by RCD_TIPO_REG_E, RCD_TIPO_REG_S, RCD_ORDEN_E;


/*
INSERT INTO OPS$PUMA.C9999934 (RCD_RM_ID, RCD_ID, RCD_NOM_CAMPO, RCD_DESC_CAMPO, RCD_ENTRADA, RCD_TIPO_REG_E,
                               RCD_ORDEN_E, RCD_LONGITUD_E, RCD_SALIDA, RCD_TIPO_REG_S, RCD_MULTI_REG, RCD_ORDEN_S,
                               RCD_TIPO_DATO_S, RCD_LONGITUD_S, RCD_DEFAULT_S, RCD_LABEL_S, RCD_FEC_CREACION)
VALUES (21, 94, 'NOMBRE_PROD', 'NOMBRE_PROD', 'N', null, null, null, 'S', 4, 'S', 67, null, 20, null, 'NOMBRE_PROD',
        TO_DATE('2022-06-15', 'YYYY-MM-DD HH24:MI:SS'));


*/
select * from sim_log
where Fecha > to_date('19-OCT-2022 17:00:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Ric_paula_segui2 recupera%';

select * from sim_log
where Fecha > to_date('19-OCT-2022 17:00:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1355087661 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like 'Proc_PreCob_67_76%';

select * from sim_log
where Fecha > to_date('04-NOV-2022 11:34:00','dd-mon-yyyy HH24:MI:SS')
  and secuencia > 1368818288 --AND VARIABLE LIKE 'PCK299%'
  and COLUMNA like ':CARGUERIC-%';


Select fecha_vig_end, sim_entidad_colocadora,
   sim_estrategias
From x2000030
Where num_secu_pol = 39745095158;

Select a.fecha_vig_end, a.sim_entidad_colocadora,
       a.sim_estrategias, a.*
From A2000030 a
Where num_secu_pol = 39745096379;

select * from naturales where numero_documento in (1030123414, 1030321401);

select * from naturales where numero_documento in (1030598333, 1030497000);

select distinct TIPDOC_CODIGO FROM juridicos;

----TABLAS FINALES CARGUE
select * from C2990030 where cod_ramo = 923 AND FECHA_CREACION >= TO_DATE('2022-09-02','YYYY-MM-DD')   AND CONSECUTIVO IN ('16515904','16515903');
select * from C2990035 where  CONSECUTIVO IN ('16515924','16515925','16515926') ;
select * from C9999040 WHERE USUARIO LIKE 'BNCSGR03923923006702092022EXP_CSV';

--DELETE C2990035 WHERE  CONSECUTIVO IN ('16514933','16514914') AND COD_CAMPO = 'API_ESTRATEGIA';

--INSERT INTO C2990035 (CONSECUTIVO, COD_RIES, COD_COB, COD_CAMPO, VALOR_CAMPO, NRO_REGISTRO, ORDEN, COD_NIVEL) VALUES (16514914, null, null, 'API_ESTRATEGIA', '67', 1, 3, 3);
--INSERT INTO C2990035 (CONSECUTIVO, COD_RIES, COD_COB, COD_CAMPO, VALOR_CAMPO, NRO_REGISTRO, ORDEN, COD_NIVEL) VALUES (16514934, null, null, 'API_ESTRATEGIA', '67', 1, 3, 3);

DELETE from C2990030 where cod_ramo = 923 AND FECHA_CREACION >= TO_DATE('2022-09-02','YYYY-MM-DD');
DELETE from c1990015
where cod_ramo = 923
  and FECHA_EQUIPO > to_date('2022-09-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS');


SELECT * FROM A2000030 WHERE NUM_SECU_POL IN ('39745098778','39745098779','39745098780');

select * from C2990030 where cod_ramo = 923 AND FECHA_CREACION = to_date('2022-09-02', 'YYYY-MM-DD');

select *
from c1990015
where cod_ramo = 923
  and FECHA_CREACION = to_date('2022-09-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

select *
from c1990015
where cod_ramo = 923
  and FECHA_EQUIPO > to_date('2023-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

SELECT * FROM c1990003 where ENTIDAD_COLOCADORA = 0;

select *
from c2990800
where cod_ramo = 923
  and fecha > to_date('2022-10-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS');

DELETE FROM c2990800 WHERE COD_RAMO = 923 AND COD_SECC = 923 AND FECHA_ENVIO >= to_date('2022-09-02', 'YYYY-MM-DD');

select * from CREGLAS where cdreg = '922PVV013';

Select a.prima_anio_cons,    a.sim_tasa_total_orig, a.suma_aseg_cons, a.tarifa, a.*
From X2000040 a
Where num_secu_pol = 39745085618
  and    cod_cob = 28;

Select  a.*
From A2000040 a
Where num_secu_pol = 39745085618;


Select substr(f.desc_opcion,1,50)
from  simapi_opc_bien_est_ent f
where id_estrategia = 67
  and entidad_colocadora = 0
 -- and sim_version_est = ip_Oferta.VERSION
  and cod_opcion = 2
  and id_bien = 76;

select * from SIMAPI_OPC_BIEN_EST_ENT where id_bien  in(76)

SELECT *
FROM   c2990800 a
WHERE  a.fecha_envio = to_date('2022-08-17', 'YYYY-MM-DD')
  AND    a.cod_ramo = 923
  AND    a.secuencia_envio = 1
  AND    NVL(a.tipo_negocio, 0) != 7;




SELECT *
FROM   c9999933 m, c9999934 d
WHERE  d.rcd_rm_id = m.rm_id
  AND    lpad(m.rm_cod_seccion, 3, '0') ||
         lpad(m.rm_cod_producto, 3, '0') ||
         lpad(m.rm_estrategia, 4, '0')   =
         SUBSTR('03923923006717082022EXP', 3, 10)  --pecuario
  AND    d.rcd_salida = 'S'
  --AND    d.rcd_nom_campo = 'NUMERO RIESGO'
  AND    rownum = 1;




SELECT * FROM c9999931 WHERE rcd_nom_campo = 'NUMERO RIESGO'



select *
from c9999909
where cod_tab   = 'CBATCH_DATVAR_RAMO'
  and cod_secc  = 923
  and cod_ramo  = 923;





select * from c9999909
WHERE  cod_tab =
       'CBATCH_RAMOS_AUTORZA'
  and cod_ramo = 923
  and rango4  = 3
  and rango1 = 3;



select * from C9999909
where cod_tab = 'CBATCH_DOMINIOS'
  and cod_secc = 923
  and cod_ramo = 923
  and dat_num = 0;


select * from C9999909
where COD_TAB = 'CBATCH_TIPREG_RAMO'
  and cod_ramo = 923
  and codigo = 0;


select * from C9999909
WHERE  cod_tab =
       'CBATCH_CAMPO_RGTRO'
  and COD_RAMO = 923
  and codigo = 0;





SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'INTBANCA_PRMTR_PRCSO' AND COD_RAMO = 923;


SELECT a.*
FROM   c9999909 a
WHERE  cod_tab = 'RETROACTPROD' AND COD_RAMO = 923;


SELECT --*
       DAT_CAR2 estrategia, DAT_CAR3 ENTIDAD, DAT_CAR4 BIEN,
       codigo1 TipoRegistro, dat_num Niveldato, dat_car DatoVariable,
       -- nombre del campo que va a la tabla c22990035
       codigo orden, rango1 CodTabla,
       -- 1=a2010030,2=a2000030,3=a2010020
       COD_CAMPO CampoTabla,
       N.*
FROM   c9999909 N
WHERE  cod_tab = 'INTBANCA_MAPEO_RGTRO'
  -- AND    cod_cia = Gb_CodCia
  --AND    cod_secc = Gb_CodSecc
  -- AND    cod_ramo = Gb_CodRamo
  -- AND    codigo1 = Gb_TipoRegistro
--  AND    cod_campo = p_CodCampo
  --AND    dat_car IS NOT NULL
  AND COD_RAMO = 923 and DAT_CAR2 = '67'
ORDER  BY codigo;

select * from c9999910
where COD_TAB = 'FACTURACION_ELEC'

select * from c9999909
    where COD_TAB = 'FACTURACION_ELEC'
    AND DAT_CAR2 = 'PRODUCTOS_NO_ENVIAR'
    AND COD_CIA = 3
    AND COD_SECC = 923;

Select a.prima_anio_cons,    a.sim_tasa_total_orig, a.suma_aseg_cons, a.tarifa, a.*
From X2000040 a
Where num_secu_pol = 39745071318
  and    cod_cob = 28

select n.SISTEMA_ORIGEN, n.SIM_SISTEMA_ORIGEN, n.* from X2000030 n where NUM_SECU_POL = 39745071318;




SELECT *
FROM
    sim_homologa_campos_tarifa
WHERE
     --   sim_sistema_origen = null
   sim_canal IN(NVL(null,99),99)
  AND cod_cia = 3
  AND cod_secc IN(NVL(923,999),999)
  AND cod_prod IN(NVL(923,999),999)
  AND tipo_operacion IN( 'P','T')
  AND estado = 'A'
ORDER BY cod_homologado;

SELECT
    a.SISTEMA_ORIGEN, a.SIM_SISTEMA_ORIGEN
FROM
    x2000030 a
WHERE
        num_secu_pol = 39745066660
  AND num_end = 0;


SELECT  premio
FROM    a2000160
WHERE   num_secu_pol  = 39745072778
  AND     num_end       = 0;


select * from  a2000030
--SET    importe_cotiz = VImprteCtzdo
WHERE  num_secu_pol  = 39745072778
  AND    num_end       = 0
  AND    NVL(mca_cotizacion,'N') IN ('S','V');

select * from A2000163 WHERE  num_secu_pol  = 39745072778;

---CALCULO DE COMISIONES POLIZAS
select * from A2990701 WHERE  NUM_POL1  = 1520000010001 AND COD_SECC = 923;

----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 39745075338;

----4 facturas
select * from A2990700 WHERE  NUM_POL1 in (1520000000101, 1520000000201) AND COD_SECC = 923;

---delete A2990700 where NUM_POL1 = 1520000000201 AND COD_SECC = 923;
select A.NUM_SECU_POL, A.* from a2000030 A where NUM_POL1 in (1520000000101, 1520000000201) AND COD_RAMO = 923;

-----marca de poliza como si hubiera pagado cod_situacion = CT
select a.COD_SITUACION, a.* from A2990700 a WHERE  NUM_POL1  = 1520000038701 AND COD_SECC = 923;


------TABLAS DE LOS JOBS Y COBOLES
'CB299212.PCO','CB299239.PCO'
SELECT * FROM A2990051 WHERE COD_LISTADO LIKE 'CB299239%';
SELECT * FROM A2990052 WHERE COD_LISTADO LIKE 'CB299239%';

SELECT * FROM G9000900 WHERE COD_PROG LIKE 'CB299239%';
SELECT * FROM G9001000 WHERE COD_PROG LIKE 'CB299239%';


select * from g2990050
where cod_campo in ('OFERTA','COD_ESTRATEGIA')


SELECT (substr('03923923006709082022EXP', 1, 2))
     ,(substr('03923923006709082022EXP', 3, 3))
     ,(substr('03923923006709082022EXP', 6, 3))
     ,(substr('03923923006709082022EXP', 9, 4))
     ,to_date(substr('03923923006709082022EXP', 13, 8), 'ddmmyyyy')
FROM   dual;




select * from simapi_datvar_bien_est_ent where id_estrategia=67 and cod_ramo in (923,922)



SELECT a.num_tarjeta , a.num_pol1         ,a.num_end         ,a.tdoc_tercero
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
WHERE  a.NUM_POL1 in ('1520000013101','1520000013201')
  AND    NVL(a.mca_cotizacion,'N')  =  'N'
  --  AND    NVL(a.mca_provisorio,'N')  =  'N'
  AND    NVL(a.mca_term_ok,'S')     =  'S'
  AND    a.num_end                  =  0
  and a.cod_ramo = 923;

select a.num_tarjeta, a.* from x2000030 a
where NUM_SECU_POL in ('39745088316','39745088317')
  and cod_ramo = 923

select  a.num_tarjeta, a.*  from a2000030 a
where num_pol1 in ('1520000010701','1520000010801')
  and cod_ramo = 923

select * from a2000040
where num_secu_pol in
      ('39745088323','39745088324')
order by cod_cob

select * from a2000160
where num_secu_pol in
      (39745086529,29861206616)
select * from a2000163
where num_secu_pol in
      (39745086529,29861206616)
select * from a2990700
where num_pol1 in (1520000051301,1520000010201)
  and cod_ramo = 923
order by num_factura



SELECT *
FROM simapi_poliza_agrupada a
WHERE (a.num_secu_pol_comer = 39745086529 OR
       a.num_secu_pol_pers = 39745086529 OR
       a.num_secu_pol_agr = 39745086529)


Select num_secu_pol , sim_estrategias, sim_entidad_colocadora, num_tarjeta
From a2000030
Where num_pol1 = 1520000051301 And cod_Secc = 923
  And num_end = 0 And nvl(mca_cotizacion,'N') = 'N';

SELECT C9999934_SEQ.nextval FROM DUAL;



SELECT *
FROM X2000020
WHERE NUM_SECU_POL = 39745095298
  AND COD_RIES = COD_RIES
  AND COD_CAMPO = 'BIEN_ASEGURADO';



select LTRIM(a.VALOR_CAMPO, '0'), a.* from a2000020 a
where num_secu_pol = 39745088340 AND COD_CAMPO in ('COORD_LATITU_A','COORD_LONGIT_A');

SELECT MAX(SIM_VERSION_EST)
FROM SIMAPI_ESTRATEGIA_ENT
WHERE  ENTIDAD_COLOCADORA = 0
  AND    ID_ESTRATEGIA      = 67
  AND    NVL(ESTADO,'P')    = 'A'
  AND    NVL(MCA_AUTORIZACION,'P') = 'A';


select * from SIM_RIESGO_POLIZA where NUM_SECU_POL in ('39745096419','39745096438');


SELECT *
FROM
    sim_homologa_campos_tarifa
WHERE
        cod_campo_origen in ('VALOR_TASA','VLR_ASEGURADO','B99_COEFCOB');



select *  from C9999909 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';

----parametrizacion pendientes por oferta----------------------------------------------
select *
from   SIMAPI_IVA_OFERTA
where  cod_cia  = 3
  and    cod_ramo = 923
  and    sim_estrategia =  67
  and    estado = 'A';
select * from fact_especial WHERE COD_TAB = 'FACTSECC_DISTRIB';
select *  from C9999909 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';
select *  from C9999909 WHERE  COD_TAB  = 'AGRO_VIG';
select * from sim_campos_tarifa WHERE cod_ramo in (923,922) and SIM_ESTRATEGIAS in (88,67);
---------------------------------------------------------------------------
select *  from C9999910 WHERE  COD_TAB  = 'AGRO_CONTROL_TOPE';
select *  from C9999910 WHERE  COD_TAB  = 'AGRO_VIG';


select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO';
select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO2';
select *  from C9999909 WHERE  COD_TAB  = 'TIPO_CULTIVO3';

select *  from C9999909 WHERE  COD_TAB  = 'ACT_AGRO';



------REENGANCHE---------------------------------------------------------------------------------------------
select * from sim_productos
where cod_producto = 923;  --1869
select * from sim_procesos_producto
where id_producto = 1869;

select * from simapi_proceso_est_ent
where id_estrategia = 67;

select * from simapi_proceso_estrategia
where id_plantilla_estrategia = 290;

select * from simapi_proceso_estrategia_JN
where id_plantilla_estrategia = 290;

select * from simapi_estrategias;

select * from sim_procesos where DESCRIPCION like '%REENGANCHE%';

/*
insert into simapi_proceso_estrategia (ID_PROCESO, ID_PLANTILLA_ESTRATEGIA, ESTADO, FECHA_CREACION, USUARIO_CREACION,
                                       FECHA_MODIFICACION, USUARIO_MODIFICACION)
values (268, 283, 'A', to_date('14-02-2022 01:55:29', 'dd-mm-yyyy hh24:mi:ss'), 'b1030598',
        to_date('14-02-2022 01:55:29', 'dd-mm-yyyy hh24:mi:ss'), null);

*/
-----------------------------------------------------------------------------------------------------------


select * from fact_especial WHERE COD_TAB = 'FACTSECC_DISTRIB' AND COD_RAMO in (923,922);

SELECT MIN(SIM_SUBPRODUCTO)
FROM   A2000030
WHERE  NUM_SECU_POL IN ('29791948649','29791948667');

select valor_campo
from a2000020
where num_secu_pol IN ('29791948649','29791948667')
  --and cod_ries       is null
  and cod_campo      = 'PRODUCTOS'
  and mca_vigente    = 'S';

select cod_campo,valor_campo  from a2000020
where num_secu_pol IN  ('29791948649','29791948667');

SELECT *
FROM   A2000030 A
WHERE A.FECHA_EQUIPO BETWEEN  (SYSDATE - 25) AND (SYSDATE + 20) AND
        A.NUM_POL1 > 1           AND
        A.FECHA_VIG_END IS NOT NULL AND
        NVL(A.MCA_FACTURA,'N')    = 'S'   AND
        NVL(A.MCA_EXCLUSIVO,'N' ) = 'N'   AND
        NVL(A.MCA_TERM_OK,'S')    = 'S'   AND
        NVL(A.MCA_PROVISORIO,'N') = 'N'   AND
        NVL(A.MCA_CADUCA,'N') = 'N'       AND
    NOT EXISTS (SELECT '' /*+ INDEX(b I1_A2000163) */
                FROM A2000163 b
                WHERE b.NUM_SECU_POL = A.NUM_SECU_POL AND
                        b.NUM_END = A.NUM_END AND
                        B.NUM_END_REV IS NULL AND
                        B.TIPO_MOV IS NULL) AND
    EXISTS (SELECT '' FROM A2000160
            WHERE NUM_SECU_POL = A.NUM_SECU_POL AND
                    NUM_END = A.NUM_END AND
                    NVL(IMP_PRIMA_END,0)  != 0)
