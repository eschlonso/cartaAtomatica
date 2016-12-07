ALTER PROCEDURE esp_eCreditos
AS
SET NOCOUNT ON
TRUNCATE TABLE eCreditos
DROP INDEX eCreditos.in_Full

IF EXISTS(SELECT * FROM sysindexes WHERE name like 'in_Full')
BEGIN
	 DROP INDEX eCreditos.in_Full
END



--ALMACENA LOS CREDITOS ACTIVOS
INSERT INTO eCreditos
SELECT	'C' TipoInfo,
	LC.LegajoCuentaID,
	CP.CreditoID,   
	CR.TarjetaNumero 'Tarjeta',
	CS.nombre_sucursal 'CreditoOrigen',
	CR.Fecha_Venta 'CreditoFecha',
	ROUND(CR.Monto,2) 'CreditoMonto',
	PL.cuotas 'CreditoCuotas',
	TP.Descripcion 'CreditoTipoPlan',
	CC.Importe 'CreditoCuotaMonto',
	CAST(CAST(MONTH(CP.FechaVencimiento) AS VARCHAR) + '/10/' + CAST(YEAR(CP.FechaVencimiento) AS VARCHAR) AS SMALLDATETIME) 'CreditoVencimientoProximo',
	CP.Cuota 'CreditoCuota',
	ROUND(CP.Cuota_Saldo,2) 'CreditoCuotaSaldo' 
FROM	CreditosTA..Creditos_Pendiente CP (NOLOCK)
	INNER JOIN CreditosTA..Grupo GR
		ON GR.GrupoID = CP.GrupoID
		AND GR.ProductoId = 0
	INNER JOIN CreditosTA..LegajoCuenta LC
		ON LC.Legajo = CP.LegajoID
		AND LC.GrupoID = GR.GrupoID
	INNER JOIN CreditosTA..Creditos CR (NOLOCK)
		ON CR.Numero = CP.CreditoID
	INNER JOIN CreditosTA..ComerSuc CS (NOLOCK)
		ON CS.suc_comer = CR.Suc_Comercio
		AND CS.Codigo = CR.Comercio
	INNER JOIN CreditosTA..Planes PL (NOLOCK)
		ON PL.codigo_plan = CR.cod_plan
	INNER JOIN CreditosTA..TipoPlan TP	 (NOLOCK)
		ON TP.TipoPlan = PL.TipoPlan
	INNER JOIN CreditosTA..CuotasCre CC (NOLOCK)
		ON CC.numero = CR.Numero
		AND CC.Cuota = 1




--ALMACENA LAS REFINANCIACIONES ACTIVAS
DECLARE @LegajoCuentaID INT,
	@Fecha	SMALLDATETIME

SELECT @Fecha = GETDATE()

DECLARE CUR_REFINANCIADOS CURSOR
READ_ONLY
FOR 
	SELECT	DISTINCT LC.LegajoCuentaID
	--INTO	#REF
	FROM	CreditosTA..Refinanciaciones_Activas RA
		INNER JOIN CreditosTA..Refinanciaciones_ActivasComposicion RAC
			ON RA.RefID = RAC.RefID
		INNER JOIN CreditosTA..Grupo GR
			ON GR.GrupoID = RAC.GrupoID
		INNER JOIN CreditosTA..LegajoCuenta LC
			ON LC.Legajo = RA.LegajoID
			AND LC.GrupoID = GR.GrupoID
	WHERE	GR.ProductoID = 0

OPEN CUR_REFINANCIADOS

FETCH NEXT FROM CUR_REFINANCIADOS INTO @LegajoCuentaID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		INSERT INTO eCreditos
		SELECT	'R' TipoInfo,
			@LegajoCuentaID LegajoCuentaID,
			RF.RefID,   
			0 'Tarjeta',
			'' 'CreditoOrigen',
			RF.FechaRef 'RefFecha',
			ROUND(RF.MontoRefinanciado,2) 'REFMonto',
			RF.Cuotas 'RefCuotas',
			'' 'CreditoTipoPlan',
			RC.Monto 'RefCuotaMonto',
			CAST(CAST(MONTH(CV.FechaVencimiento) AS VARCHAR) + '/10/' + CAST(YEAR(CV.FechaVencimiento) AS VARCHAR) AS SMALLDATETIME) 'CreditoVencimientoProximo',
			CV.Cuota 'REfCuota',
			ROUND(CV.Monto,2) 'REfCuotaSaldo' 
		
		FROM	CreditosTA.dbo.fn_Cuenta_Vencimientos(@LegajoCuentaID, @Fecha) CV
			INNER JOIN CreditosTA..Refinanciacion RF
				ON RF.RefID = CV.ClaveAsociada
			INNER JOIN CreditosTA..RefCuota RC
				ON RC.RefCuota = 1
				AND RC.RefID = RF.RefID
		WHERE	TipoInfo = 'R' 
	END
	FETCH NEXT FROM CUR_REFINANCIADOS INTO @LegajoCuentaID
END

CLOSE CUR_REFINANCIADOS
DEALLOCATE CUR_REFINANCIADOS
 
CREATE INDEX in_Full ON eCreditos (LegajoCuentaID, CreditoVencimientoProximo, CreditoFecha)

