/*
SELECT	*
FROM	Autorizacion
WHERE	AutorizacionEstadoID = 0 AND AutorizacionTipoID IN (1,2)
*/


DECLARE @LegajoCuentaID INT
SELECT	@LegajoCuentaID = 1405


DECLARE @LegajoID  INT,
	@GrupoID INT

SELECT	@LegajoID  = Legajo,
	@GrupoID = GrupoiD
FROM	LegajoCuenta
WHERE	LegajoCuentaID = @LegajoCuentaID

SELECT	*
FROM	_eCreditos
WHERE	LegajoCuentaID = 1405 @LegajoCuentaID
UNION
SELECT	AU.LegajoCuentaID,
	0 'CreditoID',
	AU.Tarjeta,
	CS.nombre_sucursal 'CreditoOrigen',
	AU.Fecha 'CreditoFecha',
	AU.MontoSolicitado 'CreditoMonto',
	AU.Cuotas 'CreditoCuotas',
	TP.Descripcion 'CreditoTipoPlan',
	AU.Cuotas 'CuotasPendientes',
	AU.CRFechaPrimerVencimiento 'VencimientoProximo',
	(AU.CRCuotaMonto *  AU.Cuotas) 'Saldo'
FROM	Autorizacion AU
	INNER JOIN ComerSuc CS
		ON AU.ComercioID = CS.Codigo
		AND AU.SucursalID = CS.suc_comer
	INNER JOIN TipoPlan TP	 (NOLOCK)
		ON AU.TipoPlan = TP.TipoPlan
WHERE	AU.AutorizacionTipoID IN (1,2)
AND	AU.Legajo =  @LegajoID
AND	AU.GrupoID = @GrupoID
AND	(AutorizacionEstadoID = 0 OR (AutorizacionEstadoID = 1 AND AutorizacionEstadoFecha > CAST(CAST(GETDATE() AS VARCHAR(11)) AS SMALLDATETIME)))
ORDER BY CreditoFecha

