SELECT * FROM SIM_CARGA_EXPEDIENTES WHERE SECUENCIA = 428677;

select * from SIM_CARGA_VAR_SINIESTROS;

---tabla de expedientes
select *
from a7001000
where NUM_SECU_SINI = 27034579549
  and  (TIPO_EXPED, NRO_ORDEN_EXP) in (select TIPO_EXPED, max(NRO_ORDEN_EXP) as max from OPS$PUMA.A7001000 where NUM_SECU_SINI = 27034579549 group by TIPO_EXPED)
  and MCA_EST_EXP is null
  and NRO_EXPED not in (select distinct NRO_EXPED from a3001700 where NUM_SINI = 50102302118)
order by NRO_EXPED, NRO_ORDEN_EXP;


SELECT COD_CONCEP_RVA, COD_COB
FROM a7001200
where NUM_SECU_EXPED in (SELECT NUM_SECU_EXPED
                         FROM a7001000
                         WHERE NUM_SECU_SINI = (select NUM_SECU_SINI from a7000900 where NUM_SINI = 50102302118)
                           AND TIPO_EXPED = 'MAA'
                           AND NRO_ORDEN_EXP = 0
                           AND NVL(MCA_EST_EXP, 'P') = 'P')
AND NRO_ORDEN_EXP = 0 AND NUM_SECU_SINI = (select NUM_SECU_SINI from a7000900 where NUM_SINI = 50102302118);


