-----consulta pagos libertador Honorarios
SELECT p.codigo_transaccion   Solicitud
     , p.ESTADO_TRANSACCION   Fecha_radicacion
     , rcb.rcc_nmro_rcbo      Liquidacion
     , rcb.RCC_FCHA_RCBO      Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC      recibo_caja_tronador
     , rcb.RCC_VLOR_RCBO      valor_recibo
     , r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado               Estado_cierre
     , e.nro_factura_dian     factura_DIAN
     , e.SUCURSAL             sucursal
     , e.TDOC_TERCERO         tipo_documento
     , e.NRO_DOCUMTO          numero_document
     , o.CODIGO_TRANSACCION_PSE
     , l.CODIGO_BARRAS
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN detalles_pago d ON d.secuencia_obligacion = o.secuencia
         INNER JOIN pagos_linea_libertador p ON p.secuencia_pago = d.secuencia_pago
WHERE e.fecha_factura >= to_date('01/04/2025', 'dd/mm/yyyy')
  and rcb.RCC_ESTDO_RCBO = 'I';

-----consulta pagos libertador Estudios
SELECT w.SOLICITUD            Solicitud
     , w.FEC_DILIGENCIA       Fecha_radicacion
     , rcb.rcc_nmro_rcbo      Liquidacion
     , rcb.RCC_FCHA_RCBO      Fecha_liquidacion
     , rcb.RCC_NMRO_LQDC      recibo_caja_tronador
     , rcb.RCC_VLOR_RCBO      valor_recibo
     , r.RLR_VLOR_RCBO_INVESA valor_invesa
     , e.estado               Estado_cierre
     , e.nro_factura_dian     factura_DIAN
     , e.SUCURSAL             sucursal
     , e.TDOC_TERCERO         tipo_documento
     , e.NRO_DOCUMTO          numero_documento
     , o.CODIGO_TRANSACCION_PSE
     , l.CODIGO_BARRAS
FROM factura_electronica_libertador e
         INNER JOIN rlcion_rcbos_cja r ON e.nro_factura_sai = r.rlr_nmro_fctra
         INNER JOIN rcbos_cja rcb ON r.rlr_nmro_rcbo_invesa = rcb.rcc_nmro_rcbo AND rcb.RCC_SUC_CDGO = e.SUCURSAL
         INNER JOIN liquidaciones_obligacion l ON l.numero_liquidacion = rcb.rcc_nmro_rcbo
         INNER JOIN obligaciones_pagar o ON o.secuencia = l.secuencia
         INNER JOIN aew_estudios w ON w.nmro_liquidacion = l.numero_liquidacion
WHERE e.fecha_factura >= to_date('01/04/2025', 'dd/mm/yyyy');

