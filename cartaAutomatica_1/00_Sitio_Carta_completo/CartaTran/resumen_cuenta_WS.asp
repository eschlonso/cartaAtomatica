<%	
Function InvokeWebService (strSoap, strSOAPAction, strURL, ByRef xmlResponse)
    '*****************************************************************************
    ' Descripci�n: Invoca un WebService y obtiene su resultado.
    '
    ' Inputs:
    '    strSoap:        Petici�n HTTP a enviar, en formato SOAP. Contiene la    
    '                llamada al WebMethod y sus par�metros 
    '                correspondientes.
    '    strSOAPAction:    Namespace y nombre del WebMethod a utilizar.
    '    strURL:        URL del WebService.
    '
    ' Returns:
    '    La funci�n retornar� False si ha fallado la ejecuci�n del WebService o si
    '    ha habido error en la comunicaci�n con el servidor remoto. De lo contrario
    '    retornar� True.
    '
    '    xmlResponse:    Respuesta obtenida desde el WebService, parseada 
    '                por el MSXML.
    '*****************************************************************************

    Dim xmlhttp
    Dim blnSuccess

        'Creamos el objeto ServerXMLHTTP
        Set xmlhttp = Server.CreateObject("Msxml2.ServerXMLHTTP")

        'Abrimos la conexi�n con el m�todo POST, ya que estamos enviando una
        'petici�n.
        xmlhttp.Open "POST", strURL

        'Agregamos encabezados HTTP requeridos por el WebService
        xmlhttp.setRequestHeader "Man", "POST " & strURL & " HTTP/1.1"
        xmlhttp.setRequestHeader "Content-Type", "text/xml; charset=utf-8"
        xmlhttp.setRequestHeader "SOAPAction", strSOAPAction

        'El SOAPAction es importante ya que el WebService lo utilizar� para
        'verificar qu� WebMethod estamos usando en la operaci�n.

        'Enviamos la petici�n
        xmlhttp.send(strSoap)

        'Verificamos el estado de la comunicaci�n
        If xmlhttp.Status = 200 Then

            'El c�digo 200 implica que la comunicaci�n se puedo establecer y que
            'el WebService se ejecut� con �xito.
            blnSuccess = True
        Else

            'Si el c�digo es distinto de 200, la comunicaci�n fall� o el
            'WebService provoc� un Error.
            blnSuccess = False
        End If

        'Obtenemos la respuesta del servidor remoto, parseada por el MSXML.
        Set xmlResponse = xmlhttp.responseXML

        InvokeWebService = blnSuccess

        'Destruimos el objeto, ac� no hay GarbageCollector ;)
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

'Realizamos la llamada a la funci�n InvokeWebService(), brind�ndole los par�metros correspondientes

If InvokeWebService (strSoap, strSOAPAction, strURL, xmlResponse) Then

    'Si el WebService se ejecut� con �xito, obtenemos la respuesta y la imprimimos utilizando MSXML.DOMDocument
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
    'Pero si hubo alg�n problema, le informamos al usuario
    Response.Write "Ha ocurrido un error en la generacion del archivo. Por favor, reintentelo nuevamente."
End If

'Liberamos la memoria del objeto xmlResponse 
Set xmlResponse = Nothing

%>