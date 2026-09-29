select
    decode(length(clausulado), 0,Null,clausulado) clausulado
from
    simapi_estrategia_ent;

select
    decode(length(clausulado), 0,Null,dbms_lob.substr( clausulado, 4000, 1 )) clausulado
from
    simapi_estrategia_ent;

select
    COALESCE(clausulado,null) clausulado
from
    simapi_estrategia_ent;

select
   cast(clausulado as text())
from
    simapi_estrategia_ent where  id_estrategia=38 and
        sim_version_est= 40;

select * from sim_log
where columna like 'RPR P%'


select * from c9999909 where cod_tab='PERIODO_FACT'


---SIMAPI_PCK_OFERTA