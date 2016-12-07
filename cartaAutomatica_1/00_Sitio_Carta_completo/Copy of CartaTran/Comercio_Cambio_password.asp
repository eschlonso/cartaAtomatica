<%@language=JScript%>


<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->


<%
	var strMensaje = "&nbsp;"
	
	var intResultado = -1

	objDB = new DB(arrConn)
	

	objDB.query("EXEC esp_COMERCIO_Cambio_Password " + Session("logincomercioid") + ", '" + Request.Form("PasswordOLD") + "', '" + Request.Form("PasswordNew") + "'")




	   strRecord = objDB.each()

		intResultado = strRecord.Codigo
		strMensaje   = strRecord.Mensaje
		strLink    	 = strRecord.Link
		strImagen    = strRecord.Imagen
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"/>
<html>
	<head>
		<meta http-equiv="Content-Language" content="es">
		<title>. Carta Autom&aacute;tica .</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
		<script language="Javascript" src="scripts/functions.js"></script>
		<script language="Javascript" src="scripts/menu_over.js"></script>
		<link  href="styles/general.css" rel="stylesheet" type="text/css"/>
		<link  href="layers/layers.css" rel="stylesheet" type="text/css"/>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
			<BR>
            <p>&nbsp;</p>
            <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="100%" id="AutoNumber1" bgcolor="#FFFFFF">
              <tr>
                <td width="33%">&nbsp;</td>
                <td width="33%">
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
				</tr>
			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
					<td class="subtitulos" bgcolor="#CAE8FB"><b><%Response.Write(strMensaje)%></b></td>
					<td width="10" bgcolor="#DDEEFF">&nbsp;</td>
				</tr>

				<tr>
					<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
					<td bgcolor="#CAE8FB">
						<table width="413" border="0" cellpadding="2" cellspacing="1" class="hometexto">
							<tr bgcolor="#CAE8FB" class="subtitulos">
								<td align="left">
                                <p align="center"><a href="<%Response.Write(strLink)%>"> <img  src="<%Response.Write(strImagen)%>"  border="0"></a></td>
							</tr>
							</table>
					</td>
					<td width="10" bgcolor="#DDEEFF">&nbsp;</td>
				</tr>

			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
				</tr>
			</table>
                </td>
                <td width="34%">&nbsp;</td>
              </tr>
            </table>
            </body>
</html>