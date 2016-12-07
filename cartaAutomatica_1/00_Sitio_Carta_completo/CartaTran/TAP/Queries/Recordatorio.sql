

CREATE PROCEDURE esp_eRecordatorios
AS
SET NOCOUNT ON
TRUNCATE TABLE eRecordatorios
IF EXISTS(SELECT * FROM sysindexes WHERE name like 'in_eRecordatoriosLegajoCuenta')
BEGIN
	 DROP INDEX eRecordatorios.in_eRecordatoriosLegajoCuenta
END
 


DECLARE	@GrupoID	INT,
	@ResumenPeriodoID INT
 
DECLARE CUR_Recordatorios CURSOR
READ_ONLY
FOR 	SELECT	RP.GrupoID, MAX(ResumenPeriodoID) 'ResumenPeriodoID'
	FROM	CreditosTA..ResumenPeriodo RP
		INNER JOIN CreditosTA..Grupo GR
			ON RP.GrupoID = RP.GrupoID
			AND GR.ProductoID = 0
	WHERE	Estado = 0
	GROUP BY RP.GrupoID

 
OPEN CUR_Recordatorios

FETCH NEXT FROM CUR_Recordatorios INTO @GrupoID, @ResumenPeriodoID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN

		INSERT INTO eRecordatorios
		EXEC  CreditosTA..sp_CuentaResumen NULL, @GrupoID, @ResumenPeriodoID, 1

	END
	FETCH NEXT FROM CUR_Recordatorios INTO  @GrupoID, @ResumenPeriodoID
END

CLOSE CUR_Recordatorios
DEALLOCATE CUR_Recordatorios


CREATE INDEX in_eRecordatoriosLegajoCuenta ON eRecordatorios (LegajoCuentaID)

