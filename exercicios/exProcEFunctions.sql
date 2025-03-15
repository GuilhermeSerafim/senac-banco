-- 1. Desenvolva uma função para calcular o desconto do cliente nos pagamentos realizados.
-- Desconto de 5% para pagamentos acima de 5,00 dólares, 3% para pagamentos acima de 2,00, e 2% para menores que 2,00.
CREATE FUNCTION CALCULADESCONTO(PAGAMENTO DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE DESCONTO DECIMAL(10,2);
    
    IF PAGAMENTO > 5 THEN
        SET DESCONTO = PAGAMENTO * 0.05;
    ELSEIF PAGAMENTO > 2 THEN
        SET DESCONTO = PAGAMENTO * 0.03;
    ELSE
        SET DESCONTO = PAGAMENTO * 0.02;
    END IF;
    
    RETURN DESCONTO;
END

SELECT CALCULADESCONTO (6) as DESCONTO;

-- 2. Desenvolva uma procedure para listar os descontos obtidos por um determinado cliente.
-- Use a function que você criou
CREATE PROCEDURE LISTARDESCONTOSCLIENTE(IDCLIENTE INT) 
BEGIN
	SELECT 
		CONCAT(c.first_name, ' ', c.last_name) as NomeCompleto,
		p.payment_id AS IdPagamento, 
		p.payment_date AS DataPagamento, 
		p.amount AS PagamentosRealizados, 
		CalculaDesconto(p.amount) AS Desconto 
	FROM payment p
	INNER JOIN customer c on c.customer_id = p.customer_id 
	WHERE p.customer_id = IDCLIENTE
	ORDER BY p.payment_date DESC;
END

CALL LISTARDESCONTOSCLIENTE (3);

-- 3. Faça uma procedure para gerar o total de descontos que cada cliente conseguiu.
CREATE PROCEDURE GERATOTALDESCONTOCLIENTES()
BEGIN
	SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS NomeCompleto,
	SUM(p.amount) AS TotalPagamentos,
	SUM(CalculaDesconto(p.amount)) AS TotalDesconto
	FROM payment p
	INNER JOIN customer c ON c.customer_id = p.customer_id
	GROUP BY c.customer_id, c.first_name, c.last_name
	ORDER BY TotalDesconto DESC;
END

CALL GERATOTALDESCONTOCLIENTES ();

-- 4. Faça uma procedure para gerar em cada locação de cliente o valor da locação mais os impostos para cada locação, sendo 8,5% de taxa em cima de cada valor, mostrando o nome do cliente, filme locado, valor da locação, valor do imposto e custo total da locação.
-- VERIFICAR E CORRIGIR
CREATE PROCEDURE OBTERLOCACAOEIMPOSTOCLIENTES()
BEGIN
	SELECT
		CONCAT(c.first_name, ' ', c.last_name) AS NomeCompleto,
		f.title as FilmeLocado,
		p.amount as Locacao,
		p.amount * 0.085 as ValorImpostoLocacao,
		p.amount * 0.085 + p.amount as CustoTotalLocacao
	from payment p
		INNER JOIN customer c on c.customer_id = p.customer_id
		INNER JOIN rental r on r.rental_id = p.rental_id
		INNER JOIN inventory i on i.inventory_id = r.inventory_id
		INNER JOIN film f on f.film_id = i.film_id;
END

call `GERATOTALDESCONTOCLIENTES`