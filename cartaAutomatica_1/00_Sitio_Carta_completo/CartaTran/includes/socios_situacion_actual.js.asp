<%
// ************************************************************************************
// Declaracion de Variables y Constantes
// ************************************************************************************
	var strFechaBlanca = "<font color='#F1F9FE'>00/00/0000</font>"

	var dblTotalConAutorizaciones = 0
	var dblTotalSinAutorizaciones = 0
	
	var arrParams = {
		"strFecha"    : "",
		"strTarjeta"  : "",
		"strConcepto" : "",
		"strPopUp"    : "",
		"strImporte"  : ""
	}
// ************************************************************************************		


// ************************************************************************************
// Procedimientos y Funciones
// ************************************************************************************
	function f_tarjeta(nAdicional) {
		if(nAdicional == 0) {
			return("Titular")
		} else {
			return("Adic. " + nAdicional)
		}
	}

	function s_arrParams_vacio() {
		arrParams = {
			"strFecha"    : "",
			"strTarjeta"  : "",
			"strLink"     : "",
			"strImporte"  : ""
		}
	}
// ************************************************************************************


// ************************************************************************************
// Fechas de cierre, cierre anterior, proximo cierre, proximo vencimiento, etc
// ************************************************************************************
	strQuery = "EXEC esp_CIERRES_VENCIMIENTOS_Informacion " + Session("UserId")

	objDB.query(strQuery)

	rs = objDB.each()

	intCalenPeriodo			= rs.ACTUAL_CalenPeriodo
	strFechaCierre			= formatDate(rs.ACTUAL_Cierre, 0)
	strFechaCierreAnt		= formatDate(rs.ANTERIOR_Cierre, 0)
	strFechaCierreProx	    = formatDate(rs.ACTUAL_Cierre, 0) 
	strFechaVencimientoProx = formatDate(rs.ACTUAL_Vencimiento, 0) 
	

	strBody  = ""
	strBody += "<tr bgcolor='#F1F9FE'>"
	strBody +=		"<td width='50'  align='center'>%strFecha%</td>"
	strBody += 		"<td width='40'  align='center'>%strTarjeta%</td>"
	strBody +=		"<td width='240' align='left'>%strLink%</td>"
	strBody +=      "<td width='50'  align='right' class='total'>%strImporte%</td>"
	strBody += "</tr>"
	
// ************************************************************************************


// ************************************************************************************
// Totales
// ************************************************************************************
//Response.Write(strQuery)

	//strQuery = "EXEC esp_SITUACION_ACTUAL_TotalesGenerales " + Session("UserId")
	strQuery = "SELECT	ISNULL(0,0) 'TotalConAutorizaciones', ISNULL(0,0) 'TotalSinAutorizaciones'"

	objDB.query(strQuery)


	rs = objDB.each()

	dblTotalConAutorizaciones = rs.TotalConAutorizaciones
	dblTotalSinAutorizaciones = rs.TotalSinAutorizaciones



// ************************************************************************************
// DETALLES QUE ARMAN TODA LA PANTALLA
// ************************************************************************************


// ************************************************************************************
// Consumos
// ************************************************************************************

	objTplRow_consumos = new Template()
	objTplRow_consumos.strBody = strBody

	curAcum_consumos_importe = 0

	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 1, NULL, NULL, 0, 1" 
	
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 1, NULL, NULL, 0, NULL" 

		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte                = rs.Importe
			curAcum_consumos_importe += curImporte	
			
			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}

			objTplRow_consumos.add(arrParams)
		}
		dblTotalSinAutorizaciones += curAcum_consumos_importe
	} else {
	
		s_arrParams_vacio()
		
		objTplRow_consumos.add(arrParams)
	}
	
// ************************************************************************************


// ************************************************************************************
// Consumos de Otros Periodos
// ************************************************************************************	
	objTplRow_ConsOtrosP = new Template()
		objTplRow_ConsOtrosP.strBody = strBody

	curAcum_ConsOtrosP_importe = 0


	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 1, NULL, NULL, 1, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 1, NULL, NULL, 1, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_ConsOtrosP_importe += curImporte
				
			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_ConsOtrosP.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_ConsOtrosP_importe
	} else {
		s_arrParams_vacio()		
			
		objTplRow_ConsOtrosP.add(arrParams)					
	}
// ************************************************************************************


// ************************************************************************************
// Cuotas Automáticas
// ************************************************************************************	
	objTplRow_CA = new Template()
		objTplRow_CA.strBody = strBody

	curAcum_CA_importe = 0

	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 6, NULL, NULL, NULL, 1"  
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 6, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)	
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_CA_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_CA.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_CA_importe
	} else {
		s_arrParams_vacio()		
			
		objTplRow_CA.add(arrParams)					
	}
// ************************************************************************************		


// ************************************************************************************
// Adelantos
// ************************************************************************************	
	objTplRow_adelantos = new Template()
		objTplRow_adelantos.strBody = strBody

	curAcum_adelantos_importe = 0

	strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 3, NULL, NULL, NULL, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 3, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte                 = rs.Importe        
			curAcum_adelantos_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_adelantos.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_adelantos_importe
	} else {
		s_arrParams_vacio()			
		
		objTplRow_adelantos.add(arrParams)					
	}
// ************************************************************************************				


// ************************************************************************************
// Servicios
// ************************************************************************************	
	objTplRow_ServImp = new Template()
		objTplRow_ServImp.strBody = strBody

	curAcum_ServImp_importe = 0
	strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 2, NULL, NULL, NULL, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 2, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte                 = rs.Importe        
			curAcum_ServImp_importe += curImporte
					
			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_ServImp.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_ServImp_importe
	} else {
		s_arrParams_vacio()			
		
		objTplRow_ServImp.add(arrParams)					
	}	
// ************************************************************************************						


// ************************************************************************************
// Ajustes
// ************************************************************************************	

	objTplRow_ajustes = new Template()
		objTplRow_ajustes.strBody = strBody
	
	curAcum_ajustes_importe = 0
	strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 7, NULL, NULL, NULL, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 7, NULL, NULL, NULL, NULL"
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte                 = rs.Importe        
			curAcum_ajustes_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_ajustes.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_ajustes_importe
	} else {
		s_arrParams_vacio()			
		
		objTplRow_ajustes.add(arrParams)					
	}			
	
// ************************************************************************************				


// ************************************************************************************
// SALDO EN CUOTAS
// ************************************************************************************	
	objTplRow_SaldoEnCuotas = new Template()
		objTplRow_SaldoEnCuotas.strBody = strBody

	curAcum_SaldoEnCuotas_importe = 0
	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 11, NULL, NULL, NULL, 1"
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 11, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_SaldoEnCuotas_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_SaldoEnCuotas.add(arrParams)	
		}
	} else {
		s_arrParams_vacio()		
			
		objTplRow_SaldoEnCuotas.add(arrParams)					
	}
	
	
	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 12, NULL, NULL, NULL, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 12, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_SaldoEnCuotas_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_SaldoEnCuotas.add(arrParams)	
		}
	} else {
		s_arrParams_vacio()		
			
		objTplRow_SaldoEnCuotas.add(arrParams)					
	}
	
	strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 14, NULL, NULL, NULL, 1" 
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {
		strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 14, NULL, NULL, NULL, NULL" 
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_SaldoEnCuotas_importe += curImporte

			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_SaldoEnCuotas.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_SaldoEnCuotas_importe
	} else {
		s_arrParams_vacio()		
			
		objTplRow_SaldoEnCuotas.add(arrParams)					
	}
// ************************************************************************************		




// ************************************************************************************
// Autorizaciones
// ************************************************************************************	
	objTplRow_autorizaciones = new Template()
		objTplRow_autorizaciones.strBody = strBody

	curAcum_autorizaciones_importe = 0
	
	
	strQuery  = "EXEC UP_MovimientosAutorizacion_VISTA " + Session("UserId") 
			
	if(objDB.query(strQuery)) {
		while(rs = objDB.each()) {
			curImporte                 = rs.Importe        
			curAcum_autorizaciones_importe += curImporte

				arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_autorizaciones.add(arrParams)	
		}
		dblTotalConAutorizaciones += curAcum_autorizaciones_importe
	} else {
		s_arrParams_vacio()			
		
		objTplRow_autorizaciones.add(arrParams)					
	}
	

// ************************************************************************************						


// ************************************************************************************
// Débito Automático
// ************************************************************************************	
	objTplRow_DebAut = new Template()
		objTplRow_DebAut.strBody = strBody

	curAcum_DebAut_importe = 0
	
	strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 9, NULL, NULL, NULL, 1"
	//Response.Write(strQuery)
	
	objDB.query(strQuery)
	
	rs = objDB.each()
	
	if(rs.Cantidad > 0) {	
		strQuery  = "EXEC UP_CuentaMovimientosActuales_VISTA " + Session("UserId") + ", 9, NULL, NULL, NULL, NULL"
		objDB.query(strQuery)
		while(rs = objDB.each()) {
			curImporte              = rs.Importe        
			curAcum_DebAut_importe += curImporte
								
			arrParams = {
				"strFecha"    : formatDate(rs.Fecha,0),
				"strTarjeta"  : f_tarjeta(rs.Adicional),
				"strLink"	  : rs.Descripcion,
				"strImporte"  : Number(curImporte).toFixed(2)
			}
			objTplRow_DebAut.add(arrParams)	
		}
		dblTotalSinAutorizaciones += curAcum_DebAut_importe
	} else {
		s_arrParams_vacio()		
			
		objTplRow_DebAut.add(arrParams)					
	}
// ************************************************************************************

var arrStrContentParams = {
	"str_tr_anterior"			: "",
	"str_anterior_fecha"		: strFechaCierreAnt,
	"str_anterior_SPRA"			: Number(0).toFixed(2),
	
//CONSUMOS	
	"str_tr_consumos"			: objTplRow_consumos.getContent(),
	"str_consumos_fecha"		: strFechaBlanca,
	"str_consumos_SubTot"		: Number(curAcum_consumos_importe).toFixed(2),
	

//OTROS PERIODOS
	"str_tr_CCOP"				: objTplRow_ConsOtrosP.getContent(),
	"str_CCOP_fecha"			: strFechaBlanca,
	"str_CCOP_SubTot"		    : Number(curAcum_ConsOtrosP_importe).toFixed(2),

//CUOTAS AUTOMATICAS
	"str_tr_CUOTASAUTOMATICAS" 	: objTplRow_CA.getContent(),
	"str_CuotasAutomaticas_fecha" : strFechaBlanca,
	"str_CuotasAutomaticas_SubTot" : Number(curAcum_CA_importe).toFixed(2),	

	
//DEBITOS AUTOMATICOS	
	"str_tr_DebAut"				: objTplRow_DebAut.getContent(),
	"str_DebAut_fecha"			: strFechaBlanca,
	"str_DebAut_SubTot"			: Number(curAcum_DebAut_importe).toFixed(2),

//ADELANTOS
	"str_tr_adelantos"			: objTplRow_adelantos.getContent(),
	"str_adelantos_fecha"		: strFechaBlanca,
	"str_adelantos_SubTot"		: Number(curAcum_adelantos_importe).toFixed(2),		

//SERVICIOS e IMPUESTOS
	"str_tr_ServImp"			: objTplRow_ServImp.getContent(),
	"str_ServImp_fecha"			: strFechaBlanca,
	"str_ServImp_SubTot"		: Number(curAcum_ServImp_importe).toFixed(2),

//AJUSTES
	"str_tr_ajustes"		    : objTplRow_ajustes.getContent(),
	"str_ajustes_fecha"			: strFechaBlanca,
	"str_ajustes_SubTot"	    : Number(curAcum_ajustes_importe).toFixed(2),

//SALDO EN CUOTAS
	"str_tr_SaldoEnCuotas"		    : objTplRow_SaldoEnCuotas.getContent(),
	"str_SaldoEnCuotas_fecha"		: strFechaBlanca,
	"str_SaldoEnCuotas_SubTot"	    : Number(curAcum_SaldoEnCuotas_importe).toFixed(2),

//SUBTOTAL sin Autorizaciones
	"str_SubTot_sa"			    : Number(dblTotalSinAutorizaciones ).toFixed(2),

//AUTORIZACIONES
	"str_tr_autorizaciones"     : objTplRow_autorizaciones.getContent(),
	"str_autorizaciones_fecha"  : strFechaBlanca,
	"str_autorizaciones_SubTot" : Number(curAcum_autorizaciones_importe).toFixed(2),		

//SUBTOTAL con Autorizaciones	
	"str_SubTot_ca"			    : Number(dblTotalConAutorizaciones).toFixed(2),

//INFO DEL PIE DE PAGINA
	"str_ProximoCierre"		    : strFechaCierreProx,
	"str_ProximoVencimiento"    : strFechaVencimientoProx
}
%>