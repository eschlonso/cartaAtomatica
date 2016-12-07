<!-- BEGIN_BLOCK MODIFICACION -->
{strErrores}
<FORM name="socios_actualizacion_datos" action="sendmail.asp" method="post">
	<input name="strFrom"         type="hidden" value="Veneziaa@cartaautomatica.com.ar"/>
	<input name="strTo"           type="hidden" value="{strTo}"/>
	<input name="strSubject"      type="hidden" value="Actualizacion de Datos"/>
	<input name="strTemplateFile" type="hidden" value="templates/mail_socios_actualizacion_datos.tpl"/>
	<input name="strBodyFormat"   type="hidden" value="html"/>
	<input name="strReturnURL"    type="hidden" value="default.asp?strSection=main&strContentType=agradecimiento"/>
	<INPUT name="enviado" 		  type="hidden" value="1"/>
	<input name="strSocio"           type="hidden" value="{strSocio}"/>

<TABLE width="440" border="0" cellspacing="0" cellpadding="0">
	<TR>
		<TD width="183" valign="top"><IMG src="images/tit_datospersonales.gif" width="183" height="52"/></TD>
		<TD width="10" bgcolor="#E4F3FD">&nbsp;</TD>
		<TD bgcolor="#E4F3FD">
			<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
				<TR>
					<TD width="70" class="hometexto">&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD width="250" class="hometexto">Nombres</td>
					<TD><INPUT name="strNombres" type="text" value="{strNombres}" class="forms" size="27" maxlength="32"/></TD>
				</TR>
				<TR>
					<TD width="250" class="hometexto">Apellidos</td>
					<TD><INPUT name="strApellidos" type="text" value="{strApellidos}" class="forms" size="27" maxlength="32"/></TD>
				</TR>
				<TR>
					<TD class="hometexto">Fecha Nac.</TD>
					<TD class="hometexto">
						<INPUT name="strFechaD" type="text" value="{strFechaD}" class="forms" size="2" maxlength="2"/>
						<SELECT name="strFechaM" class="forms">
							<OPTION value=""></OPTION>
							<OPTION value="1">Enero</OPTION>
							<OPTION value="2">Febrero</OPTION>
							<OPTION value="3">Marzo</OPTION>
							<OPTION value="4">Abril</OPTION>
							<OPTION value="5">Mayo</OPTION>
							<OPTION value="6">Junio</OPTION>
							<OPTION value="7">Julio</OPTION>
							<OPTION value="8">Agosto</OPTION>
							<OPTION value="9">Sept.</OPTION>
							<OPTION value="10">Oct.</OPTION>
							<OPTION value="11">Nov.</OPTION>
							<OPTION value="12">Dic.</OPTION>
						</SELECT>
						<INPUT name="strFechaY" type="text" value="{strFechaY}" class="forms" size="4" maxlength="4"/>
					</TD>
				</TR>
				<TR>
					<TD class="hometexto">Direcci&oacute;n</TD>
					<TD><INPUT name="strDireccion" type="text" value="{strDireccion}" class="forms" size="27"/></TD>
				</TR>
				<TR>
					<TD class="hometexto">Localidad</TD>
					<TD><INPUT name="strLocalidad" type="text" value="{strLocalidad}" class="forms" size="27"/></TD>
				</TR>
				<tr>
					<TD class="hometexto">C.P.</TD>
					<TD>
                    <INPUT name="strCP" type="text" value="{strCP}" class="forms" size="27" maxlength="4"/></TD>
				</tr>
				<TR>
					<TD class="hometexto">Provincia</TD>
					<TD><INPUT name="strProvincia" type="text" value="{strProvincia}" class="forms" size="27"/></TD>
				</TR>
				<TR>
					<TD class="hometexto">Tel&eacute;fono</TD>
					<TD><INPUT name="strTelefono" type="text" value="{strTelefono}" class="forms" size="27"/></TD>
				</TR>
				<TR>
					<TD class="hometexto">E-Mail</TD>
					<TD><INPUT name="strEmail" type="text" value="{strEmail}" class="forms" size="27" onBlur="JavaScript:if(this.value.length > 0) validateEmail(this.form.name, this.name)"/></TD>
				</TR>
			</TABLE>
		</TD>
		<TD width="20" valign="top" bgcolor="#E4F3FD"><IMG src="images/borde_celeste.gif" width="20" height="19"/></TD>
	</TR>
	<TR>
		<TD>&nbsp;</TD>
		<TD bgcolor="#E4F3FD">&nbsp;</TD>
		<TD bgcolor="#E4F3FD">&nbsp;</TD>
		<TD valign="top" bgcolor="#E4F3FD"><IMG src="images/borde_celeste_bottom.gif" width="20" height="19"/></TD>
	</TR>
</TABLE>
<BR/>
<TABLE width="443" border="0" cellspacing="0" cellpadding="0">
	<tr>
		 <TD align="right"><A href="#" onClick="JavaScript: checkRequiredFields('socios_actualizacion_datos', 'strNombres,strApellidos,strFechaD,strFechaM,strFechaY,strDireccion,strLocalidad,strCP,strProvincia,strTelefono');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image53','','images/bot_enviar_on.gif',1)">
         <IMG src="images/bot_enviar.gif" name="Image53" border="0"/></A></TD>
		<!--// <TD align="right"><A href="#" onClick="JavaScript: document.forms['socios_actualizacion_datos'].submit();" onMouseOut="javaScript: MM_swapImgRestore();" onMouseOver="JavaScript: MM_swapImage('Image53', '', 'images/bot_actualizar_on.gif', 1);"><IMG src="images/bot_actualizar.gif" name="Image53" width="107" height="25" border="0"/></A></TD>//-->
	</TR>
</TABLE>
</FORM>




<SCRIPT language="JavaScript">
	document.forms['socios_actualizacion_datos']['strFechaM']['options']['{strFechaM}'].selected = true;
    </SCRIPT>
<!-- END_BLOCK MODIFICACION -->