<!--#include file="functions.asp"-->
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

//-->
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<body onLoad="MM_preloadImages('images/lupa_b.gif','images/b_sucursales_b.gif','images/b_sitemap_b.gif','images/b_home_b.gif')">
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
            <td width="555" valign="top"><table width="555" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="552" height="38" valign="top">
                <!--#include file="Buscador.asp"-->
                </td>
              </tr>
              <tr>
                <td><table width="550" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="548"><table width="548" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><script type="text/javascript">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','548','height','111','src','images/tit_comercios','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','images/tit_comercios','menu','false' ); //end AC code</script>
                          <noscript>
                          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="548" height="111">
                            <param name="movie" value="images/tit_comercios.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
                            <embed src="images/tit_comercios.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="548" height="111"></embed>
                          </object>
                          </noscript></td>
                      </tr>
                      <tr>
						<td class="negro">&nbsp;						</td>
                      </tr>
				<%
'BEGIN chequeo el formulario
	if (Request("cmbZona")<>"") then
		intIdZona = Cint(Request("cmbZona"))
	else
		intIdZona = 0
	end if
	if (Request("cmbRubro")<>"") then
		intIdRubro = Cint(Request("cmbRubro"))
	else
		intIdRubro = 0
	end if
	if (Request("txtComercio")<>"") then
		strComercio = Request("txtComercio")
	else
		strComercio = ""
	end if
'END

'BEGIN paginación
	iPagActual	= Request.Form("hidPagActual")
	if iPagActual = "" then	iPagActual = Request.querystring("pagactual")
	iPagProx		= Request.Form("hidPagProx")
	if iPagProx = "" then iPagProx = Request.querystring("pagprox")
	iSuma				= Request.Form("hidSuma")
	if iSuma = "" then iSuma = Request.querystring("suma")

	if request.querystring("itampagina") <> "" then
		iTamPagina = cint(request.querystring("itampagina"))
	else
		iTamPagina = 20
	end if

	cantPag = 20

	set objComercios = server.CreateObject("adodb.recordset")
	objComercios.Open "esp_COMERCIOS_Buscador_New " & intIdZona & ", " & intIdRubro & ", '" & strComercio & "'", Conn,3, 3
	
	if not objComercios.EOF then
		iCantTotal = contarRS(objComercios)
	else
		iCantTotal=0
	end if
	
	iPagTotal =  int(iCantTotal / iTamPagina)
	If iCantTotal mod iTamPagina > 0 Then iPagTotal = iPagTotal + 1

	iPagActual	= calculoPagActual(iSuma, cantPag, iPagActual, iPagProx)
	
	strPagina			= "comercios.asp"
	strFiltroPaginacion	= "&itampagina=" & iTamPagina &"&cmbZona="&intIdZona&"&cmbRubro="&intIdRubro&"&txtComercio="&strComercio
	
	if iCantTotal>0 then 
		objComercios.Move (iPagActual * iTamPagina)
	end if
'END
					set objPlanes = server.CreateObject("adodb.recordset")

					strZonaAnt = ""
					strRubroAnt = ""
					%>
				<!-- BEGIN hiddens para la paginación -->
				<input type="Hidden" name="hidPagActual" value="<% = iPagActual %>">
				<input type="Hidden" name="hidPagProx" value="<% = iPagProx %>">
				<input type="Hidden" name="hidSuma" value="<% = iSuma %>">
				<!-- END -->
					<%
					  intCont = 0
                      while not objComercios.EOF and intCont<iTamPagina
						if objComercios("Rubro")<>"SUCURSAL TA" then
								objPlanes.Open "esp_PlanesComercio_consulta " & objComercios("ComercioId") & ", " & intIdZona, Conn,3, 3
								intCont = intCont + 1
								if objComercios("Localidad")<> strZonaAnt then
									strRubroAnt=""
									if strZonaAnt<>"" then
							%>
							    </table></td>
							  </tr>
							<%
									end if
							%>
							<tr>
							  <td><table width="50%"  border="0" cellspacing="0" cellpadding="0">
							    <tr>
							      <td width="11%"><em></em></td>
							      <td width="89%" class="titulos2"><strong><% = objComercios("Localidad")%></strong><br>&nbsp;</td>
							    </tr>
							  </table></td>
							</tr>
							<%
									strZonaAnt = objComercios("Localidad")
								end if
								if objComercios("Rubro")<> strRubroAnt then
									if strRubroAnt<>"" then
							%>
							    </table></td>
							  </tr>
							<%
									end if
							%>

							<tr>
								<tr>
								  <td>
								    <table width="95%"  border="0" cellspacing="0" cellpadding="0">
								      <tr>
								        <td width="4%"><em><strong><img src="images/flecha2.gif" width="19" height="17"></strong></em></td>
								        <td colspan="2"><em class="titulos"><strong><% = objComercios("Rubro")%></strong></em></td>
								      </tr>
							 <%
									strRubroAnt = objComercios("Rubro")
							 end if
							 %>
							      <tr>
							        <td>&nbsp;</td>
							        <td valign="baseline" class="negro"><strong><% = objComercios("NombreFantasia")%></strong></td>
							        <td valign="baseline" class="rojo" rowspan="2">
							        <% 
										strPlanAnterior = ""
										while not objPlanes.EOF 
											if objPlanes(2)<>strPlanAnterior then
												Response.Write (objPlanes(2)&"<br>")
												strPlanAnterior = objPlanes(2)
											end if
												objPlanes.MoveNext
										wend %> 
										</td>
							      </tr>
							      <tr>
							        <td>&nbsp;</td>
							        <td width="46%" valign="top" class="negro">
							          <p><% = objComercios("Domicilio")%></p></td>
							      </tr>
							      <tr>
							        <td colspan="3" height="3"></td>
							      </tr>
							 <%
									objPlanes.Close
							else
								if iCantTotal>0 then iCantTotal = iCantTotal - 1
							end if
							objComercios.MoveNext
						wend
						'repito cálculos de paginación por los registros evitados
						iPagTotal =  int(iCantTotal / iTamPagina)
						If iCantTotal mod iTamPagina > 0 Then iPagTotal = iPagTotal + 1

						iPagActual	= calculoPagActual(iSuma, cantPag, iPagActual, iPagProx)
						%>
                                
                          </table></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                      </tr>
                    </table></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
                  <tr>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                    <td width="1" height="1" bgcolor="#B6B7B8"></td>
                  </tr>
					<tr>
					  <td colspan="3" height="25" align="center" valign="bottom" class="negro">
					      <!-- BEGIN mostrar paginación -->
								<% muestroPaginacionFront iCantTotal, iPagActual, cantPag, iPagTotal, strPagina, strFiltroPaginacion %>
							<!-- END -->
					  </td>
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
    <td height="9"><img src="images/corner_left.gif" width="9" height="9"></td>
    <td height="9" background="images/down.gif"><img src="images/down.gif" width="1" height="9"></td>
    <td height="9"><img src="images/corner_right.gif" width="9" height="9"></td>
  </tr>
  <tr>
    <td height="9">&nbsp;</td>
    <td height="9" class="blanco"><div align="center"><a href="data/acuerdo.htm" class="blanco">Acuerdo con el Usuario</a> - <a href="data/politica.htm" class="blanco">Pol&iacute;tica de Usuario</a> - Todos los derechos reservados @ Carta Automatica 2010</div></td>
    <td height="9">&nbsp;</td>
  </tr>
</table>
</body>
</html>
