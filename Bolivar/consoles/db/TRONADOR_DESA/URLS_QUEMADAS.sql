select count(b.id) --504
from url_archivos a inner join url_archivo b on b.id = a.id
where a.grupo = 7
--and a.estado = 'nuevo';

select count(b.id) --504
from url_archivos a inner join url_archivo b on b.id = a.id
where a.grupo = 8;

select criterio from url_reporte group by criterio;


SELECT
    *
--count(*)
FROM
    url_reporte r
        inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
where
      --  criterio = 'HTTP://'
 revisada = 2
  --and r.linea like '%"http://www.w3.org/%'
  and r.grupo =9;

localhost
bolivar
http://10
http
intranet


----------
-- namespace


SELECT
                     *
--count(*)
                 FROM
                     url_reporte r
                         inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
                 where
                       --  criterio in ('/javax.faces.resource','/SimonWeb','/ccm','HTTP://','/app','/SeguridadSimon','/AppConsultaTributaria','/Transmillenio','/img','/ConocimientoDelCliente','/IPMServiceSite','/PagosElectronicos')
                    revisada = 2
                   and r.linea like '%targetNamespace%'
                        -- r.linea like '%localhost%'
                   and r.grupo =2;
--and a.extension = '.java'
--grupo 2

--update revi


SELECT
    count(*)
FROM
    url_reporte r
 --       inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
where
        criterio = 'HTTP://'
  and revisada = 0
  and r.linea like '%http://omnifaces.org/ui%'
  and r.grupo =2;
--and a.extension


update url_reporte r set revisada = 1 , r.OBSERVACION = ''
where
      --  r.pkid in (20673)
  -- criterio in ('/javax.faces.resource','/SimonWeb','/ccm','HTTP://','/app','/SeguridadSimon','/AppConsultaTributaria','/Transmillenio','/img','/ConocimientoDelCliente','/IPMServiceSite','/PagosElectronicos')
        revisada = 2
  and r.linea like '%http://segurosbolivar.com%'
  -- r.linea like '%localhost%'
  and r.grupo =2;
--and a.extension = '.java'

SELECT
    *
--count(*)
FROM
    url_reporte r
        inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
where
       -- r.ID = '2b517bc3-912b-4bbb-b4c7-024ea647cd8e'
 -- and r.grupo =2
 r.pkid = 25623

update url_reporte r set revisada = 2
where
r.pkid in ('813','3703','3193','22783')
       -- criterio in ('/javax.faces.resource','/SimonWeb','/ccm','HTTP://','/app','/SeguridadSimon','/AppConsultaTributaria','/Transmillenio','/img','/ConocimientoDelCliente','/IPMServiceSite','/PagosElectronicos')
   and revisada = 2
 --- and r.linea like '%http://10%'
  -- r.linea like '%localhost%'
  and r.grupo =2;

SELECT
    revisada,
count(*)
FROM
    url_reporte r
        inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
--where
  --  criterio = 'HTTP://'
        --revisada = 2
  --and r.linea like '%"http://www.w3.org/%'
  -- r.grupo =2
group by revisada;



--CREATE TABLE url_reporte_ricardo
--AS (SELECT * FROM url_reporte where grupo =2);

DELETE url_reporte_ricardo WHERE REVISADA IN (1,2,-1);

INSERT INTO url_reporte_ricardo (SELECT * FROM url_reporte where grupo =2);

select  revisada,
        count(*) from url_reporte_ricardo group by revisada;



SELECT
   *
FROM
    url_reporte r
        inner join url_archivos a on a.id=r.id
-- update url_reporte r set revisada = 1
where
    --  criterio = 'HTTP://'
    revisada = 2
    --and r.linea like '%"http://www.w3.org/%'
  and  r.grupo =2;




SELECT
    count(l.id)
FROM
    url_archivos a
        inner join url_archivo l on l.id=a.id
where
        a.app = 'SimonTransmillenio'

SELECT
    count(*)
     ,app, estado
FROM
    url_archivos
where
        app<>'SimonWeb'
group by app, estado
order by app


--Seleccionar registros a revisar ------------------------
SELECT r.criterio    as URL_REPORTE_criterio,
       r.id          as URL_REPORTE_ID,
       r.numero      as URL_REPORTE_NUMERO,
       r.linea       as URL_REPORTE_LINEA,
       r.grupo       as URL_REPORTE_GRUPO,
       r.pkid        as URL_REPORTE_PKID,
       r.revisada    as URL_REPORTE_REVISADA,
       r.observacion as URL_REPORTE_OBSERVACION,
       a.id          as URL_ARCHIVOS_ID,
       a.filename    as URL_ARCHIVOS_FILENAME,
       a.estado      as URL_ARCHIVOS_ESTADO,
       a.nombre      as URL_ARCHIVOS_NOMBRE,
       a.extension   as URL_ARCHIVOS_EXTENSION,
       a.grupo       as URL_ARCHIVOS_GRUPO,
       a.app         as URL_ARCHIVOS_APLICACION
FROM url_reporte r
         INNER JOIN url_archivos a on a.id = r.id
WHERE r.revisada = 0
  AND r.grupo = 2
  --AND r.linea like '%graphicImage%'
ORDER BY URL_REPORTE_criterio,URL_REPORTE_ID, URL_REPORTE_NUMERO;


SELECT distinct r.criterio    as URL_REPORTE_criterio, /* r.id          as URL_REPORTE_ID,*/
r.numero as URL_REPORTE_NUMERO,
                r.linea  as URL_REPORTE_LINEA,
                /*  r.grupo  as URL_REPORTE_GRUPO,*/
                /*      r.pkid        as URL_REPORTE_PKID,*/
                r.revisada as URL_REPORTE_REVISADA,
                /*    r.observacion as URL_REPORTE_OBSERVACION,*/
                /*     a.id          as URL_ARCHIVOS_ID,*/
                a.filename as URL_ARCHIVOS_FILENAME,
                /*  a.estado      as URL_ARCHIVOS_ESTADO,*/
                a.nombre    as URL_ARCHIVOS_NOMBRE,
                a.extension as URL_ARCHIVOS_EXTENSION,
                /*   a.grupo       as URL_ARCHIVOS_GRUPO,*/
                a.app as URL_ARCHIVOS_APLICACION
  FROM url_reporte r
 INNER JOIN url_archivos a
    on a.id = r.id
 WHERE r.observacion like '%-05-2022%'
   and r.revisada in (2, 4, -1)
 ORDER BY URL_ARCHIVOS_APLICACION, URL_ARCHIVOS_NOMBRE, URL_REPORTE_NUMERO;