<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="includes/functions.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<!--#include file="classes/class.template.js.asp"-->
<!--#include file="classes/class.jstemplate.asp"-->
<%
	// Creo objeto DB
	objDB = new DB(arrConn)

	// Creo objeto File (para leer los archivos tpl)
	objFile = Server.CreateObject("Scripting.FileSystemObject")

	// leo el template para la home
	objTextStream = objFile.OpenTextFile(Server.MapPath("templates/home.tpl"), 1, false)
	objTemplate = new Template()
	while (!objTextStream.AtEndOfStream) {
		objTemplate.strBody +=  objTextStream.ReadLine() + "\n"
	}

	// Menu
	objTextStream = objFile.OpenTextFile(Server.MapPath("templates/menu_comun.tpl"), 1, false)
	var strCommonMenu = ""
	while (!objTextStream.AtEndOfStream) {
		strCommonMenu +=  objTextStream.ReadLine() + "\n"
	}

	// Genero los options del select de sucursales
	objSucOptionTemplate = new Template()
		objSucOptionTemplate.strBody = "<option value=\"%strOptionValue%\">%strOptionItem%</option>"

		var arrParams = {"strOptionItem":"", "strOptionValue":""}

		objDB.query("esp_GENERAL_Sucursal_Consulta")

		var max_chars = 17;

		while(strRecord = objDB.each()) {
			arrParams["strOptionItem"] = strRecord.Descripcion.substr(0, max_chars) + ((strRecord.Descripcion.length > max_chars) ? "..." : "")
			arrParams["strOptionValue"] = strRecord.SucursalTAId
			objSucOptionTemplate.add(arrParams)
		}

	// Genero los options del select de rubros
	objRubOptionTemplate = new Template()
		objRubOptionTemplate.strBody = "<option value=\"%strOptionValue%\">%strOptionItem%</option>"

		var arrParams = {"strOptionItem":"", "strOptionValue":""}

		objDB.query("EXEC esp_GENERAL_Rubro_Consulta")

		var max_chars = 17;

		while(strRecord = objDB.each()) {
			arrParams["strOptionItem"] = strRecord.Descripcion.substr(0, max_chars) + ((strRecord.Descripcion.length > max_chars) ? "..." : "")
			arrParams["strOptionValue"] = strRecord.RubroId
			objRubOptionTemplate.add(arrParams)
		}

	// Replazo los tags de la home template por las variables
	arrParams = {
		"strCommonMenu":        strCommonMenu,
		"strSucOptionTemplate": objSucOptionTemplate.getContent(),
		"strRubOptionTemplate": objRubOptionTemplate.getContent()
	}
	objTemplate.add(arrParams)

	// Imprimo página
	Response.write(objTemplate.getContent())
%>