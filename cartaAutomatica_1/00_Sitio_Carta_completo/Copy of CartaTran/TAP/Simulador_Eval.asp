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
<script language="JavaScript">
<!--
function FP_swapImg() {//v1.0
 var doc=document,args=arguments,elm,n; doc.$imgSwaps=new Array(); for(n=2; n<args.length;
 n+=2) { elm=FP_getObjectByID(args[n]); if(elm) { doc.$imgSwaps[doc.$imgSwaps.length]=elm;
 elm.$src=elm.src; elm.src=args[n+1]; } }
}

function FP_preloadImgs() {//v1.0
 var d=document,a=arguments; if(!d.FP_imgs) d.FP_imgs=new Array();
 for(var i=0; i<a.length; i++) { d.FP_imgs[i]=new Image; d.FP_imgs[i].src=a[i]; }
}

function FP_getObjectByID(id,o) {//v1.0
 var c,el,els,f,m,n; if(!o)o=document; if(o.getElementById) el=o.getElementById(id);
 else if(o.layers) c=o.layers; else if(o.all) el=o.all[id]; if(el) return el;
 if(o.id==id || o.name==id) return o; if(o.childNodes) c=o.childNodes; if(c)
 for(n=0; n<c.length; n++) { el=FP_getObjectByID(id,c[n]); if(el) return el; }
 f=o.forms; if(f) for(n=0; n<f.length; n++) { els=f[n].elements;
 for(m=0; m<els.length; m++){ el=FP_getObjectByID(id,els[n]); if(el) return el; } }
 return null;
}
// -->
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="FP_preloadImgs(/*url*/'botones/Simulacion_Pressed.gif', /*url*/'botones/Simulacion_Over.gif', /*url*/'button249.jpg', /*url*/'button24A.jpg')">

<%
Dim Plan, PlanID, ClaveID , Monto, Puede, Sugerencia

Plan = right(Request.Form("CmbPlan"), len(Request.Form("CmbPlan")) - InStr(1,Request.Form("CmbPlan"), "//") -1)
PlanID = LEFT(Request.Form("CmbPlan"), InStr(1,Request.Form("CmbPlan"), "//") -1)
ClaveID = Request.Form("CmbComercio")
Monto = Replace(Request.Form("TxtMonto"), ",", ".")


Dim Rs
SET RS = AbrirRS("esp_Simulacion " & Session("LegajoCuentaID") & "," & ClaveID & ", " & PlanID & ", " & Monto)

Monto = rs.fields("Monto").Value
Puede = rs.fields("Puede").Value
Sugerencia = rs.fields("Sugerencia").Value
%>
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
<% IF Puede = 1 THEN %>
						<table border="1" width="100%" id="table7" style="border-width: 0px">
							<tr>
								<td style="border-style: none; border-width: medium">&nbsp;</td>
								<td style="border-style: none; border-width: medium">
								<table cellspacing="0" cellpadding="0" width="433" class="tah12" align="center" border="0" id="table8">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>" width="20" height="19"></b></font></td>
										<td align="right"><font color="#225895">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>" width="20" height="19"></font></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table9">
									<tr>
										<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
										<td>
										<table cellspacing="1" cellpadding="3" width="423" border="0" id="table10">
											<tr bgcolor="#daeefc" class="tah14">
												<td class="hometexto" valign="top" width="415" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
												<font color="#225895"><b>RESULTADO 
												DE LA EVALUACIÓN</b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" valign="bottom" width="200" align="left">
												<font color="#225895"><b>Monto Pretendido</b></font></td>
												<td class="hometexto" valign="bottom" width="196" align="right">
												<font color="#225895">$<%Response.Write(Monto)%></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
												<td class="hometexto" valign="top" width="200" align="left">
												<b><font color="#225895">Forma de 
												Financiamiento</font></b></td>
												<td class="hometexto" valign="top" width="196" align="right">
												<font color="#225895"><%Response.Write(Plan)%></font></td>
											</tr>
											<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="ver14" width="396" align="left" colspan="2">&nbsp;</td>
											</tr>
											<tr valign="bottom" bgcolor="#daeefc" class="tah12">
												<td class="tah14" width="396" align="left" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>">
												<font color="#225895"><b><%Response.write(Sugerencia)%></td></b>
											</tr>
											</table>
										</td>
										<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table11">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
										<td align="right">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
									</tr>
								</table>
	<%ELSE%>
			<table cellspacing="0" cellpadding="0" width="462" class="tah12" align="center" border="0" id="table12">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td class="ver12"><font color="#225895">
										<b>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>" width="20" height="19"></b></font></td>
										<td align="right" width="33">
										<font color="#225895">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>" width="20" height="19"></font></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="468" align="center" border="0" id="table13">
									<tr>
										<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
										<td class="tah12">
										<table cellspacing="1" cellpadding="3" width="445" border="0" id="table14" height="263">
											<tr bgcolor="#daeefc" class="tah14">
												<td class="tah14" valign="top" width="437" colspan="4" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="16">
												<font color="#225895"><b>RESULTADO 
												DE LA EVALUACIÓN</b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah14">
												<td class="tah12" valign="top" width="219" colspan="2" bgcolor="<%Response.write( GrillaColorBorde)%>" height="13">
												<font color="#225895"><b>Monto Pretendido</b></font></td>
												<td class="tah12" valign="top" width="211" colspan="2" bgcolor="<%Response.write( GrillaColorBorde)%>" height="13" align="right">
												<font color="#225895">$<%Response.Write(Monto)%></font></td>
											</tr>
											<tr bgcolor="#daeefc" class="tah14">
												<td class="tah12" valign="top" width="219" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="11">
												<b><font color="#225895">Forma de 
												Financiamiento</font></b></td>
												<td class="tah12" valign="top" width="211" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro)%>" height="11" align="right">
												<font color="#225895"><%Response.Write(Plan)%></font></td>
											</tr>
											<tr bgcolor="#daeefc" class="tah14">
												<td class="ver14" valign="top" width="437" colspan="4" bgcolor="<%Response.write( GrillaColorBorde)%>" height="18">
												&nbsp;</td>
											</tr>
											<tr bgcolor="#daeefc" class="tah14">
												<td class="tah14" valign="top" align="center" width="437" colspan="4" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="24">
												<font color="#225895"><b><%Response.write(Sugerencia)%></b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah14">
												<td class="hometexto" valign="top" width="437" colspan="4" height="16"></td>
											</tr>
											<tr bgcolor="#daeefc" class="tah14">
												<td class="hometexto" valign="top" width="437" colspan="4" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="16">
												<font color="#225895"><b>DETALLE 
												DE VENCIMIENTOS</b></font></td>
											</tr>
											<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" valign="bottom" width="93" align="center" height="13">
												<p align="left">
												<font color="#225895"><b>FECHA</b></font></p>
												</td>
												<td class="hometexto" valign="bottom" width="114" align="center" height="13">
												<font color="#225895"><b>COMPRA 
												SIMULADA</b></font></td>
												<td class="hometexto" valign="bottom" width="112" align="center" height="13">
												<font color="#225895"><b>CUOTAS PACTADAS
												</b></font></td>
												<td class="hometexto" valign="bottom" width="89" align="center" height="13">
												<font color="#225895"><b>TOTAL 
												DEL MES</b></font></td>
											</tr>
											<%while not rs.eof = true%>
											<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
												<td class="hometexto" valign="top" width="93" align="left" height="13">
												<font color="#225895"><% Response.Write( rs.fields("FechaVencimiento").Value) %></font></td>
												<td class="hometexto" valign="bottom" width="114" align="right" height="13">
												<font color="#225895"><% Response.Write( rs.fields("Simulacion").Value) %></font></td>
												<td class="hometexto" valign="bottom" width="112" align="right" height="13">
												<font color="#225895"><% Response.Write( rs.fields("Otro").Value)%></font></td>
												<td class="hometexto" valign="bottom" width="89" align="right" height="13">
												<font color="#225895"><% Response.Write( rs.fields("Total").Value)%></font></td>
											</tr>
											<% rs.Movenext
											Wend%>
											<tr valign="top" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
												<td class="hometexto" width="409" align="left" bgcolor="<%Response.write(GrillaColorBorde)%>" colspan="4" height="13">&nbsp;</td>
											</tr>
										</table>
										</td>
										<td width="12" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="468" align="center" border="0" id="table15">
									<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
										<td>
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
										<td align="right">
										<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
									</tr>
								</table>
<%END IF%>
								<table border="1" cellspacing="0" style="border-collapse: collapse; border-width: 0px" width="100%">
									<tr>
										<td style="border-style: none; border-width: medium">&nbsp;</td>
										<td width="253" style="border-style: none; border-width: medium">
										<p align="left"><br>
										
										<img border="0" onclick="history.back()" id="img3" src="botones/Simulacion_Normal.gif" height="20" width="140" alt="Nueva Simulación" onmouseover="FP_swapImg(1,0,/*id*/'img3',/*url*/'botones/Simulacion_Over.gif')" onmouseout="FP_swapImg(0,0,/*id*/'img3',/*url*/'botones/Simulacion_Normal.gif')" onmousedown="FP_swapImg(1,0,/*id*/'img3',/*url*/'botones/Simulacion_Pressed.gif')" onmouseup="FP_swapImg(0,0,/*id*/'img3',/*url*/'botones/Simulacion_Over.gif')" fp-style="fp-btn: Corporate 9; fp-font-style: Bold; fp-font-size: 8; fp-font-color-normal: #F1F9FE; fp-font-color-hover: #225895; fp-font-color-press: #DAEEFC; fp-proportional: 0; fp-orig: 0" fp-title="Nueva Simulación" align="left"></p>
										</td>
									</tr>
								</table>
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