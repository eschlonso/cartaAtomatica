<base href="file:///C:/Inetpub/wwwroot/CartaNew/CartaTran/prueba.asp" fptype="TRUE">
<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->

<%
objDB = new DB(arrConn)
var strQuery = ""
strQuery = "EXEC esp_INFOSYS"
if(objDB.query(strQuery)) {
	Response.Write("OK")	
}else{
	Response.Write("NO")
}

%>