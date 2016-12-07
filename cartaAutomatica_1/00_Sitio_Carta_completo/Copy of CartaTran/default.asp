<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="includes/functions.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<!--#include file="classes/class.template.js.asp"-->
<!--#include file="classes/class.jstemplate.asp"-->
<%
	// ########## Creo objetos DB y File ##########
	objDB   = new DB(arrConn)
	objFile = Server.CreateObject("Scripting.FileSystemObject")

	var aBlocks = new Array()
	aBlocksVacios = new Array()
	var arrStrContentParams = new Array()

	// ########## Valido la página solicitada e incluyo contenidos específicos ##########
	switch(Request.QueryString("strSection").item) {
		// ########## COMUN A TODOS ##########
		case "main":
			switch(Request.QueryString("strContentType").item) {
				case "agradecimiento":               break
				case "agradecimiento_especial":      break
				case "buscador":                     %><!--#include file="includes/main_buscador.js.asp"--><%                 break	
				case "home":                         Response.Redirect("home.asp"); break
				case "mapa_sitio":                   %><!--#include file="includes/main_mapa_sitio.js.asp"--><%               break	
				case "servicios_titulares":          break
				case "obtene_tarjeta":               %><!--#include file="includes/main_obtene_tarjeta.js.asp"--><%           break
				case "como_leer_resumen":            break
				case "olvide_password":              break
				case "registrate":                   break
				case "buscador_comercios":           %><!--#include file="includes/main_buscador_comercios.js.asp"--><%       break
				case "tasa_cero":                    break
				case "empresa_quienes_somos":        break
				case "empresa_productos":            break
				case "empresa_prensa":               break
				case "socios_promociones":           %><!--#include file="includes/main_socios_promociones.js.asp"--><%       break
				case "socios_adicionales":           break
				case "socios_extravio":              break
				case "socios_formas_pago":           break
				case "socios_efectivo":              break
				case "socios_planes":                break
				case "socios_debito_automatico":     break
				case "socios_Pack":     break
				case "socios_preguntas_frecuentes":  break
				case "socios_como_obtenerla":        %><!--#include file="includes/main_socios_como_obtenerla.js.asp"--><%    break
				case "comercios_servicios":          break
				case "comercios_como_adherirse":     %><!--#include file="includes/main_comercios_como_adherirse.js.asp"--><% break
				case "sucursales":                   break
				case "sugerencias":                  %><!--#include file="includes/main_sugerencias.js.asp"--><%              break
				case "rrhh":                         %><!--#include file="includes/main_rrhh.js.asp"--><%                     break
				default:                             Response.Redirect("home.asp")
			}
			break
		// ########## SOCIOS ##########
		case "socios":
			if(Session("validation") != "socio")    Response.Redirect("login_error.asp")
			switch(Request.QueryString("strContentType").item) {
				case "bienvenida":             break
				case "resumen_cuenta":         break
				case "BuscarCodigoBarra":      %><!--#include file="includes/socios_BuscarCodigoBarra.js.asp"--><% break
				case "resumenes_anteriores":   %><!--#include file="includes/socios_resumenes_anteriores.js.asp"--><%   break
				case "situacion_actual":       %><!--#include file="includes/socios_situacion_actual.js.asp"--><%       break
				case "pago_resumen":           %><!--#include file="includes/socios_pago_resumen.js.asp"--><%           break
				case "clave_pago_electronico": %><!--#include file="includes/socios_clave_pago_electronico.js.asp"--><% break
				case "limites_disponibles":    %><!--#include file="includes/socios_limites_disponibles.js.asp"--><%    break
				case "resumen_anual":          %><!--#include file="includes/socios_resumen_anual.js.asp"--><%          break
				case "cierres_vencimientos":   %><!--#include file="includes/socios_cierres_vencimientos.js.asp"--><%   break
				case "actualizacion_datos":    %><!--#include file="includes/socios_actualizacion_datos.js.asp"--><%    break
				case "Cambio_Password":    	   %><!--#include file="includes/socios_Cambio_Password.js.asp"--><%    break
				default:                       Response.Redirect("home.asp")
			}
			break
		// ########## COMERCIOS ##########
		case "comercios":
			if(Session("validation") != "comercio") Response.Redirect("login_error.asp")
			switch(Request.QueryString("strContentType").item) {
				case "login":           %><!--#include file="includes/comercios_login.js.asp"--><%           break
				case "bienvenida":      %><!--#include file="includes/comercios_bienvenida.js.asp"--><%      break
				case "liquidaciones":   %><!--#include file="includes/comercios_liquidaciones.js.asp"--><%   break
				case "planes_vigentes": %><!--#include file="includes/comercios_planes_vigentes.js.asp"--><% break
				case "cambio_password": %><!--#include file="includes/comercios_cambio_password.js.asp"--><% break
				default:                Response.Redirect("home.asp")
			}
			break
		default:
			Response.Redirect("default.asp?strSection=main&strContentType=home")
	}

	// ########## Buscador de comercios ##########
	if(Session("validation") != "comercio") {
		oTemplatesPath = Server.MapPath("templates/")
		var tBuscadorComercios = new jsTemplate(oTemplatesPath)

		tBuscadorComercios.setFile({

			"tpl_main"           : "form_buscador_comercios.tpl",
			"options_sucursales" : "option_row.tpl",
			"options_rubros"     : "option_row.tpl"
		})

		
		sQuery = "esp_GENERAL_Sucursal_Consulta"
		objDB.query(sQuery)		
		while(rsSucursal = objDB.each()) {
			tBuscadorComercios.setVar("VALUE", rsSucursal.SucursalTAId)
			tBuscadorComercios.setVar("LABEL", rsSucursal.Descripcion)
			tBuscadorComercios.parse("strSucOptionTemplate", "options_sucursales", true)
		}

		sQuery = "esp_GENERAL_Rubro_Consulta"
		objDB.query(sQuery)
		while(rsRubro = objDB.each()) {
			tBuscadorComercios.setVar("VALUE", rsRubro.RubroId)
			tBuscadorComercios.setVar("LABEL", rsRubro.Descripcion)
			tBuscadorComercios.parse("strRubOptionTemplate", "options_rubros", true)
		}

		strFormBuscadorComercios = tBuscadorComercios.parse("OUT", "tpl_main", false)
	} else {
		strFormBuscadorComercios = ""
	}

	// ########## Banner de la derecha ##########
	switch(Session("validation")) {
		case "socio" :
			strBannerMargenRight = "<a href=\"default.asp?strSection=main&strContentType=socios_extravio\"><IMG src=\"images/banner_extravio.gif\" style=\"border-style: none;\" width=\"146\" height=\"100\"/></a>"
			break

		case "comercio" :
			strBannerMargenRight = ""
			break
			
		default :
			// Si es la pagina de obtene tu tarjeta no tiene que mostrar la imagen de obtene tu tarjeta
			if(Request.QueryString("strContentType").item.toUpperCase() == "OBTENE_TARJETA") {
				strBannerMargenRight = ""
			} else {
				strBannerMargenRight = "<A href=\"default.asp?strSection=main&strContentType=obtene_tarjeta\"><IMG src=\"images/banner_solicite.gif\" style=\"border-style: none;\" width=\"146\" height=\"100\"/></A>"
			}				
			break
	}

	// ########## Defino menúes exclusivos ##########
	var strAditionalMenu = ""

	switch(Session("validation")) {
		case "socio" :
			// Menú para socios
			objAditionalMenu = new Template()
			objTextStream = objFile.OpenTextFile(Server.MapPath("templates/menu_socios.tpl"), 1, false)
			while (!objTextStream.AtEndOfStream) {
				objAditionalMenu.strBody += objTextStream.ReadLine() + "\n"
			}
			objTextStream.Close()
			var arrParams = {"userName":Session("userName"), "userLastName":Session("userLastName")}
			objAditionalMenu.add(arrParams)
			strAditionalMenu = objAditionalMenu.getContent()
			break
		case "comercio" :
			// Si no está registrada la variable "Sucursal" es porque aún no se definió cuál comercio entre todos los que tienen el mismo CUIT suministrado.
			// En ese caso, no muestró aún el menú exclusivo.
			if(Session("Sucursal")) {
				// Menú para comercios
				objAditionalMenu = new Template()
				objTextStream = objFile.OpenTextFile(Server.MapPath("templates/menu_comercios.tpl"), 1, false)
				while (!objTextStream.AtEndOfStream) {
					objAditionalMenu.strBody +=  objTextStream.ReadLine() + "\n"
				}
				objTextStream.Close()
				var arrParams = {"userName":Session("userName"), "userLastName":Session("userLastName")}
				objAditionalMenu.add(arrParams)
				strAditionalMenu = objAditionalMenu.getContent()
				break
			}
	}

	// ########## Menu común ##########
	objTextStream = objFile.OpenTextFile(Server.MapPath("templates/menu_comun.tpl"), 1, false)
	var strCommonMenu = ""
	while (!objTextStream.AtEndOfStream) {
		strCommonMenu +=  objTextStream.ReadLine() + "\n"
	}

	// ########## Defino si habrá área de login ##########
	strLoginArea = ""
	if(Session("validation") != "socio" && Session("validation") != "comercio") {
		objTextStream = objFile.OpenTextFile(Server.MapPath("templates/login_area.tpl"), 1, false)
		while (!objTextStream.AtEndOfStream) {
			strLoginArea += objTextStream.ReadLine() + "\n"
		}
		objTextStream.Close()
	}

	// ########## Construcción del contenido central ##########
	oTemplatesPath = Server.MapPath("templates/")
	tMainContent = new jsTemplate(oTemplatesPath)
	tMainContent.setFile("tpl_main", Request.QueryString("strSection").item + "_" + Request.QueryString("strContentType").item + ".tpl")

	// Como el método lenght no funciona para arrays asociativos, y no encuentro
	// otro método para tal fin, utilizo este recurso precario.
	var count = 0
	for(key in arrStrContentParams) {
		count++
	}

	// Si el array de parámetros tiene valores, lo parseo.
	// (los tiene cuando la sección es dinámica)
	if(count > 0) {
		// Si el array de bloques tiene valores, los parseo.
		// (los tiene cuando la sección tiene bloques que no siempre deben mostrarse)
		while(aBlocks.length > 0) {
			sBlock = aBlocks.pop()
			tMainContent.setBlock("tpl_main", sBlock, "VAR_" + sBlock)
			tMainContent.parse("tpl_main", sBlock, false)
		}
		tMainContent.setVar(arrStrContentParams)
	}

	// ########## Construcción de la página ##########
	// Creo objeto TextStream a partir del objeto File, para poder leer el archivo template principal
	objTextStream = objFile.OpenTextFile(Server.MapPath("templates/main.tpl"), 1, false)

	// Creo el objeto Template que formará la página
	objTemplate = new Template()
		objTemplate.strDelimiter = "%"
		// Leo el archivo template y lo guardo en el objeto
		while(!objTextStream.AtEndOfStream) {
			objTemplate.strBody +=  objTextStream.ReadLine() + "\n"
		}

		// Creo un array asociativo, con las marcas del template y los valores para reemplazar
		var arrParams = {
			//"strPreloadImages"       : arrPreloadImages.join(", "),
			"strPreloadImages"         : "",
			"strCommonMenu"            : strCommonMenu,
			"strAditionalMenu"         : strAditionalMenu,
			"strLoginArea"             : strLoginArea,
			"strFormBuscadorComercios" : strFormBuscadorComercios,
			"strBannerMargenRight"     : strBannerMargenRight,
			"strCabezal"               : "images/cabezales/cabezal_" + Request.QueryString("strSection").item + "_" + Request.QueryString("strContentType").item + ".gif",
			"strBody"                  : tMainContent.parse("OUT", "tpl_main", false),
			"strCol10Image"            : "images/cabezales/fondo_col10_" + Request.QueryString("strSection").item + "_" + Request.QueryString("strContentType").item + ".gif"
		}

		// Paso el array al objeto
		objTemplate.add(arrParams)

		// Imprimo página
		Response.Write(objTemplate.getContent())
%>