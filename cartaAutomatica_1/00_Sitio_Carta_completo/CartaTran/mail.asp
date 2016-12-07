<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>
<%

'-- Dimension and Create Objects -- 
Dim objMessage, objConfig 
Set objMessage = Server.CreateObject("CDO.Message") 
Set objConfig = Server.CreateObject("CDO.Configuration") 

'-- Create Configuration -- 
With objConfig.Fields 
.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "192.168.50.50" 
.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10 
.Update() 
End With 

'-- Send Email -- 
With objMessage 
.Configuration = objConfig 
.To = "serras@cartaautomatica.com.ar" 
.From = "WEB_CARTA_AUTOMATICA" 
.Subject = "Test Email" 
.htmlBody = "Hola Silvia!!!. Logré que funcionara mi mail! Ahora nos queda que nos pasen las direcciones. Voy a ir sector por sector para que nos pasen las cuentas y después mando un mail general. Quiero terminarlo hoy.! Saludos, La Página" 
.Send() 
End With 

'-- Destroy Objects -- 
Set objMessage = Nothing 
Set objConfig = Nothing

%>
</body>

</html>
