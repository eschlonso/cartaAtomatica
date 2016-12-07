<%
	objDB.query("EXEC esp_INFOSYS")
	rs = objDB.each()

	var arrStrContentParams = {
		"strTo" : rs.MailComercial
	}
%>