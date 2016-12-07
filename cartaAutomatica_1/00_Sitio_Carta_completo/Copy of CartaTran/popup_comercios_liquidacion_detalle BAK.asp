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
		<BR>
				
		<CENTER>		
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR bgcolor="#E4F3FD">
					<TD><IMG src="images/borde_celesteizq.gif" width="20" height="19"></TD>
					<TD align="right"><IMG src="images/borde_celeste.gif" width="20" height="19"/></TD>
				</TR>
			</TABLE>
		
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR>
					<TD width="10" bgcolor="#E4F3FD">&nbsp;</TD>
					<TD>
						<TABLE width="100%" border="0" cellpadding="2" cellspacing="1" class="hometexto">
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center">
								<p align="left"><b>N° Liquidación</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3">
								<p align="left">RS_LIQUIDACIONID</TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center">
								<p align="left"><b>Fecha de Emisión</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3">
								<p align="left">RS_EMISION</TD>
							</TR>
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD align="center" height="20">
								<p align="left"><b>Fecha de Pago</b></TD>
								<TD bgcolor="#E4F3FD" align="center" colspan="3" height="20">
								<p align="left">RS_PAGO</TD>
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
		
			<INPUT type="image" src="images/cerrar.gif" onClick="JavaScript: window.close();"/ id=image1 name=image1>
		</CENTER>
	</BODY>
</HTML>