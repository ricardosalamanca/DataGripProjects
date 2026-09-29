select count(1)
from  C9999909
WHERE COD_TAB = 'SECC_DECL_ASEGURA'
  and cod_cia = 2
  and cod_secc =  18  ;

select *
from  C9999909
WHERE COD_TAB = 'SECC_DECL_ASEGURA'


select min ( decode ( cod_campo ,'DESC_RIES' , VALOR_CAMPO, ''  ) )    desc_riesgo
     ,min ( decode ( cod_campo ,'COD_ASEG' , VALOR_CAMPO, ''  ) )      coddoc
     ,min ( decode ( cod_campo ,'TIPO_DOC_ASEG' , VALOR_CAMPO, ''  ) ) tipdoc
     ,min ( decode ( cod_campo ,'TDOC_ASEG' , VALOR_CAMPO, ''  ) )     tipdoc_alterno
     ,cod_ries
from A2000020
WHERE Num_secu_pol = 29744788442
  and cod_campo in ('DESC_RIES','COD_ASEG','TIPO_DOC_ASEG'  , 'TDOC_ASEG' )
  And num_end = 0
group by cod_ries
Order By cod_ries;


select substr ( cod_agrup_cont, 4 , 3 ) seccion
from a2000040
WHERE Num_secu_pol = 29744788442
  and cod_ries     = 1
  And num_end = 0;

--29744788442


