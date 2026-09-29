SELECT object_name, object_type, status, created, last_ddl_time
FROM user_objects
ORDER BY object_type, object_name;

select * from LISTA_DOCUMENTO where sini_sol_sai_solicitud = 4989324;

select * from LISTA_DOCUMENTO order by cod_list_doc desc;

         ---where COD_LIST_DOC = 296332;

--select * from ADMSISA.documento_temporal;

select *
from INDEMNIZA.SINIESTRO
WHERE SOLICITUD_SAI_SOLICITUD IN
      (11194443);

select TO_CHAR(I.FEC_REP, 'DD-MON-YY HH24:MI:SS') AS FEC_REP_COMPLETA,
       I.*
from INDEMNIZA.SINIESTRO I
WHERE SOLICITUD_SAI_SOLICITUD IN
      (11194443, 11145122, 11355242, 11260878, 11136073, 11174227, 11194521, 11323608, 11350334, 11201579, 11351706,
       7775225, 7777761, 11204202, 11046536, 11259212, 11065479, 11203733, 11079761, 11137493, 11024151, 11087227,
       11120765, 11035449, 11214388, 11188857, 11202764, 11202276, 11175318, 11310946, 11091106, 11186144, 11129496,
       7769131, 11141221, 11066539, 11082582, 11183829, 11392077, 11343271, 11083326
          );

SELECT column_name, data_type, data_length
FROM all_tab_columns
WHERE owner = 'INDEMNIZA'
  AND table_name = 'SINIESTRO'
ORDER BY column_id;

SELECT constraint_name, table_name, status, search_condition, r_constraint_name
FROM all_constraints
WHERE owner = 'INDEMNIZA'
  AND table_name = 'LISTA_DOCUMENTO'
  AND constraint_name = 'LISTA_DOCUMENTO_SINIESTRO_FK';

SELECT
    ac.constraint_name,
    ac.table_name,
    acc.column_name,
    ac.r_constraint_name,
    r.table_name AS referenced_table,
    rcc.column_name AS referenced_column
FROM all_constraints ac
         JOIN all_cons_columns acc
              ON ac.owner = acc.owner
                  AND ac.constraint_name = acc.constraint_name
         JOIN all_constraints r
              ON ac.r_constraint_name = r.constraint_name
                  AND ac.r_owner = r.owner
         JOIN all_cons_columns rcc
              ON r.constraint_name = rcc.constraint_name
                  AND r.owner = rcc.owner
                  AND acc.position = rcc.position
WHERE ac.owner = 'INDEMNIZA'
  AND ac.table_name = 'LISTA_DOCUMENTO'
  AND ac.constraint_name = 'LISTA_DOCUMENTO_SINIESTRO_FK';


INSERT INTO INDEMNIZA.SINIESTRO (FEC_REP, COD_SINI_SAI, FEC_MORA, FEC_INI_CONT, FEC_FIN_CONT, PERIODO, TIP_POL,
                                 TIPO_REP_SINI, CUOT_ADM, EST_PAGO, EST_SINI, CANO_ARRE_REPO, VAL_ADMI_REPO,
                                 OBSERVACION, SOLICITUD_SAI_SOLICITUD)
VALUES (TO_DATE('10-FEB-25 11:01:15', 'DD-MON-YY HH24:MI:SS'), 2025014111, TO_DATE('28/12/2024', 'DD/MM/YYYY'),
        TO_DATE('28/08/2024', 'DD/MM/YYYY'), TO_DATE('28/02/2025', 'DD/MM/YYYY'), '022025', 'C', '1', 'N', 9, 1, NULL,
        NULL, NULL, 11194443);

SELECT * FROM INDEMNIZA.SOLICITUD_SAI WHERE SOLICITUD IN (11194443, 11145122, 11355242, 11260878, 11136073, 11174227, 11194521, 11323608, 11350334, 11201579, 11351706,
                                                          7775225, 7777761, 11204202, 11046536, 11259212, 11065479, 11203733, 11079761, 11137493, 11024151, 11087227,
                                                          11120765, 11035449, 11214388, 11188857, 11202764, 11202276, 11175318, 11310946, 11091106, 11186144, 11129496,
                                                          7769131, 11141221, 11066539, 11082582, 11183829, 11392077, 11343271, 11083326
    );

SELECT
    'INSERT INTO INDEMNIZA.SOLICITUD_SAI (solicitud, inquilino, destinacion, tipo_inmu, poliza, direccion, ciudad, canon, administracion, cano_aseg, admi_aseg, amp_hog_aseg, amp_int_aseg, nuev_val_aseg, fec_nove, est_soli, est_sini, est_pago, fec_mora, fec_ingr, fec_estu, fec_deso, fec_reti, fec_ini_cont, tip_identifica, num_identifica, email_inmobiliaria, estrato, amp_clsla_pnal_aseg) VALUES (' ||
    solicitud || ', ' ||
    NVL('''' || REPLACE(inquilino, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL('''' || REPLACE(destinacion, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL('''' || REPLACE(tipo_inmu, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL(TO_CHAR(poliza), 'NULL') || ', ' ||
    NVL('''' || REPLACE(direccion, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL('''' || REPLACE(ciudad, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL(TO_CHAR(canon), 'NULL') || ', ' ||
    NVL(TO_CHAR(administracion), 'NULL') || ', ' ||
    NVL(TO_CHAR(cano_aseg), 'NULL') || ', ' ||
    NVL(TO_CHAR(admi_aseg), 'NULL') || ', ' ||
    NVL(TO_CHAR(amp_hog_aseg), 'NULL') || ', ' ||
    NVL(TO_CHAR(amp_int_aseg), 'NULL') || ', ' ||
    NVL(TO_CHAR(nuev_val_aseg), 'NULL') || ', ' ||
    CASE WHEN fec_nove IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_nove, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    NVL('''' || est_soli || '''', 'NULL') || ', ' ||
    NVL('''' || est_sini || '''', 'NULL') || ', ' ||
    NVL('''' || est_pago || '''', 'NULL') || ', ' ||
    CASE WHEN fec_mora IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_mora, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    CASE WHEN fec_ingr IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_ingr, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    CASE WHEN fec_estu IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_estu, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    CASE WHEN fec_deso IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_deso, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    CASE WHEN fec_reti IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_reti, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    CASE WHEN fec_ini_cont IS NOT NULL THEN 'TO_DATE(''' || TO_CHAR(fec_ini_cont, 'DD-MM-YYYY') || ''', ''DD-MM-YYYY'')' ELSE 'NULL' END || ', ' ||
    NVL('''' || tip_identifica || '''', 'NULL') || ', ' ||
    NVL(TO_CHAR(num_identifica), 'NULL') || ', ' ||
    NVL('''' || REPLACE(email_inmobiliaria, '''', '''''') || '''', 'NULL') || ', ' ||
    NVL(TO_CHAR(estrato), 'NULL') || ', ' ||
    NVL(TO_CHAR(amp_clsla_pnal_aseg), 'NULL') ||
    ');' AS insert_statement
FROM INDEMNIZA.SOLICITUD_SAI
WHERE SOLICITUD IN (
                    11194443, 11145122, 11355242, 11260878, 11136073, 11174227, 11194521, 11323608, 11350334, 11201579, 11351706,
                    7775225, 7777761, 11204202, 11046536, 11259212, 11065479, 11203733, 11079761, 11137493, 11024151, 11087227,
                    11120765, 11035449, 11214388, 11188857, 11202764, 11202276, 11175318, 11310946, 11091106, 11186144, 11129496,
                    7769131, 11141221, 11066539, 11082582, 11183829, 11392077, 11343271, 11083326
    );



