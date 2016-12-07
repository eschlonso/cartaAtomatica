<!--#INCLUDE FILE="Libreria.asp"--><%SesionActiva%>

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
</head>

<%
'Leo los limites y luego armo la pantalla
Dim GA, GD, MA, MD

Limites GA, GD, MA, MD


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
						<table border="1" width="100%" id="table7" style="border-width: 0px">
							<tr>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
								<td style="border-style: none; border-width: medium">
								<table cellspacing="0" cellpadding="0" width="380" class="tah12" align="center" border="0" id="table8">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>" width="20" height="19"></b></font></td>
										<td align="right"><font color="#225895">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>" width="20" height="19"></font></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="380" align="center" border="0" id="table9">
									<tr>
										<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
										<td>
										<table cellspacing="1" cellpadding="3" width="361" border="0" id="table10">
											<tr bgcolor="#daeefc" class="tah14">
												<td class="hometexto" valign="top" width="353" colspan="3" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
												<font color="#225895"><b>LIMITES 
												DE COMPRA</b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" valign="bottom" width="74" align="left">&nbsp;</td>
												<td class="hometexto" valign="bottom" width="99" align="right">
												<font color="#225895"><b>ASIGNADO</b></font></td>
												<td class="hometexto" valign="bottom" width="167" align="right">
												<b><font color="#225895">DISPONIBLE</font></b></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
												<td class="hometexto" valign="top" width="74" align="left">
												<font color="#225895"><b>TOTAL</b></font></td>
												<td class="hometexto" valign="top" width="99" align="right">
												<font color="#225895">$ <%Response.write(GA)%></font></td>
												<td class="hometexto" valign="top" width="167" align="right">
												<font color="#225895">$<%Response.write(GD)%></font></td>
											</tr>
											<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" width="74" align="left">
												<font color="#225895"><b>MENSUAL</b></font></td>
												<td class="hometexto" width="99" align="right">
												<font color="#225895">$<%Response.write(MA)%></font></td>
												<td class="hometexto" width="167" align="right">
												<font color="#225895">$<%Response.write(MD)%></font></td>
											</tr>
										</table>
										</td>
										<td width="11" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="382" align="center" border="0" id="table11">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
										<td align="right">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
									</tr>
								</table>
								</td>
								<td style="border-style: none; border-width: medium" width="4">&nbsp;</td>
							</tr>
							<tr>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
								<td style="border-style: none; border-width: medium" class="ver14">
								<p align="justify"><font color="#225895"><br>
								El <b>LIMITE TOTAL </b>representa el importe máximo 
								que usted y sus adicionales pueden adeudar con la 
								tarjeta. De ese valor que se le asigna en un principio, 
								cada compra que se realiza va descontando y cada 
								pago lo va reestableciendo, lo que lleva a determinar 
								el <b>DISPONIBLE</b> de la cuenta en un momento 
								dado.</font></p>
								<p align="justify"><font color="#225895">A su vez 
								existe también un <b>LIMITE MENSUAL</b> que establece 
								el importe máximo de cuotas que puede vencer en 
								un mes. Al igual que con el límite total, cada cuota 
								que vence en el mes lo disminuye y cuando las cuotas 
								se pagan, se reestablece.</p>
								</font></td>
								<td style="border-style: none; border-width: medium" width="4">&nbsp;</td>
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
