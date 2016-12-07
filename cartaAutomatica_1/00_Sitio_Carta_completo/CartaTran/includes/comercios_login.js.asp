<%
	// Consulta en la base de datos
	strQuery  = "EXEC esp_COMERCIOS_LOGIN_Consultas '" + Session("cuit") + "' , 0, 0"

	objDB.query(strQuery)



//	rsComercios = objDB.each()

//	if(rsComercios.Cantidad > 0) {

		// Creo objeto template para generar rows
		objTplOption = new Template()
		objTplOption.strBody = "<OPTION VALUE=\"%strComercioId%:%strSucursalTAId%\">%strComercioId% - %strSucursalTAId% %strNombreFantasia%</OPTION>"

		var arrParams = {
			"strComercioId"     : "",
			"strSucursalTAId"   : "",
			"strNombreFantasia" : ""
		}

		while(rsComercios = objDB.each()) {
			var arrParams = {
				"strComercioId"     : rsComercios.ComercioId,
				"strSucursalTAId"   : rsComercios.SucursalId,
				"strNombreFantasia" : rsComercios.NombreFantasia

			} 

			objTplOption.add(arrParams)
		}
//		}
//	} else {
//		rsComercios = objDB.each()
//		Session("Sucursal") = rsComercios.SucursalId,
//		Session("userId")   = rsComercios.ComercioId
//		Response.Redirect("default.asp?strSection=comercios&strContentType=bienvenida")
//	}



	// Defino valores para los tags del template
	var arrStrContentParams = {
		"strOptions" : objTplOption.getContent()
	}
%>