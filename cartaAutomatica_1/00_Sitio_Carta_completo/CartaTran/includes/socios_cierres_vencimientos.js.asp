<%

	function formatearPeriodo(sPeriodo) {
		var periodo = String(sPeriodo)
		return periodo.substr(4, 2) + "/" + periodo.substr(0, 4)
	}

	// Consulta en la base de datos
	var periodoActual
	var periodoResumen
	var periodoProx
	strQuery = "EXEC esp_INFOSYS"
	objDB.query(strQuery)
	rs = objDB.each()
	periodoResumen = rs.CalenPeriodoAnterior1
	periodoActual = rs.CalenPeriodoActual
	periodoProx = rs.CalenPeriodoPosterior
	
	sQuery  = " UP_CuentaPeriodoResumenCabecera_VISTA " + Session("userId") + ", " + periodoResumen
	
	
	//sQuery  = " esp_CIERRES_VENCIMIENTOS_Informacion " + Session("userId")

	objDB.query(sQuery)

	strRecord = objDB.each()

	//strActualPeriodo     = formatPeriodo(strRecord.ACTUAL_CalenPeriodo)
	//strActualCierre      = formatDate(strRecord.ACTUAL_Cierre, 0)
	//strActualVencimiento = formatDate(strRecord.ACTUAL_Vencimiento, 0)

	
	//strProximoPeriodo  = formatPeriodo(strRecord.PROXIMO_CalenPeriodo)
	//strProximoCierre   = formatDate(strRecord.PROXIMO_Cierre, 0)
	//strProximoVencimiento = formatDate(strRecord.PROXIMO_Vencimiento, 0)
	
	//strAnteriorPeriodo = formatPeriodo(strRecord.ANTERIOR_CalenPeriodo, 0)
	//strAnteriorCierre = formatDate(strRecord.ANTERIOR_Cierre, 0)
	//strAnteriorVencimiento = formatDate(strRecord.ANTERIOR_Vencimiento, 0)

	strActualPeriodo     = formatearPeriodo(periodoActual)
	strActualCierre      = formatDate(strRecord.CalenCierreFecha, 0)
	strActualVencimiento = formatDate(strRecord.CalenVenciMiniPagoFecha, 0)

	
	strProximoPeriodo  = formatearPeriodo(periodoProx)
	strProximoCierre   = formatDate(strRecord.CalenCierreFechaProx, 0)
	strProximoVencimiento = formatDate(strRecord.CalenVenciMiniPagoFechaProx, 0)
	
	strAnteriorPeriodo = formatearPeriodo(periodoResumen)
	strAnteriorCierre = formatDate(strRecord.CalenCierreFechaAnte, 0)
	strAnteriorVencimiento = formatDate(strRecord.CalenVenciMiniPagoFechaAnte, 0)
	
	// Defino valores para los tags del template
	var arrStrContentParams = {
		"strAnteriorPeriodo"     : strAnteriorPeriodo,
		"strAnteriorCierre"      : strAnteriorCierre,
		"strAnteriorVencimiento" : strAnteriorVencimiento,
		"strActualPeriodo"       : strActualPeriodo,
		"strActualCierre"        : strActualCierre,
		"strActualVencimiento"   : strActualVencimiento,
		"strProximoPeriodo"      : strProximoPeriodo,
		"strProximoCierre"       : strProximoCierre,
		"strProximoVencimiento"  : strProximoVencimiento
	}
%>