<form name="adhesion_comercio" action="sendmail.asp" method="post">
	<input name="strFrom"         type="hidden" value="website@cartaautomatica.com.ar">
	<input name="strTo"           type="hidden" value="{strTo}">
	<input name="strSubject"      type="hidden" value="Adhesión de Comercio">
	<input name="strTemplateFile" type="hidden" value="templates/mail_adhesion_comercio.tpl">
	<input name="strBodyFormat"   type="hidden" value="html">
	<input name="strReturnURL"    type="hidden" value="default.asp?strSection=main&strContentType=agradecimiento">
<table width="433" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#E4F3FD">&nbsp;</td>
		<td bgcolor="#E4F3FD" class="hometexto"><b class="destacados">COMPLETE LOS DATOS DEL COMERCIO QUE DESEA ADHERIR</b></td>
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
					<td width="200" class="hometexto"><b>Raz&oacute;n Social:</b></td>
					<td width="200" class="hometexto"><b>Nombre fantas&iacute;a del comercio:</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strRazonSocial" type="text" class="forms" size="26">
					</td>
					<td width="200" class="hometexto">
						<input name="strNombreFantasia" type="text" class="forms" size="26">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>CUIT:</b></td>
					<td width="200" class="hometexto"><b>Direcci&oacute;n:</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strCUIT" type="text" class="forms" size="26">
					</td>
					<td width="200" class="hometexto">
						<input name="strDireccion" type="text" class="forms" size="26">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Localidad:</b></td>
					<td width="200" class="hometexto"><b>CP:</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strLocalidad" type="text" class="forms" size="26">
					</td>
					<td width="200" class="hometexto">
						<input name="strCP" type="text" class="forms" size="26">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Tel&eacute;fono:</b></td>
					<td width="200" class="hometexto"><b>Mail:</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strTelefono" type="text" class="forms" size="26">
					</td>
					<td width="200" class="hometexto">
						<input name="strEmail" type="text" class="forms" size="26" onBlur="JavaScript: validateEmail(this.form.name, this.name);">
					</td>
				</tr>
				<tr valign="top" bgcolor="#DAEEFC">
					<td valign="bottom" class="hometexto"><b>Comentarios:</b></td>
					<td class="hometexto"></td>
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
		<td align="center"><a onClick="JavaScript: checkRequiredFields('adhesion_comercio', 'strSenderName,strSenderLastName,strRazonSocial,strNombreFantasia,strCUIT,strDireccion,strLocalidad,strCP,strTelefono,strEmail');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image53','','images/bot_enviar_on.gif',1)"><img src="images/bot_enviar.gif" name="Image53" width="81" height="23" border="0"></a></td>
	</tr>
</table>
<P class="texto" align ="justify">Por cualquier consulta comuníquese al 
0-810-999-9988</P> 
</form>