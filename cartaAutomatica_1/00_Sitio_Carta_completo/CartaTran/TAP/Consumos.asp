<!--#INCLUDE FILE="Libreria.asp"-->
<%SesionActiva%>
<head>
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
<title>Consumos</title>
</head>
<%

DIM Detalle
Detalle = Consumos()

%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" height="30%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td width="50%" rowspan="2"></td>
		<td width="4" bgcolor="#000000" rowspan="2"></td>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="16"></td>
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
						<table cellspacing="0" cellpadding="0" width="770" align="center" border="0" id="table2">
							<tr>
								<td class="texto" valign="top" align="left" width="443" bgcolor="#ffffff">
								<br>
								</td>
							</tr>
						</table>
						
<%IF Detalle <> "" THEN %>
						<table border="1" width="100%" id="table7" style="border-width: 0px">
							<tr>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
								<td style="border-style: none; border-width: medium">
								<table cellspacing="0" cellpadding="0" width="608" class="tah12" align="center" border="0" id="table8">
									<tr bgcolor=<%Response.write(GrillaColorBorde)%>>
										<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo )%>' width="20" height="19"></b></font></td>
										<td align="right" width="139">
										<font color="#225895">
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>' width="20" height="19"></font></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="609" align="center" border="0" id="table9">
									<tr>
										<td width="10" bgcolor='<%Response.write(GrillaColorBorde)%>'>&nbsp;</td>
										<td class="tah12">
										<table cellspacing="1" cellpadding="3" width="591" border="0" id="table10">
											<tr bgcolor="#daeefc" class="tah14">
												<td class="hometexto" valign="top" width="583" colspan="5" bgcolor='<%Response.write(GrillaColorInteriorClaro )%>' height="25">
												<font color="#225895"><b>CONSUMOS</b></font></td>
											</tr>
											<tr bgcolor='<%Response.write(GrillaColorBorde)%>' class="tah12">
												<td class="hometexto" valign="bottom" width="276" align="center">
												<p align="left">
												<font color="#225895"><b>CONSUMO</b></font></p>
												</td>
												<td class="hometexto" valign="bottom" width="68" align="center">
												<font color="#225895"><b>VALOR CUOTA</b></font></td>
												<td class="hometexto" valign="bottom" width="70" align="center">
												<font color="#225895"><b>PRÓXIMO 
												VENC.</b></font></td>
												<td class="hometexto" valign="bottom" width="71" align="center">
												<font color="#225895"><b>CTAS. PENDIENTES</b></font></td>
												<td class="hometexto" valign="bottom" width="70" align="center">
												<font color="#225895"><b>SALDO</b></font></td>
											</tr>
<% Response.write(Detalle)%>
										</table>
										</td>
										<td width="10" bgcolor='<%Response.write(GrillaColorBorde)%>'>&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="607" align="center" border="0" id="table11">
									<tr bgcolor='<%Response.write(GrillaColorBorde)%>'>
										<td>
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>' width="20" height="19"></td>
										<td align="right">
										<img border="0" src='images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>' width="20" height="19"></td>
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
						<font color="#225895"><b>USTED NO POSEE CONSUMOS ACTIVOS</b></font></p>
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
<%END IF%>
								
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