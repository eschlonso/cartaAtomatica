<base href="file:///C:/Inetpub/wwwroot/CartaNew/CartaTran/validacion.asp" fptype="TRUE">
<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<%
		intLoginType = Number(Request.Form("strLoginType"))

		// Creo objeto DB
		objDB = new DB(arrConn)

// Response.Write(" - intLoginType:" + intLoginType)
// Response.Write(" - strTipoDoc:" + Request.Form("strTipoDoc").item)
// Response.Write(" - strCuit:" + Request.Form("strCuit").item)
// Response.Write(" - strDocumento:" + Request.Form("strDocumento").item)
// Response.Write(" - strPassword:" + Request.Form("strPassword").item)

// Response.End

		// Armo el query para consultar usuario y contraseña en la base

		var strQuery = ""

		switch(intLoginType) {

			case 1:

				strQuery = "EXEC esp_GENERAL_LoginSocio_Validacion_New '" + Request.Form("strTipoDoc").item + "', '" +  Request.Form("strDocumento").item + "', '" + Request.Form("strPassword").item + "'"

				// Si el query trae resultado, entonces el usuario es válido
				if(objDB.query(strQuery)) {

					rsUsuario = objDB.each()

					if (rsUsuario.id_ta < 0) {

						if (rsUsuario.id_ta == -1) {

							objDB.close()
							Session.Abandon()
							var strRedirect = "login_error.asp"
					
						} else if (rsUsuario.id_ta == -2) {

							var strRedirect = "cambio_password_formato.asp?TipoDoc=" + Request.Form("strTipoDoc").item + '&NumeroDoc=' + Request.Form("strDocumento").item

						}
					
					} else {

						Session("userName")     = rsUsuario.nombres
						Session("userLastName") = rsUsuario.apellidos
						Session("validation") = "socio"
						Session("userId") = rsUsuario.id_ta
						Session("moroso") = rsUsuario.moroso
						Session("pwd") = rsUsuario.password						
						var strRedirect = "default.asp?strSection=socios&strContentType=bienvenida"

				       	}

				} else {
				
					objDB.close()
					Session.Abandon()
					var strRedirect = "login_error.asp"

				}

				Response.Redirect(strRedirect)
				break				

			case 2:

				strQuery = "EXEC esp_GENERAL_LoginComercio_Validacion '" + Request.Form("strCuit").item + "', '" + Request.Form("strPassword").item + "'"

				if(objDB.query(strQuery)) {
				
					rsUsuario = objDB.each()

					// Registro las variables del usuari
					Session("validation") = "comercio"
					Session("logincomercioid") = rsUsuario.ComercioID
					Session("cuit") = rsUsuario.CUIT
					Session("pwd") = rsUsuario.Password
					Session("userName")     = rsUsuario.nombres
					Session("userLastName") = ""

					var strRedirect = "default.asp?strSection=comercios&strContentType=login"


				} else {
		
					objDB.close()
					Session.Abandon()
					var strRedirect = "login_error.asp"

				}

				Response.Redirect(strRedirect)
				break

		}


%>