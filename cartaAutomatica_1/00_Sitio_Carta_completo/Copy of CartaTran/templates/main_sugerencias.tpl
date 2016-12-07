<form name="sugerencias" action="sendmail.asp" method="post">
	<input name="strFrom"         type="hidden" value="info@cartaautomatica.com.ar"/>
	<input name="strTo"           type="hidden" value="{strTo}"/>
	<input name="strSubject"      type="hidden" value="Sugerencia"/>
	<input name="strTemplateFile" type="hidden" value="templates/mail_sugerencias.tpl"/>
	<input name="strBodyFormat"   type="hidden" value="html"/>
	<input name="strReturnURL"    type="hidden" value="default.asp?strSection=main&strContentType=agradecimiento"/>
<table width="433" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#E4F3FD">&nbsp;</td>
		<td bgcolor="#E4F3FD" class="hometexto"><b class="destacados">COMPLETA LOS DATOS </b></td>
		<td bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
	<tr>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
		<td>
			<table width="413" border="0" cellspacing="1" cellpadding="3">
				<tr bgcolor="#DAEEFC">
					<td width="200" valign="bottom" class="hometexto"><b>Nombre:</b></td>
					<td width="200" valign="bottom" class="hometexto"><b>Apellido:</b></td>
				</tr>
				<tr bgcolor="#F1F9FE">
					<td width="200" valign="top" class="hometexto">
						<input name="strSenderName" type="text" class="forms" size="26">
					</td>
					<td width="200" valign="top" class="hometexto">
						<input name="strSenderLastName" type="text" class="forms" size="26">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Mail:</b></td>
					<td width="200" class="hometexto"><img src="images/1x1.gif" width="1" height="1"></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strSenderEmail" type="text" class="forms" size="26">
					</td>
					<td width="200" class="hometexto">&nbsp;</td>
				</tr>
				<tr valign="top" bgcolor="#DAEEFC">
					<td valign="bottom" class="hometexto"><b>Sugerencias - Consultas:</b></td>
					<td class="hometexto"><img src="images/1x1.gif" width="1" height="1"></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td colspan="2" class="hometexto" align="center">
						<textarea name="strBody" cols="76" rows="8" class="forms"></textarea>
					</td>
				</tr>
			</table>
		</td>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
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
		<td align="center"><a onClick="JavaScript: checkRequiredFields('sugerencias', 'strSenderName,strSenderLastName,strSenderEmail,strBody');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image53','','images/bot_enviar_on.gif',1)"><img src="images/bot_enviar.gif" name="Image53" width="81" height="23" border="0"></a></td>
	</tr>
</table>
</form>