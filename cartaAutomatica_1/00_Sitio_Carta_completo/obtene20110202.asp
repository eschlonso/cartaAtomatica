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
  var txtNombre = document.frmObtene.txtNombre.value;
  if (txtNombre == "")
    {msg +="Nombre\n"};
  var txtApellido = document.frmObtene.txtApellido.value;
  if (txtApellido == "")
    {msg +="Apellido\n"};
  var txtLocalidad = document.frmObtene.txtLocalidad.value;
  if (txtLocalidad == "")
    {msg +="Localidad\n"};
  var txtProvincia = document.frmObtene.txtProvincia.value;
  if (txtProvincia == "")
    {msg +="Provincia\n"};
  var txtTelefono = document.frmObtene.txtTelefono.value;
  if (txtTelefono == "")
    {msg +="Tel�fono\n"};
  var txtHorario = document.frmObtene.txtHorario.value;
  if (txtHorario == "")
    {msg +="Horario\n"};
//  var txtDNI = document.frmObtene.txtDNI.value;
//  if (txtDNI == "")
//    {msg +="DNI\n"};
  
  if (msg){
       var msg1 = "-------------------------------------------------------\nTen�s que ingresar:\n-------------------------------------------------------\n"+ msg;
       window.alert(msg1);
   }else{
		document.frmObtene.hidOperacion.value=1;
		document.frmObtene.submit();   
   }
}
//-->
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<body onLoad="MM_preloadImages('images/lupa_b.gif','images/b_sucursales_b.gif','images/b_sitemap_b.gif','images/b_home_b.gif','images/enviar_b.gif')">
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" background="images/left.gif">&nbsp;</td>
    <td bgcolor="#FFFFFF"><table width="752" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><script type="text/javascript">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','752','height','100','src','images/top','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','images/top','menu','false' ); //end AC code</script>
          <noscript>
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="752" height="100">
            <param name="movie" value="images/top.swf" />
            <param name="menu" value="false" />
            <param name="quality" value="high" />
            <embed src="images/top.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="752" height="100"></embed>
          </object>
          </noscript></td>
      </tr>
      <tr>
        <td><table width="752" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="190" valign="top"><!--#include file="inc_banners_left.asp" --></td>
            <td width="7" valign="top"></td>
            <td width="555" valign="top">
            <table width="555" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="552" height="38" valign="top">
                <!--#include file="Buscador.asp"-->
                </td>
              </tr>
<%
	if (Request.Form ("hidOperacion")<>"") then
		intOperacion = Cint (Request.Form ("hidOperacion"))
	else
		intOperacion = 0
	end if
	strMensaje = ""
	strMail = Request("txtMail")
	if (intOperacion = 1) then
		'BEGIN chequeo el formulario
			strNombre = Request("txtNombre")
			strApellido = Request("txtApellido")
			strMail = Request("txtMail")
			strLocalidad = Request("txtLocalidad")
			strProvincia = Request("txtProvincia")
			strTelefono = Request("txtTelefono")
			strMovil = Request("txtMovil")
			strHorario = Request("txtHorario")
			strDNI	= Request("txtDNI")
		'END
		set objMail = server.CreateObject("adodb.recordset")
'		on error resume next
		objMail.Open "esp_InfoSys_Buscador 5 ", Conn,3, 3
		if Not objMail.EOF then
			
			Set objMessage = CreateObject("CDO.Message") 
			set objConfig = Server.CreateObject("CDO.Configuration") 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "192.168.50.50" 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10 
			objConfig.Fields.Update() 
			objMessage.Configuration = objConfig 
			if strMail = "" Then strMail = objMail(0)
			objMessage.Subject = "Solicitud de tarjeta" 
			objMessage.From = "Web_CartaAutomatica@CartaAutomatica.com.ar" 
			objMessage.To = "comercialwebcarta@CartaAutomatica.com.ar"
			strBody = "Se ha recibido una solicitud de tarjeta con los siguientes datos: <br>Nombre: " &strNombre & "<br>Apellido: " & strApellido &_
					 "<br>Localidad: " & strLocalidad & "<br>Provincia: " & strProvincia & "<br>Tel�fono: " &strTelefono & "<br>M�vil: " & strMovil & "<br>Horario de contacto: " & strHorario & "<br>DNI: " & strDNI & "<br>email: " & strMail
			objMessage.HTMLBody = strBody
			objMessage.Send
			strMensaje = "Solicitud enviada."
			intOperacion = 0
		else 
			strMensaje = "Su solicitud no ha podido ser enviada."
		end if
		set objMail = nothing
	end if

%>
              <tr>
                <td><table width="550" border="0" cellspacing="0" cellpadding="0">
					<form name="frmObtene" method="post" action="obtene.asp">
					<input type="hidden" name="hidOperacion" value=<% = intOperacion %>>
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="548"><table width="548" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><script type="text/javascript">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','548','height','111','src','images/tit_obtene','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','images/tit_obtene','menu','false' ); //end AC code</script>
                          <noscript>
                          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="548" height="111">
                            <param name="movie" value="images/tit_obtene.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
                            <embed src="images/tit_obtene.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="548" height="111"></embed>
                          </object>
                          </noscript></td>
                      </tr>
                     <%if strMensaje="" then %>
                     <tr>
                                	<td><img src="images/queres-ahorrar-febrero.jpg" alt="" /></td>
                                </tr>
                      <tr>
                        <td><table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
                     
                          <tr>
                            <td width="548"><table width="93%"  border="0" cellspacing="0" cellpadding="0">
                            	<!--<tr> <td colspan="3"><a href="bahia_blanca.asp"><img src="images/comercios.jpg" border="0" /></a></td></tr>-->
                                
                                <tr>
                                  <td width="5%"><em></em></td>
                                  <td colspan="2"><em class="titulos"><strong><br/>Requisitos</strong></em></td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" class="negro"> Mayor de 18 a&ntilde;os. </td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" valign="top" class="negro">
                                    <p>DNI/LC/LE/CI del Mercosur.</p></td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" valign="top" class="negro">Ultima factura de un servicio o impuesto a tu nombre. </td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" class="negro">Tel&eacute;fono fijo particular.</td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" valign="top" class="negro">Tel&eacute;fono fijo de referencia. </td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td colspan="2" valign="top" class="negro">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td colspan="2" valign="top" class="negro"><em class="titulos"><strong>Y seg&uacute;n la actividad </strong></em></td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" class="negro"><span class="texto"><strong>Empleados: </strong> Ultimo recibo de sueldo. </span></td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" class="negro"><span class="texto"><strong>Jubilados y Pensionados: </strong> Hasta 75 a&ntilde;os, &uacute;ltimo recibo de haberes jubilatorios. </span></td>
                                </tr>
                                <tr>
                                  <td><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
                                  <td colspan="2" class="negro"><span class="texto"><strong>Aut&oacute;nomos: </strong>Mayor de 21 a&ntilde;os. </span></td>
                                </tr>
                                <tr>
                                  <td height="85">&nbsp;</td>
                                  <td width="5%" class="negro">&nbsp;</td>
                                  <td width="90%" class="negro"><span class="texto"><strong>-Responsable Inscripto: </strong> Inscripci&oacute;n en la AFIP, declaraci&oacute;n jurada de ganancias y &uacute;ltimo pago de ingresos brutos. <br>
                                      <strong>-Monotributista: </strong>  &Uacute;ltimo pago de ingresos brutos. <br>
                                      <strong>-Profesionales: </strong> Ultimo pago de matr&iacute;cula y fotocopia de matr&iacute;cula.</span></td>
                                </tr>
                                <tr>
                                  <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="3"><table width="371" border="0" align="center" cellpadding="3" cellspacing="1">
                                    <tr bgcolor="#B9EAF7">
                                      <td width="133" height="30" bgcolor="#EAF9FD"><div align="right" class="negro"><strong>Nombre *</strong></div></td>
                                      <td width="223" bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtNombre" type="text" class="selector" id="txtNombre" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD"><div align="right" class="negro"><strong>Apellido *</strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtApellido" type="text" class="selector" id="txtApellido" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#B9EAF7">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right"><strong>DNI</strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                          <input name="txtDNI" type="text" class="selector" id="txtDNI" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#B9EAF7">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right"><strong>Localidad *</strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtLocalidad" type="text" class="selector" id="txtLocalidad" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right"><strong>Provincia *</strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtProvincia" type="text" class="selector" id="txtProvincia" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#B9EAF7">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right"><strong>Tel&eacute;fono *</strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtTelefono" type="text" class="selector" id="txtTelefono" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"> <div align="right"><strong>M&oacute;vil </strong> </div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtMovil" type="text" class="selector" id="txtMovil" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"> <div align="right"><strong>Mail </strong></div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtMail" type="text" class="selector" id="txtMail" size="40">
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"> <div align="right"><strong>Horario de<br> contacto *</strong> </div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="txtHorario" type="text" class="selector" id="txtHorario" size="40">
                                      </div></td>
                                    </tr>
                                     <tr bgcolor="#DDF4FB">
                                      <td height="30" bgcolor="#EAF9FD" class="negro"> <div align="right"><strong>�C�mo te <br/>enteraste de<br/> Carta Autom�tica?</strong> </div></td>
                                      <td bgcolor="#C5F0FA"><div align="center">
                                        <input name="" type="text" class="selector heightcomment" id="" size="40" >
                                      </div></td>
                                    </tr>
                                    <tr bgcolor="#FFFFFF">
                                      <td bgcolor="#FFFFFF" class="gris">* obligatorios</td>
                                      <td bgcolor="#FFFFFF">&nbsp;</td>
                                    </tr>
                                    <tr bgcolor="#FFFFFF">
                                      <td height="36" class="negro">&nbsp;</td>
                                      <td bgcolor="#FFFFFF"><div align="right"><a href="javascript: alerta();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','images/enviar_b.gif',1)"><img src="images/enviar_a.gif" name="Image17" width="95" height="30" border="0"></a></div></td>
                                    </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td colspan="3">&nbsp;</td>
                                  </tr>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                      <%else%>
                      <tr>
                        <td width="548" align="center" class="negro"><% = strMensaje %></td>
                      </tr>
                     <%end if %>
                      <tr>
                        <td width="548" height="30">&nbsp;</td>
                      </tr>
                    </table></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
                  </form>
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
    <td height="9"><img src="images/corner_left.gif" width="9" height="9"></td>
    <td height="9" background="images/down.gif"><img src="images/down.gif" width="1" height="9"></td>
    <td height="9"><img src="images/corner_right.gif" width="9" height="9"></td>
  </tr>
  <tr>
    <td height="9">&nbsp;</td>
    <td height="9" class="blanco"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="4%" height="10"><span class="estilo"><a href="http://www.fancy-park.com" target="_blank" class="blanco">FP</a></span></td>
        <td width="45%" align="right"><a href="#" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')" class="blanco">Pol&iacute;tica de Usuario</a> </td>
        <td width="51%" align="right" class="blanco-1">- <a href="sitemap.asp" class="blanco">Mapa del Sitio</a> <span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2010</span></td>
      </tr>
    </table></td>
    <td height="9">&nbsp;</td>
  </tr>
</table>
</body>
</html>
