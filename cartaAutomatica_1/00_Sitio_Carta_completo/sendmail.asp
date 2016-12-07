<%@language=JScript%>
<!--// Class para manejar templates //-->
<!--#include file="classes/class.template.js.asp"-->
<%

	var arrParams = new Array()

	objEnum = new Enumerator(Request.Form);
	while(!objEnum.atEnd()) {
		arrParams[objEnum.item()] = Request.Form(objEnum.item())(1)
		objEnum.moveNext();
	}
	

	if(arrParams["strTemplateFile"]) {
		objTemplate = new Template()
		objTemplate.strDelimiter = "%"
		objFile = Server.CreateObject("Scripting.FileSystemObject")
		objTextStream = objFile.OpenTextFile(Server.MapPath(arrParams["strTemplateFile"]), 1, false)

		while(!objTextStream.AtEndOfStream) {
			objTemplate.strBody +=  objTextStream.ReadLine() + "\n"
		}

		objTextStream.Close()

		objTemplate.add(arrParams)

		strBody = objTemplate.getContent()
	} else {
		strBody = arrParams["strBody"]
	}

//	objMail = Server.CreateObject("CDONTS.NewMail")

	objMessage = Server.CreateObject("CDO.Message") 
	objConfig = Server.CreateObject("CDO.Configuration") 

	
//CONEXION

objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "192.168.50.50" 
objConfig.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10 
objConfig.Fields.Update() 

objMessage.Configuration = objConfig 
objMessage.From = "Web_CartaAutomatica@CartaAutomatica.com.ar" 
objMessage.To = "actualizacioneswebcarta@CartaAutomatica.com.ar"
objMessage.Subject = arrParams["strSubject"]
objMessage.htmlBody = strBody 
objMessage.Send()


Response.Redirect(Request.Form("strReturnURL"))

%>