<%
	// Creo objeto template para generar rows
	tRow = new Template()

	// leo el template con el html necesario para cada row
	fTemplate = objFile.OpenTextFile(Server.MapPath("templates/main_socios_promociones_row.tpl"), 1, false)
	while(!fTemplate.AtEndOfStream) {
		tRow.strBody += fTemplate.ReadLine() + "\n"
	}
	fTemplate.Close()

	// PROMOCIONES GENERICAS
	// Valores default
	var aParams = {
		"sTitulo"      : "",
		"sDescripcion" : "No hay promociones por el momento."
	}

	// Consulta en la base de datos
	sQuery  = "EXEC esp_PROMOCIONES_Consulta"

	if(objDB.query(sQuery)) {
		for(i = 0; (rs = objDB.each()) && i < 3; i++) {
			aParams["sTitulo"]      = rs.Titulo
			aParams["sDescripcion"] = rs.Descripcion
			tRow.add(aParams)
		}
	} else {
		tRow.add(aParams)
	}

	// Parseo y guardo en variable
	sPromGen = tRow.getContent()

	// Defino valores para los tags del template
	var arrStrContentParams = {
		"sPromGen": sPromGen
	}
%>