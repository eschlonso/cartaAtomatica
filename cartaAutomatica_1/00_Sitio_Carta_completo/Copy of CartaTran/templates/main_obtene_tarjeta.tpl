<form name="solicitud_tarjeta" action="sendmail.asp" method="post">
	<input name="strFrom"         type="hidden" value="website@cartaautomatica.com">
	<input name="strTo"           type="hidden" value="{strTo}">
	<input name="strSubject"      type="hidden" value="Solicitud de Tarjeta">
	<input name="strTemplateFile" type="hidden" value="templates/mail_obtene_tarjeta.tpl">
	<input name="strBodyFormat"   type="hidden" value="html">
	<input name="strReturnURL"    type="hidden" value="default.asp?strSection=main&strContentType=agradecimiento_especial">
<table width="433" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td class="texto"><b class="destacados">* Requisitos:</b> <br>
			-	Mayor de 18 a&ntilde;os.<br>
			-	DNI/LC/LE/CI del Mercosur.<br>
			-	Ultima factura de un servicio o impuesto a tu nombre.<br>
			- Teléfono fijo particular.<br>
			- Teléfono fijo de referencia.<br>
			<br>
			<b class="destacados"> Y seg&uacute;n la actividad:</b> 
		</td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="20" valign="top"><img src="images/bullet.gif" width="9" height="6" vspace="6"></td>
		<td colspan="2" class="texto"><b>Empleados:</b> Ultimo recibo de sueldo.</td>
	</tr>
	<tr>
		<td valign="top"><img src="images/bullet.gif" width="9" height="6" vspace="6"></td>
		<td colspan="2" class="texto"><b>Jubilados y Pensionados:</b> Hasta 75 a&ntilde;os, &uacute;ltimo recibo de haberes jubilatorios.</td>
	</tr>
	<tr>
		<td valign="top"><img src="images/bullet.gif" width="9" height="6" vspace="6"></td>
		<td colspan="2" class="texto"><b>Aut&oacute;nomos: </b>Mayor de 21 a&ntilde;os. </td>
	</tr>
	<tr>
		<td valign="top">&nbsp;</td>
		<td width="20" class="texto">&nbsp;</td>
		<td class="texto">
			<B>-Responsable Inscripto:</B> Inscripción en la AFIP, declaraci&oacute;n jurada de ganancias, 
			último pago de impuesto a las ganancias, último pago de IVA, inscripci&oacute;n y &uacute;ltimo pago de ingresos brutos.
			<br>
			<B>-Monotributista:</B> Inscripci&oacute;n (formulario 162) y último pago de monotributo, 
			inscripci&oacute;n y &uacute;ltimo pago de ingresos brutos.
			<br>
			<B>-Profesionales:</B> Ultimo pago de matr&iacute;cula y fotocopia de matr&iacute;cula.
		</td>
	</tr>
</table>
<BR>
<table width="433" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0" align="center">
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
						<input name="strNombre" type="text" class="forms" size="28">
					</td>
					<td width="200" valign="top" class="hometexto">
						<input name="strApellido" type="text" class="forms" size="28">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Localidad:</b></td>
					<td width="200" class="hometexto"><b>Provincia:</b></td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto">
						<input name="strLocalidad" type="text" class="forms" size="28"></td>
					<td width="200" class="hometexto">
						<input name="strProvincia" type="text" class="forms" size="28"></td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Tel&eacute;fono:</b></td>
					<td width="200" class="hometexto"><b>Móvil (opcional):</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strTelefono" type="text" class="forms" size="28">
					</td>
					<td width="200" class="hometexto">
						<input name="strMovil" type="text" class="forms" size="28">
					</td>
				</tr>
				<tr valign="bottom" bgcolor="#DAEEFC">
					<td width="200" class="hometexto"><b>Mail (opcional):</b></td>
					<td width="200" class="hometexto"><b>Horario de contacto:</b></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td width="200" class="hometexto">
						<input name="strEmail" type="text" class="forms" size="28" onBlur="JavaScript:if(this.value.length > 0) validateEmail(this.form.name, this.name)"/>
					</td>
					<td width="200" class="hometexto">
						<input name="strHorario" type="text" class="forms" size="28"/>
					</td>
				</tr>
			</table>
		</td>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
</table>
<table width="433" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>
<br>
<table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center"><a onClick="JavaScript: checkRequiredFields('solicitud_tarjeta', 'strNombre,strApellido,strLocalidad,strProvincia,strTelefono,strHorario')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image53','','images/bot_enviar_on.gif',1)"><img src="images/bot_enviar.gif" name="Image53" width="81" height="23" border="0"></a></td>
	</tr>
</table>
</form>