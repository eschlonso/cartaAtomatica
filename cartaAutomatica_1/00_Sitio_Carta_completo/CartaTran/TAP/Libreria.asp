<%OPTION EXPLICIT%>
<%
DIM	CONST_SVR, CONST_DB, Const_DBUser, Const_DBPwd
Const_SVR = "CORELLIA"
Const_DB = "WebTAP"

Const_DBUser = "webuser"
Const_DBPwd = "PH0J3T21"




Sub SesionActiva
	IF Clng(Session("LegajoCuentaID")) = 0 then
		response.Redirect("Validacion.ASP")
	END IF
end sub


'CONFIGURACION SEGUN GRUPO
Dim GrillaColorBorde, GrillaColorInteriorClaro
Dim GrillaBordeSuperiorIzquierdo, GrillaBordeSuperiorDerecho, GrillaBordeBajoDerecho, GrillaBordeBajoIzquiero

IF Session("GrupoID") = 1  OR Session("GrupoID") = 0 then
	GrillaColorBorde = "#e4f3fd"
'	GrillaColorBorde = "#e4f3gg"
	GrillaColorInteriorClaro = "#F1F9FE"
'	GrillaColorInteriorClaro = "#F1F678"	
END IF

GrillaBordeSuperiorIzquierdo = "GrillaCuadroSuperiorIzquierdo" & Session("GrupoID")& ".gif"
GrillaBordeSuperiorDerecho = "GrillaCuadroSuperiorDerecho" & Session("GrupoID")& ".gif"
GrillaBordeBajoDerecho = "GrillaCuadroBajoDerecho" & Session("GrupoID")& ".gif"
GrillaBordeBajoIzquiero = "GrillaCuadroBajoIzquierdo" & Session("GrupoID")& ".gif"





Function AbrirDB()
	DIM CN
	SET	CN = server.CreateObject("Adodb.Connection")
	Cn.ConnectionString = "Provider=SQLOLEDB;SERVER=" & CONST_SVR & ";Initial Catalog=" & CONST_DB & ";User ID =" & Const_DBUser & ";Password=" & Const_DBPwd
	Cn.Open
	cn.CommandTimeout = 0
	SET AbrirDB = CN
end function

Function AbrirRS(Query)
'adOpenForwardOnly = 0
'adOpenKeyset = 1
'adOpenDynamic = 2
'adOpenStatic = 3

'adLockReadOnly = 1
'adLockPessimistic = 2
'adLockOptimistic = 3

	DIM RC
	SET	RC = Server.CreateObject("Adodb.Recordset")
	RC.ActiveConnection = AbrirDB()
	RC.Open Query,,0,1
	SET AbrirRS = RC
End Function


Function ValidarUsuario(GrupoID, TipoDocumento, NumDocumento, Password)
Dim Rs
	if IsNumeric(NumDocumento) = false then
		ValidarUsuario= false
		exit function
	end if
	
	TipoDocumento = Trim(TipoDocumento)
	Password = Trim(Password)
	
	SET RS = AbrirRS("esp_USER_SOCIO_Validar " & GrupoID & ", '" & TipoDocumento & "', " & numDocumento & ", '" & Password & "'")
	
	IF Rs.eof = true Then
			ValidarUsuario= false
		else
			ValidarUsuario= true
			Session("LegajoCuentaID") = Rs.Fields("LegajoCuentaID").value
			Session("NumDocumento") = Rs.Fields("NumDocumento").value
			Session("Password") = Rs.Fields("Password").value			
			Session("GrupoID") = Rs.Fields("GrupoID").value		
			Session("Nombre") = trim(Rs.Fields("Nombre").value)
			
			'Session("LegajoCuentaID") = 6456
			

	END IF 
End Function




 
Function IFNull(Valor, Alternativo, Formateado)
	IF ISNULL(valor) = true then
		Valor = Alternativo
	End if
	IFNULL = Valor
		IF Formateado = "Fecha" AND ISDATE(Valor) = true THEN 
			IF cdate(Valor) <> cdate("1/1/1900") Then
						IFNULL = DatePart("d",Valor) & "/" & DatePart("m",Valor) & "/" & DatePart("yyyy",Valor)
				ELSE
						IFNULL = Alternativo		
			end if
			'IFNULL = formatdatetime(Valor,2)
		END IF
		
		'IF Formateado = "Fecha" AND DatePart("yyyy", Valor) = 1900 THEN IFNULL = ""
		
		IF Formateado = "$" AND IsNumeric(Valor) = true THEN IFNULL = FormatCurrency(cdbl(Valor),2)
		IF Formateado = "%" AND IsNumeric(Valor) = true THEN IFNULL = FormatPercent(cdbl(Valor)/100,2)
		IF Formateado = "," AND IsNumeric(Valor) = true THEN IFNULL = REPLACE(FormatNumber(cdbl(Valor),2), ",", ".")
		IF Formateado = "." AND IsNumeric(Valor) = true THEN IFNULL = FormatNumber(cdbl(Valor),0)
End function


Function FechaToSql (Fecha, Comillas)
	FechaToSql = MONTH(Fecha) & "/" & DAY(Fecha) & "/" & Year(Fecha)
	IF Comillas = 1 then
		FechaToSql = "'" & FechaToSql & "'"
	END IF
END Function

SUB MuestraError(MensajeError, Contacto, DetalleError1, DetalleError2, Sugerencia,Fin)
	RESPONSE.WRITE("<div style=""border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; width:471; height:87""><h3 style=""margin-top: 0; margin-bottom: 0"" align=""center""><font face=""Trebuchet MS"" color=""#CC0033"">")
	response.write(MensajeError)
	RESPONSE.WRITE("</font></h3><h3 style=""margin-top: 0; margin-bottom: 0"" align=""center"">")
	IF TRIM(Contacto) = "" THEN Contacto = "Por favor, contactese con la empresa."	
	response.write(Contacto)
	RESPONSE.WRITE("</h3><p style=""margin-top: 0; margin-bottom: 0"" align=""left"">&nbsp;</p><p style=""margin-top: 0; margin-bottom: 0"" align=""left""><font size=""2"">")
	response.Write("Mensaje de Error: " & DetalleError1)
	IF TRIM(DetalleError2) <> "" THEN
		Response.write(" - " & TRIM(DetalleError2))
	END IF
	Response.write("</font></p><p style=""margin-top: 0; margin-bottom: 0"" align=""left""><font size=""1"">Sugerencia: ")
	IF TRIM(Sugerencia) = "" THEN Sugerencia = "Imprima esta pagina para tener como referencia o bien para enviarla por fax."
	Response.write(Sugerencia)
	Response.write("</font></p></div>")

	IF Fin=TRUE THEN
		Response.end
	END IF
END sub


Function Consumos
Dim Rs
Dim Devolver
Dim Color
SET RS = AbrirRS("esp_Consumos " & Session("LegajoCuentaID"))

Color = GrillaColorBorde

IF Rs.Eof = true Then
			Devolver = ""
		Else
				while not rs.eof = true 
						'Intercalado de colores
						if Color = GrillaColorBorde then
								Color = GrillaColorInteriorClaro
							else
								Color = GrillaColorBorde
						end if
						Devolver = Devolver & "<tr bgcolor='" & color & "' class='tah12'><td class='hometexto' valign='top' width='276' align='left'><font color='#225895'>"
						Devolver = Devolver & rs.Fields("Linea1").value & " " & rs.Fields("Linea2").value
						Devolver = Devolver & "</font></td><td class='hometexto' valign='bottom' width='68' align='right'><font color='#225895'>"
						Devolver = Devolver & "$" & rs.Fields("CuotaMonto").value
						Devolver = Devolver & "</font></td><td class='hometexto' valign='bottom' width='70' align='right'><font color='#225895'>"
						Devolver = Devolver & rs.Fields("ProximoVencimiento").value
						Devolver = Devolver & "</font></td><td class='hometexto' valign='bottom' width='71' align='right'><font color='#225895'>"
						Devolver = Devolver & rs.Fields("PendienteCuotas").value
						Devolver = Devolver & "</font></td><td class='hometexto' valign='bottom' width='70' align='right'><font color='#225895'>"
						Devolver = Devolver & "$" & rs.Fields("PendienteMonto").value
						Devolver = Devolver & "</font></td></tr>"
						rs.movenext
				wend
End if 
Consumos = Devolver
End Function


Function Limites(GlobalAsignado, GlobalDisponible, MensualAsignado, MensualDisponible)
Dim Rs
SET RS = AbrirRS("esp_Limites " & Session("LegajoCuentaID"))

if Rs.eof = true then
		GlobalAsignado = ""
		GlobalDisponible = ""
		MensualAsignado = ""
		MensualDisponible = ""
		exit function
	else
	
			GlobalAsignado = Rs.Fields("LimiteGlobalExcedido").value
			MensualAsignado = Rs.Fields("LimiteMensualExcedido").Value
			rs.movenext

			GlobalDisponible = Rs.Fields("LimiteGlobalExcedido").Value
			MensualDisponible = Rs.Fields("LimiteMensualExcedido").Value
End if	

End Function




Function Recordatorio(Existe, CierreFecha, Vencimiento1Fecha, Vencimiento1Monto, Vencimiento2Fecha, Vencimiento2Monto, ClavePagoElectronico, Detalle)
Dim Rs
Dim Devuelve
SET RS = AbrirRS("esp_Recordatorio " & Session("LegajoCuentaID"))


'VALIDACIONES
if rs.eof = true then
	existe = 1
	exit function
end if

if rs.fields("codigo").value = 1 then
	existe = 1
	exit function
end if


CierreFecha = rs.fields("FechaCierre").value 
Vencimiento1Fecha = rs.fields("Vencimiento1").value 
Vencimiento1Monto = rs.fields("Vencimiento1Monto").value 
Vencimiento2Fecha = rs.fields("Vencimiento2").value 
Vencimiento2Monto = rs.fields("Vencimiento2Monto").value 
ClavePagoElectronico = rs.fields("ClavePagoElectronico").value 

Devuelve = ""

while not rs.eof = true 
		Devuelve = Devuelve & "<tr valign='bottom' bgcolor='" & GrillaColorInteriorClaro & "' height='23' class='tah12'>"
		Devuelve = Devuelve & "			<td class='tah12' width='72' valign=center align='left'>"
		Devuelve = Devuelve & "			<font color='#225895'>" & rs.fields("VencimientoCuota").value & " </font></td>"
		Devuelve = Devuelve & "			<td class='tah12' width='73' valign=center align='left'>"
		Devuelve = Devuelve & "			<font color='#225895'>" & rs.fields("FechaCompra").value &  "</font></td>"
		Devuelve = Devuelve & "			<td class='tah12' width='216' valign=center align='left'>"
		Devuelve = Devuelve & "			<font color='#225895'>" & rs.fields("Descripcion").value &  "</font></td>"
		Devuelve = Devuelve & "			<td class='tah12' width='58' valign=center align='Right'>"
		Devuelve = Devuelve & "			<font color='#225895'>$" & rs.fields("SaldoCuota").value &  "</font></td>"
		Devuelve = Devuelve & "		</tr>"
		rs.movenext
wend

Detalle = Devuelve 
End Function

Function FinDePagina()
Dim Devuelve
Devuelve = Devuelve & "<table width='100%' height='15%' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>"
Devuelve = Devuelve & "	<tr>"
Devuelve = Devuelve & "		<td width='50%'></td>"
Devuelve = Devuelve & "		<td width='1' bgcolor='#000000'></td>"
Devuelve = Devuelve & "		<td height='54'>"
Devuelve = Devuelve & "		<table width='780' border='0' cellpadding='0' cellspacing='0' bgcolor='#707787'>"
Devuelve = Devuelve & "			<tr>"
Devuelve = Devuelve & "				<td colspan='16'>"
Devuelve = Devuelve & "				<table width='780' border='0' cellpadding='0' cellspacing='0' background='images/bgdown.gif' id='table1'>"
Devuelve = Devuelve & "					<tr>"
Devuelve = Devuelve & "						<td width='780' height='26' colspan='2' align='center' class='tah10'>"
Devuelve = Devuelve & "						<font color='#FFFFFF'><b>• Tarjeta Automática © 2005 •</b></font></td>"
Devuelve = Devuelve & "					</tr>"
Devuelve = Devuelve & "					<tr>"
Devuelve = Devuelve & "						<td>&nbsp;</td>"
Devuelve = Devuelve & "						<td width='748' height='28' align='center' class='ver10'>&nbsp;</td>"
Devuelve = Devuelve & "					</tr>"
Devuelve = Devuelve & "				</table>"
Devuelve = Devuelve & "				</td>"
Devuelve = Devuelve & "			</tr>"
Devuelve = Devuelve & "		</table>"
Devuelve = Devuelve & "		</td>"
Devuelve = Devuelve & "		<td width='50%'>&nbsp;</td>"
Devuelve = Devuelve & "	</tr>"
Devuelve = Devuelve & "</table>"

FinDePagina = Devuelve
end function





Function SimuladorComercios()
Dim Rs
Dim Devuelve
SET RS = AbrirRS("esp_Simulador_Comercios " & Session("LegajoCuentaID"))

while not rs.eof = true 
		if  rs.Fields("Seleccionar").value = 1 Then
				Devuelve = Devuelve & "<option selected"
			ELSE
				Devuelve = Devuelve & "<option"
		End if
		Devuelve = Devuelve & " value=" & rs.Fields("ClaveID").value &  ">" & rs.Fields("Sucursal").value &  "</option>"
		rs.movenext
wend

SimuladorComercios = Devuelve
end Function

Function SimuladorPlanes(ComercioID)
Dim Rs
Dim Devuelve
SET RS = AbrirRS("esp_Simulador_Planes " & ComercioID & ", " & Session("LegajoCuentaID"))

while not rs.eof = true 
		if  rs.Fields("Seleccionar").value = 1 Then
				Devuelve = Devuelve & "<option selected"
			ELSE
				Devuelve = Devuelve & "<option"
		End if
		Devuelve = Devuelve & " value=""" & rs.Fields("PlanID").value & "//" & TRIM(rs.Fields("Descripcion").value) & """>" & TRIM(rs.Fields("Descripcion").value) &  "</option>"
		rs.movenext
wend

SimuladorPlanes = Devuelve
end Function


Function CambioPassword(PasswordOLD, PasswordNew)
Dim Rs
Dim Devuelve

SET RS = AbrirRS("esp_Password " & Session("LegajoCuentaID") & ", '" & PasswordOLD & "', '" & PasswordNew & "'")

	Devuelve = rs.Fields("Descripcion").value

	IF rs.Fields("Codigo").value = 0 Then
		Session("Password") = PasswordNew
	end if

CambioPassword = Devuelve
End Function

%>