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

	//sQuery  = " esp_CIERRES_VENCIMIENTOS_Informacion " + Session("userId")
	//objDB.query(sQuery)
	//strRecord = objDB.each()

	//strActualPeriodo = formatPeriodo(strRecord.ACTUAL_CalenPeriodo)

	// Consulta en la base de datos - limites

	//objDB.query("EXEC SMARTADMIN.dbo.up_CTACTE_InfoCalenPeriodoCuenta_web " + " 1, " + Session("userId") + ", 52007, 0" )
	//strRecord = objDB.each()

	// Defino valores para los tags del template
	//var arrStrContentParams = {
	//	"strLimiteGlobal"    : Number(f_CorrigeNumeroNegativo(strRecord.GlobalAsignado)).toFixed(2),
	//	"strTotalDisponible" : Number(f_CorrigeNumeroNegativo(strRecord.DisponibleGlobal)).toFixed(2),
	//	"strCompras1Pago"    : Number(f_CorrigeNumeroNegativo(strRecord.DisponibleCorto)).toFixed(2),
	//	"strComprasCuotas"   : Number(f_CorrigeNumeroNegativo(strRecord.DisponibleLargo)).toFixed(2),
	//	"strAdelantoEfvo"    : Number(f_CorrigeNumeroNegativo(strRecord.DisponibleAdelantos)).toFixed(2),
	//	"strComprasExtra"    : Number(f_CorrigeNumeroNegativo(strRecord.ExtraLimiteDispo)).toFixed(2)
	//}
%>