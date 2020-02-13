## Triggers

### O que são Triggers?

O termo trigger (gatilho em inglês) define uma estrutura do banco de dados que funciona, como o nome sugere, como uma função que é disparada mediante alguma ação. Geralmente essas ações que disparam os triggers são alterações nas tabelas por meio de operações de inserção, exclusão e atualização de dados (insert, delete e update).

Um gatilho está intimamente relacionado a uma tabela, sempre que uma dessas ações é efetuada sobre essa tabela, é possível dispará-lo para executar alguma tarefa.


#### A sintaxe para criação de um trigger é a seguinte:
```sql
CREATE TRIGGER [NOME DO TRIGGER]
ON  [NOME DA TABELA]
[FOR/AFTER/INSTEAD OF]  [INSERT/UPDATE/DELETE]
AS
    --CORPO DO TRIGGER
```

#### **Exemplo:**
```sql
CREATE TRIGGER trgEnviarEmailAlunoNovo	
ON tblAluno 

FOR INSERT-- Para quando [inserir,alterar,excluir]
AS
BEGIN 
	DECLARE
		@IdAluno   int,
		@Nome 	   varchar(100);

		SELECT 
			@IdAluno = IdAluno,
			@Nome = Nome
		FROM 
			INSERTED -- Os dados que foram inseridos na tabela

		INSERT INTO tblEnviarEmail	(Destinatario, Assunto,	Corpo )
		VALUES
		(
			'aluno.teste@email.com',
			'Novo aluno cadastrado',
			'Foi cadastrado o aluno codigo ' + CAST(@IdAluno AS VARCHAR) + ' nome ' + @Nome
		)		
END

SELECT * FROM tblAluno;
SELECT * FROM tblEnviarEmail;

```
