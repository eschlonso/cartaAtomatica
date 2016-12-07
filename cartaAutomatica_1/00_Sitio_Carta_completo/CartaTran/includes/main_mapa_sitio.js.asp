<%
	var exclusivoSocios = ""
	var exclusivoComercios = ""
	switch(Session("validation")) {
		case "socio" :
			objTextStream = objFile.OpenTextFile(Server.MapPath("templates/main_mapa_sitio_socios.tpl"), 1, false)
			while (!objTextStream.AtEndOfStream) {
				exclusivoSocios += objTextStream.ReadLine() + "\n"
			}
			break

		case "comercio" :
			objTextStream = objFile.OpenTextFile(Server.MapPath("templates/main_mapa_sitio_comercios.tpl"), 1, false)
			while (!objTextStream.AtEndOfStream) {
				exclusivoComercios += objTextStream.ReadLine() + "\n"
			}
			break
	}

	var arrStrContentParams = {
		"EXCLUSIVO_SOCIOS" : exclusivoSocios,
		"EXCLUSIVO_COMERCIOS" : exclusivoComercios
	}
%>