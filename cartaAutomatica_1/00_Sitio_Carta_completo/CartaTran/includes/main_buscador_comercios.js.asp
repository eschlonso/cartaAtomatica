<%
	// Creo objeto template para generar rows
	objRowTemplate = new Template()
		objRowTemplate.strBody = "<tr valign=\"top\" bgcolor=\"#F1F9FE\"><td class=\"hometexto\"><b>%strRowComercio%</b></td><td class=\"hometexto\">%strRowDomicilio%</td><td class=\"hometexto\">%strRowLocalidad%%strRowProvincia%</td><td class=\"hometexto\">%strRowTelefonos%</td></tr>"

	var strSucursalId = Request("strSucursalId").item ? Request("strSucursalId").item : false
	var strRubroId    = Request("strRubroId").item    ? Request("strRubroId").item    : false
	var strComercio   = Request("strComercio").item   ? Request("strComercio").item   : "" //false
	var intRowFrom    = Request("intRowFrom").item    ? Number(Request("intRowFrom")) : 0

	var intCantidadRegistros = 0

	var intRowsToShow = 100

//	if(!strSucursalId || !strRubroId || !strComercio || !(intRowFrom%intRowsToShow == 0)) {
//		Response.Redirect("default.asp")
//		Response.End()
//	}

	// Armo el query
	strQuery  = "EXEC esp_COMERCIOS_Buscador "
	strQuery += strSucursalId + ", "
	strQuery += strRubroId + ", '"
	strQuery += strComercio + "'"
	
	// Valores default
	var arrParams = {
		"strRowComercio"  :"",
		"strRowDomicilio" :"",
		"strRowLocalidad" :"",
		"strRowProvincia" :"",
		"strRowTelefonos" :""
	}

	// Consulta en la base de datos
	if(objDB.query(strQuery)) {
		var intTotalRows  = objDB.rec.RecordCount

		// Muevo el cursor hasta el primer registro que quiero mostrar
		objDB.rec.Move(intRowFrom)

		for(var i = 1; (rsComercio = objDB.each()) && i <= intRowsToShow; i++) {
			arrParams["strRowComercio"]  = "<b>" + rsComercio.NombreFantasia + "</b>"
			arrParams["strRowDomicilio"] = rsComercio.Domicilio
			arrParams["strRowLocalidad"] = rsComercio.Localidad
			arrParams["strRowProvincia"] = rsComercio.Provincia ? "<br>" + rsComercio.Provincia : ""
			arrParams["strRowTelefonos"] = rsComercio.Telefonos
			CantidadRegistros  = rsComercio.Cantidad
	
			objRowTemplate.add(arrParams)
			
		
		}

		// Navegación
		var strNavegacion = ""
		
	if(intCantidadRegistros >= intRowsToShow) {
		strNavegacion  = "AAAA"
		}



//COMENTADO POR ARIEL
		// Si en total se mostraron más registros de los establecidos por página
//		if(intRowFrom >= intRowsToShow) {
//			// Muestro flecha de retroceso
//			strNavegacion += "<A HREF=\"default.asp?strSection=main&strContentType=buscador_comercios&intRowFrom=" + (intRowFrom - intRowsToShow) + "&strSucursalId=" + strSucursalId + "&strRubroId=" + strRubroId + "&strComercio=" + strComercio + "\" STYLE=\"color: #990099;\"><<</A>"
//		}

//		strNavegacion += "&nbsp;&nbsp;" + String((intRowFrom + intRowsToShow) > intTotalRows ? intTotalRows : intRowFrom + intRowsToShow) + " de " + String(intTotalRows) + "&nbsp;&nbsp;"

		// Si aún no se mostraron todos los registros que hay en la base
//		if((intRowFrom + intRowsToShow) < intTotalRows) {
			// Muestro flecha de avance
//			strNavegacion += "<A HREF=\"default.asp?strSection=main&strContentType=buscador_comercios&intRowFrom=" + (intRowFrom + intRowsToShow) + "&strSucursalId=" + strSucursalId + "&strRubroId=" + strRubroId + "&strComercio=" + strComercio + "\" STYLE=\"color: #990099;\">>></A>"
//		}



		var arrStrContentParams = {
			"strRow"        : objRowTemplate.getContent(),
			"strNavegacion" : strNavegacion
		}
	} else {
		var arrStrContentParams = {
			"strRow"        : "<tr><td class=\"grilla\" colspan=\"4\" ALIGN=\"center\">No se encontraron resultados</td></tr>",
			"strNavegacion" : ""
		}
	}
%>