<%
	objDB.query("EXEC esp_INFOSYS")
	objRecordSet = objDB.each()

	var arrStrContentParams = {
		"strTo" : objRecordSet.MailSugerencias
	}
%>