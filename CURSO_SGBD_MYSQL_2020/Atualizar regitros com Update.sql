-- atualizar registros
-- modificar informações de um determinado registro
-- sintaxe:
-- UPDATE nome_tabela SET coluna_que_vai_sofrer_alteraçõa = novo_valor WHERE coluna = valor_filtro;
--                                                                     (Qual registro vai ser alterado)
-- se não usar o where para filtrar, pode acabar alterando todos os registros de uma tabela

-- EX:
UPDATE livro SET nome_livro = "SSH, Shel Seguro" WHERE id_livro = 9;

select * from livro;