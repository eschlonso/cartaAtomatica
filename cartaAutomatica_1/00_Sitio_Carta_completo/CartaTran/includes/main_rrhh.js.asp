<%
	objDB.query("EXEC esp_INFOSYS")
	objRecordSet = objDB.each()

	var arrStrContentParams = {
		"strMailCVs" : objRecordSet.MailCVs
	}
%>