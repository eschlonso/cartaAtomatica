
		
<!--#INCLUDE FILE="Libreria.asp"-->
<%
Dim TipoDocumento
Dim NumDocumento
Dim	Password
Dim GrupoID

NumDocumento = Request.Form("TxtNumDocumento")
Password = Request.Form("TxtPassword")
GrupoID = Request.Form("TxtGrupo")
TipoDocumento= Request.Form("TxtTipoDocumento")

IF NumDocumento <> "" AND Password <> "" Then
	IF ValidarUsuario(GrupoID, TipoDocumento, NumDocumento, Password) = true then
		response.Redirect("default.htm")
		response.end
	end if
End if

%>
<SCRIPT LANGUAGE="JavaScript">
			setTimeout("top.location.href = 'index.htm'",4000);
</SCRIPT>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Validacion</title>
<style>
<!--
.tah12 {
	font-family: Tahoma;
	font-size: 11px;
	text-decoration: none;
	color: #000000;
}
.tah14 {
	font-family: Tahoma;
	font-size: 13px;
	text-decoration: none;
	color: #000000;
}
-->
</style>
</head>

<body>

<table border="1" width="100%" id="table12" style="border-width: 0px">
	<tr>
		<td style="border-style: none; border-width: medium">&nbsp;</td>
		<td style="border-style: none; border-width: medium">
		<table cellspacing="0" cellpadding="0" width="433" class="tah12" align="center" border="0" id="table13">
			<tr bgcolor="#e4f3fd">
				<td class="ver12"><font color="#225895"><b>
				<img border="0" src="images/Bordes/GrillaCuadroSuperiorIzquierdo1.gif" width="20" height="19" style="border: medium none"></b></font></td>
				<td align="right"><font color="#225895">
				<img border="0" src="images/Bordes/GrillaCuadroSuperiorDerecho1.gif" width="20" height="19" style="border: medium none"></font></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table14">
			<tr>
				<td width="10" bgcolor="#e4f3fd">&nbsp;</td>
				<td>
				<table cellspacing="1" cellpadding="3" width="423" border="0" id="table15">
					<tr bgcolor="#daeefc" class="tah14">
						<td class="hometexto" valign="top" width="415" bgcolor="#F1F9FE" height="25">
						<p align="center">
						<font color="#225895"><b>LA INFORMACIÓN SUMINISTRADA NO 
						PERTENECE A UN CUENTA, LA MISMA NO SE ENCUENTRA ACTIVA O 
						BIEN EXPIRÓ EL TIEMPO DE ESPERA.<br>
						POR FAVOR, REINGRESE LOS DATOS Y VUELVA A INTENTAR.</b></font></p>
						<p align="right">
						<font color="#225895"><b>MUCHAS GRACIAS.</b></font></p>
						</td>
					</tr>
				</table>
				</td>
				<td width="10" bgcolor="#e4f3fd">&nbsp;</td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table16">
			<tr bgcolor="#e4f3fd">
				<td>
				<img border="0" src="images/Bordes/GrillaCuadroBajoIzquierdo1.gif" width="20" height="19" style="border: medium none"></td>
				<td align="right">
				<img border="0" src="images/Bordes/GrillaCuadroBajoDerecho1.gif" width="20" height="19" style="border: medium none"></td>
			</tr>
		</table>
		</td>
		<td style="border-style: none; border-width: medium">&nbsp;</td>
	</tr>
</table>
<%
'response.Write("TipoDocumento: " & TipoDocumento)
'response.Write("NumDocumento: " & NumDocumento)
'response.Write("Password: " & Password)
'response.Write("GrupoID: " & GrupoID)
%>

</body>

</html>
