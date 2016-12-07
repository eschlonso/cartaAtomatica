<!--#INCLUDE FILE="Libreria.asp"--><%SesionActiva%>
<%
Dim PasswordNew, PasswordNewNew, PasswordOLD, Resultado

PasswordOLD = UCASE(TRIM(Request.Form("PWD")))
PasswordNew = UCASE(TRIM(Request.Form("TxtPwdNew")))
PasswordNewNew = UCASE(trim(Request.Form("TxtPwdNewNew")))

Resultado = ""

if PasswordOLD <> "" AND PasswordNew <> "" Then
	Resultado = CambioPassword(PasswordOLD, PasswordNew)
end if

%>
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

<%
'Leo los limites y luego armo la pantalla

%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="FP_preloadImgs(/*url*/'botones/Actualizar_Pressed.jpg',/*url*/'botones/Actualizar_Over.jpg')">

<form name="Form_PWD" method="POST" action="Password.asp" >
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
									<input type="hidden" name="PWD" value="<%response.write(Session("Password"))%>">
<%IF Resultado <> "" THEN %>									
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
						<font color="#225895"><b><%Response.Write(Resultado) %></b></font></p>
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
		<%ELSE%>
									<table cellspacing="0" cellpadding="0" width="335" class="tah12" align="center" border="0" id="table8">
										<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
											<td class="ver12">
											<font color="#225895"><b>
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorIzquierdo)%>" width="20" height="19"></b></font></td>
											<td align="right">
											<font color="#225895">
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeSuperiorDerecho)%>" width="20" height="19"></font></td>
										</tr>
									</table>
									<table cellspacing="0" cellpadding="0" width="335" align="center" border="0" id="table9">
										<tr>
											<td width="10" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
											<td>
											<table cellspacing="1" cellpadding="3" width="321" border="0" id="table10">
												<tr bgcolor="#daeefc" class="tah14">
													<td class="hometexto" valign="top" width="313" colspan="2" bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" height="25">
													<font color="#225895"><b>CAMBIO 
													DE CONTRASEÑA</b></font></td>
												</tr>
												<tr bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
													<td class="hometexto" width="157" align="left" valign="baseline">
													<font color="#225895"><b>ACTUAL</b></font></td>
													<td class="hometexto" width="149" align="left">
													<input name="TxtPwdOld" size="10" tabindex="0" maxlength="16" class="ver11" style="float: left" type="password"></td>
												</tr>
												<tr bgcolor="<%Response.write(GrillaColorInteriorClaro )%>" class="tah12">
													<td class="hometexto" width="157" align="left" height="29" valign="baseline">
													<font color="#225895"><b>NUEVA</b></font></td>
													<td class="hometexto" width="149" align="left" height="29">
													<font color="#225895">
													<input name="TxtPwdNew" size="10" tabindex="0" maxlength="16" class="ver11" style="float: left" type="password">*</font></td>
												</tr>
												<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
													<td class="hometexto" width="157" align="left" height="25" valign="baseline">
													<font color="#225895"><b>RECONFIRMAR 
													NUEVA</b></font></td>
													<td class="hometexto" width="149" align="left" height="25">
													<font color="#225895">
													<input name="TxtPwdNewNew" size="10" tabindex="0" maxlength="16" class="ver11" style="float: left" type="password">*</font></td>
												</tr>
												<tr valign="bottom" bgcolor="<%Response.write(GrillaColorBorde)%>" class="tah12">
													<td class="hometexto" width="157" align="left" height="25" valign="top">
													<font color="#225895">* 
													Mínimo 5 Caracteres.</font></td>
													<td class="hometexto" width="149" align="left" height="25">
													<br>
													<img border="0" onclick="vbscript:Validar()" id="Actualizar" src="botones/Actualizar_Normal.jpg" height="20" width="110" alt="Actualizar" onmouseover="FP_swapImg(1,0,/*id*/'Actualizar',/*url*/'botones/Actualizar_Over.jpg')" onmouseout="FP_swapImg(0,0,/*id*/'Actualizar',/*url*/'botones/Actualizar_Normal.jpg')" onmousedown="FP_swapImg(1,0,/*id*/'Actualizar',/*url*/'botones/Actualizar_Pressed.jpg')" onmouseup="FP_swapImg(0,0,/*id*/'Actualizar',/*url*/'botones/Actualizar_Over.jpg')" fp-style="fp-btn: Corporate 9; fp-font-style: Bold; fp-font-size: 8; fp-font-color-normal: #F1F9FE; fp-font-color-hover: #225895; fp-font-color-press: #DAEEFC; fp-proportional: 0; fp-orig: 0" fp-title="Actualizar"></td>
												</tr>
											</table>
											</td>
											<td width="4" bgcolor="<%Response.write(GrillaColorBorde)%>">&nbsp;</td>
										</tr>
									</table>
									<table cellspacing="0" cellpadding="0" width="333" align="center" border="0" id="table11">
										<tr bgcolor="<%Response.write(GrillaColorBorde)%>">
											<td>
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoIzquiero)%>" width="20" height="19"></td>
											<td align="right">
											<img border="0" src="images/Bordes/<%Response.write(GrillaBordeBajoDerecho)%>" width="20" height="19"></td>
										</tr>
									</table>
<%END IF%>
									<td style="border-style: none; border-width: medium" width="4">&nbsp;</td>
								</tr>
								<tr>
									<td style="border-style: none; border-width: medium">&nbsp;</td>
									<td style="border-style: none; border-width: medium" class="ver14">&nbsp;</td>
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

<script id="clientEventHandlersVBS"  language="VBScript">
<!--


SUB Validar()
Dim PWDOld, PWDNew, PWDNewNew, PW

PWD = ucase(TRIM(Form_PWD.PWD.value))

PWDOld= ucase(TRIM(Form_PWD.TxtPwdOld.value))
PWDNew= ucase(TRIM(Form_PWD.TxtPwdNew.value))
PWDNewNew= ucase(TRIM(Form_PWD.TxtPwdNewNew.value))

if PWDOld = "" AND PWDNew = "" AND PWDNewNew = "" THEN
	alert "Debe completar todos los campos para poder continuar."'
	Form_PWD.TxtPwdOld.select

	exit sub
END IF


IF LEN(PWDNewNew) < 5 OR Len(PWDNew) < 5 THEN
	alert "La Contraseña nueva debe poseer al menos 5 caracteres."
	Form_PWD.TxtPwdNew.Select
	exit sub
END IF


if PWDNew <> PWDNewNew Then
	alert "La contraseña nueva no coincide con su verificación."
	Form_PWD.TxtPwdNewNew.Select
	exit sub
end if

if PWD <> PWDOld then
	alert "La contraseña actual no coincide con la ingresada."
	Form_PWD.TxtPwdOld.Select
	exit sub
end if
Form_PWD.submit


End Sub

-->
</script>
</form>

</body>

</html>

