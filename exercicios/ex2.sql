-- 1) Criar uma procedure para gerar o valor total gasto por cliente,
-- — imprima a comissão de cada gerente sendo 5% sobre o valor pago. Param(cliente): ValorGastoPorCadaCliente
CREATE PROCEDURE GeraValorTotalGastoPorCliente(IdCliente int)
BEGIN
    SELECT
    p.staff_id as GerenteId,
    p.customer_id as IdCliente,
    sum(p.amount) as ValorGastoPorCadaCliente,
    ROUND(sum(p.amount) * 0.05, 2) as ComissaoPorGerente
FROM payment p
WHERE p.customer_id = IdCliente
GROUP BY
    p.customer_id,
    p.staff_id
ORDER BY GerenteId, IdCliente;
END;