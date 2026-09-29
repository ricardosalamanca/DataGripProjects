select cr.fueres_codigo, cr.levantamiento_temporal, cr.*
from CLIENTES_RESTRINGIDOS cr, FUENTES_RESTRICCION ft
where cr.FUERES_CODIGO = ft.CODIGO
  and cr.TIPDOC_CODIGO = 'NT'
  and cr.fecha_baja is null
  and cr.NUMERO_DOCUMENTO = '900309373';


select crp.TIPO_DECISION,
       crp.TIPO_ALERTA,
       crp.TIPO_REPORTE,
       crp.*
from CLIENTES_RESTRINGIDOS_PARAMETR crp
where crp.TIPO_MOVIMIENTO = 6

select * from juridicos where numero_documento = '860042985';


