<%@language=JScript%>


<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->


<%
	var strMensaje = "&nbsp;"
	
	var intResultado = -1

	objDB = new DB(arrConn)
	
	objDB.query("EXEC esp_SOCIO_Cambio_Password_xFormato'" + Request.Form("TipoDocumento")  + "', " + Request.Form("NumeroDocumento") + ", '" + Request.Form("PasswordOLD") + "', '" + Request.Form("PasswordNew") + "'")


	strRecord = objDB.each()

	intResultado = strRecord.Codigo
	strMensaje   = strRecord.Mensaje

%>

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
						<td style="border-style: none; border-width: medium" width="603">
						

            <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="100%" id="AutoNumber1" bgcolor="#FFFFFF">
              <tr>
                <td width="33%">&nbsp;</td>
                <td width="33%">
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
				</tr>
			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
					<td class="subtitulos" bgcolor="#CAE8FB"><b><%Response.Write(strMensaje)%></b></td>
					<td width="10" bgcolor="#DDEEFF">&nbsp;</td>
				</tr>

			</table>
			<table width="433" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#E4F3FD">
					<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
					<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
				</tr>
			</table>
                </td>
                <td width="34%">&nbsp;</td>
              </tr>
            </table>

						
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