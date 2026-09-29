select sr.id_reporte,count(*) reportes
from sim_reportes sr where sr.id_reporte in (678,679,680,681)
group by sr.id_reporte order by 1;


select * from SIM_PROCESOS where ID_PROCESO = 2014

select * from OPS$PUMA.SIM_PROCESOS_PRODUCTO where ID_PROCESO = 2014

select t.num_secu_pol,
       t.num_end,
       t.cod_secc,
       t.cod_ramo,
       t.sim_subproducto,
       t.sim_sistema_origen,
       t.sim_canal,
       t.sim_entidad_colocadora,
       t.id_proceso,
       ps.desc_proceso,
       t.num_pol_provisorio,
       t.num_pol_definitivo,
       t.estado,
       t.desc_estado,
       t.ciclo,
       t.fecha_ciclo,
       t.usuario_creacion,
       t.fecha_creacion,
       t.usuario_modificacion,
       t.fecha_modificacion
from ops$puma.sim_traza_proc_formaliza t, ops$puma.sim_procesos_seguimiento ps
where t.id_proceso = ps.id_proceso
  and trunc(t.fecha_creacion) between to_date('20-03-2021','dd-mm-yyyy')
    and to_date('25-03-2021','dd-mm-yyyy')
  and t.num_secu_pol = 29744854301--29744854170--29744854121 --29744810574
order by t.num_secu_pol,id_proceso


