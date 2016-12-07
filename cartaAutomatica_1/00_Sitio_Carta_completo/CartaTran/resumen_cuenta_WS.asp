<%	
Function InvokeWebService (strSoap, strSOAPAction, strURL, ByRef xmlResponse)
    '*****************************************************************************
    ' Descripción: Invoca un WebService y obtiene su resultado.
    '
    ' Inputs:
    '    strSoap:        Petición HTTP a enviar, en formato SOAP. Contiene la    
    '                llamada al WebMethod y sus parámetros 
    '                correspondientes.
    '    strSOAPAction:    Namespace y nombre del WebMethod a utilizar.
    '    strURL:        URL del WebService.
    '
    ' Returns:
    '    La función retornará False si ha fallado la ejecución del WebService o si
    '    ha habido error en la comunicación con el servidor remoto. De lo contrario
    '    retornará True.
    '
    '    xmlResponse:    Respuesta obtenida desde el WebService, parseada 
    '                por el MSXML.
    '*****************************************************************************

    Dim xmlhttp
    Dim blnSuccess

        'Creamos el objeto ServerXMLHTTP
        Set xmlhttp = Server.CreateObject("Msxml2.ServerXMLHTTP")

        'Abrimos la conexión con el método POST, ya que estamos enviando una
        'petición.
        xmlhttp.Open "POST", strURL

        'Agregamos encabezados HTTP requeridos por el WebService
        xmlhttp.setRequestHeader "Man", "POST " & strURL & " HTTP/1.1"
        xmlhttp.setRequestHeader "Content-Type", "text/xml; charset=utf-8"
        xmlhttp.setRequestHeader "SOAPAction", strSOAPAction

        'El SOAPAction es importante ya que el WebService lo utilizará para
        'verificar qué WebMethod estamos usando en la operación.

        'Enviamos la petición
        xmlhttp.send(strSoap)

        'Verificamos el estado de la comunicación
        If xmlhttp.Status = 200 Then

            'El código 200 implica que la comunicación se puedo establecer y que
            'el WebService se ejecutó con éxito.
            blnSuccess = True
        Else

            'Si el código es distinto de 200, la comunicación falló o el
            'WebService provocó un Error.
            blnSuccess = False
        End If

        'Obtenemos la respuesta del servidor remoto, parseada por el MSXML.
        Set xmlResponse = xmlhttp.responseXML

        InvokeWebService = blnSuccess

        'Destruimos el objeto, acá no hay GarbageCollector ;)
        Set xmlhttp = Nothing
End Function



Dim xmlhttp
Dim blnSuccess
Dim urlPDF
Dim strURL
Dim xmlResponse



strSoap =	"<?xml version='1.0' encoding='utf-8'?>"& _
			"<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"& _
			"<soap:Body>"& _
			"<generarResumen xmlns='http://tempuri.org/'>"& _
			"<cuenta>"&Session("UserID")&"</cuenta>"& _
			"<carpetaDestino>"&Server.MapPath("Resumenes")&"</carpetaDestino>"& _
			"</generarResumen>"& _
			"</soap:Body>"& _
			"</soap:Envelope>"
strSOAPAction = "http://tempuri.org/generarResumen"

strURL = "http://TAHQ002vw0178.tarjeta.local:850/WebServices/SUMAResumenesPDF/WebService.asmx"

'Realizamos la llamada a la función InvokeWebService(), brindándole los parámetros correspondientes

If InvokeWebService (strSoap, strSOAPAction, strURL, xmlResponse) Then

    'Si el WebService se ejecutó con éxito, obtenemos la respuesta y la imprimimos utilizando MSXML.DOMDocument
    urlPDF = xmlResponse.documentElement.selectSingleNode("soap:Body/generarResumenResponse/generarResumenResult").text
	archivo = urlPDF
	
	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	'Response.Write(archivo)
	'Response.Write(cstr(fs.FileExists(archivo)))
	'Response.End()
	if fs.FileExists(archivo) then
		Set objStream = Server.CreateObject("ADODB.Stream")
		objStream.Type = 1
		objStream.Open
		objStream.LoadFromFile archivo
	

	
		Response.AddHeader "Content-Disposition", "attachment; filename=" & archivo
		Response.ContentType = "application/octet-stream"
		Response.BinaryWrite objStream.Read
		objStream.Close
		Set objStream = Nothing
		response.write"Descargando archivo"
	else
		response.write(archivo)
	end if
	set fs=nothing
Else
    'Pero si hubo algún problema, le informamos al usuario
    Response.Write "Ha ocurrido un error en la generacion del archivo. Por favor, reintentelo nuevamente."
End If

'Liberamos la memoria del objeto xmlResponse 
Set xmlResponse = Nothing

%>