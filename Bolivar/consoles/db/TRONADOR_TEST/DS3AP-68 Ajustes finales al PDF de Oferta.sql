select * from c9999909 where cod_tab='PERIODO_FACT'

select *
from simapi_log_webservices
where
        codigows like '%SIM_PCK_PROCESO%'
  and ID_SIMLOGWS > 33500230
order by id_simlogws desc;


DECLARE
    TDIRIMP PKG_DIRECCIONES.t_direccion_impresion;
BEGIN

    TDIRIMP.p_numero_documento    := 1 ;
    TDIRIMP.p_tipo_documento      := 'CC';
    PKG_DIRECCIONES.PRC_DIRECCION_IMPRESION ( TDIRIMP );
    dbms_output.put_line(TDIRIMP.p_numero_documento);
    dbms_output.put_line(TDIRIMP.p_nombres);
END;


select *
from simapi_log_webservices
where
   codigows like '%SIMAPI_PCK_IMPRESION%'
  and ID_SIMLOGWS > 33495394
order by id_simlogws desc;

select valor_campo from a2000030 a, a2000020 b
where cod_secc=922
  and   a.num_secu_pol=b.Num_secu_pol
  and   a.num_end = b.num_end
  and   b.cod_campo LIKE  'EDAD_ASEGURADO%'
  --and num_pol1= 1511000008701
  AND b.num_secu_pol = 29744636769;

select valor_campo
from a2000020
where num_secu_pol = 29744636769
  and cod_ries       = 1
  and cod_campo      LIKE  'EDAD_ASEGURADO%'
  and mca_vigente    = 'S';



select fun_rescata_a2000020('EDAD_ASEGURADO', 29744636769, 1) from dual;

Ip_Clave Is Not Null


/* LINEA 2574 SIMAPI_PCK_IMPRESION_TUSEGURO
      BEGIN
      op_ArrImpre(op_ArrImpre.COUNT).campo10 := fun_rescata_a2000020('EDAD_ASEGURADO', l_Numsecupol, Ip_Codries);
      EXCEPTION
           WHEN  OTHERS  THEN  NULL;
      END;
*/

select COD_ASEG from A7000900;