---si el siniestro se encuentra en control técnico es por el campo MCA_TRANSIT,
--y la razón del control técnico del siniestro la encuentra en A2000220 con num_secu_pol igual a num_secu_sini
---siniestro ve si esta en MCA_TRANSIT en S tiene control tecnico
select * from A7000900 where num_sini = 50100002642;
-----tabla mirar controles tecnicos de siniestros---- COD_RECHAZO 1 es observado, 3 a autorizar.
select * from A2000220 where NUM_SECU_POL in (27308703910);
select * from A2000220 WHERE COD_ERROR IN (702,706,714,721,728,302);
-----codigos de error controles tecnicos---------
select * from G2000210 where COD_ERROR IN (702,706,714,721,728,302) and COD_CIA = 3;

select * from a2000020 where NUM_SECU_POL = 29810794316;
select * from a3001700 where num_sini=50100002443
                         and cod_secc=37 and num_ord_pago=81172025005575;

select * from a3001700 a, a2000220 b where num_sini=50100002443 and cod_secc=37
                                       and b.num_secu_pol(+)=a.num_secu_liq;
select * from a7000900 where num_sini=50100002443 and cod_secc=37;

select * from a2000040 where num_secu_pol= 29788211874;

select * from a7001210 where num_secu_sini=27275580190;

select * from a2000220 where num_secu_pol=27074892973;

select * from g2000210 where cod_error=302 AND COD_CIA=3;

select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where CDREG IN ('300LTI002', '300LTF001');
select R.REGLA_COMPLETA, R.DSSUCCES, R.* from CREGLAS R where DSSUCCES = '300LTI002';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTI001';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV006';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV005';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV004';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTV002';
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.* from CREGLAS R where DSFAILUR = '300LTI110';

SELECT *  FROM G2000020 WHERE COD_CIA = 3 AND COD_RAMO = 486;
select * from G7000025 WHERE COD_CIA = 3 AND COD_RAMO = 486 and COD_SECC = 37;
select * from SIM_G7000025 WHERE COD_CIA = 3 AND COD_RAMO = 486 and COD_SECC = 37;
SELECT * FROM G7000020 WHERE COD_REGLA = '300LTF002';

SELECT *  FROM G2000020 where COD_REGLA = '300LTV006';
select * from G2000200 where CDREG IN ('300LTV006');
select * from G2000200 where COD_CIA = 3 and COD_RAMO = 486 AND COD_SECC = 37;
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV013', '237PVV028', '237PVV031', '237PVV029', '237PVV030');
select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('237PVV020', '237PVV005', '237PVV004', '237PVV006','237PVV005', '300LTV001', '300LTV002', '300LTV003', '300LTV004', '300LTV005', '300LTV006', '300LTV007', '300LTV008');

select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R WHERE REGLA_COMPLETA LIKE '%300LTI%';

select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('210PVV200', '220PVV258', '223GVV003', '237PVV001', '237PVV003', '237PVV005', '237PVV005', '237PVV009',
                '237PVV009', '237PVV010', '237PVV011', '237PVV015', '237PVV016', '237PVV018', '237PVV020', '237PVV020',
                '237PVV033', '299GVV010', '299PVV012');

select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('220PVV263','223GVV004','223PVV098','237PVV004','237PVV005','237PVV008','237PVV008','237PVV021','299GVV007');

select R.REGLA_COMPLETA, R.DSSUCCES, R.DSFAILUR, R.*
from CREGLAS R
where CDREG IN ('205PVV142','220PVV425','223PVV099','237PVV004','237PVV006');