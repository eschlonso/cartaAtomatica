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
  var txtNombre = document.frmContactenos.txtNombre.value;
  if (txtNombre == "")
    {msg +="Nombre\n"};
  var txtApellido = document.frmContactenos.txtApellido.value;
  if (txtApellido == "")
    {msg +="Apellido\n"};
  var txtMail = document.frmContactenos.txtMail.value;
  if (!IsEmail(txtMail))
    {msg +="Email\n"};
  var txtDireccion = document.frmContactenos.txtDireccion.value;
  if (txtDireccion == "")
    {msg +="Direccion\n"};
  var txtLocalidad = document.frmContactenos.txtLocalidad.value;
  if (txtLocalidad == "")
    {msg +="Localidad\n"};
  var txtDNI = document.frmContactenos.txtDNI.value;
  if (txtDireccion == "")
    {msg +="DNI\n"};
  var txtCelular = document.frmContactenos.txtCelular.value;
  if (txtCelular == "")
    {msg +="Celular\n"};
  
  if (msg){
       var msg1 = "-------------------------------------------------------\nTenés que ingresar:\n-------------------------------------------------------\n"+ msg;
       window.alert(msg1);
   }else{
		document.frmContactenos.hidOperacion.value=1;
		document.frmContactenos.submit();   
   }
}

//-->
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<body onLoad="MM_preloadImages('images/lupa_b.gif','images/b_sucursales_b.gif','images/b_sitemap_b.gif','images/b_home_b.gif','images/enviar_b.gif')">
<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <th valign="top" scope="col"> </th>
  <th scope="col">
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
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
            <td width="555" valign="top"><table width="555" border="0" cellspacing="0" cellpadding="0">
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
	if (intOperacion = 1) then
		'BEGIN chequeo el formulario
			strNombre = Request("txtNombre")
			strApellido = Request("txtApellido")
			strMail = Request("txtMail")
			strDNI = Request("txtDNI")
			strDireccion = Request("txtDireccion")
			strCelular = Request("txtCelular")
			strLocalidad = Request("txtLocalidad")
		'END
		set objMail = server.CreateObject("adodb.recordset")
		'on error resume next
			objMail.Open "esp_InfoSys_Buscador 1 ", Conn,3, 3
		if Not objMail.EOF then
			Set objMessage = CreateObject("CDO.Message") 

			set objConfig = Server.CreateObject("CDO.Configuration") 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.cartaautomatica.com.ar" 
			objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10 
			objConfig.Fields.Update() 
			objMessage.Configuration = objConfig 

			objMessage.Subject = "Concurso Tablet" 
			objMessage.From = "comercialwebcarta@cartaautomatica.com.ar"
			objMessage.To = "comercialwebcarta@cartaautomatica.com.ar"
			objMessage.TextBody = strNombre & " " & strApellido & " envia los siguientes datos para el concurso de la tablet: <br> DNI: " & strDNI & "<br> Direccion: " & strDireccion & "<br> Localidad: " & strLocalidad & "<br> Celular: " & strCelular & "<br> Email:" & strMail
			objMessage.Send
			strMensaje = "Formulario enviado."
			intOperacion = 0
		end if
		set objMail = nothing
	end if

%>
              <tr>
                <td><table width="550" border="0" cellspacing="0" cellpadding="0">
				<form name="frmContactenos" method="post" action="formulario_tablet.asp">
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
                        <td><script type="text/javascript">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','548','height','111','src','images/tit_contacto','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','images/tit_contacto','menu','false' ); //end AC code</script>
                          <noscript>
                          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="548" height="111">
                            <param name="movie" value="images/tit_contacto.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
                            <embed src="images/tit_contacto.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="548" height="111"></embed>
                          </object>
                          </noscript></td>
                      </tr>
                     <%if strMensaje="" then %>
                      <tr>
                        <td><div align="center" class="titulos"><strong>Completa los datos </strong>para participar por una Tablet</div></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><div align="center" class="titulos">
                            <table width="371" border="1" cellpadding="0" cellspacing="0" bordercolor="#C5F0FA">
                            <tr>
                              <td>
                              <table width="371" border="0" align="center" cellpadding="3" cellspacing="1">
                                <tr bgcolor="#B9EAF7">
                                  <td width="140" height="30" bgcolor="#EAF9FD"><div align="right" class="negro"><strong>Nombre *</strong></div></td>
                                  <td width="216" bgcolor="#C5F0FA"><div align="center">
                                      <input name="txtNombre" type="text" class="selector" id="nombre" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#DDF4FB">
                                  <td height="30" bgcolor="#EAF9FD"><div align="right" class="negro"><strong>Apellido *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                      <input name="txtApellido" type="text" class="selector" id="nombre2" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#DDF4FB">
                                  <td height="30" bgcolor="#EAF9FD"><div align="right" class="negro"><strong>DNI *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                    <input name="txtDNI" type="text" class="selector" id="nombre2" size="40">
                                    </div></td>
                                </tr>
                                <tr bgcolor="#B9EAF7">
                                  <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right" class="negro"><strong>Direcci&oacute;n *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                    <input name="txtDireccion" type="text" class="selector" id="nombre4" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#B9EAF7">
                                  <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right" class="negro"><strong>Localidad *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                    <input name="txtLocalidad" type="text" class="selector" id="nombre5" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#B9EAF7">
                                  <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right" class="negro"><strong>Celular *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                    <input name="txtCelular" type="text" class="selector" id="nombre6" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#B9EAF7">
                                  <td height="30" bgcolor="#EAF9FD" class="negro"><div align="right"><strong>Mail *</strong></div></td>
                                  <td bgcolor="#C5F0FA"><div align="center">
                                    <input name="txtMail" type="text" class="selector" id="nombre3" size="40">
                                  </div></td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td bgcolor="#FFFFFF" class="gris">* obligatorios</td>
                                  <td bgcolor="#FFFFFF">&nbsp;</td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td height="36" class="negro">&nbsp;</td>
                                  <td bgcolor="#FFFFFF"><div align="right"><a href="javascript:alerta();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','images/enviar_b.gif',1)"><img src="images/enviar_a.gif" name="Image17" width="95" height="30" border="0"></a></div></td>
                                </tr>
                              </table></td>
                            </tr>
                          </table>
                        </div></td>
                      </tr>
                      <%else%>
                      <tr>
                        <td width="548" align="center" class="negro"><% = strMensaje %></td>
                      </tr>
                     <%end if %>
                      <tr>
                        <td width="548">&nbsp;</td>
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
      <td>&nbsp;</td>
      <td><table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="4%" height="10" align="center"><span class="estilo"><a href="http://www.iutopi.com" target="_blank" class="blanco" style="color: #666666">i</a></span></td>
          <td width="43%" align="right" style="color: #333333"><a href="#" class="blanco" style="color: #666" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')">Pol<span style="color: #666666"></span><span style="color: #999999"></span>&iacute;tica de Usuario</a></td>
          <td width="53%" align="left" class="blanco-1" style="color: #666666">- <a href="sitemap.asp" class="blanco" style="color: #666666">Mapa del Sitio</a> <span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2012</span></td>
        </tr>
      </table></td>
    </tr>
  </table>
</body>
</html>