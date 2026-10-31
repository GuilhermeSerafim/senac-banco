# Banco de dados — estudos no Senac

Acervo acadêmico de exercícios SQL e modelagem de dados. O contexto declarado do repositório é o estudo de bancos de dados no Senac, incluindo materiais de Oracle. Os arquivos devem ser lidos como atividades de aprendizagem, com requisitos e dialetos próprios.

## Organização

- `aulas/`: anotações de consultas e exemplos de triggers.
- `exercicios/`: exercícios SQL separados.
- `projetos/distribuicao-de-produtos-nacionais/`: enunciado e modelos hierárquico e recursivo para regiões, distritos, territórios e áreas de vendas.

## Antes de executar

Não há um script único de instalação. `aulas/estrutura.sql` é um esquema didático de cláusulas de consulta, não uma consulta completa. `aulas/aula01/trigger.sql` contém sintaxe como `AUTO_INCREMENT` e exemplos de alteração de tabelas e dados; não deve ser assumido compatível diretamente com Oracle. Nesse arquivo, os inserts usam `quantidade`, mas a tabela declara `qtdProduto`, ponto que requer revisão antes de execução.

Escolha um exercício, confira seu dialeto e use uma base descartável de estudo.
