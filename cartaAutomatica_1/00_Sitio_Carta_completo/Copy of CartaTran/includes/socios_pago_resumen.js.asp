

<%
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
	
		strQuery  = "EXEC esp_CIERRES_VENCIMIENTOS_Informacion " + Session("UserId")
		objDB.query(strQuery)

		rs = objDB.each()

		iCalenPeriodo = rs.ACTUAL_CalenPeriodo
		sUltimoCierre = formatDate(rs.ANTERIOR_Cierre, 0)
		sVencimiento  = formatDate(rs.ANTERIOR_Vencimiento, 0)

		intMes = Number(sVencimiento.substr(3,2))
		strMes = arrMeses[intMes - 1]

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
			
			objTplRow_OP.strBody  = ""
			objTplRow_OP.strBody += "<tr bgcolor='#F1F9FE' style='border: 1px solid #CAE8FB; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px'>"
			objTplRow_OP.strBody +=		"<td width='25%' align='Right' >%strPagueAhora%</td>"
			objTplRow_OP.strBody +=		"<td  width='50%' colspan='3'  align='center' class='hometexto'>%strDescripcion%"
			objTplRow_OP.strBody +=		"</td>"
			objTplRow_OP.strBody +=		"<td width='25%' align='right'>%strDescuento%</td>"
			objTplRow_OP.strBody +=	"</tr>"	

//PAGUE AHORA - Opcion 0
//		curImporteAbonar_PagueAhora  = f__monto("PagueAhora", iCalenPeriodo, 0)
//		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 0)
//		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 0)).toFixed(2) + '%'

		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 0)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 0)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 0)).toFixed(2) + '%'


		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}
	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)



//PAGUE AHORA - Opcion 1
		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 1)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 1)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 1)).toFixed(2) + '%'

		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}
	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)

//PAGUE AHORA - Opcion 2
		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 2)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 2)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 2)).toFixed(2) + '%'

		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}

	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)

//PAGUE AHORA - Opcion 3
		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 3)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 3)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 3)).toFixed(2) + '%'

		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}

	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)
				
//PAGUE AHORA - Opcion 4
		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 4)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 4)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 4)).toFixed(2) + '%'

		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}

	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)

//PAGUE AHORA - Opcion 5
		curImporteAbonar_PagueAhora  = Number(f__monto("PagueAhora", iCalenPeriodo, 5)).toFixed(2)
		curImporteAbonar_Descripcion = f__monto("CuotaDescri", iCalenPeriodo, 5)
		curImporteAbonar_Descuento = Number(f__monto("DescuentoServicios", iCalenPeriodo, 5)).toFixed(2) + '%'

		if (curImporteAbonar_PagueAhora == "NaN")
				{
					curImporteAbonar_PagueAhora = " "
					curImporteAbonar_Descripcion = " "
					curImporteAbonar_Descuento = " "
				}
	
		var arrParams = {
			"strPagueAhora"  : curImporteAbonar_PagueAhora,
			"strDescripcion" : curImporteAbonar_Descripcion,
			"strDescuento" : curImporteAbonar_Descuento
		}	
	
		objTplRow_OP.add(arrParams)
				
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