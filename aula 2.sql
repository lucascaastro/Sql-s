INSERT INTO tb_escolaridade(id_escolaridade,ds_escolaridade, fg_ativo)
VALUES
(1,'Ensino Fundamental',true),
(2,'Ensino Medio',true),
(3,'Ensino Superior',true),
(4,'Pos Graduacao',true);


Select *
from tb_funcionario

SELECT (CASE
	WHEN salario BETWEEN 500.00 AND 1500.00 THEN 'Nível A'
	WHEN salario BETWEEN 1501.00 AND 2500.99 THEN 'Nível B'
	WHEN salario BETWEEN 2501.00 AND 3500.00 THEN 'Nível C'
	WHEN salario BETWEEN 3501.00 AND 4500.99 THEN 'Nível D'
	WHEN salario BETWEEN 4501.00 AND 5500.00 THEN 'Nível E'
	WHEN salario BETWEEN 5501.00 AND 6500.99 THEN 'Nível F'
	ELSE 'Nível Salrial Desconhecido'
	END) AS "Classificação Salarial", COUNT(*)
FROM tb_funcionario f
JOIN tb_funcao fu ON (f.id_funcao = fu.id_funcao)
GROUP BY 1;

CREATE FUNCTION fn_inserir_funcao(p_ds_funcao tb_funcao.ds_funcao%TYPE,
				  p_salario tb_funcao.salario%TYPE,
		  p_fg_ativo tb_funcao.fg_ativo%TYPE) RETURNS varchar AS
$$
DECLARE 
  v_id_funcao tb_funcao.id_funcao%TYPE;
  v_resultado VARCHAR;

BEGIN 
  SELECT MAX(id_funcao) + 1 INTO v_id_funcao
  FROM tb_funcao;

INSERT INTO tb_funcao
 VALUES 
 (v_id_funcao, p_ds_funcao, p_salario, p_fg_ativo);

 v_resultado := 'Função Inseridade com êxito - ID:' || v_id_funcao || 'Descrição: '
|| p_ds_funcao || 'salário:' || p_salario;

  RETURN v_resultado;
END;
$$
LANGUAGE plpgsql;  

SELECT fn_inserir_funcao('Funcao Nivel |',777.88,true);

select * 
from tb_funcao

