<%
	objDB.query("EXEC esp_PAGO_ELECTRONICO_Claves " + Session("userId"))
	strRecord = objDB.each()
	var arrStrContentParams = {
		"strClaveBanelco" : strRecord.ClaveBanelco,
		"strClaveDebito"  : strRecord.ClaveAdhesion
	}
%>