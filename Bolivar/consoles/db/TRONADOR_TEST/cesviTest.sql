SELECT *
FROM A2000030 N
WHERE NUM_POL1 = 5160702277201;

SELECT * FROM A2000020 WHERE NUM_SECU_POL = 29744840280;

select v.siniestro, v.estado, v.cesv_error, v.fecha_creacion, v.fecha_actualizacion, v.* from sim_siniestro_cesvi v where v.siniestro = 51600008031