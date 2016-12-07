<%
	// Creo objeto template para generar rows
	objPlanesTemplate = new Template()
		objPlanesTemplate.strDelimiter = "%"
//		objPlanesTemplate.strBody = "<tr align=\"center\" bgcolor=\"#F1F9FE\"><td width=\"105\">%planesCuotas%</td><td><img border=0 src=%imagen% width=130 height=71.5></td></tr>"
		objPlanesTemplate.strBody = "<tr align=\"center\" bgcolor=\"#F1F9FE\"><td width=\"105\">%planesCuotas%</td><td>%imagen%</td></tr>"
 
	var arrParams = {
		"planesCuotas"     :"  ",
		"planesArancel"    :"  ",
		"planesDiasPago"   :"  ",
		"planesSinInteres" :"  ",
		"imagen"		   :"  "
	}

	// Consulta en la base de datos
	sQuery  = " EXEC esp_COMERCIOS_Planes_Vigentes " + Session("UserId") +", " + Session("Sucursal")

	if(objDB.query(sQuery)) {
		while(strRecord = objDB.each()) {
			arrParams["planesCuotas"]     = strRecord.Descripcion
			arrParams["planesArancel"]    = strRecord.ArancelDescuento
			arrParams["planesDiasPago"]   = strRecord.PlazoPago
			arrParams["planesSinInteres"] = strRecord.InteresSocio == 0 ? "No" : "Sí"
			arrParams["imagen"] = strRecord.Imagen

			objPlanesTemplate.add(arrParams)
		}
	} else {
		objPlanesTemplate.add(arrParams)
	}

	// Defino valores para los tags del template
	var arrStrContentParams = {
		"planes" : objPlanesTemplate.getContent()
	}
%>