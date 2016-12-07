

<script LANGUAGE="VBScript">
<!--
SUB Validar()

Dim strSucursalID 
strSucursalID = buscarComercios.strSucursalId.value 

Dim strRubroID 
strRubroID = buscarComercios.strRubroId.value

Dim strComercio 
strComercio = TRIM(buscarComercios.strComercio.value)


IF (strSucursalID = 0 AND strRubroID = 0 AND strComercio = "") = true THEN
	alert "Debés acotar tu búsqueda eligiendo Sucursal y Rubro o Sucursal y Comercio o bien el nombre del comercio en el que estas interesado."
	exit sub
END IF

IF strSucursalID <> 0 AND strRubroID = 0 AND strComercio = "" THEN
	alert "Debés seleccionar un rubro o bien colocar el nombre del comercio."
	exit sub
END IF	

IF strRubroID <> 0 AND strSucursalID = 0 AND strComercio = "" THEN
	alert "Debés seleccionar una Sucursal o bien colocar el nombre del comercio."
	exit sub
END IF	

	buscarComercios.submit
End Sub

-->
</script>

					<br>
					<FORM name="buscarComercios" action="default.asp?strSection=main&strContentType=buscador_comercios" method="post">
						<table width="147" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="3"><img src="images/tit_comercios.gif" width="147" height="30"></td>
							</tr>
							<tr bgcolor="#DCDCDC">
								<td width="10"><img src="images/1x1.gif" width="1" height="20"></td>
								<td width="127" valign="bottom" class="hometexto">Sucursal</td>
								<td width="10"><img src="images/1x1.gif" width="1" height="20"></td>
							</tr>
							
							<tr bgcolor="#DCDCDC">
								<td>&nbsp;</td>
								<td>
									<SELECT name="strSucursalId" class="forms" STYLE="width: 120px;">
										<OPTION value="0">Todas</OPTION>
										<OPTGROUP LABEL="-----------------------------"></OPTGROUP>
										
									    
									    
									    
									    
									    
									    
									    
									    
									    {strSucOptionTemplate}
									</SELECT>
									<br>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr bgcolor="#DCDCDC">
								<td><img src="images/1x1.gif" width="1" height="15"></td>
								<td valign="bottom" class="hometexto">Rubro</td>
								<td><img src="images/1x1.gif" width="1" height="15"></td>
							</tr>
							<tr bgcolor="#DCDCDC">
								<td>&nbsp;</td>
								<td>
									<!--input name="strRubro" type="text" class="forms" size="20"-->
									<SELECT name="strRubroId" class="forms" STYLE="width: 120px;">
										<OPTION value="0">Todos</OPTION>
										<OPTGROUP LABEL="-----------------------------"></OPTGROUP>
										
									    
									    
									    
									    
									    
									    
									    
									    
									    {strRubOptionTemplate}
									</SELECT>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr valign="bottom" bgcolor="#DCDCDC">
								<td><img src="images/1x1.gif" width="1" height="15"></td>
								<td class="hometexto">Comercio</td>
								<td><img src="images/1x1.gif" width="1" height="15"></td>
							</tr>
							<tr bgcolor="#DCDCDC">
								<td>&nbsp;</td>
								<td>
									<input name="strComercio" type="text" class="forms" size="20">
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr bgcolor="#DCDCDC">
								<td colspan="3"><img src="images/1x1.gif" width="1" height="5"></td>
							</tr>
							<tr>
								<TD colspan="3"><A href="#" onClick="vbscript:Validar()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image43','','images/bot_buscar_com_on.gif',1)"><IMG name="btnBuscar" src="images/bot_buscar_com.gif" name="Image43" width="147" height="31" border="0"></A></TD>
							</tr>
						</table>
					</FORM>