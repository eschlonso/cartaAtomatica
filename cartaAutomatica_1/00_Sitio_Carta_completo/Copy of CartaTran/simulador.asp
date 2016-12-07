<%@language=JScript%>


<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->


<%
	var strMensaje = "&nbsp;"
	
	var intResultado = -1

	objDB = new DB(arrConn)
	
	if(Request("enviado") == 1) 
	{
	   objDB.query("EXEC esp_SIMULACION_COMPRA_Procesar " + Session("userId") + ", " + Request("importe") + ", " + Request("cuotas"))
	   strRecord = objDB.each()

		intResultado = strRecord.Resultado
		strMensaje   = strRecord.Mensaje
	} 
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"/>
<html>
	<head>
		<title>. Carta Autom&aacute;tica .</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
		<script language="Javascript" src="scripts/functions.js"></script>
		<script language="Javascript" src="scripts/menu_over.js"></script>
		<link  href="styles/general.css" rel="stylesheet" type="text/css"/>
		<link  href="layers/layers.css" rel="stylesheet" type="text/css"/>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<FORM name="simulador" action="simulador.asp" method="post">
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
				</tr>
			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
					<td>
						<table width="413" border="0" cellpadding="2" cellspacing="1" class="hometexto">
							<tr bgcolor="#CAE8FB" class="subtitulos">
								<td colspan="2" align="left"><b>SIMULADOR</b></td>
							</tr>

							<tr bgcolor="#E4F3FD" class="hometexto">
								<td width="363" align="center">&nbsp;</td>
								<td width="100" align="right">&nbsp;</td>
							</tr>
							<tr bgcolor="#F1F9FE">
								<td width="363" align="left" bgcolor="#F1F9FE">
                                Completá el importe que deseas consumir</td>
								<td width="100" align="right" class="total">
									<input name="importe" type="text" class="forms" size="5" value="<%=Request("importe")%>" >
								</td>
							</tr>
							<tr bgcolor="#E4F3FD">
								<td width="363" align="left">Completá la cantidad de cuotas</td>
								<td width="100" align="right" class="total">
									<input name="cuotas" type="text" class="forms" size="5" value="<%=Request("cuotas")%>">
								</td>
							</tr>
							<tr bgcolor="#F1F9FE">
								<td width="363" align="left">&nbsp;</td>
								<td width="100" align="right" class="total">&nbsp;</td>
							</tr>
							<tr bgcolor="#F1F9FE">
								<td align="right" bgcolor="#CAE8FB" class="subtitulos"><b>Resultado:</b></td>
								<td width="100" align="center" bgcolor="#F1F9FE">
<%
	switch(intResultado) {
		case 0 :
			%>
									<B class="subtitulos">ACEPTADO</B>
			<%
			break
		case 1 :
			%>
									<B class="subtitulos">RECHAZADO</B>
			<%
			break
		default :
			%>
									<B class="subtitulos">-</B>
			<%
	}
%>
								</td>
							</tr>
							<TR bgcolor="#E4F3FD" height="60">
								<td valign="middle"><B class="subtitulos"><%=strMensaje%></b></td>
								<TD valign="top" align="right" class="subtitulos">
									<INPUT type="hidden" name="enviado" value="1"/>
									<INPUT type="submit" value="consultar"/>
								</td>
							</TR>
						</table>
					</td>
					<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
				</tr>
				<TR>
					<TD colspan="3" bgcolor="#E4F3FD" align="center">
						<BR>
						<INPUT type="image" src="images/cerrar.gif" onClick="JavaScript: window.close();"/>
					</TD>
				</TR>
			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
				</tr>
			</table>
		</FORM>
	</body>
</html>