-- 2) Construa uma função para incluir endereço completo de um cliente.
CREATE FUNCTION IncluirEnderecoCompleto
    (
        IdCliente int, 
        Endereco varchar(50),
        Bairro varchar(20),
        Cidade varchar(50),
        Cep varchar(10),
        Pais VARCHAR(50)
    )
RETURNS INT -- NR DE ONDE FOI ALTERADO
BEGIN
    DECLARE v_country_id INT;
    DECLARE v_city_id INT;
    DECLARE v_adrees_id INT;

    -- 1. Verifica ou insere o país
    -- Verifica se o país já existe na tabela country, comparando com LOWER para ignorar maiúsculas/minúsculas.
    -- Se encontrar, guarda o country_id na variável v_country_id.
    SELECT country_id INTO v_country_id
    FROM country
    WHERE LOWER(country) = LOWER(Pais)
    LIMIT 1;

    IF v_country_id IS NULL THEN
        INSERT INTO country (country, last_update)
        VALUES (Pais, NOW());
        SET v_country_id = LAST_INSERT_ID();
    END IF

    -- 2. Verifica ou insere a cidade
    SELECT city_id INTO v_city_id
    FROM city
    WHERE LOWER(city) = LOWER(Cidade) AND country_id = v_country_id
    LIMIT 1;


    IF v_city_id IS NULL THEN
        INSERT INTO city (city, country_id, last_update)
        VALUES (Cidade, v_country_id, NOW());

        SET v_city_id = LAST_INSERT_ID();

    -- 3. Insere o endereço
    INSERT INTO address (address, district, city_id, postal_code, phone, last_update)
    VALUES (Endereco, Bairro, v_city_id, Cep, 'N/A', NOW());

    SET v_address_id = LAST_INSERT_ID();

    -- 4. Atualiza o cliente com o novo endereço
    UPDATE customer
    SET address_id = v_address_id
    WHERE customer_id = IdCliente;

    RETURN v_address_id;
    END IF;

    

END;

select * from country;

select * from city;