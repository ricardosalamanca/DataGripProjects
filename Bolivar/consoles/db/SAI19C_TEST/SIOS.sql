select r.RVI_NMRO_ITEM, p.POL_PRS_NMRO_IDNTFCCION
from rsgos_vgntes r, plzas p
where r.RVI_NMRO_PLZA = p.POL_NMRO_PLZA
and p.POL_NMRO_PLZA < 999
and r.RVI_FCHA_DSDE_ACTUAL > to_date('01/01/2024', 'dd/mm/yyyy') and p.POL_PRS_NMRO_IDNTFCCION = 901143222;

select * from LISTA_DOCUMENTO where sini_sol_sai_solicitud = 10825099;

select * from documento_temporal where NUMEROSOLICITUD = 10825099;

select COUNT(*)
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;

select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;

select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC
WHERE d.numerosolicitud in (7701873, 7492676, 5060036, 10580440, 3174718, 10355714);

select *
from documento_temporal
where numerosolicitud = 5717885
  and cod_doc = 1;

select numerosolicitud, cod_doc, count(*)
from documento_temporal
group by numerosolicitud, cod_doc
having count(*) > 1;

select l.*, d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC
WHERE d.numerosolicitud in (select numerosolicitud
                            from documento_temporal
                            group by numerosolicitud, cod_doc
                            having count(*) > 1);

select d.*
from LISTA_DOCUMENTO l
         inner join documento_temporal d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;

select TIPOMOVIMIENTO, count(*) as cantidad
from documento_temporal
where TIPOMOVIMIENTO is not null
group by TIPOMOVIMIENTO;

Select *
from documento_temporal
where TIPOMOVIMIENTO is not null
order by archivo asc;

Select count(*) from documento_temporal;

select
    'INSERT INTO DOCUMENTO_TEMPORAL (' ||
    'TITULODOCUMENTO, NOMBREUSUARIO, IDENTIFICADORUSUARIO, NOMBREDELDOCUMENTO, TIPODOCUMENTOASEGURADO, NOMBREASEGURADO, NUMERODOCUMENTOASEGURADO, FECHAEXPEDICIONDOCUMENTO, VIGENCIADOCUMENTO, IDCOMPANIA, RAMO, PRODUCTO, NUMEROSOLICITUD, NUMEROSINIESTRO, NUMERODEPOLIZA, NOCASO, IDRIESGO, CLASIFICACIONSEGURIDADINFO, CLASIFICACIONHABEASDATA, TIPOMOVIMIENTO, FECHARECEPCIONDOCUMENTO, ARCHIVO, TIPOARCHIVO, COD_DOC, APLICA) VALUES (''' ||
    d.TITULODOCUMENTO || ''',''' ||
    d.NOMBREUSUARIO || ''',''' ||
    d.IDENTIFICADORUSUARIO || ''',''' ||
    d.NOMBREDELDOCUMENTO || ''',''' ||
    d.TIPODOCUMENTOASEGURADO || ''',''' ||
    d.NOMBREASEGURADO || ''',''' ||
    d.NUMERODOCUMENTOASEGURADO || ''',''' ||
    d.FECHAEXPEDICIONDOCUMENTO || ''',''' ||
    d.VIGENCIADOCUMENTO || ''',''' ||
    d.IDCOMPANIA || ''',''' ||
    d.RAMO || ''',''' ||
    d.PRODUCTO || ''',''' ||
    d.NUMEROSOLICITUD || ''',''' ||
    d.NUMEROSINIESTRO || ''',''' ||
    d.NUMERODEPOLIZA || ''',''' ||
    d.NOCASO || ''',''' ||
    d.IDRIESGO || ''',''' ||
    d.CLASIFICACIONSEGURIDADINFO || ''',''' ||
    d.CLASIFICACIONHABEASDATA || ''',''' ||
    d.TIPOMOVIMIENTO || ''',''' ||
    d.FECHARECEPCIONDOCUMENTO || ''',''BLOB'',''' ||
    d.TIPOARCHIVO || ''',''' ||
    d.COD_DOC || ''',''' ||
    d.APLICA || ''');' as INSERT_STATEMENT
from LISTA_DOCUMENTO l
         inner join DOCUMENTO_TEMPORAL d
                    on l.sini_sol_sai_solicitud = d.NUMEROSOLICITUD and l.COD_DOC = d.COD_DOC;


select
    'docfilenet.extend;' || chr(10) ||
    'docfilenet(' || rownum || ') := ty_reg_filenet(''' ||
    d.COD_DOC || ''',''' ||
    d.NUMEROSOLICITUD || ''',''{0051F571-0000-C046-BD54-D700EEAE92A5}'');'
        as linea_plsql
from documento_temporal d;

SELECT
       dt.cod_doc,
       dt.titulodocumento,
       dt.aplica,
       NULL,
       TO_DATE(dt.fecharecepciondocumento,
               'dd-mm-yyyy hh24:mi:ss')

FROM documento_temporal dt
WHERE dt.numerosolicitud = 7496885
  AND dt.cod_doc = 7
  AND ROWNUM = 1;

