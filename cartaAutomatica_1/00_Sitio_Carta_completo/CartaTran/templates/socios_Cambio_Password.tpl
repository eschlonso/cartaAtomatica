

<script LANGUAGE="VBScript">
<!--
SUB ValidarPasswords()

Dim XPWD
Dim xPasswordOLD
Dim	xPasswordNew
Dim xPasswordNewVerificacion

XPWD = Cambio_password.PWD.value

xPasswordOLD = trim(Cambio_password.PasswordOLD.value)
IF xPasswordOLD = "" THEN
	Alert "Debés completar el campo que contiene tu Contraseña Actual."
	exit sub
end if

xPasswordNew = trim(Cambio_password.PasswordNew.value)
IF xPasswordNew = "" THEN
	Alert "Debés completar el campo donde indicás tu Nueva Contraseña."
	exit sub
end if

IF len(xPasswordNew) < 4 Then
	alert "Tu nueva contraseña es demasiado corta. (Mínimo 4 caracteres)."
	Cambio_password.PasswordNew.Value = ""
	Cambio_password.PasswordNewVerificacion.Value = ""
	exit sub
end if

xPasswordNewVerificacion = trim(Cambio_password.PasswordNewVerificacion.value)
IF xPasswordNewVerificacion = "" THEN
	Alert "Debés completar el campo de verificación de tu contraseña nueva."
	exit sub
end if


IF xPasswordOLD  <> XPWD THEN
	Alert "Tu Contraseña actual no coincide con la contraseña ingresada. Volvé a ingresarla."
	Cambio_password.PasswordOLD.Value = ""
	exit sub
end if


IF xPasswordNew  <> xPasswordNewVerificacion THEN
	Alert "Tu Contraseña nueva y su verificación no coinciden. Volvé a completar los campos."
	Cambio_password.PasswordNew.Value = ""
	Cambio_password.PasswordNewVerificacion.Value = ""
	exit sub
end if

	Cambio_password.submit
End Sub

-->
</script>


<form name="Cambio_password" action="Socio_Cambio_password.asp" method="post">
<input name="PWD"         type="hidden" value="{strPWD}"/>
<table width="433" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table width="427" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
	<tr>
		<td bgcolor="#E4F3FD" width="8">&nbsp;</td>
		<td bgcolor="#E4F3FD" class="hometexto" width="504"><b class="destacados">Completa 
        los siguientes campos:</b></td>
		<td bgcolor="#E4F3FD" width="70">&nbsp;</td>
	</tr>
	<tr>
		<td width="8" bgcolor="#E4F3FD">&nbsp;</td>
		<td width="504">
			<table width="420" border="0" cellspacing="0" cellpadding="3" style="border-collapse: collapse" bordercolor="#111111" height="186">
				<tr bgcolor="#DAEEFC">
					<td width="137" class="hometexto" align="center" bgcolor="#E4F3FD" height="52">
                    <p align="left">Contraseña 
                    Anterior</td>
					<td width="249" class="hometexto" align="left" bgcolor="#E4F3FD" height="52">
                    <input type="password" name="PasswordOLD" size="16"></td>
				</tr>
				<tr bgcolor="#F1F9FE">
					<td width="137" class="hometexto" bgcolor="#E4F3FD" align="center" height="44">
						<p align="left">Contraseña Nueva</td>
					<td width="249" class="hometexto" bgcolor="#E4F3FD" align="left" height="44">
						<input type="password" name="PasswordNew" size="16"></td>
				</tr>
				<tr bgcolor="#DAEEFC">
					<td width="137" class="hometexto"  bgcolor="#E4F3FD"  align="center" height="44">
                    <p align="left">Reingrese la nueva Contraseña</td>
					<td width="249" class="hometexto" align="left" bgcolor="#E4F3FD" height="44">
                    <input type="password" name="PasswordNewVerificacion" size="16"></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td colspan="2" class="hometexto" align="center" width="393" bgcolor="#E4F3FD" height="22">
						&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="70" bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>
<br>
<table width="443" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center"><a onClick="vbscript:ValidarPasswords()" onMouseOut="javaScript: MM_swapImgRestore();" onMouseOver="JavaScript: MM_swapImage('Image53', '', 'images/bot_actualizar_on.gif', 1);"     >
        <img src="images/bot_actualizar.gif" name="Image53" border="0"></a></td>
	</tr>
</table>
</form>