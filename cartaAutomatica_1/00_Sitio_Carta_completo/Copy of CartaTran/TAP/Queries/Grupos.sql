
 

ALTER PROCEDURE esp_eGrupos
AS
SET NOCOUNT ON

TRUNCATE TABLE eGrupos


IF EXISTS(SELECT * FROM sysindexes WHERE name like 'in_Grupo')
BEGIN
	 DROP INDEX eGrupos.in_Grupo
END
 

INSERT INTO eGrupos
SELECT	GD.*,
	CM.razocial 'Comercio',
	CS.nombre_sucursal 'Sucursal'
FROM	CreditosTA..GrupoDetalle GD
	INNER JOIN CreditosTA..Grupo GR
		ON GR.GrupoID = GD.GrupoID
		AND GR.ProductoID = 0
	INNER JOIN CreditosTA..Comercios CM
		ON CM.Codigo = GD.ComercioID
	INNER JOIN CreditosTA..ComerSuc CS
		ON CS.Codigo = GD.ComercioID
		AND CS.suc_comer = GD.SucursalID

CREATE INDEX in_Grupo ON eGrupos(GrupoID)