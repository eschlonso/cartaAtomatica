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

function alerta()
{
  var msg = "";
  var txtNombre = document.frmPedila.txtNombre.value;
  if (txtNombre == "")
    {msg +="Nombre\n"};
  var txtApellido = document.frmPedila.txtApellido.value;
  if (txtApellido == "")
    {msg +="Apellido\n"};
  var txtNumDoc = document.frmPedila.txtNumDoc.value;
  if (txtNumDoc == "")
    {msg +="Documento\n"};
  var txtMail = document.frmPedila.txtMail.value;
  if (!IsEmail(txtMail))
    {msg +="Email\n"};
  var txtSucursal = document.getElementById("txtSucursal").options[document.getElementById("txtSucursal").selectedIndex].value;
  if (txtSucursal == "")
    {msg +="Sucursal\n"};
  var strTelefono = document.frmPedila.strTelefono.value;
  if (strTelefono == "")
    {msg +="Telefono\n"};
  var txtNumCel = document.frmPedila.txtNumCel.value;
  if (txtNumCel == "")
    {msg +="Celular\n"};
  if (msg){
       var msg1 = "-------------------------------------------------------\nTen�s que ingresar:\n-------------------------------------------------------\n"+ msg;
       window.alert(msg1);
   }else{
		document.frmPedila.hidOperacion.value=1;
		document.frmPedila.submit();   
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
-->
</style>
<script type="text/javascript">

 

  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-42658052-1']);

  _gaq.push(['_setDomainName', 'cartaautomatica.com.ar']);

  _gaq.push(['_trackPageview']);

 

  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();

 

</script>
</head>

<body onLoad="MM_preloadImages('images/enviar_b.jpg')">
  <!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-WVX3DM"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WVX3DM');</script>
<!-- End Google Tag Manager -->
<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th valign="top" scope="col"> </th>
    <th scope="col"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="9" background="images/left.gif">&nbsp;</td>
        <td bgcolor="#FFFFFF"><table width="752" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="752" height="100">
              <param name="movie" value="images/top.swf">
              <param name="quality" value="high">
              <param name="wmode" value="opaque">
              <embed src="images/top.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="752" height="100"></embed>
            </object></td>
          </tr>
          <tr>
            <td><table width="752" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="190" valign="top"><!--#include file="inc_banners_left.asp" --></td>
                <td width="7" valign="top"></td>
                <td width="555" valign="top">
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
							strDNI = Request("strTipoDoc")
							strNumDNI = Request("txtNumDoc")
							strSexo = Request("txtSexo")
							strNacimiento = Request("strNac")
							strMail = Request("txtMail")
							strSucursal = Request("txtSucursal")
							strTelefono = Request("strTelefono")
							strHorarioTel = Request("strHorarioTel")
							strTelefono2 = Request("strTelefono2")
              strNumCel = Request("strNumCel")
							strTrabajo = Request("txtTrabajo")
							strFechaT = Request("strFechaT")
							strCiudad = Request("txtCiudad")
							strIngresos = Request("txtIngresos")
							strComentarios = Request("txtComentarios")
						'END
				
						'set objMail = server.CreateObject("adodb.recordset")
						'on error resume next
						'	objMail.Open "esp_InfoSys_Buscador 1 ", Conn,3, 3
						'if Not objMail.EOF then
							Set objMessage = CreateObject("CDO.Message") 
							set objConfig = Server.CreateObject("CDO.Configuration") 
							objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
							objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.cartaautomatica.com.ar"
							objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
							objConfig.Fields.Update() 
							objMessage.Configuration = objConfig 

							objMessage.Subject = "Solicitud de Prestamo" 
							objMessage.From = "surespuesta@cartaautomatica.com.ar"
							objMessage.To = "surespuesta@cartaautomatica.com.ar"
							objMessage.TextBody = strNombre & " " & strApellido & " " & strDNI & " " & strNumDNI & " " & strSexo & " " & strNacimiento & " " & strMail & " " & strSucursal & " " & strTelefono & " " & strHorarioTel & " " & strTelefono2 & " " & strNumCel & " " & strTrabajo & " " & strFechaT & " " & strCiudad & " " & strIngresos & " " & strComentarios  & " Comentarios:  " & strComentarios 
							objMessage.Send
							strMensaje = "Solicitud enviada."
							intOperacion = 0
						'end if
						'set objMail = nothing
					end if
					
					
					%>
				  <tr></tr>
                  <tr>
                    <td valign="top"><table width="549" border="0" cellspacing="0" cellpadding="0">
                    	<form name="frmPedila" method="post" action="pedilamaster.asp">
						<input type="hidden" name="hidOperacion" value=<% = intOperacion %>>
                      <tr> </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td width="1" height="1"></td>
                        <td width="547" valign="top"><table width="547" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="1" align="center" ></td>
                          </tr>
                          <tr>
                            <td align="center"><img src="images/tit_prestamos2.jpg" width="550" height="39" style="padding-bottom:40px;"></td>
                          </tr>
                          <%if strMensaje="" then %>
                          <tr>
                            <td align="center" class="tit_1">Complet&aacute; con tus datos el siguiente formulario</td>
                          </tr>
                          <tr>
                            <td align="center" id="bienvenida">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center">
                            
                            <table width="450" border="1" cellpadding="0" cellspacing="0" bordercolor="#6f6f6e">
                              <tr>
                                <td><table width="485" border="0" align="center" cellpadding="3" cellspacing="1">
                                  <tr bgcolor="#ececec">
                                    <td width="183" height="30"><div align="right" class="negro">Nombre *</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                    <input name="txtNombre" type="text"  id="nombre" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Apellido *</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                    <input name="txtApellido" type="text" id="nombre2" size="35">
                                    </div></td>
                                  </tr>
                                    <tr bgcolor="#ececec">
                                      <td height="30"><div align="right" class="negro">Tipo y N&uacute;m. de  Documento *</div></td>
                                      <td width="95" bgcolor="#ececec"><div align="center">
                                        <select name="strTipoDoc" style="width: 55px;" size="1">
                                          <option value="DNI">DNI</option>
                                          <option value="CI">CI</option>
                                          <option value="LC">LC</option>
                                          <option value="LE">LE</option>
                                          </select>
                                        </div></td>
                                      <td width="150" bgcolor="#ececec"><input name="txtNumDoc" type="text" id="doc" size="20"></td>
                                    </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Sexo</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="12%" class="negro">&nbsp;</td>
                                          <td width="37%" class="negroch"><input name="txtSexo" type="radio" value="masculino">Masculino</td>
                                          <td width="51%" class="negroch"><input name="txtSexo" type="radio" value="femenino">Femenino</td>
                                        </tr>
                                      </table>
									</div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Fecha de Nacimiento</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center" class="negroch">
                                      <input name="strNac" type="text" id="fecha" size="22">
                                     dd/mm/aaaa</div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30" class="negro"><div align="right">Correo electr&oacute;nico *</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="txtMail" type="text" id="correo" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Tel&eacute;fono *</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="strTelefono" type="text" id="tel" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Horario</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="strHorarioTel" type="text" id="horario" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Tel&eacute;fono Celular</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="strNumCel" type="text" id="tel2" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Tel&eacute;fono Alternativo</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="strTelefono2" type="text" id="tel2" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Trabaja</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="12%" class="negro">&nbsp;</td>
                                          <td width="37%" class="negroch"><input name="txtTrabajo" type="radio" value="si">
                                            Si</td>
                                          <td width="51%" class="negroch"><input name="txtTrabajo" type="radio" value="no">
                                          No</td>
                                        </tr>
                                      </table>
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Fecha de inicio laboral</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="strFechaT" type="text" id="fechatrabajo" size="22">
                                      <span class="negroch">dd/mm/aaaa</span></div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Ciudad</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="txtCiudad" type="text" id="ciudad" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30"><div align="right" class="negro">Ingresos mensuales</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <input name="txtIngresos" type="text" id="ingresos" size="35">
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#ececec">
                                    <td height="30" valign="top" class="negro"><div align="right">Comentarios</div></td>
                                    <td colspan="2" bgcolor="#ececec"><div align="center">
                                      <textarea name="txtComentarios" cols="28" rows="5" id="comentarios"></textarea>
                                    </div></td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td align="right" bgcolor="#FFFFFF" class="gris">* Campos obligatorios</td>
                                    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td height="36" class="negro">&nbsp;</td>
                                    <td colspan="2" bgcolor="#FFFFFF"><div align="right">
                                    <a href="javascript:alerta();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','images/enviar_b.jpg',1)">
                                    <img src="images/enviar_a.jpg" alt="" name="Image17" width="95" height="30" border="0"></a>
                                    </div></td>
                                  </tr>
                                </table></td>
                              </tr>
                            </table>
							
						  </td>
                          </tr>
                          <tr>
                            <td align="left"><p class="titulosC">&nbsp;</p></td>
                          </tr>
                      <%else%>
                      <tr>
                        <td width="548" align="center" class="negro"><% = strMensaje %></td>
                      </tr>
                     <%end if %>
                          <tr>
                            <td width="547" align="center">&nbsp;</td>
                          </tr>
                        </table></td>
                        <td width="1" height="1"></td>
                      </tr>
                      <tr>
                        <td width="1" height="1" ></td>
                        <td width="547" height="1" ></td>
                        <td width="1" height="1"></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="9" background="images/right.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="9"><img src="images/corner_left.gif" alt="" width="9" height="9"></td>
        <td height="9" background="images/down.gif"><img src="images/down.gif" alt="" width="1" height="9"></td>
        <td height="9"><img src="images/corner_right.gif" alt="" width="9" height="9"></td>
      </tr>
    <tr>
      <td>&nbsp;</td>
      <td><table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="4%" height="10" align="center"><span class="estilo"><a href="http://www.iutopi.com" target="_blank" class="blanco" style="color: #666666">i</a></span></td>
          <td width="43%" align="right" style="color: #333333"><a href="#" class="blanco" style="color: #666" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')">Pol<span style="color: #666666"></span><span style="color: #999999"></span>&iacute;tica de Usuario</a></td>
          <td width="53%" align="left" class="blanco-1" style="color: #666666">- <a href="sitemap.asp" class="blanco" style="color: #666666">Mapa del Sitio</a> <span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2013</span></td>
        </tr>
      </table></td>
    </tr>
  </table>
</body>
</html>