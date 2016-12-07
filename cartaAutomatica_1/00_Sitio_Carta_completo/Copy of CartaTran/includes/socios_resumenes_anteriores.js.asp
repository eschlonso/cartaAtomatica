




<%

	function f_tarjeta(nAdicional) {
		if(nAdicional == 0) {
			return("Titular")
		} else {
			return("Adic. " + nAdicional)
		}
	}
	
	
	
	var arrConsumoAnt = new Array()
	arrConsumoAnt[1]  = new Template()
	arrConsumoAnt[2]  = new Template()
	arrConsumoAnt[3]  = new Template()

	arrConsumoAnt[1].setDelimiter = arrConsumoAnt[2].setDelimiter = arrConsumoAnt[3].setDelimiter = "%"
	arrConsumoAnt[1].strBody = arrConsumoAnt[2].strBody = arrConsumoAnt[3].strBody = "<tr bgcolor=\"#F1F9FE\" align=\"center\"><td width=\"50\">%strFecha%</td><td width=\"50\">%strNroTarjeta%</td><td width=\"245\" align=\"left\">%strDescripcion%</td><td width=\"75\" align=\"right\" class=\"total\">%strImporte%</td></tr>"

	strQuery = "EXEC esp_InfoSys"
	if(objDB.query(strQuery)) {
		strRecord = objDB.each()
		
		var arrPeriodoAnt = new Array()
		arrPeriodoAnt[1]  = strRecord.CalenPeriodoAnterior1
		arrPeriodoAnt[2]  = strRecord.CalenPeriodoAnterior2
		arrPeriodoAnt[3]  = strRecord.CalenPeriodoAnterior3

		for(i = 1; i < 4 ;i++) {
			strQuery = "esp_CONSUMOS_ANTERIORES_ConsumosXPeriodo " + String(Session("userId")) + ", " + arrPeriodoAnt[i] 
			if(objDB.query(strQuery)) {
				while(strRecord = objDB.each()) {
					var arrParams = {
						"strFecha"       : formatDate(strRecord.Fecha, 0),
						"strNroTarjeta"  : f_tarjeta(strRecord.Adicional), //strRecord.NroTarjeta,
						"strDescripcion" : strRecord.Comercio,
						"strImporte"     : strRecord.ImporteTotalFormato
					}
					arrConsumoAnt[i].add(arrParams)
				}
			} else {
				arrConsumoAnt[i].strBody = "<tr bgcolor=\"#F1F9FE\" class=\"hometexto\"><td colspan=\"4\" align=\"center\"><b> </b></td></tr>"
			}
		}
	}

	var arrStrContentParams = {
		"strPeriodoAnterior1" : formatPeriodo(arrPeriodoAnt[1]),
		"strPeriodoAnterior2" : formatPeriodo(arrPeriodoAnt[2]),
		"strPeriodoAnterior3" : formatPeriodo(arrPeriodoAnt[3]),
		"strConsumoAnterior1" : arrConsumoAnt[1].getContent(),
		"strConsumoAnterior2" : arrConsumoAnt[2].getContent(),
		"strConsumoAnterior3" : arrConsumoAnt[3].getContent()
	}
%>