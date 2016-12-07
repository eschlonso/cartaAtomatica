<%
// Como la base está muy incompleta, harcodeo la fecha para poder ver resultados
 strHoy = new Date()


// ########## LIQUIDACIONES PREVIAS (DEL MES)
	// Creo objeto template para generar rows
	objLiqPrevMesTemplate = new Template()
		objLiqPrevMesTemplate.strBody = "<tr bgcolor=\"#F1F9FE\" align=\"center\"><td width=\"105\">%liqPrevFecha%</td><td width=\"130\">%liqPrevId%</td><td width=\"70\" align=\"right\" class=\"total\">%liqPrevBruto%</td><td width=\"70\" align=\"right\" class=\"total\">%liqPrevImporte%</td><td width=\"80\">%liqPrevFechaPago%</td><td width=\"80\">%liqPrevImage%</td></tr>"

	// Seteo defaults para cada columna.
	var arrParams = {
		"liqPrevFecha"   : "-",
		"liqPrevId"      : "-",
		"liqPrevImporte" : "-",
		"liqPrevBruto" : "-",
		"liqPrevImage"   : "-",
		"liqPrevFechaPago" : "-"
	}

	// Consulta en la base de datos
	strQuery = "EXEC esp_COMERCIOS_Liquidacion_New " + Session("UserId") + ", " + Session("Sucursal") + ", 1"

	// Si el query trae datos, mostraré los datos. Sino, quedarán los guiones.
	if(objDB.query(strQuery)) {
		while(rsLiquidacion = objDB.each()) {
			arrParams["liqPrevFecha"]   = formatDate(rsLiquidacion.FechaPresentacion, 0)
			arrParams["liqPrevId"]      = rsLiquidacion.LiquidacionId,
			arrParams["liqPrevImporte"] = rsLiquidacion.Neto.toFixed(2)
			arrParams["liqPrevBruto"] = rsLiquidacion.TotalBruto.toFixed(2)
			arrParams["liqPrevFechaPago"]   = formatDate(rsLiquidacion.FechaPago, 0)
			arrParams["liqPrevImage"]   = "<A href=\"#\" onClick=\"JavaScript: window.open('popup_comercios_liquidacion_detalle.asp?LiquidacionId=" + rsLiquidacion.LiquidacionId + "', 'liquidacion', 'scrollbars=yes,width=600,height=400');\"><IMG class=\"image\" src=\"images/ic_verinfo.gif\" width=\"67\" height=\"12\"/></A>"
			objLiqPrevMesTemplate.add(arrParams)
		}
	} else {
		objLiqPrevMesTemplate.add(arrParams)
	}

// ########## LIQUIDACIONES PREVIAS (MESES ANTERIORES)
	// Creo objeto template para generar rows
	objLiqPrevMesAntTemplate = new Template()
		objLiqPrevMesAntTemplate.strBody = "<tr bgcolor=\"#F1F9FE\" align=\"center\"><td width=\"105\">%liqPrevFecha%</td><td width=\"130\">%liqPrevId%</td><td width=\"70\" align=\"right\" class=\"total\">%liqPrevBruto%</td><td width=\"70\" align=\"right\" class=\"total\">%liqPrevImporte%</td><td width=\"80\">%liqPrevFechaPago%</td><td width=\"80\">%liqPrevImage%</td></tr>"

	// Seteo defaults para cada columna.
	var arrParams = {
		"liqPrevFecha"   : "-",
		"liqPrevId"      : "-",
		"liqPrevImporte" : "-",
		"liqPrevBruto"   : "-",
		"liqPrevImage"   : "-",
		"liqPrevFechaPago" : "-"
	}

	// Consulta en la base de datos
	strQuery = "EXEC esp_COMERCIOS_Liquidacion_New " + Session("UserId") + ", " + Session("Sucursal") + ", 2"

	// Si el query trae datos, mostraré los datos. Sino, quedarán los guiones.
	if(objDB.query(strQuery)) {
		while(rsLiquidacion = objDB.each()) {
			arrParams["liqPrevFecha"]   = formatDate(rsLiquidacion.FechaPresentacion, 0)
			arrParams["liqPrevId"]      = rsLiquidacion.LiquidacionId
			arrParams["liqPrevImporte"] = rsLiquidacion.Neto.toFixed(2)
			arrParams["liqPrevBruto"] = rsLiquidacion.TotalBruto.toFixed(2)
			arrParams["liqPrevFechaPago"]   = formatDate(rsLiquidacion.FechaPago, 0)
			arrParams["liqPrevImage"]   = "<a href=\"#\" onClick=\"JavaScript: window.open('popup_comercios_liquidacion_detalle.asp?LiquidacionId=" + rsLiquidacion.LiquidacionId + "', 'liquidacion', 'scrollbars=yes,width=600,height=400');\"><IMG class=\"image\" src=\"images/ic_verinfo.gif\" width=\"67\" height=\"12\"/></A>"
			objLiqPrevMesAntTemplate.add(arrParams)
		}
	} else {
		objLiqPrevMesAntTemplate.add(arrParams)
	}

// ########## ULTIMA LIQUIDACION EMITIDA
	// Consulta en la base de datos
	strQuery = "EXEC esp_COMERCIOS_Liquidacion_New " + Session("UserId") + ", " + Session("Sucursal") + ", 3"
	var arrUltLiq = {
		"fecha"   : "-",
		"id"      : "-",
		"importe" : "-",
		"bruto" : "-",
		"fechapago" : "-"		
	}

	if(objDB.query(strQuery)) {
		strRecord = objDB.each()

		arrUltLiq["fecha"]   = formatDate(strRecord.FechaPresentacion, 0)
		arrUltLiq["id"]      = strRecord.LiquidacionId
		arrUltLiq["importe"] = strRecord.Neto.toFixed(2)
		arrUltLiq["bruto"] = strRecord.TotalBruto.toFixed(2)
		arrUltLiq["fechapago"]   = formatDate(strRecord.FechaPago, 0)
	}

// ########## DATOS DEL COMERCIO
	// Consulta en la base de datos
	sQuery  = "EXEC esp_COMERCIOS_LOGIN_Consultas"
	sQuery += " '' ,"
	sQuery += Session("userId") + ", "
	sQuery += Session("Sucursal")

	objDB.query(strQuery)
	strRecord= objDB.each()


	// Defino valores para los tags del template
	var arrStrContentParams = {
		"domicilio"     : strRecord.Domicilio,
		"provincia"     : strRecord.Provincia,
		"localidad"     : strRecord.Localidad,
		"cp"            : strRecord.CP,
		"telefono"      : strRecord.Telefonos,
		"cuit"          : strRecord.CUIT,
		"ib"            : Number(strRecord.IngresosBrutos),
		"arancel"       : strRecord.ArancelDescuento,
		"plazo"         : strRecord.PlazoPago,
		"orden"         : strRecord.OrdenCheque,
		"liqPrevMes"    : objLiqPrevMesTemplate.getContent(),
		"liqPrevMesAnt" : objLiqPrevMesAntTemplate.getContent(),
		"ultLiqFecha"   : arrUltLiq["fecha"],
		"ultLiqId"      : arrUltLiq["id"],
		"ultLiqImporte" : arrUltLiq["importe"],
		"ultLiqBruto" : arrUltLiq["bruto"],
		"ultLiqFechaPago" : arrUltLiq["fechapago"]
	}


%>