<!--#INCLUDE FILE="Libreria.asp"--><%SesionActiva%>

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
<base target="_self">
<title>Simulador de Compra</title>
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

<script LANGUAGE="VBScript">
<!--
SUB Validar()
Dim Monto 
Monto = Replace(Form_Simulador.TxtMonto.value,",",".")
if IsNumeric(Monto) = false then
	alert "El Monto debe ser un valor numérico."
	Form_Simulador.TxtMonto.select
	exit sub
end if


if CDbl(Monto) = CDbl(0) then
	alert "Debe especificar el monto de la compra que desea simular."
	Form_Simulador.TxtMonto.select
	exit sub
END IF

if CDbl(Monto) > CDbl(50000) then
	alert "El Monto a simular no puede ser superior a $50000."
	Form_Simulador.TxtMonto.value = 50000.00
	Form_Simulador.TxtMonto.select
	exit sub
END IF

	Form_Simulador.submit
End Sub
-->
</script>
</head>

<body onload="Form_Simulador.TxtMonto.select" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="FP_preloadImgs(/*url*/'botones/Simular_Pressed.gif',/*url*/'botones/Simular_Over.gif')">

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
						<form name="Form_Simulador" method="POST" action="Simulador_Eval.asp">
							<br>
							<table cellspacing="0" cellpadding="0" width="770" align="center" border="0" id="table2">
								<tr>
									<td class="texto" valign="top" align="left" width="443" bgcolor="#ffffff">
									</td>
								</tr>
							</table>
							<input type="hidden" name="Ingreso" value="0" id="Hidden1">
							<table border="1" width="100%" id="table7" style="border-width: 0px">
								<tr>
									<td style="border-style: none; border-width: medium">&nbsp;</td>
									<td style="border-style: none; border-width: medium">
									<table cellspacing="0" cellpadding="0" width="433" class="tah12" align="center" border="0" id="table8">
										<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
											<td class="ver12">
											<font color="#225895"><b>
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>" width="20" height="19"></b></font></td>
											<td align="right">
											<font color="#225895">
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>" width="20" height="19"></font></td>
										</tr>
									</table>
									<table cellspacing="0" cellpadding="0" width="433" align="center" border="0" id="table9">
										<tr>
											<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
											<td class="tah12">
											<table cellspacing="1" cellpadding="3" width="423" border="0" id="table10">
												<tr bgcolor="#daeefc" class="tah14">
													<td class="hometexto" valign="top" width="415" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
													<font color="#225895"><b>SIMULADOR 
													DE COMPRA</b></font></td>
												</tr>
												<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
													<td class="hometexto" valign="bottom" width="232" align="center">
													<p align="left"><b>
													<font color="#225895">Ingrese 
													el monto que desea comprar</font></b></p>
													</td>
													<td class="hometexto" valign="bottom" width="176" align="center">
													<input name="TxtMonto" size="9" style="float: left; text-align: right" tabindex="0" class="tah14" value="0.00"></td>
												</tr>
												<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
													<td class="hometexto" valign="top" width="232" align="left">
													<b><font color="#225895">Seleccione 
													el comercio / sucursal</font></b></td>
													<td class="hometexto" valign="top" width="176" align="right">
													<p align="left">
													<select size="1" name="CmbComercio" tabindex="1" class="tah12">
													<%Response.write(SimuladorComercios)%>
													</select> </p>
													</td>
												</tr>
												<tr bgcolor="#f1f9fe" class="tah12">
													<td class="hometexto" valign="top" width="232" align="left" bgcolor="<%Response.write(GrillaColorBorde)%>">
													<b><font color="#225895">Seleccione 
													la Forma de Financiamiento</font></b><font color="#225895" size="1"><span lang="es-ar">*</td>
													<td class="hometexto" valign="top" width="176" align="right" bgcolor="<%Response.write(GrillaColorBorde)%>">
													<p align="left">
													<select size="1" name="CmbPlan" tabindex="1" class="tah12">
													<%response.write(SimuladorPlanes(0))%>
													</select></p>
													</td>
												</tr>
												<tr valign="bottom" bgcolor="#daeefc" class="tah12">
													<td class="hometexto" width="408" align="left" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>">
													<img border="0" onclick="vbscript:Validar()" id="img2" src="botones/Simular_Normal.gif" height="20" width="100" alt="Simular" fp-style="fp-btn: Corporate 9; fp-font-style: Bold; fp-font-size: 8; fp-font-color-normal: #F1F9FE; fp-font-color-hover: #225895; fp-font-color-press: #DAEEFC; fp-orig: 0" fp-title="Simular" onmouseover="FP_swapImg(1,0,/*id*/'img2',/*url*/'botones/Simular_Over.gif')" onmouseout="FP_swapImg(0,0,/*id*/'img2',/*url*/'botones/Simular_Normal.gif')" onmousedown="FP_swapImg(1,0,/*id*/'img2',/*url*/'botones/Simular_Pressed.gif')" onmouseup="FP_swapImg(0,0,/*id*/'img2',/*url*/'botones/Simular_Over.gif')" align="right"></td>
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
									<table border="1" cellspacing="0" style="border-collapse: collapse; border-width: 0px" width="100%">
										<tr>
											<td style="border-style: none; border-width: medium">
											<p align="center">
											<font color="#225895" size="1">
											<span lang="es-ar"><br>
											(*) Los planes promocionales son sin 
											interés y están disponibles en 
											determinados rubros, según el mes.<br>
											Consulte las promociones vigentes en 
											la Página Principal de este sitio o 
											en el comercio.</td>
										</tr>
									</table>
									</td>
									<td style="border-style: none; border-width: medium">&nbsp;</td>
								</tr>
							</table>
						</form>
						<p>&nbsp;</p>
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
