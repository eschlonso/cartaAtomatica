<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Carta Automatica</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background-image:   url(images/fondo.gif);
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function IsEmail(sMail)
{
  var iLastPos = sMail.length - 1;
  for (var iPos = 0; iPos <= iLastPos; iPos++)
    if (sMail.charAt(iPos) < "!" || sMail.charAt(iPos) > "~")
      return false;
    iPos = sMail.indexOf("@");
    if (iPos < 1 || iLastPos == iPos || sMail.charAt(iLastPos) == "." || sMail.indexOf("@", iPos + 1) >= 0 || sMail.indexOf(".", iPos + 1) < iPos + 2)
       return false;
    return true;
}
function alerta()
{
  var msg = "";
  var txtNombre = document.frmContactenos.txtNombre.value;
  if (txtNombre == "")
    {msg +="Nombre\n"};
  var txtApellido = document.frmContactenos.txtApellido.value;
  if (txtApellido == "")
    {msg +="Apellido\n"};
  var txtSugerencias = document.frmContactenos.txtSugerencias.value;
  if (txtSugerencias == "")
    {msg +="Sugerencias\n"};
  var txtMail = document.frmContactenos.txtMail.value;
  if (!IsEmail(txtMail))
    {msg +="Email\n"};
  
  if (msg){
       var msg1 = "-------------------------------------------------------\nTen�s que ingresar:\n-------------------------------------------------------\n"+ msg;
       window.alert(msg1);
   }else{
		document.frmContactenos.hidOperacion.value=1;
		document.frmContactenos.submit();   
   }
}
//-->
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.txt_negro .txt_negro {
	color: #666;
}
.lal {
	font-size: 10px;
}
.textover {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 11px;
	text-align: left;
	color: #666;
}
.textverb {
	font-weight: bold;
}
-->
</style>
</head>

<body onLoad="MM_preloadImages('images/enviar_b.gif','images/enviar_b.jpg')">
<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th valign="top" scope="col"> </th>
    <th align="center" scope="col">
	
	<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr></tr>
	  
      <tr>
        <td width="9" background="images/left.gif">&nbsp;</td>
		
        <td bgcolor="#FFFFFF">
		<table width="752" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="752" height="100">
              <param name="movie" value="images/top.swf">
              <param name="quality" value="high">
              <param name="wmode" value="opaque">
              <embed src="images/top.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="752" height="100"></embed>
            </object>
			</td>
          </tr>
		  
          <tr>
            <td>
			<table width="752" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="190" valign="top"><!--#include file="inc_banners_left.asp" --></td>
                <td width="7" valign="top"></td>
                
				<td width="555" valign="top" aling="left">
					<table width="555" border="0" cellspacing="0" cellpadding="0">
							<%
							if (Request.Form ("hidOperacion")<>"") then
								intOperacion = Cint (Request.Form ("hidOperacion"))
							else
								intOperacion = 0
							end if
							strMensaje = ""
							if (intOperacion = 1) then
							'BEGIN chequeo el formulario
								strNombre = Request("txtNombre")
								strApellido = Request("txtApellido")
								strMail = Request("txtMail")
								strSugerencias = Request("txtSugerencias")
								strDNI = Request("txtDNI")
							'END
							'set objMail = server.CreateObject("adodb.recordset")
							''on error resume next
							'	objMail.Open "esp_InfoSys_Buscador 1 ", Conn,3, 3
							'if Not objMail.EOF then
								Set objMessage = CreateObject("CDO.Message") 
								set objConfig = Server.CreateObject("CDO.Configuration") 
								objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
								objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.cartaautomatica.com.ar"
								objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
								objConfig.Fields.Update() 
								objMessage.Configuration = objConfig  
								objMessage.Subject = "Consultas y sugerencias" 
								objMessage.From = "sugerenciaswebcarta@CartaAutomatica.com.ar"
								objMessage.To = "sugerenciaswebcarta@CartaAutomatica.com.ar"
								objMessage.TextBody = "Nombre: "& strNombre & " " & vbCrLf & "Apellido: " & strApellido & " " & vbCrLf & "DNI: " & strDNI & " " & vbCrLf & "Correo: " & strMail & " " & vbCrLf &"Sugerencia / Consulta:  " & strSugerencias  
								objMessage.Send
								strMensaje = "Consulta enviada."
								intOperacion = 0
							'end if
							'set objMail = nothing
							end if
							%>
							<tr>
								<td valign="top">
									<table width="549" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="547" valign="top">
												<table width="547" border="0" cellspacing="0" cellpadding="0">
													  <tr>
														<td height="125" align="center" valign="top"><img src="images/tit_contacto.jpg" alt="" width="548" height="113"></td>
													  </tr>
													  <tr>
														<td height="20">
															<div align="center" class="titulos">
															<table width="450" border="1" cellpadding="0" cellspacing="0" bordercolor="#6f6f6e">
															<tr>
															  <td>
															  <table width="450" border="0" align="center" cellpadding="3" cellspacing="1">
																<form name="frmContactenos" method="post" action="contactenos.asp">
																  <input type="hidden" name="hidOperacion" value=<% = intOperacion %> >
																  <%if strMensaje="" then %>
																  <tr bgcolor="#ececec">
																	<td width="183" height="30"><div align="right" class="negro">Nombre&nbsp;</div></td>
																	<td width="252" bgcolor="#ececec">
																		<div align="center">
																			<input name="txtNombre" type="text"  id="nombre" size="35">
																		</div>
																	</td>
																  </tr>
																  <tr bgcolor="#ececec">
																	<td height="30"><div align="right" class="negro">Apellido&nbsp;</div></td>
																	<td bgcolor="#ececec">
																		<div align="center">
																			<input name="txtApellido" type="text" id="nombre2" size="35">
																		</div>
																	</td>
																  </tr>
																  <tr bgcolor="#ececec">
																	<td height="30"><div align="right" class="negro">DNI&nbsp;</div></td>
																	<td bgcolor="#ececec">
																		<div align="center">
																			<input name="txtDNI" type="text" id="nombre2" size="35">
																		</div>
																	</td>
																  </tr>
																  <tr bgcolor="#ececec">
																	<td height="30" class="negro"><div align="right">Correo electr&oacute;nico&nbsp;</div></td>
																	<td bgcolor="#ececec">
																		<div align="center">
																			<input name="txtMail" type="text" id="nombre3" size="35">
																		</div>
																	</td>
																  </tr>
																  <tr bgcolor="#ececec">
																	<td height="30" class="negro"><div align="right">Sugerencias / Consultas&nbsp;</div></td>
																	<td bgcolor="#ececec">
																		<div align="center">
																			<textarea name="txtSugerencias" cols="28" rows="5" id="nombre45"></textarea>
																		</div>
																	</td>
																  </tr>
																  <tr bgcolor="#FFFFFF">
																	<td align="right" bgcolor="#FFFFFF" class="gris">&nbsp;&nbsp;Todos los campos son obligatorios&nbsp;</td>
																	<td bgcolor="#FFFFFF">&nbsp;</td>
																  </tr>
																  <tr bgcolor="#FFFFFF">
																	<td height="36" class="negro">&nbsp;</td>
																	<td bgcolor="#FFFFFF">
																		<div align="right">
																			<a href="javascript:alerta();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','images/enviar_b.jpg',1)">
																				<img src="images/enviar_a.jpg" alt="" name="Image17" width="95" height="30" border="0">
																			</a>
																		</div>
																	</td>
																  </tr>	
																  <%else%>
																	  <tr>
																		<td width="450" align="center" class="negro"><% = strMensaje %></td>
																	  </tr>
																  <%end if %>
																  </form>
																</table>
																</td>
															  </tr>
															</table>
															</div>
														 </td>
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
			</td>
         </tr>
		 
        </table>
																			 
		</td>
		
		
        <td width="9" background="images/right.gif">&nbsp;</td>
      </tr>
	  
      <tr>
        <td height="9"><img src="images/corner_left.gif" alt="" width="9" height="9"></td>
        <td height="9" background="images/down.gif"><img src="images/down.gif" alt="" width="1" height="9"></td>
        <td height="9"><img src="images/corner_right.gif" alt="" width="9" height="9"></td>
      </tr>
	  
      <tr>
      <td width="9">&nbsp;</td>
      <td>
		<table width="740" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20" height="10" align="center">
				<span class="estilo">
				<a href="http://www.iutopi.com" target="_blank" class="blanco" style="color: #666666">i</a>
				</span>
			</td>
            <td width="320" align="right" style="color: #333333">
				<a href="#" class="blanco" style="color: #666" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')">Pol&iacute;tica de Usuario - </a>
			</td>
            <td width="390" align="left" class="blanco-1" style="color: #666666">
				<a href="sitemap.asp" class="blanco" style="color: #666666">&nbsp;Mapa del Sitio </a>
				<span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2013</span>
			</td>
          </tr>
        </table>
	  </td>
      </tr>
	  
	  
    </table>
</body>
</html>