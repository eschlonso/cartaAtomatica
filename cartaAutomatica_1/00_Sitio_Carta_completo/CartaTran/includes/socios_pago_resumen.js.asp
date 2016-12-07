

<%

	function formatearPeriodo(sPeriodo) {
		var periodo = String(sPeriodo)
		return periodo.substr(4, 2) + "/" + periodo.substr(0, 4)
	}

	// ************************************************************************************
	// Declaracion de Variables
	// ************************************************************************************
	
		var intIndice
	
		arrMeses   = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

	// ************************************************************************************
	

	// ************************************************************************************
	// Procedimientos y Funciones
	// ************************************************************************************
	
	function f__monto(sCampo, intCalenPeriodo, intOpcionId) {
		var sQuery


		sQuery  = "EXEC esp_PAGO_RESUMEN_Opciones " + Session("UserId") + ", " + intCalenPeriodo + ", " + intOpcionId
		objDB.query(sQuery)

		rs = objDB.each()
		return(rs[sCampo])
	}

	
	// ************************************************************************************
	// CalenPeriodo, Fecha de Cierre, Fecha de Vencimiento, etc
	// ************************************************************************************
		// Consulta en la base de datos
		var periodoResumen
		strQuery = "EXEC esp_INFOSYS"
		objDB.query(strQuery)
		rs = objDB.each()
		periodoResumen = rs.CalenPeriodoAnterior1
		sQuery  = "EXEC UP_CuentaPeriodoResumenCabecera_VISTA " + Session("userId") + ", " + periodoResumen
		////strQuery  = "EXEC esp_CIERRES_VENCIMIENTOS_Informacion " + Session("UserId")
//Response.Write(sQuery)
//Response.End
		objDB.query(sQuery)

		rs = objDB.each()

		//iCalenPeriodo = rs.CalenPeriodoActual
		sUltimoCierre = formatDate(rs.CalenCierreFecha, 0)
		sVencimiento  = formatDate(rs.CalenVenciMiniPagoFecha, 0)

		//intMes = Number(sVencimiento.substr(3,2))
		//strMes = arrMeses[intMes - 1]

	// ************************************************************************************


	// ************************************************************************************
	// Clave Banelco
	// ************************************************************************************

		strQuery  = "EXEC esp_PAGO_ELECTRONICO_Claves " + Session("UserId")
		objDB.query(strQuery)

		rs = objDB.each()
		
		strClaveBanelco = rs.ClaveBanelco

	// ************************************************************************************

	// ************************************************************************************
	// Opciones de Pago
	// ************************************************************************************
		
	objTplRow_OP = new Template()
	
	//strQuery = "EXEC esp_INFOSYS"
	//objDB.query(strQuery)
	//rs = objDB.each()
	//periodoActual = rs.CalenPeriodoAnterior1
	
	strQuery = "EXEC UP_CuentaPeriodoResumenCabecera_VISTA " + Session("userId")+","+periodoResumen
	objDB.query(strQuery)
	rs = objDB.each()
	iTotalMes = rs.CuentaPesoSaldoBanel
	
	strQuery  = "EXEC UP_CuentaPeriodoResumenOpcionesDePago_VISTA " + Session("userId")+","+periodoResumen
	
	objTplRow_OP.strBody  = ""
	objTplRow_OP.strBody += "<tr bgcolor='#F1F9FE' style='border: 1px solid #CAE8FB; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px'>"
	objTplRow_OP.strBody +=		"<td width='25%' align='Right' >%strPagueAhora%</td>"
	objTplRow_OP.strBody +=		"<td  width='50%' colspan='3'  align='center' class='hometexto'>%strDescripcion%"
	objTplRow_OP.strBody +=		"</td>"
	objTplRow_OP.strBody +=	"</tr>"
	
	if(objDB.query(strQuery)) {

		titulo = "Inicio"

		while(rs = objDB.each()) {

			if(titulo == "Inicio") {
				var arrParams = {
					"strPagueAhora"  : "$ " + Number(rs.Importe).toFixed(2),
					"strDescripcion" : "y "+rs.CuotasPendi+" cuotas de $ " + Number(rs.MontoCuota).toFixed(2)
				}	
			
				objTplRow_OP.add(arrParams)
			}

			if(titulo == "NoInicio") {
				var arrParams = {
					"strPagueAhora"  : "$ " + Number(rs.Importe).toFixed(2),
					"strDescripcion" : "y "+rs.CuotasPendi+((rs.CuotasPendi==1)?" cuota de $ ":" cuotas de $ ") + Number(rs.MontoCuota).toFixed(2)
				}	
			
				objTplRow_OP.add(arrParams)
			}			

			titulo = "NoInicio"

		}
		var arrParams = {
			"strPagueAhora"  : "$ " + Number(iTotalMes).toFixed(2),
			"strDescripcion" : " "
		}	
					
		objTplRow_OP.add(arrParams)
		
		
	}
	else {
		var arrParams = {
			"strPagueAhora"  : "--",
			"strDescripcion" : "--"
		}	
					
		objTplRow_OP.add(arrParams)
	}
	
				
			
	// ************************************************************************************
	// Pagos registrados a la fecha
	// ************************************************************************************	
		
		objTplRow_PR = new Template()
	
			objTplRow_PR.strBody  = ""
			objTplRow_PR.strBody += "<tr bgcolor=\"#F1F9FE\">"
			objTplRow_PR.strBody +=	 "<td>%strFecha%</td>"
			objTplRow_PR.strBody +=	"<td align=\"right\">%strImporte%</td>"
			objTplRow_PR.strBody += "</tr>"
	
		var arrParams = {
			"strFecha"   : "&nbsp;",
			"strImporte" : "&nbsp;"
		}
				
		curAcum_importe = 0

		strQuery   = "EXEC esp_PAGO_RESUMEN_Pago " + Session.Contents("UserId")+ " "
		
		objDB.query(strQuery)

		while(objRs = objDB.each()) {
			curImporte       = objRs.Importe
			curAcum_importe += curImporte
			
			arrParams = {
				"strFecha"   : objRs.FechaRealF,
				"strImporte" : objRs.ImporteF
						}
			
			objTplRow_PR.add(arrParams)	
							
		}

		
	// ************************************************************************************	
	
	
	currPagoMin  = 0 //curImporteAbonar_PagoMin  - curAcum_importe
	currPagoInt1 = 0 //curImporteAbonar_PagoInt1 - curAcum_importe
	currPagoInt2 = 0 //curImporteAbonar_PagoInt2 - curAcum_importe
	currPagoInt3 = 0 //curImporteAbonar_PagoInt3 - curAcum_importe
	currPagoTot  = 0 //curImporteAbonar_PagoTot  - curAcum_importe


	var arrStrContentParams = {
		"sUltimoCierre"    : sUltimoCierre,
		"sVencimiento"     : sVencimiento,
		"strTR_OP"         : objTplRow_OP.getContent(),
		"strTR_PR"         : objTplRow_PR.getContent(),
		"strPR_Tot"        : Number(curAcum_importe).toFixed(2),
		"strSaldos"        : sVencimiento,
		"strPagoMin"       : Number(currPagoMin)  < 0 ? "0.00" : Number(currPagoMin).toFixed(2),
		"strPagoInt1"      : Number(currPagoInt1) < 0 ? "0.00" : Number(currPagoInt1).toFixed(2),
		"strPagoInt2"	   : Number(currPagoInt2) < 0 ? "0.00" : Number(currPagoInt2).toFixed(2),
		"strPagoInt3"	   : Number(currPagoInt3) < 0 ? "0.00" : Number(currPagoInt3).toFixed(2),
		"strPagoTot"	   : Number(currPagoTot)  < 0 ? "0.00" : Number(currPagoTot).toFixed(2),
		"strClaveBanelco"  : strClaveBanelco
	}
%>