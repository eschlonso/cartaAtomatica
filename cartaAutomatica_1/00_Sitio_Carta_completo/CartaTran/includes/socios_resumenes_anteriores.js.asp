




<%

	function formatearPeriodo(sPeriodo) {
		var periodo = String(sPeriodo)
		return periodo.substr(4, 2) + "/" + periodo.substr(0, 4)
	}

	function f_tarjeta(nAdicional) {
		if(nAdicional == 0) {
			return("Titular")
		} else {
			return("Adic. " + nAdicional)
		}
	}
	
	
	var periodo1
	var arrConsumoAnt = new Array()
	arrConsumoAnt[1]  = new Template()
	arrConsumoAnt[2]  = new Template()
	arrConsumoAnt[3]  = new Template()

	arrConsumoAnt[1].setDelimiter = arrConsumoAnt[2].setDelimiter = arrConsumoAnt[3].setDelimiter = "%"
	arrConsumoAnt[1].strBody = arrConsumoAnt[2].strBody = arrConsumoAnt[3].strBody = "<tr bgcolor=\"#F1F9FE\" align=\"center\"><td width=\"50\">%strFecha%</td><td width=\"50\"></td><td width=\"245\" align=\"left\">%strDescripcion%</td><td width=\"75\" align=\"right\" class=\"total\">%strImporte%</td></tr>"

	strQuery = "EXEC esp_InfoSys"
	if(objDB.query(strQuery)) {
		strRecordSys = objDB.each()
		
		var arrPeriodoAnt = new Array()
		arrPeriodoAnt[1]  = strRecordSys.CalenPeriodoAnterior1
		arrPeriodoAnt[2]  = strRecordSys.CalenPeriodoAnterior2
		arrPeriodoAnt[3]  = strRecordSys.CalenPeriodoAnterior3

		for(i = 1; i < 4 ;i++) {
			strQuery = "EXEC UP_CuentaMovimientosActuales_VISTA " + String(Session("userId")) + ", NULL , 2, " + arrPeriodoAnt[i] + ", NULL" 
			
			if(objDB.query(strQuery)) {
				while(strRecord = objDB.each()) {
					
					var arrParams = {
						"strFecha"       : formatDate(strRecord.Fecha, 0),
						"strNroTarjeta"  : f_tarjeta(strRecord.Adicional), //strRecord.NroTarjeta,
						"strDescripcion" : strRecord.Descripcion,
						"strImporte"     : strRecord.Importe
					}
					arrConsumoAnt[i].add(arrParams)
				}
			} else {
				arrConsumoAnt[i].strBody = "<tr bgcolor=\"#F1F9FE\" class=\"hometexto\"><td colspan=\"4\" align=\"center\"><b> </b></td></tr>"
			}
		}
	}
	periodo1 = arrPeriodoAnt[1]
	
	var arrStrContentParams = {
		"strPeriodoAnterior1" : formatearPeriodo(arrPeriodoAnt[1]),
		"strPeriodoAnterior2" : formatearPeriodo(arrPeriodoAnt[2]),
		"strPeriodoAnterior3" : formatearPeriodo(arrPeriodoAnt[3]),
		"strConsumoAnterior1" : arrConsumoAnt[1].getContent(),
		"strConsumoAnterior2" : arrConsumoAnt[2].getContent(),
		"strConsumoAnterior3" : arrConsumoAnt[3].getContent()
	}
%>