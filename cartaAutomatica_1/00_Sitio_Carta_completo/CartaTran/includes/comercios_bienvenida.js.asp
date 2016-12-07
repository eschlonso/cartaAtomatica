<%
	if(Request.Form("strComercioIdSucursalTAId").item) {
		var arrValues = String(Request.Form("strComercioIdSucursalTAId")).split(":")
		Session("UserId")   = arrValues[0]
		Session("Sucursal") = arrValues[1]
		
	}

	// Consulta en la base de datos
	sQuery  = "EXEC esp_COMERCIOS_FechasLiquidacion " + Session("UserId") + ", " + Session("Sucursal")
	
	objDB.query(sQuery)

	var arrFechas = new Array()
	i = 0
	while(strRecord = objDB.each()) {
		arrFechas[i] = strRecord.Dia
		i++
	}

	// Consulta en la base de datos
	sQuery  = "EXEC esp_COMERCIOS_LOGIN_Consultas"
	sQuery += " '' ,"
	sQuery += Session("userId") + ", "
	sQuery += Session("Sucursal")
	
	objDB.query(sQuery)

	strRecord = objDB.each()

	// Defino valores para los tags del template
	var arrStrContentParams = {
		"domicilio"     : strRecord.Domicilio + Session("UserId") + "  -" + Session("Sucursal"),
		"provincia"     : strRecord.Provincia,
		"localidad"     : strRecord.Localidad,
		"cp"            : strRecord.CP,
		"telefono"      : strRecord.Telefonos,
		"cuit"          : strRecord.CUIT,
		"ib"            : Number(strRecord.IngresosBrutos),
		"arancel"       : strRecord.ArancelDescuento,
		"plazo"         : strRecord.PlazoPago,
		"orden"         : strRecord.OrdenCheque,
		"fechas"        : arrFechas.join(" - ")
	}
%>