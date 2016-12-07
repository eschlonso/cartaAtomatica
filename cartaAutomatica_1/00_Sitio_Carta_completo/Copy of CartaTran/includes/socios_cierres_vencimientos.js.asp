<%
	// Consulta en la base de datos
	sQuery  = " esp_CIERRES_VENCIMIENTOS_Informacion " + Session("userId")

	objDB.query(sQuery)

	strRecord = objDB.each()

	strActualPeriodo     = formatPeriodo(strRecord.ACTUAL_CalenPeriodo)
	strActualCierre      = formatDate(strRecord.ACTUAL_Cierre, 0)
	strActualVencimiento = formatDate(strRecord.ACTUAL_Vencimiento, 0)

	
	strProximoPeriodo  = formatPeriodo(strRecord.PROXIMO_CalenPeriodo)
	strProximoCierre   = formatDate(strRecord.PROXIMO_Cierre, 0)
	strProximoVencimiento = formatDate(strRecord.PROXIMO_Vencimiento, 0)
	
	strAnteriorPeriodo = formatPeriodo(strRecord.ANTERIOR_CalenPeriodo, 0)
	strAnteriorCierre = formatDate(strRecord.ANTERIOR_Cierre, 0)
	strAnteriorVencimiento = formatDate(strRecord.ANTERIOR_Vencimiento, 0)
	
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