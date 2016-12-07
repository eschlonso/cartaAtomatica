<%
	var sErrores = " "

	//Mail al cual se envía la solicitud
	sQuery  = " EXEC esp_InfoSys"

	objDB.query(sQuery)
	rs = objDB.each()
	
	sTo = rs.MailOperaciones
	

	// Consulta en la base de datos de la tabla de cuentas de socios
	// Los datos que pido están con seguridad porque estos campos son NOT_NULL
	sQuery  = " EXEC esp_SOCIO_DatosPersonales " + Session("userId")
	objDB.query(sQuery)
	rs = objDB.each()

	sNombres   = rs.nombres
	sApellidos = rs.apellidos
	sPassword  = rs.password
/*
	// Consulta en la tabla de socios (socios de TA, no socios del website).
	// Algunos de los datos que pido pueden no estar, porque la tabla no está completa.
	sQuery  = " SELECT"
	sQuery += "    s.FechaNacimiento,"
	sQuery += "    s.Direccion,"
	sQuery += "    s.Localidad,"
	sQuery += "    s.Provincia,"
	sQuery += "    s.Telefono,"
	sQuery += "    s.Email"
	sQuery += " FROM"
	sQuery += "    Socios s"
	sQuery += " WHERE"
	sQuery += "    s.IdTA = " + Session("userId")
	objDB.query(sQuery)
	rs = objDB.each()
*/
	if(rs.FechaNacimiento) {
		oDate = rs.FechaNacimiento

		sFechaD = (oDate.getDate() > 9) ? oDate.getDate() : "0" + oDate.getDate()
		sFechaM = (Number(oDate.getMonth()) + 1 > 9) ? String(Number(oDate.getMonth() + 1)) : "0" + String(Number(oDate.getMonth()) + 1)
		sFechaY = oDate.getYear()
		sFechaNacimiento = sFechaD + "/" + sFechaM + "/" + sFechaY
	} else {
		sFechaD = ""
		sFechaM = "00"
		sFechaY = ""
		sFechaNacimiento = ""
	}

	sDireccion = rs.Direccion ? rs.Direccion : ""
	sLocalidad = rs.Localidad ? rs.Localidad : ""
	sCP  	   = rs.CP  	  ? rs.CP        : ""
	sProvincia = rs.Provincia ? rs.Provincia : ""
	sTelefono  = rs.Telefono  ? rs.Telefono  : ""
	sEmail     = rs.Email     ? rs.Email     : ""

	// Si se hizo el submit con la info
	if(Request.Form("enviado").item) {
		var aCamposIncorrectos = new Array();

		// Hago validaciones
		if(Request.Form("strNombres").item) {
			sNombres = Request.Form("strNombres").item
			if(1 != 1) {
				aCamposIncorrectos.push("Nombres")
			}
		}

		if(Request.Form("strApellidos").item) {
			sApellidos = Request.Form("strApellidos").item
			if(1 != 1) {
				aCamposIncorrectos.push("Apellidos")
			}
		}

		if(Request.Form("strFechaD").item && Request.Form("strFechaM").item && Request.Form("strFechaY").item) {
				sFechaD = Request.Form("strFechaD").item
				sFechaM = Request.Form("strFechaM").item
				sFechaY = Request.Form("strFechaY").item
				sFechaNacimiento = formatDate(sFechaM + "/" + sFechaD + "/" + sFechaY, 0)
			if(1 != 1) {
				aCamposIncorrectos.push("Fecha de Nacimiento")
			}
		}

		if(Request.Form("strDireccion").item) {
			sDireccion = Request.Form("strDireccion").item
			if(1 != 1) {
				aCamposIncorrectos.push("Dirección")
			}
		}

		if(Request.Form("strLocalidad").item) {
			sLocalidad = Request.Form("strLocalidad").item
			if(1 != 1) {
				aCamposIncorrectos.push("Localidad")
			}
		}

		if(Request.Form("strProvincia").item) {
			sProvincia = Request.Form("strProvincia").item
			if(1 != 1) {
				aCamposIncorrectos.push("Provincia")
			}
		}

		if(Request.Form("strTelefono").item) {
			sTelefono = Request.Form("strTelefono").item
			if(1 != 1) {
				aCamposIncorrectos.push("Teléfono")
			}
		}

		if(Request.Form("strEmail").item) {
			sEmail = Request.Form("strEmail").item
			if(1 != 1) {
				aCamposIncorrectos.push("E-Mail")
			}
		}

		if(Request.Form("strPassword").item) {
			sPassword = Request.Form("strPassword").item
			if(1 != 1) {
				aCamposIncorrectos.push("Contraseña")
			}
		}

		// Si hubo errores
		if(aCamposIncorrectos.length > 0) {
			sErrores  = "<TABLE width=\"440\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-style: solid; border-width: 1px; border-color: #FF0000;\">"
			sErrores +="<TR>"
			sErrores +="<TD class=\"hometexto\">"
			for(i = 0; aCamposIncorrectos[i]; i++) {
				sErrores += "&nbsp;- El campo <B>" + aCamposIncorrectos[i] + "</B> tiene datos no válidos.<BR/>"
			}
			sErrores += "</TD>"
			sErrores += "</TR>"
			sErrores += "</TABLE>"
			sErrores += "<BR/>"

			aBlocks.push("MODIFICACION")
		} else {
			aBlocks.push("CONFIRMACION")
		}
	} else {
		aBlocks.push("MODIFICACION")
	}

	var arrStrContentParams = {
		"strNombres"         : sNombres,
		"strApellidos"       : sApellidos,
		"strFechaD"          : sFechaD,
		"strFechaM"          : sFechaM,
		"strFechaY"          : sFechaY,
		"strFechaNacimiento" : sFechaNacimiento,
		"strDireccion"       : sDireccion,
		"strLocalidad"       : sLocalidad,
		"strCP"       		 : sCP,
		"strProvincia"       : sProvincia,
		"strTelefono"        : sTelefono,
		"strEmail"           : sEmail,
		"strPassword"        : sPassword,
		"strErrores"         : sErrores,
		"strSocio"			 : Session("userId"),
		"strTo"			 	 : sTo
		
	}
%>