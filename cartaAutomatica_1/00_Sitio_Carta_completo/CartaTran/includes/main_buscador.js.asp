<%
	// Creo objeto template para generar rows
	//objRowTemplate = new Template()
	//	objRowTemplate.strBody = "<tr valign=\"top\" bgcolor=\"#F1F9FE\"><td class=\"comerciotexto\"><b>%strRowComercio%</b></td><td class=\"comerciotexto\">%strRowDomicilio%</td><td class=\"comerciotexto\">%strRowLocalidad%%strRowProvincia%</td><td class=\"comerciotexto\">%strRowTelefonos%</td></tr>"

	// Armo el query
	strQuery  = ""
	strQuery += "SELECT * "
	strQuery += "FROM Tabla "
	strQuery += "WHERE UPPER(campo_key) LIKE '%UPPER(" + Request.Form("txt_busqueda") + ")%' "
	strQuery += "ORDER BY Descripcion"
	Response.Write(strQuery)
	Response.End 

	// Valores default
	var arrParams = {
		"strRowDesc"  :"",
		"strRowLink"  :""
	}

	// Consulta en la base de datos
	if(objDB.query(strQuery)) 
	{
		while(strRecord = objDB.each()) 
		{
			arrParams["strDesc"] = strRecord.Descripcion
			arrParams["strLink"] = strRecord.Link

			objRowTemplate.add(arrParams)
		}

		var arrStrContentParams = {"strRow":objRowTemplate.getContent()}
	} 
	else
		var arrStrContentParams = {"strRow":"<tr><td class=\"grilla\" colspan=\"4\" ALIGN=\"center\">No se encontraron resultados</td></tr>"}
%>