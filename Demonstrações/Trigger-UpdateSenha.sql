CREATE DATABASE UpSenhaTrigger
go
Use UpSenhaTrigger
go
CREATE TABLE Usuarios(
	Id_Usuario	INT PRIMARY KEY IDENTITY,
	Nome		VARCHAR(100),
	Senha		VARCHAR(20)
	);
go
CREATE TABLE AlterarDados(
	NovaSenha	VARCHAR(20),
	Id_Alterado	INT
	);
	
	
	--==============TRIGGER===============
	CREATE TRIGGER TGR_AlterSenha
		ON AlterarDados
		FOR INSERT
		AS
		BEGIN
				DECLARE		@NOVASENHA		VARCHAR(20), 
							@Id_Alterado	INT

				SELECT
					@NOVASENHA = NovaSenha,
					@Id_Alterado = Id_Alterado
				FROM 
					INSERTED

			UPDATE Usuarios 
			SET Senha = @NOVASENHA
			WHERE @Id_Alterado = Id_Usuario
		END
	--=======================================

	INSERT INTO Usuarios(Nome,Senha)
	VALUES	('Cesar','cesar1221'),
			('Adriano','adrianolegal')
	
	INSERT INTO AlterarDados (NovaSenha, Id_Alterado)
	VALUES ('cesaraugusto',1)

	


