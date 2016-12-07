esp_Simulacion_MensajePosibilidad 18, 1, 432, 10000
EXEC esp_Simulacion 4440, 1, 432, 3

SELECT * FROM ePlanes

DECLARE @F VARCHAR(26) 

EXEC EROS.CreditosTA.dbo.esp_WEBTAP_Autorizaciones_PosibilidadDeCompra
	18, 
	0, 
	1605,  
	4, 
	1,
	0
	 


SELECT * FROM ePlanes WHERE ComercioID = 1605
SELECT * FROM eGrupos


CREATE TABLE #TEMP
(TipoInfo VARCHAR(1),
Adicional TINYINT,
TipoInformacion VARCHAR(5),
ClaveAsociada INT,
Fecha	SMALLDATETIME,
ComercioID INT,
Comercio  VARCHAR(100),
SucursalID TINYINT,
Sucursal VARCHAR(100),
Cuota 	TINYINT,
Monto   SMALLMONEY,
MontoSinInteres SMALLMONEY,
FechaVencimiento SMALLDATETIME)

INSERT INTO #TEMP 
EXEC esp_Simulacion 4440, 1, 640, 500

SELECT 	FechaVencimiento, SUM(Monto)
FROM	#TEMP
WHERE	TipoInfo = 'C'
GROUP BY FechaVencimiento
UNION
SELECT 	FechaVencimiento, SUM(Monto)
FROM	#TEMP
WHERE	TipoInfo = 'X'
GROUP BY FechaVencimiento







ALTER PROCEDURE esp_Simulacion 
(@LegajoCuentaID INT,
@ClaveID	INT,
@PlanID		INT,
@Monto		SMALLMONEY)
AS
SET NOCOUNT ON
SET REMOTE_PROC_TRANSACTIONS OFF


DECLARE @ComercioID 	INT,
	@SucursalID	TINYINT


SELECT	@ComercioID = ComercioID,
	@SucursalID = SucursalID
FROM	eGrupos
WHERE	ClaveID = @ClaveID


EXEC EROS.CREDITOSTA.DBO.esp_WEBTAP_Simulacion @LegajoCuentaID, @ComercioID, @SucursalID, @PlanID, @Monto

/*
CREATE TABLE #TEMP
(TipoInfo VARCHAR(1),
Adicional TINYINT,
TipoInformacion VARCHAR(5),
ClaveAsociada INT,
Fecha	SMALLDATETIME,
ComercioID INT,
Comercio  VARCHAR(100),
SucursalID TINYINT,
Sucursal VARCHAR(100),
Cuota 	TINYINT,
Monto   SMALLMONEY,
MontoSinInteres SMALLMONEY,
FechaVencimiento SMALLDATETIME)

INSERT INTO #TEMP 
EXEC esp_Simulacion 4440, 1, 640, 500
*/
GO





ALTER PROCEDURE esp_Simulacion_MensajePosibilidad
(@LegajoCuentaID INT,
@ClaveID	INT,
@PlanID		INT,
@Monto		SMALLMONEY)
AS
SET NOCOUNT ON
SET REMOTE_PROC_TRANSACTIONS OFF


DECLARE @ComercioID 	INT,
	@SucursalID	TINYINT,
	@TipoPlan TINYINT,
	@Fecha	SMALLDATETIME


DECLARE @Resultado VARCHAR(26)


SELECT @Fecha = GETDATE()


SELECT	@ComercioID = ComercioID,
	@SucursalID = SucursalID
FROM	eGrupos
WHERE	ClaveID = @ClaveID


SELECT	@TipoPlan = TipoPlan
FROM	ePlanes
WHERE	PlanID = @PlanID


EXEC EROS.CreditosTA.dbo.sp_Autorizaciones_PosibilidadDeCompra
	@LegajoCuentaID, 
	0, 
	@ComercioID,  
	@SucursalID, 
	@Monto,
	@TipoPlan,
	@Fecha,
	@Resultado OUT

SELECT @Resultado 'Resultado'
GO