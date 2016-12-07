<%@language=JScript%>


<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<!--#include file="includes/functions.js.asp"-->


<%
	objDB = new DB(arrConn)
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
<%						
							strQuery  = " SELECT"
							strQuery += "     co.FechaImputacion,"
							strQuery += "     co.Importe,"
							strQuery += "     co.FechaReal,"
							strQuery += "     co.CanalPago"
							strQuery += " FROM"
							strQuery += "    Cobranza co"
							strQuery += "    INNER JOIN InfoSys infs ON co.CalenPeriodo = infs.CalenPeriodo_Anterior1"
							strQuery += " WHERE"
							strQuery += "    co.SoliNume = " + Session("UserId")
							
							if(objDB.query(strQuery))	
							{												
								rs = objDB.each()
								
								strFechaImputacion = formatDate(rs.FechaImputacion, 0)
								strImporte         = Number(rs.Importe).toFixed(2)
								strFechaReal       = formatDate(rs.FechaReal, 0)								
								strCanalPago       = rs.CanalPago
							}
							else
							{
								strFechaImputacion = "-"
								strImporte		   = "-"
								strFechaReal       = "-"
								strCanalPago       = "-"
							}
%>							
							<TR bgcolor="#F1F9FE">
								<TD width="50%" align="right"><B>Fecha de Imputación:&nbsp;</B></TD>								
								<TD width="50%"><%=strFechaImputacion%></TD>								
							</TR>

							<TR bgcolor="#E4F3FD">
								<TD align="right"><B>Importe:&nbsp;</B></TD>								
								<TD><%=strImporte%></TD>					
							</TR>							

							<TR bgcolor="#F1F9FE">
								<TD align="right"><B>Fecha Real:&nbsp;</B></TD>								
								<TD><%=strFechaReal%></TD>					
							</TR>							


							<TR bgcolor="#E4F3FD">
								<TD align="right"><B>Canal de Pago:&nbsp;</B></TD>								
								<TD><%=strCanalPago%></TD>					
							</TR>								
						</TABLE>
					</TD>
					<TD width="10" bgcolor="#E4F3FD">&nbsp;</TD>
				</TR>				
			</TABLE>
	
			<TABLE width="90%" border="0" cellspacing="0" cellpadding="0">
				<TR bgcolor="#E4F3FD">
					<TD><IMG src="images/borde_celeste_bottomizq.gif" width="20" height="19"></TD>
					<TD align="right"><IMG src="images/borde_celeste_bottom.gif" width="20" height="19"/></TD>
				</TR>
			</TABLE>
		
			<BR>
		
			<INPUT type="image" src="images/cerrar.gif" onClick="JavaScript: window.close();"/>
		</CENTER>
	</BODY>
</HTML>
