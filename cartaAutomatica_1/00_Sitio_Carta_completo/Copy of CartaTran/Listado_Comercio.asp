
<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="includes/functions.js.asp"-->
<!--#include file="classes/class.jstemplate.asp"-->
<!--#include file="classes/class.db.js.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

	<HEAD>
		<TITLE>Carta Autom&aacute;tica</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link href="estilos.css" rel="stylesheet" type="text/css">

	</HEAD>
	
	<BODY>

		<div align="right">
		<input type="image" target="_blank" href="" src="images/imprimir.gif" name="imprimir" width="111" height="31" border="0">
		</div>

		<%

			strZonaAnt = ""
			strRubroAnt = ""

			var objDB = new DB(arrConn)			

			sQuery = "esp_COMERCIOS_Buscador_New2 20, 0, ''"			
								
			objDB.query(sQuery)		

			while(rs = objDB.each()) {			

				if (rs.Rubro != "SUCURSAL TA") {

					if (rs.Localidad != strZonaAnt) {									
			
						strRubroAnt=""
						if (strZonaAnt != "") {
						}

					Response.Write( '<BR>' )
					Response.Write( '<TABLE width=740 border=0 cellspacing=0 cellpadding=0>')
					Response.Write( '<TR>' )
					Response.Write( '<TD class=titulos2 width=20>' )
					Response.Write( '<strong>' )
					Response.Write( "" )
					Response.Write( '</strong>' )
					Response.Write( '</TD>' )
					Response.Write( '<TD class=titulos2 width=580>' )
					Response.Write( '<strong>' )
					Response.Write( rs.Localidad )
					Response.Write( '</strong>' )
					Response.Write( '</TD>' )
					Response.Write( '</TR>' )
					Response.Write( '</TABLE>' )
					Response.Write( '<BR>' )

					strZonaAnt = rs.Localidad

				   	}


					if (rs.Rubro != strRubroAnt) {
									
						if (strRubroAnt != "") {
						}

						Response.Write( '<TABLE width=740 border=0 cellspacing=0 cellpadding=0>')
						Response.Write( '<TR>' )
						Response.Write( '<TD>' )
						Response.Write( '<em class=titulos><strong>' )
						Response.Write( '<img src=/images/flecha2.gif width=19 height=17>' )
						Response.Write( rs.Rubro )
						Response.Write( '</strong></em>' )
						Response.Write( '</TD>' )
						Response.Write( '</TR>' )
						Response.Write( '</TABLE>' )
						Response.Write( '<BR>' )		

						strRubroAnt = rs.Rubro
	
					}
				
				Response.Write( '<TABLE width=740 border=0 cellspacing=0 cellpadding=0>')
				Response.Write( '<TR>' )		
				Response.Write( '<TD width=350 valign=baseline class=negro>' )
				Response.Write( '<strong>' )	
				Response.Write( rs.NombreFantasia )	
				Response.Write( '</strong>' )
				Response.Write( '</TD>' )
				Response.Write( '<TD  width=390 valign=baseline class=rojo rowspan=2>' )
				Response.Write( rs.Planes )		
				Response.Write( '</TD>' )		
				Response.Write( '</TR>' )		
				Response.Write( '</TABLE>' )

				Response.Write( '<TABLE width=740 border=0 cellspacing=0 cellpadding=0>')
				Response.Write( '<TR>' )
				Response.Write( '<TD class=negro>' )
				Response.Write( rs.Domicilio )
				Response.Write( '</TD>' )
				Response.Write( '</TR>' )
				Response.Write( '</TABLE>' )

				Response.Write( '<BR>' )			

				}

			}

		%>
	
	</BODY>

</HTML>