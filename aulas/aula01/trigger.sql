create table produto (
    cdProduto int primary key AUTO_INCREMENT,
    descricao VARCHAR(30) not null,
    qtdProduto int,
    vrUnidade DECIMAL(9, 2)
);

insert into
    produto (
        descricao,
        quantidade,
        vrUnidade
    )
values ("Lapis", 50, 5.50);

insert into
    produto (
        descricao,
        quantidade,
        vrUnidade
    )
values ("Caneta", 50, 6.50);

create table venda (
    cdVenda int primary key AUTO_INCREMENT,
    cliente VARCHAR(30) not null,
    fkCdProduto int,
    Foreign Key (fkCdProduto) REFERENCES produto (cdProduto),
    qtdVendas int
);
-- Uma TRIGGER é um mecanismo no banco de dados que executa automaticamente uma ação sempre que um evento específico ocorre em uma tabela (como INSERT, UPDATE ou DELETE).
-- A TRIGGER baixa_estoque serve para atualizar automaticamente o estoque (qtdProduto) da tabela produto sempre que uma nova venda é registrada na tabela venda.

create TRIGGER baixa_estoque after insert on venda for each row
begin
    update produto set qtdProduto = qtdProduto - new.qtdVendas where cdProduto = new.fkCdProduto;
end;

insert into
    venda (
        cliente,
        `fkCdProduto`,
        `qtdVendas`
    )
VALUES ("João", 1, 5);


create trigger retorno_estoque after delete on venda for EACH row
begin
    update produto set `qtdProduto` = `qtdProduto` + old.qtdVendas where `cdProduto` = old.fkCdProduto;
end;


-- CRIANDO AUDITORIA
create table copia_produto as select * from produto;

select * from copia_produto;

TRUNCATE table copia_produto;

alter table copia_produto add COLUMN data_alteracao DATETIME;

alter table copia_produto add COLUMN usuario varchar(20);

CREATE TRIGGER auditoria_produto
AFTER UPDATE ON produto
FOR EACH ROW
BEGIN
    INSERT INTO copia_produto (cdProduto, descricao, vrUnidade, data_alteracao, usuario)
    VALUES (OLD.cdProduto, OLD.descricao, OLD.vrUnidade, NOW(), USER());
END;


-- Consulta para verificar os dados
SELECT * FROM produto;
UPDATE produto
SET qtdProduto = 100
WHERE cdProduto = 2;

select * from copia_produto;