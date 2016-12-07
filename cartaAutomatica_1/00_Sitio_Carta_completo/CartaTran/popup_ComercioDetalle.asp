<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<!--#include file="includes/functions.js.asp"-->
<%
	objDB = new DB(arrConn)
	
	intComercioId = Number(Request.QueryString("id"))
	
	sQuery = "esp_COMERCIO_POPUP_Consulta " + intComercioId
	
	objDB.query(sQuery)	

	if(rs = objDB.each()) {
		strRZ		      = rs.RazonSocial
		strNombreFantasia = rs.NombreFantasia
		strRubro	      = rs.Rubro
		strDom            = rs.Domicilio
		strCUIT           = rs.CUIT
		strLoc            = rs.Localidad
		strIngBrutos      = Number(rs.IngresosBrutos)
		strIVA		      = rs.PosicionIVA
		strProv		      = rs.Provincia
		strCP		      = rs.CP
		strTel		      = rs.Telefonos
	}
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
								<TD><B>Razón Social</B></TD>
								<TD><%=strRZ%></TD>
							</TR>					
						
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Nombre de Fantasía</B></TD>
								<TD><%=strNombreFantasia%></TD>
							</TR>										
							
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Rubro</B></TD>
								<TD><%=strRubro%></TD>
							</TR>														
												
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>CUIT</B></TD>
								<TD><%=strCUIT%></TD>
							</TR>				

						
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Provincia</B></TD>
								<TD><%=strProv%></TD>
							</TR>									
							
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Localidad</B></TD>
								<TD><%=strLoc%></TD>
							</TR>			
							
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Domicilio</B></TD>
								<TD><%=strDom%></TD>								
							</TR>					
							
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>CP</B></TD>
								<TD><%=strCP%></TD>
							</TR>					
							
							<TR bgcolor="#CAE8FB" class="subtitulos">
								<TD><B>Teléfonos</B></TD>
								<TD><%=strTel%></TD>
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