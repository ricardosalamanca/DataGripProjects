-----VALIDA CREACION POLIZA----
select a.mca_cotizacion,
       a.NUM_POL_COTIZ,
       a.NUM_POL1,
       a.FOR_COBRO,
       a.NUM_SECU_POL,
       a.NUM_END,
       a.COD_END,
       a.SUB_COD_END,
       a.TIPO_END,
       a.DESC_POL,
       a.*
from a2000030 a
where cod_secc = 66
  and NUM_SECU_POL = 39745174955;
--  and NUM_POL1 =  1530375085401;
  
  
-----VALIDA CREACION COTIZACION
select a.mca_cotizacion, a.NUM_POL_COTIZ, a.NUM_POL1, a.*
from a2000030 a
where cod_secc = 66
  and NUM_POL_COTIZ = 1530000891301;


select a.*  from x2000020 a
where num_secu_pol = 39745213720;


---datos variables NIVEL DE POLIZA
select a.*  from a2000020 a
where num_secu_pol = 39745085598
  and cod_ries is null;

select a.*  from a2000020 a
where num_secu_pol in (select NUM_SECU_POL from a2000030 where NUM_POL1 in (1520000114001, 1520000114101))
  and cod_ries is null;


---datos variables NIVEL DE RIESGO
select a.*  from a2000020 a
where num_secu_pol = 39745202471
  and cod_ries is not null;


--Asegurados
select t.*, rowid from a2001300 t WHERE NUM_SECU_POL = 29861287516;

-----debito automatico
select t.*, rowid from a2000060 t WHERE NUM_SECU_POL = 29861287516;


----COBERTURAS POR RIESGO
Select  a.*
From A2000040 a
Where num_secu_pol = 39745202471;

----VALIDACION SIM_TERCEROS
select * from SIM_TERCEROS where NUM_SECU_POL = 29861287516;

---CALCULO DE COMISIONES POLIZAS -NO APLICA PARA COTIZACION
select * from A2990701 WHERE  NUM_POL1  = 1530375100701 AND COD_SECC = 66;
----AGENTES POLIZAS
select * from A2000250 WHERE  num_secu_pol  = 29861287505;

----FACTURAS  -NO APLICA PARA COTIZACION
select * from a2990700 where NUM_SECU_POL = 39745202471;
---VALOR TOTAL DE LA PRIMA
select * from a2000160 where NUM_SECU_POL = 39745202471;
----impuestos
select * from a2000190 where NUM_SECU_POL = 39745202471;



