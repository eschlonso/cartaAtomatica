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
	
	// Consulta en la base de datos
	objDB.query("EXEC esp_LIMITES_DISPONIBLES_Consulta " + Session("userId"))
	strRecord = objDB.each()

	// Defino valores para los tags del template
	var arrStrContentParams = {
		"strLimiteGlobal"    : Number(f_CorrigeNumeroNegativo(strRecord.GlobalAsignado)).toFixed(2),
		"strTotalDisponible" : Number(f_CorrigeNumeroNegativo(strRecord.CuentaGlobalRema)).toFixed(2),
		"strCompras1Pago"    : Number(f_CorrigeNumeroNegativo(strRecord.Consumos)).toFixed(2),
		"strComprasCuotas"   : Number(f_CorrigeNumeroNegativo(strRecord.ConsumosCuotas)).toFixed(2),
		"strAdelantoEfvo"    : Number(f_CorrigeNumeroNegativo(strRecord.Adelantos)).toFixed(2),
		"strComprasExtra"    : Number(f_CorrigeNumeroNegativo(strRecord.PLGlobalRema)).toFixed(2)
	}
%>