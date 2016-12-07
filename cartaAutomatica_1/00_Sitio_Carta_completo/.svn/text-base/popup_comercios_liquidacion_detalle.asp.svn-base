<%@language=JScript%>


<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<!--#include file="includes/functions.js.asp"-->


<%
	objDB = new DB(arrConn)
	
	intLiquidacionId = Number(Request.QueryString("LiquidacionId"))
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>. Carta Autom&aacute;tica .</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<LINK href="styles/general.css" rel="stylesheet" type="text/css">
	</HEAD>
	
	
	<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table border="1" width="100%" id="table2" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
		
			<INPUT type="image" src="images/imprimir.gif" onClick="JavaScript: window.print();" id=image2 name=image2 align="right"></td>
			</tr>
		</table>
				
		<CENTER>		
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR bgcolor="#E4F3FD">
					<TD><IMG src="images/borde_celesteizq.gif" width="20" height="19"></TD>
					<TD align="right"><IMG src="images/borde_celeste.gif" width="20" height="19"/></TD>
				</TR>
			</TABLE>
<% 
							strQuery  = "EXEC esp_COMERCIOS_Liquidacion_Detalle " + intLiquidacionId							
							
							if(objDB.query(strQuery)) 
							{
								rs = objDB.each()
								strLiquidacionID = rs.LiquidacionID
								strFechaPago   = formatDate(rs.FechaPago, 0)
								strFechaEmision = formatDate(rs.FechaLiquidacion, 0)
								
								
								
								strCUIT = rs.Cuit
								strComercio = rs.Comercio
								strComercioNumero = rs.NumComercio
		
							}
%>		
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR>
					<TD width="10" bgcolor="#E4F3FD">&nbsp;</TD>
					<TD>
						<TABLE width="100%" border="0" cellpadding="2" cellspacing="1" class="hometexto">
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center">
								<p align="left"><b>N° Liquidación</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3">
								<p align="left"><%Response.Write(strLiquidacionID )%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left">
								<b>N° Comercio</b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<%Response.Write(strComercioNumero)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left">
								<b>Comercio</b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<%Response.Write(strComercio)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center">
								<p align="left"><b>CUIT</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3">
								<p align="left"><%Response.Write(strCUIT)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center">
								<p align="left"><b>Fecha de Emisión</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3">
								<p align="left"><%Response.Write(strFechaEmision )%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" height="20">
								<p align="left"><b>Fecha de Pago</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3" height="20">
								<p align="left"><%Response.Write(strFechaPago)%></TD>
							</TR>
							<TR bgcolor="#F1F9FE" class="subtitulos">
								<TD align="center" colspan="4" height="10"></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center"><B>Nº Lote</B></TD>
								<TD align="center"><B>Nº Terminal</B></TD>
								<TD align="center"><B>Cant. Cupones</B></TD>								
								<TD align="center"><B>$ Venta</B></TD>
							</TR>
<%							
							sBgColor        = "#E4F3FD"
							curAcum_importe = 0
							
							strQuery  = "EXEC esp_COMERCIOS_Liquidacion_Detalle " + intLiquidacionId							
							
							if(objDB.query(strQuery)) 
							{

								while(rs = objDB.each()) 
								{	
									if(sBgColor == "#E4F3FD") 
										sBgColor = "#F1F9FE"
									else 
										sBgColor = "#E4F3FD"

									curImporte	     = rs.Importe
									curAcum_importe += curImporte
								
									Response.Write("<TR bgcolor=\"" + sBgColor + "\">")
										Response.Write("<TD align=\"right\">" + rs.NroLote + "</TD>")
										Response.Write("<TD align=\"right\">" + rs.NroTerminal + "</TD>")
										Response.Write("<TD align=\"right\">" + rs.CantCupones + "</TD>")
										Response.Write("<TD align=\"right\">" + Number(curImporte).toFixed(2) + "</TD>")										
									Response.Write("</TR>")
								}
							}						
							else
							{
								Response.Write("<TR bgcolor=\"" + sBgColor + "\">")
									Response.Write("<TD align='center'>--</TD>")
									Response.Write("<TD align='center'>--</TD>")
									Response.Write("<TD align='center'>--</TD>")
									Response.Write("<TD align='center'>--</TD>")
								Response.Write("</TR>")							
							}
%>
							<TR>
								<TD align="right" colspan="4" class="total"><%=Number(curAcum_importe).toFixed(2)%></TD>
							</TR>							
						</TABLE>					
					</TD>
					<TD width="10" bgcolor="#E4F3FD">&nbsp;</TD>
				</TR>
			</TABLE>
		
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR bgcolor="#E4F3FD">
					<TD><IMG src="images/borde_celeste_bottomizq.gif" width="20" height="19"/></TD>
					<TD align="right"><IMG src="images/borde_celeste_bottom.gif" width="20" height="19"/></TD>
				</TR>
			</TABLE>
		
			<BR>
		
			&nbsp;<table border="1" width="100%" id="table1" style="border-width: 0px">
				<tr>
					<td style="border-style: none; border-width: medium" align="center"><INPUT type="image" src="images/cerrar.gif" onClick="JavaScript: window.close();"/ id=image1 name=image1></td>
				</tr>
			</table>
			<p>&nbsp;</p>
		</CENTER>
		<p>&nbsp;</p>
	</BODY>
</HTML>