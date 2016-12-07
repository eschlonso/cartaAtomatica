CREATE TABLE [USER_Socio] (
	USER_SocioID int IDENTITY (1, 1) NOT NULL ,
	LegajoCuentaID int NOT NULL ,
	GrupoID	INT NOT NULL,
	TipoDocumento VARCHAR(1) NOT NULL ,
	NumDocumento int,
	Password varchar (10) NOT NULL ,
	Estado tinyint NULL ,
	EstadoFecha datetime NULL ,
	EstadoUsuario varchar (30) NULL ,
	 PRIMARY KEY  CLUSTERED 
	(
		[USER_SocioID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

INSERT INTO USER_Socio (LegajoCuentaID, GrupoID, TipoDocumento, NumDocumento, Password, Estado, EstadoFecha, EstadoUsuario)
VALUES (4440, 1, 'D', 20237413, '00', 0, GETDATE(), USER_NAME())
 
OnClick=form_name.submit()
esp_USER_SOCIO_Validar 1, 'D', 20237413, '00'
esp_USER_SOCIO_Validar 1, 'D', Pepe, ''


ALTER PROCEDURE esp_USER_SOCIO_Validar
(@GrupoID	INT,
@TipoDocumento VARCHAR(1),
@NumDocumento INT,
@Password VARCHAR(10))
AS
SET NOCOUNT ON

	SELECT	*
	FROM	USER_Socio
	WHERE	GrupoID = @GrupoID
	AND	TipoDocumento = @TipoDocumento
	AND	NumDocumento = @NumDocumento
	AND	UPPER(Password) = UPPER(@Password)


