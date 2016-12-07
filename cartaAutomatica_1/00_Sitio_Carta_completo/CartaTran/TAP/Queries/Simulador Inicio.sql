ALTER PROCEDURE esp_ePlanes
AS
SET NOCOUNT ON

TRUNCATE TABLE ePlanes

INSERT INTO ePlanes
SELECT	DISTINCT GR.GrupoID,
	Pl.codigo_plan 'PlanID', 
	CAST(PL.Cuotas AS VARCHAR)  + ' CUOTA/S - ' + TP.Descripcion 'Descripcion', 
	PL.Cuotas,
	PL.TipoPlan,
	PL.Tasa, 
	PL.TasaSeguroDesempleo, 
	PL.credcondni
FROM	CreditosTA..GrupoDetalle GD
	INNER JOIN CreditosTA..Planes PL
		ON GD.ComercioID = PL.codigo_com
	INNER JOIN CreditosTA..TipoPlan TP
		ON TP.TipoPlan = PL.TipoPlan
	INNER JOIN CreditosTA..Grupo GR
		ON GD.GrupoID = GR.GrupoID
		AND GR.ProductoID = 0
WHERE	PL.FechaDesde <= GETDATE()    
AND	(PL.FechaHasta >= GETDATE()  OR PL.FechaHasta IS NULL) 
AND	PL.nuevo_renu  = 'R'
AND	PL.adelantado = 'V'
AND	PL.credcondni = 0
AND	PL.Estado = 0
ORDER BY PL.Cuotas, CAST(PL.Cuotas AS VARCHAR)  + ' CUOTA/S - ' + TP.Descripcion
