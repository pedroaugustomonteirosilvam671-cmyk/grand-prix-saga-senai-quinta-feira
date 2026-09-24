
SELECT
    op.codigo_op AS ordem_producao,
    u_criador.nome AS criador_op,
    u_almox.nome AS almoxarife_responsavel,
    p.codigo_sku AS id_codigo_produto,
    p.descricao AS produto,
    its.qtd_necessaria AS quantidade_pedida,
    its.qtd_separada AS quantidade_ja_separada,
    e.quantidade_disponivel AS saldo_estoque,
    e.sinal_disponibilidade AS sinal_estoque,
    e.localizacao
FROM ITEM_SEPARACAO its
JOIN SEPARACAO_KIT sk ON its.idSEPARACAO_KIT = sk.id_kit
JOIN ORDEM_PRODUCAO op ON sk.id_ordem = op.id_ordem
JOIN PRODUTO_KIT pk ON pk.idSEPARACAO_KIT = sk.id_kit
JOIN PRODUTO p ON pk.idPRODUTO = p.codigo_sku
JOIN ESTOQUE e ON p.idESTOQUE = e.id_estoque
JOIN USUARIO u_criador ON op.id_usuario_criador = u_criador.id_usuario
LEFT JOIN USUARIO u_almox ON sk.id_usuario_almoxarifado = u_almox.id_usuario
WHERE sk.id_kit = 1;