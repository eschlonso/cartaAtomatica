
<script LANGUAGE="VBScript">

SUB ValidarPasswords()

Dim xPasswordOLD
Dim xPasswordNew
Dim xPasswordNewVerificacion

	xPasswordOLD = trim(password_cambio_formato.PasswordOLD.value)
	IF xPasswordOLD = "" THEN
		Alert "Debés completar el campo que contiene tu Contraseña Anterior."
		exit sub
	end if

	xPasswordNew = trim(password_cambio_formato.PasswordNew.value)
	IF xPasswordNew = "" THEN
		Alert "Debés completar el campo donde indicás tu Nueva Contraseña."
		exit sub
	end if

	IF len(xPasswordNew) < 4 Then
		alert "Tu nueva contraseña es demasiado corta. (Mínimo 4 caracteres)."
		password_cambio_formato.PasswordNew.Value = ""
		password_cambio_formato.PasswordNewVerificacion.Value = ""
		exit sub
	end if

	IF len(xPasswordNew) > 10 Then
		alert "Tu nueva contraseña es demasiado larga. (Máximo 10 caracteres)."
		password_cambio_formato.PasswordNew.Value = ""
		password_cambio_formato.PasswordNewVerificacion.Value = ""
		exit sub
	end if

	IF not isnumeric(xPasswordNew) Then
		alert "Tu nueva contraseña debe tener formato númerico."
		password_cambio_formato.PasswordNew.Value = ""
		password_cambio_formato.PasswordNewVerificacion.Value = ""
		exit sub
	end if

	xPasswordNewVerificacion = trim(password_cambio_formato.PasswordNewVerificacion.value)
	IF xPasswordNewVerificacion = "" THEN
		Alert "Debés completar el campo de verificación de tu contraseña nueva."
		exit sub
	end if

	IF xPasswordNew  <> xPasswordNewVerificacion THEN
		Alert "Tu Contraseña nueva y su verificación no coinciden. Volvé a completar los campos."
		password_cambio_formato.PasswordNew.Value = ""
		password_cambio_formato.PasswordNewVerificacion.Value = ""
		exit sub
	end if

	password_cambio_formato.submit

End Sub

</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>

		<TITLE>. Carta Autom&aacute;tica .</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
		<SCRIPT language="Javascript" src="scripts/functions.js"></SCRIPT>
		<SCRIPT language="Javascript" src="scripts/menu.js"></SCRIPT>
		<SCRIPT language="Javascript" src="scripts/menu_over.js"></SCRIPT>
		<LINK href="styles/general.css" rel="stylesheet" type="text/css"/>
		<LINK href="styles/menu.css"    rel="stylesheet" type="text/css"/>
		<LINK href="layers/layers.css"  rel="stylesheet" type="text/css"/>
	    <script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
        </script>
	    <style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	color: #333333;
}
body {
	background-image: url(images/fondo_azul.gif);
}
.style2 {color: #FFFFFF}
-->
        </style>
	</HEAD>
<!--//

###############################################################
#################### TAG: strPreloadImages ####################
###############################################################
//-->
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/nav_empresa_on.gif', 'images/nav_sucursales_on.gif', 'images/nav_sugerencias_on.gif', 'images/nav_propuestas_prov_on.gif', 'images/nav_solicitud_on.gif', 'images/nav_promociones_on.gif', 'images/nav_novedades_on.gif', 'images/nav_adhesion_on.gif', 'images/nav_mapadelsitio_on.gif'%strPreloadImages%)">
		<map name="Map">
          <area shape="rect" coords="3,5,305,66">
	    </map>
	    <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="9" background="images/left.gif">&nbsp;</td>
            <td bgcolor="#FFFFFF" style="width: 576px">
              <table width="752" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                <tr>
                  <td colspan="2" style="width: 752px"><img src="images/top_transaccional.jpg" height="100" border="0" usemap="#MapMap" style="width: 752px"></td>
                </tr>
                <tr>
                  <td width="150" align="right"><img src="images/1x1.gif" width="1" height="5"></td>
                </tr>
              </table>

              <map name="MapMap">
                <area shape="rect" coords="2,5,297,66">
              </map>
              <table border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="width: 684px">
                <tr>
                  <td valign="top" style="width: 684px">

                    &nbsp;</tr>
                  <td valign="top" style="width: 684px">

                    <!--//

#########################################################
#################### TAG: strCabezal ####################
#########################################################

//-->
                    <img src="images/cabezales/cabezal_socios_Cambio_Password.gif" style="width: 609px; height:111px"><br>
                    </tr>
                <tr>
                  <td valign="top" height="113">&nbsp;</td>
                  <td valign="top" height="113">&nbsp; <img src="images/1x1.gif" width="1" height="1">
                      &nbsp;
                  <table border="1" width="100%" style="border-width: 0px">
					<tr>
						<td style="border-style: none; border-width: medium">
						
						&nbsp;</td>
						<td style="border-style: none; border-width: medium" width="493">
						
						<form name="password_cambio_formato" action="cambio_password_formato_proceso.asp" method="post">

<table width="360" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
	
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="39"></td>
		<td align="right" width="180"><img src="images/borde_celeste.gif" width="20" height="39"></td>
	</tr>
		
</table>

<table width="360" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">

	<tr bgcolor="#DAEEFC">
		<td width="173" class="hometexto" align="center" bgcolor="#E4F3FD" height="0"><p align="left">
			<input type="hidden" name="TipoDocumento" size="0" bgcolor="#E4F3FD" value=<% Response.Write(Request.QueryString("TipoDoc")) %> >
		</td>
		<td width="173" class="hometexto" align="center" bgcolor="#E4F3FD" height="0"><p align="left">
			<input type="hidden" name="NumeroDocumento" size="0" bgcolor="#E4F3FD" value=<% Response.Write(Request.QueryString("NumeroDoc")) %> >
		</td>
	</tr>

	<tr>
		<td bgcolor="#E4F3FD" width="8">&nbsp;</td>
		<td bgcolor="#E4F3FD" class="hometexto" width="504"><b class="destacados">&nbsp;&nbsp; La contraseña ha caducado, ingresa una nueva.</b></td>
		<td bgcolor="#E4F3FD" width="70">&nbsp;</td>
	</tr>

	<tr>
		
		<td width="8" bgcolor="#E4F3FD">&nbsp;</td>

		<td width="504">
		
			<table width="352" border="0" cellspacing="0" cellpadding="3" style="border-collapse: collapse" bordercolor="#111111" height="186">
				
				<tr bgcolor="#DAEEFC">
					<td width="173" class="hometexto" align="center" bgcolor="#E4F3FD" height="52"><p align="left">&nbsp; Contraseña Anterior</td>
					<td width="167" class="hometexto" align="left" bgcolor="#E4F3FD" height="52"><input type="password" name="PasswordOLD" size="16"></td>
				</tr>
				<tr bgcolor="#F1F9FE">
					<td width="173" class="hometexto" bgcolor="#E4F3FD" align="center" height="44"><p align="left">&nbsp; Contraseña Nueva</td>
					<td width="167" class="hometexto" bgcolor="#E4F3FD" align="left" height="44"><input type="password" name="PasswordNew" size="16"></td>
				</tr>
				<tr bgcolor="#DAEEFC">
					<td width="173" class="hometexto"  bgcolor="#E4F3FD"  align="center" height="44"><p align="left">&nbsp; Reingrese la nueva Contraseña</td>
					<td width="167" class="hometexto" align="left" bgcolor="#E4F3FD" height="44"><input type="password" name="PasswordNewVerificacion" size="16"></td>
				</tr>
				<tr valign="top" bgcolor="#F1F9FE">
					<td colspan="2" class="hometexto" align="center" width="393" bgcolor="#E4F3FD" height="22">&nbsp;</td>
				</tr>
			</table>
			
		</td>
		<td width="70" bgcolor="#E4F3FD">&nbsp;</td>
		
	</tr>

</table>

<table width="360" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>

<br>

<table width="360" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center"><a onClick="vbscript:ValidarPasswords()" onMouseOut="javaScript: MM_swapImgRestore();" onMouseOver="JavaScript: MM_swapImage('Image53', '', 'images/bot_actualizar_on.gif', 1);"     >
        <img src="images/bot_actualizar.gif" name="Image53" border="0"></a></td>
	</tr>
</table>

</form>

						
						</td>
					</tr>
					</table>
					<p>&nbsp;</p>
					<p>&nbsp;</td>
                </tr>
              </table></td>
            <td background="images/right.gif" style="width: 10px">&nbsp;</td>
          </tr>
          <tr>
            <td height="9"><img src="images/corner_left.gif" width="9" height="9"></td>
            <td height="9" background="images/down.gif" style="width: 576px"><img src="images/down.gif" width="1" height="9"></td>
            <td height="9" style="width: 10px"><img src="images/corner_right.gif" width="9" height="9"></td>
          </tr>
          <tr>
            <td height="9">&nbsp;</td>
            <td height="9" class="blanco" colspan="2"><div align="center">
                <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="4%"><span class="estilo"></span></td>
                    <td width="4%">&nbsp;</td>
                    <td width="92%"><div align="right" class="style1 style2" >&nbsp;&nbsp; Todos los derechos reservados &copy; Carta Autom&aacute;tica 2006</div></td>
                  </tr>
                </table>
            </div>&nbsp;</td>
          </tr>
        </table>
</body>
</html>