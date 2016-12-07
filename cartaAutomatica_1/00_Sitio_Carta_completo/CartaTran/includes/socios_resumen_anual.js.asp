<%
	hoy = new Date()

	var arrMeses = new Array()
	arrMeses[1]  = "01/01/" + hoy.getYear()
	arrMeses[2]  = "01/02/" + hoy.getYear()
	arrMeses[3]  = "01/03/" + hoy.getYear()
	arrMeses[4]  = "01/04/" + hoy.getYear()
	arrMeses[5]  = "01/05/" + hoy.getYear()
	arrMeses[6]  = "01/06/" + hoy.getYear()
	arrMeses[7]  = "01/07/" + hoy.getYear()
	arrMeses[8]  = "01/08/" + hoy.getYear()
	arrMeses[9]  = "01/09/" + hoy.getYear()
	arrMeses[10] = "01/10/" + hoy.getYear()
	arrMeses[11] = "01/11/" + hoy.getYear()
	arrMeses[12] = "01/12/" + hoy.getYear()
	arrMeses[13] = "01/01/" + (hoy.getYear() + 1)

	
	// Creo objeto template para generar rows
	objRowSemestre1 = new Template()
	objRowSemestre2 = new Template()
		objRowSemestre1.strDelimiter = "%"
		objRowSemestre2.strDelimiter = "%"

		// Leo el archivo template y se los asigno a los Bodies de los objetos template
		objTextStream = objFile.OpenTextFile(Server.MapPath("templates/socios_resumen_anual_row.tpl"), 1, false)
		while (!objTextStream.AtEndOfStream) {
			objRowSemestre1.strBody = objRowSemestre2.strBody += objTextStream.ReadLine() + "\n"
		}
		objTextStream.Close()

	// Cargo en un array los rubros del semestre 1
	strQueryRubros = "esp_RESUMEN_ANUAL_Rubros " + Session("UserId")
	var arrRubros = new Array()
	if(objDB.query(strQueryRubros)) {
		i = 0
		while(strRecord = objDB.each()) {
			arrRubros[i]  = strRecord.Rubro
			i++
		}
	}

	// Traigo los datos de la base
	// Valores default

	var arrParams = {"rubro"  :"", "val1" :"", "val2" :"", "val3" :"", "val4" :"", "val5" :"", "val6" :""}
//	var arrParams = {"rubro"  :"", "" :"", "" :"", "" :"", "" :"", "" :"", "" :""}

	// Semestre 1
	// Cada iteración será un Rubro.
	for(i = 0; i < arrRubros.length; i++) {
		arrParams["rubro"]  = "<p class=hometexto>" + arrRubros[i] + "</p>"
		// Cada iteración será el consumo del socio en un mes, para el rubro en cuestion
		for(mes = 1; mes < 7; mes++) {
			strQuery = "esp_RESUMEN_ANUAL_ConsumosXRubroXMes " + Session("userId") + ", '" + arrRubros[i] + "', " + mes 

			if(objDB.query(strQuery)) {
				strRecord = objDB.each()
				arrParams["val" + mes] = Number(strRecord["Total"]?strRecord["Total"]:0).toFixed(2)
			}
		}

		objRowSemestre1.add(arrParams)
	}

	// Semestre 2
	// Cada iteración será un Rubro.
	for(i = 0; i < arrRubros.length; i++) {
		arrParams["rubro"]  = "<p class=hometexto>" + arrRubros[i] + "</p>"
		// Cada iteración será el consumo del socio en un mes, para el rubro en cuestion
		for(mes = 6; mes < 13; mes++) {
			strQuery = "esp_RESUMEN_ANUAL_ConsumosXRubroXMes " + Session("userId") + ", '" + arrRubros[i] + "', " + mes 
			
			if(objDB.query(strQuery)) {
				strRecord = objDB.each()
				arrParams["val" + (mes - 6)] = Number(strRecord["Total"]?strRecord["Total"]:0).toFixed(2)
			}
		}

		objRowSemestre2.add(arrParams)
	}


	// ************************************************************************************
	// Totales
	// ************************************************************************************
	
		strBody  = "<td>&nbsp;</td>"
		for(intMes = 1; intMes < 7; intMes ++)
			strBody += "<td class=hometexto align=right><b>%tot_" + intMes + "%</b></td>"	

		objTplRow_totales1 = new Template()	
			objTplRow_totales1.strBody = strBody	

		objTplRow_totales2 = new Template()	
			objTplRow_totales2.strBody = strBody				
			
			
		for(mes = 1; mes < 7; mes++) 
		{
			curImporte = 0
			
			strQuery  = "esp_RESUMEN_ANUAL_ConsumosTotalXMes " + Session("userId") + ", " + mes
			
							
			if(objDB.query(strQuery)) 
			{
				strRecord = objDB.each()
				curImporte = strRecord.Total
			}
			
			arrParams["tot_" + mes] = Number(curImporte).toFixed(2)
		}
		
		objTplRow_totales1.add(arrParams)
		
		
		for(mes = 7; mes < 13; mes++) 
		{
			curImporte = 0
			

			strQuery  = "esp_RESUMEN_ANUAL_ConsumosTotalXMes " + Session("userId") + ", " + mes
	
							
			if(objDB.query(strQuery)) 
			{
				strRecord = objDB.each()
				curImporte = strRecord.Total 
			}
			
			nIndice = (mes - 7) + 1
			arrParams["tot_" + nIndice] = Number(curImporte).toFixed(2)
		}
			
		objTplRow_totales2.add(arrParams)		
		
	// ************************************************************************************
	
	
	var arrStrContentParams = {
		"semestre1" : objRowSemestre1.getContent(),
		"semestre2" : objRowSemestre2.getContent(),
		"totales1"  : objTplRow_totales1.getContent(),
		"totales2"  : objTplRow_totales2.getContent()
	}
%>