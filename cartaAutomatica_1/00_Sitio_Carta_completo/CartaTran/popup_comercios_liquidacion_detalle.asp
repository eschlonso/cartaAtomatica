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
								strCondicionIVAComercio = rs.PosicionIVA
								strMarca = rs.Marca
								strMarca_RazonSocial = rs.Marca_RazonSocial
								strMarca = rs.Marca
								strMarca_CUIT = rs.Marca_CUIT
								strMarca_PosicionIVA = rs.Marca_PosicionIVA
								strMarca_NumIngresosBrutos = rs.Marca_NumIngresosBrutos
								
								strLeyendaPie = rs.LeyendaPie
								strLeyendaPie1 = rs.LeyendaPie1
								strLeyendaPie2 = rs.LeyendaPie2
								strLeyendaPie3 = rs.LeyendaPie3
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
								<TD align="left" width="34%">
								<p align="left"><b>Origen</b></TD>
								<TD bgcolor="#E4F3FD" colspan="3">
								<b>
								<%Response.Write(strMarca_RazonSocial + " (" + strMarca + ") ")%></b></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<b>CUIT </b></TD>
								<TD bgcolor="#E4F3FD" colspan="3">
								<%Response.Write(strMarca_CUIT)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<b>Posición IVA</b></TD>
								<TD bgcolor="#E4F3FD" colspan="3">
								<%Response.Write(strMarca_PosicionIVA)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<p align="left"><b>Ing. Brutos</b></TD>
								<TD bgcolor="#E4F3FD" colspan="3">
								<%Response.Write(strMarca_NumIngresosBrutos )%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" colspan="4">
								&nbsp;</TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" width="34%">
								<p align="left"><b>N° Liquidación</b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<p align="left"><%Response.Write(strLiquidacionID )%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<b>Comercio</b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<%Response.Write(strComercio + " (" + strComercioNumero + ")")%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<p align="left"><b>CUIT</b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<p align="left"><%Response.Write(strCUIT) %></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="left" width="34%">
								<p align="left"><b>Posición IVA </b></TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<%Response.Write(strCondicionIVAComercio) %></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" width="34%">
								<p align="left"><b>Fecha de Emisión</TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<%Response.Write(strFechaEmision)%></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" width="34%">
								<p align="left"><b>Fecha de Pago</TD>
								<TD bgcolor="#E4F3FD" align="left" colspan="3">
								<p align="left"><%Response.Write(strFechaPago)%></TD>
							</TR>
							<TR bgcolor="#F1F9FE" class="subtitulos">
								<TD align="center" colspan="4" height="10"></TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" width="30%"><B>Nº Lote</B></TD>
								<TD align="center" width="30%"><B>Nº Terminal</B></TD>
								<TD align="center" width="23%"><B>Cant. Cupones</B></TD>								
								<TD align="center" width="15%"><B>$ Venta</B></TD>
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

									if(rs.CantCupones == "$Bruto Liq.") {curAcum_importe = curImporte}
							
									Response.Write("<TR bgcolor=\"" + sBgColor + "\">")
									Response.Write("<TD align=\"right\">" + rs.NroLote + "</TD>")
									Response.Write("<TD align=\"right\">" + rs.NroTerminal + "</TD>")

									if(rs.CantCupones != "$ Bruto Liq.") 
				
									{ Response.Write("<TD align=\"right\">" + rs.CantCupones + "</TD>")
									  Response.Write("<TD align=\"right\">" + Number(curImporte).toFixed(2) + "</TD>") }

									else

									{ Response.Write("<TD align=\"right\"><b>" + rs.CantCupones + "</b></TD>")
									  Response.Write("<TD align=\"right\"><b>" + Number(curImporte).toFixed(2) + "</b></TD>") 
									}

										
									Response.Write("</TR>") 
									/*if (curAcum_importe>0 && rs.CantCupones != "$Bruto Liq."){
										if (curImporte<0){curImporte = curImporte*(-1)}
										curAcum_importe = curAcum_importe - curImporte
									}
									else */if (rs.CantCupones=="")
									{
										curAcum_importe = curAcum_importe + curImporte*(-1)
									}
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
								<TD></TD> 
								<TD></TD> 
								<TD align="right"><b>$ Neto Liq.</b></TD> 
								<TD align="right"><b><%=Number(curAcum_importe).toFixed(2)%></b></TD>
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


			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR class="subtitulos">
					<td class="subtitulos" align="center" ><BR><%Response.Write(strLeyendaPie1)%><BR><BR><%Response.Write(strLeyendaPie2)%><BR><BR><%Response.Write(strLeyendaPie3)%><BR><BR><%Response.Write(strLeyendaPie)%></td>
				</TR>
			</TABLE>
		
			&nbsp;<table border="1" width="100%" id="table1" style="border-width: 0px">
				<tr>
					<td style="border-style: none; border-width: medium" align="center"><INPUT type="image" src="images/cerrar.gif" onClick="JavaScript: window.close();"/ id=image1 name=image1></td>
				</tr>
				<tr>
				</tr>

			</table>
			<p>&nbsp;</p>
		</CENTER>

	</BODY>
</HTML>