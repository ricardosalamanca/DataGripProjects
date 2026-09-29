--1.
-----tabla de los RAMOS Y SECCIONES---------------
----forma tronador crear seccion y ramo ->>> AP100002
----cod_secc codigo seccion (Ramo)
----cod_ramo codigo ramo (Producto)
Select * from a1000200
where cod_cia in (2,3) order by cod_secc;
INSERT INTO OPS$PUMA.A1000200 (COD_CIA, COD_SECC, NOM_SECC, ABREV_SECC, COD_PLAN_PAGO, COD_MON, COD_USR, PERIODO_FACT, TIPO_RAMO, MCA_SALTEADA, MCA_AHORRO, MCA_VIDA, MCA_FINAN, COD_SUPERBAN, COD_SUPERFINAN)
VALUES (3, 200, 'PRUEBA NVA SECCION', 'PNS', null, 1, 'INTASI20', 12, 1, 'N', 'N', 'N', 'S', null, null);

--2.
----se escoje usuario para perfil y permisos por ejemplo para levantar los controles tecnicos
----EJEMPLO INSTASI14
select * from g1002700
where cod_cia in (2,3);
-----FORMA PARAMETRIZACION NIVELES --->>AP900110
--Tabla de Niveles de autorización por nodo
Select * from G9000001 d where d.nodo = 1;
INSERT INTO OPS$PUMA.G9000001 (NODO, COD_SECC, NIVEL1, NIVEL2, NIVEL3, NIVEL4, NIVEL5, NIVEL6, NIVEL7, NIVEL8, NIVEL9, NIVEL10, COD_CIA)
VALUES (1, 200, 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 'INTASI14', 3);

--3.
---AP299020 Numeración Cotizaciones Automatica
select *  from A2990920  where cod_secc=200;
---Ap299030 Cotizaciones Reservadas
select *  from A2990930;
----AP299005 Numeracion Poliza
select * from A2990500;
--- AP299006 NUmeracion Reservada
select * from A2990600;

----oficinas   a1000700 -canales,  a1000701 sucursales y a1000702 oficinas
Select * from a1000700;
Select * from a1000701;
Select * from a1000701 Where cod_div_dreg = 10;
select * from a1000702;
------------------------------------------------------------------
select * from a2010500;
select * from a2990500;

select * from a2010030; --poliza principal

------------------------------------------------------------------------------------
-----tambien existe menu de creacion de productos en simon ->>>C:\Users\1030598961\Pictures\Screenpresso\IMPORTANTE\2021-04-23_07h53_23.png

select * from a1001600
where cod_cia in (2,3)
  and cod_secc = 200;
Select  * from a1001800 where Cod_proceso = '2'  and sub_cod_texto is null and tipo_end is null;

select * from SIM_PRODUCTOS where COD_SECC = 200;

----DATOS VARIABLES DEL PRODUCTO----- C:\Users\1030598961\Pictures\Screenpresso\IMPORTANTE\2021-04-23_08h39_59.png
select * from g2000010;  ----SI NO EXISTE Y ES UN DATO NUEVO DATO VARIABLE OSE VERIFICAR SI EXITE YA EN LA g2000020
select * from g2000020 where cod_ramo = 200;

select * from sim_g2000020 where cod_ramo = 690;
------/Parametros Test/Parametros Emision Test/Menú de Parámetros por Producto/Categorias datos variables Emision Test

----SIMON WEB CREACION DE PRODUCTOS ---> C:\Users\1030598961\Pictures\Screenpresso\IMPORTANTE\2021-04-28_08h30_57.png

--------------------------------LISTASN
Select * from sim_g2000020
where cod_cia = 3
  and cod_campo in (select cod_campo from g2000020
                    where cod_ramo = 690)
  and componente != 'TX' and cod_ramo = 690
order by cod_campo;

-----COBERTURAS---- FORMA AP100020
SELECT * FROM A1002000 WHERE COD_COB = 450

---COBERUTRAS AUTOS
Select * from g1002000 g
where g.cod_cia = 3
  and cod_sector = 1
  and cod_ramocont in (999,250)
--and holexp_nconver = 1
order by g.holexp_nconver;

------- AP200040   Cobertura por producto A1002100
AP510200  Ramos Contables
g1002000
SELECT * FROM A1002000 WHERE COD_COB = 759
select *
from A1002100
where  COD_CIA = 3 and COD_RAMO = 117;

/*
 El sistema no los controla, pero si es bueno conservarlos. Ejemplo PCC--> regla de calculo   GCI--> Precobertura   GCU--> seleccion, PCV --> Validacion     Primer digito Modulo o ahora para Uds. epica del sistema  2--> Emision   8--> Reaseguros etc. Proximos 2 digitos la seccion o ramo ejemplo si es Hogar 23   . Una regla de emision precobertura 223PCC001
EJEMPLO--->>
 perdon precobertura seria 223GCI001, calculo 223PCC001
 */


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- REASEGUROS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----seccion de reaseguros: -- Tronador: Diagnostico Reaseguros
select * from A8500120 WHERE COD_CIA = 3 AND MCA_BAJA IS NULL;

----Actualizacion de secciones vs secciones de reaseguros
select * from C8500125 where COD_CIA = 3 and COD_SECC = 200;
select * from G8500003;

-- COberturas por ramo
select * from a1002080  where cod_ramo = 690 order by cod_cia, cod_ramo, fecha_vig;

----marca de reaseguro
select cod_cia, cod_ramo, cod_cob, num_Secu, txt_cob, cod_cob_inf, cod_reg_cal, cod_reg_pre,
       mca_reaseguro, mca_suma_aseg, cod_agrup_cont
from a1002100 where cod_ramo = 690;

------------------------MODIFICACIONES------------------------------------------------
---Codigos de modificaciones tronador AP100025
Select * from A1001800
where COD_PROCESO = 2;

select * from SIM_CODIGOS_ENDOSO_SECCION
where COD_SECC = 200

select * from SIM_GRUPOS;

select * from SIM_CAMPOS;

select * from SIM_GRUPOS_SECCION
where cod_secc = 23 OR COD_SECC = 200

SELECT * FROM SIM_GRUPO_ENDOSO_SECCION
where COD_SECC = 200;

select * from SIM_GRUPO_DATOS_ENDOSO_SECC
where SECUENCIA_SGES IN (SELECT SECUENCIA_SGES FROM SIM_GRUPO_ENDOSO_SECCION
                         where COD_SECC = 200);
--Tabla donde están los grupos de datos creados para Simón Web
select * from sim_grupos;

--Tabla donde están los campos de Simón Web
select * from sim_campos;

--Relación grupo - campos
select * from sim_campos_x_grupo;

--Los grupos de datos que utiliza la seccion
select * from sim_grupos_seccion;

--Los campos que pueden modificar para el código de endoso están en
select * from sim_grupo_datos_endoso_secc;

------comisiones emicion x2000253, x2000252, x2000250
select * from x2000253 where NUM_SECU_POL = 29744877601;
select * from x2000252 where NUM_SECU_POL = 29744877601;
-----tabla global de comisiones
select * from x2000250 where NUM_SECU_POL = 29744877601;
----detalle a nivel de riesgo y cobertura
select * from x2000251