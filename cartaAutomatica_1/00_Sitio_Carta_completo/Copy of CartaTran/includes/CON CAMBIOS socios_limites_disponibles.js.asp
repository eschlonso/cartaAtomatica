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
		"strLimiteGlobal"    : "Consultar",
		"strTotalDisponible" : "Consultar",
		"strCompras1Pago"    : "Consultar",
		"strComprasCuotas"   : "Consultar",
		"strAdelantoEfvo"    : "Consultar",
		"strComprasExtra"    : "Consultar"
	}
%>