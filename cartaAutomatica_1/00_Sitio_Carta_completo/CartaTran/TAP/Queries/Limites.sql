 

CREATE TABLE #TEMP
(LgeajoCuentaID	INT,
Adicional	TINYINT,
Tipo		TINYINT,
LimiteMensual	SMALLMONEY,
LimiteGlobla	SMALLMONEY,
LimiteMensualExcedido	SMALLMONEY,
LimiteGlobalExcedido	SMALLMONEY)

INSERT INTO #TEMP
EXEC sp_CuentaLimitesDisponiblesDetalle  1405, 0


SELECT	AG.LimiteGlobalExcedido 'GlobalAsignado',
	DS.LimiteGlobalExcedido 'GlobalDisponible',
	AG.LimiteMensualExcedido 'MensualAsignado',
	DS.LimiteMensualExcedido 'MensualDisponible'
FROM	#TEMP AG
	INNER JOIN #TEMP DS
		ON AG.LgeajoCuentaID = DS.LgeajoCuentaID
WHERE	AG.Tipo = 0
AND	DS.Tipo = 1
	