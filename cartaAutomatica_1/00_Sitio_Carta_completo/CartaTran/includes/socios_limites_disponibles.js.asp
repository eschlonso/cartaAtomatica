<%

// ************************************************************************************
// Procedimientos y Funciones
// ************************************************************************************
	function f_CorrigeNumeroNegativo(nValor) {
		if(nValor< 0) {
			return(0)
		} else {
			return(nValor)
		}
	}
	
	// Consulta en la base de datos - periodo

	/*sQuery  = " esp_CIERRES_VENCIMIENTOS_Informacion " + Session("userId")
	objDB.query(sQuery)
	strRecord = objDB.each()
	strActualPeriodo = strRecord.ACTUAL_CalenPeriodo*/
	
	/*sQuery = "EXEC esp_INFOSYS"
	objDB.query(sQuery)
	strRecord = objDB.each()
	strActualPeriodo = strRecord.CalenPeriodoPosterior*/

	// Consulta en la base de datos - limites
//Response.Write("EXEC esp_LIMITES_Sel " + Session("userId"))
//Response.End

	objDB.query("EXEC esp_LIMITES_Sel " + Session("userId"))

	strRecord = objDB.each()

	// Defino valores para los tags del template
	var arrStrContentParams = {
		"strLimiteGlobal"    		: Number(f_CorrigeNumeroNegativo(strRecord.LimiteGlobalAsignado)).toFixed(2),
		"strTotalDisponible" 		: Number(f_CorrigeNumeroNegativo(strRecord.LimiteGlobalDisponible)).toFixed(2),
		"strCompras1Pago"    		: Number(f_CorrigeNumeroNegativo(strRecord.LimitePlanCortoDisponible)).toFixed(2),
		"strComprasCuotas"   		: Number(f_CorrigeNumeroNegativo(strRecord.LimitePlanLargoDisponible)).toFixed(2),
		"strAdelantoEfvo"    		: Number(f_CorrigeNumeroNegativo(strRecord.LimiteAdelantoDisponible)).toFixed(2)/*,
		"strComprasExtra"    		: Number(f_CorrigeNumeroNegativo(strRecord.ExtraLimiteDispo)).toFixed(2),
		"strExceso"    	     		: Number(f_CorrigeNumeroNegativo(strRecord.Exceso)).toFixed(2),
		"strTotalDisponibleExceso"	: Number(f_CorrigeNumeroNegativo(strRecord.DisponibleGlobalConExceso)).toFixed(2),
		"strCompras1PagoExcesoPC"       : Number(f_CorrigeNumeroNegativo(strRecord.DisponibleCortoConExceso)).toFixed(2),
		"strComprasCuotasExcesoPL"	: Number(f_CorrigeNumeroNegativo(strRecord.DisponibleLargoConExceso)).toFixed(2)*/
	}
%>