ALTER PROCEDURE esp_eGrupos
AS
SET NOCOUNT ON

TRUNCATE TABLE eCuentas

IF EXISTS(SELECT * FROM sysindexes WHERE name like 'in_eCuentasLegajoCuenta')
BEGIN
	 DROP INDEX eCuentas.in_eCuentasLegajoCuenta
END
 

INSERT INTO eCuentas
SELECT	LegajoCuentaID,
	LC.GrupoID,
	LG.Nombre,
	LG.Tip_Doc 'TipoDocumento',
	LG.Documento 'NumDocumento',
	LC.Legajo,
	LC.Comercio,
	LC.Sucursal,
	LegajoCuentaEstadoID
FROM	CreditosTA..LegajoCuenta LC
	INNER JOIN CreditosTA..Grupo GR
		ON GR.GrupoID = LC.GrupoID
		AND GR.ProductoID = 0
	INNER JOIN CreditosTA..Legajos LG
		ON LG.Codigo = LC.Legajo

CREATE INDEX in_eCuentasLegajoCuenta ON eCuentas(LegajoCuentaID)