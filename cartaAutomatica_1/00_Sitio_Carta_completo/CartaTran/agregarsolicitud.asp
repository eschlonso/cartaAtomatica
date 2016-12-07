<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<%
		strQuery = "EXEC sp_SolicitudTarjeta_ALTA '" + Request.Form("txtNombre").item + "', '" +  Request.Form("txtApellido").item + "', '" +  Request.Form("strTipoDoc").item + "', " +  Request.Form("txtNumDoc").item + ", '" +  Request.Form("txtSexo").item + "', '" +  Request.Form("strNac").item + "', '" +  Request.Form("txtMail").item + "', " +  Request.Form("txtSucursal").item + ", '" +  Request.Form("strTelefono").item + "', '" +  Request.Form("strHorarioTel").item + "', '" +  Request.Form("strTelefono2").item + "', '" +  Request.Form("txtTrabajo").item + "', '" +  Request.Form("strFechaT").item + "', '" +  Request.Form("txtCiudad").item + "', '" + Request.Form("txtIngresos").item + "', '" + Request.Form("txtComentarios").item + "'"
		objDB = new DB(arrConn)
		objDB.query(strQuery)
		strMensaje = "La solicitud ha sido enviada. Muchas gracias."		
		Response.Redirect("../pedilamaster.asp?strMensaje="+strMensaje)
%>
<!--
<html>
	<body>
		<form name="agregar_solicitud" id="agregar_solicitud" action="../pedilamaster.asp" method="post">
			<input type="hidden" id="strMensaje" name="strMensaje" value="<%=strMensaje%>" />
		</form>
	</body>
</html>

<script>
	document.getElementById("agregar_solicitud").submit();
</script>
-->