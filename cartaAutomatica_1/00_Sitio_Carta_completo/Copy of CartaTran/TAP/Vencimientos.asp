<!--#INCLUDE FILE="Libreria.asp"-->
<%SesionActiva%>

<head>
<meta http-equiv="Content-Language" content="es">
<style type="text/css">
<!--
img {
	border: none;
}
.tah10 {
	font-family: Tahoma;
	font-size: 10px;
	text-decoration: none;
	color: #000000;
}
.tah11 {
	font-family: Tahoma;
	font-size: 11px;
	text-decoration: none;
	color: #000000;
}
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
.ver10 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	text-decoration: none;
	color: #000000;
}
.ver11 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	text-decoration: none;
	color: #000000;
}
.tah9 {
	font-family: Tahoma;
	font-size: 9px;
	text-decoration: none;
	color: #000000;
}
.ver9 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	text-decoration: none;
	color: #000000;
}
.ver14 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
	text-decoration: none;
	color: #000000;
}
-->
</style>
<base target="bottom">
<title>Vencimientos del período</title>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<% Dim HayDatos, FechaC, Ven1Fecha, Ven1Monto, Ven2Fecha, Ven2Monto, PE, Composicion

Recordatorio HayDatos, FechaC, Ven1Fecha, Ven1Monto, Ven2Fecha, Ven2Monto, PE, Composicion

%>

<table width="100%" height="30%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td width="50%" rowspan="2"></td>
		<td width="4" bgcolor="#000000" rowspan="2"></td>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		</td>
		<td width="50%" rowspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td height="100%">
		<table width="780" border="0" cellpadding="0" cellspacing="0" height="64%">
			<tr>
				<td width="780" height="100%">
				<table width="780" cellpadding="0" cellspacing="0" height="232">
					<tr>
						<td width="780" height="232" class="ver14" valign="top" style="border-style: none; border-width: medium">
						<table cellspacing="0" cellpadding="0" width="770" align="center" border="0" id="table12">
							<tr>
								<td class="texto" valign="top" align="left" width="443" bgcolor="#ffffff">
								&nbsp;</td>
							</tr>
						</table>
 <%IF HayDatos= 0 THEN%>
						<table border="1" width="100%" id="table13" style="border-width: 0px">
							<tr>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
								<td style="border-style: none; border-width: medium">
								<table cellspacing="0" cellpadding="0" width="433" class="tah12" align="center" border="0" id="table14">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>' width="26" height="19"></b></font></td>
										<td align="right"><font color="#225895">
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>' width="22" height="19"></font></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table15">
									<tr>
										<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
										<td class="tah12">
										<table cellspacing="1" cellpadding="3" width="423" border="0" id="table16">
											<tr bgcolor="#daeefc" class="tah14">
												<td class="hometexto" valign="top" width="415" colspan="4" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
												<p align="left">
												<font color="#225895"><b>ÚLTIMO 
												RECORDATORIO EMITIDO</b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" valign="bottom" width="135" align="center">
												<p align="left">
												<font color="#225895"><b>FECHA DE 
												CIERRE</b></font></p>
												</td>
												<td class="hometexto" valign="bottom" width="273" align="center" colspan="3">
												<p align="left">
												<font color="#225895"><%Response.write(FechaC)%></font></p>
												</td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
												<td class="hometexto" valign="top" width="135" align="left">
												<font color="#225895"><b>PRIMER VENCIMIENTO</b></font></td>
												<td class="hometexto" valign="top" width="69" align="left">
												<font color="#225895"><%Response.write(Ven1Fecha)%></font></td>
												<td class="hometexto" valign="top" width="112" align="right">
												<font color="#225895"><b>IMPORTE
												</b></font></td>
												<td class="hometexto" valign="top" width="78" align="left">
												<p align="right">
												<span lang="es">
												<font color="#225895">$ <%Response.write(Ven1Monto)%></font></p>
												</td>
											</tr>
											<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" width="135" align="left">
												<font color="#225895"><b>SEGUNDO VENCIMIENTO</b></font></td>
												<td class="hometexto" width="69" align="left">
												<font color="#225895"><%Response.write(Ven2Fecha)%></font></td>
												<td class="hometexto" width="112" align="right">
												<font color="#225895"><b>IMPORTE</b></font></td>
												<td class="hometexto" width="78" align="left">
												<p align="right">
												<span lang="es">
												<font color="#225895">$ <%Response.write(Ven2Monto)%></font></p>
												</td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
												<td class="hometexto" width="135" align="left">
												<font color="#225895"><b>
												<% 	IF PE <> "" THEN
															Response.write("CLAVE PAGO ELECTRÓNICO")
														ELSE
															Response.write("&nbsp;")
													END IF %>
												</b></font></td>
												<td class="hometexto" width="273" align="left" colspan="3">
												<font color="#225895">
												<%  IF PE <> "" THEN
														Response.write(PE)
													END IF 
												%>
												</font></td>
											</tr>											
										</table>
								<table cellspacing="0" cellpadding="0" width="422" align="center" border="0" id="table15" height="90">
											<tr valign="bottom" bgcolor="#daeefc" class="tah12">
												<td class="hometexto" width="362" align="left" bgcolor="<%Response.write(GrillaColorBorde)%>" colspan="4">
												&nbsp;</td>
											</tr>
											<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah14">
												<td class="tah14" valign="middle" width="415" colspan="4" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25" align="center">
												<p align="left">
												<font  color="#225895" ><b>DETALLE DE 
												COMPOSICIÓN</b></font></td>
											</tr>
											<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" width="83" valign=middle align="left" height="23">
												<b><font color="#225895">
												VENCIMIENTO</font></b></td>
												<td class="hometexto" width="65" valign=center align="left" height="23">
												<b><font color="#225895">COMPRA</font></b></td>
												<td class="hometexto" width="216" valign=center align="left" height="23">
												<font color="#225895"><b>OPERACIÓN</b></font></td>
												<td class="hometexto" width="58" valign=center align="left" height="23">
												<b><font color="#225895">IMPORTE</font></b></td>
											</tr>
											<%response.write(Composicion)%>
										</table>
										</td>
										<td width="4" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table17">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
										<td align="right">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
									</tr>
								</table>
 <%ELSE%>								
		<table cellspacing="0" cellpadding="0" width="433" class="tah12" align="center" border="0" id="table18">
			<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
				<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>' width="26" height="19"></b></font></td>
				<td align="right"><font color="#225895">
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>' width="22" height="19"></font></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table19">
			<tr>
				<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
				<td>
				<table cellspacing="1" cellpadding="3" width="423" border="0" id="table20">
					<tr bgcolor="#daeefc" class="tah14">
						<td class="hometexto" valign="top" width="415" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
						<p align="center">
						<font color="#225895"><b>USTED NO POSEE UN RECORDATORIO 
						DE PAGOS PARA ESTE PERÍODO</b></font></p>
						</td>
					</tr>
				</table>
				</td>
				<td width="10" bgcolor=<%Response.write(GrillaColorBorde)%>>&nbsp;</td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table21">
			<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
				<td>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
				<td align="right">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
			</tr>
		</table>
<%End if%>
								</td>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>