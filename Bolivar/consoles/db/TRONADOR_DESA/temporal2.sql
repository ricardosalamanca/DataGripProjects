SELECT ccc.transactional_promotion_credit_card_id,
       ccc.credit_card_promotion_name,
       ccp.condition_product_id,
       prm.parameter_name,
       cc.transactional_promotion_id_fk,
       pcctp.promotion_name       AS transaccional_operator,
       pp.ppe_id,
       pp.portfolio_name,
       cc.condition_id,
       CASE cc.condition_type_id_fk
           WHEN 1 THEN '💰 Reciprocidad'
           WHEN 2 THEN '💳 Transaccionalidad'
           END                    AS tipo_condicion,
       ccp.product_id_fk,
       ccp.minimun_value,
       ccp.number_of_transactions AS min_transacciones,
       ccp.transaction_billing    AS min_facturacion,
       ccp.bin,
       CASE
           WHEN cc.condition_type_id_fk = 1 THEN CONCAT('Depósitos >= $', COALESCE(ccp.transaction_billing, '0'))
           WHEN cc.condition_type_id_fk = 2 THEN CONCAT('Trans: ', COALESCE(ccp.number_of_transactions::text, '0'),
                                                        ' | Fact: $', COALESCE(ccp.transaction_billing, '0'), CASE
                                                                                                                  WHEN ccp.bin IS NOT NULL
                                                                                                                      THEN CONCAT(' | BIN: ', ccp.bin)
                                                                                                                  ELSE ''
                                                            END)
           END                    AS criterios
FROM portfoliodb.prtf_campaign_condition cc
         INNER JOIN portfoliodb.prtf_campaign_condition_product ccp ON cc.condition_id = ccp.condition_id_fk
         INNER JOIN portfoliodb.prtf_campaign_portfolio pcp ON cc.campaign_portfolio_id_fk = pcp.campaign_portfolio_id
         INNER JOIN portfoliodb.prtf_portfolio pp ON pcp.portfolio_id_fk = pp.portfolio_id
         INNER JOIN portfoliodb.prtf_product p ON ccp.product_id_fk = p.product_id
         LEFT JOIN portfoliodb.prtf_campaign_condition_transactional_promotion pcctp
                   ON pcctp.transactional_promotion_id = cc.transactional_promotion_id_fk
         LEFT JOIN portfoliodb.prtf_campaign_condition_parameter prm ON cc.parameter_id_fk = prm.parameter_id
         LEFT JOIN portfoliodb.prtf_campaign_condition_transactional_promotion_credit_card ccc
                   ON ccc.transactional_promotion_credit_card_id =
                      cc.transactional_promotion_credit_card_id_fk --where ppe_id='44'
ORDER BY cc.condition_id,
         p.product_type,
         ccp.product_id_fk