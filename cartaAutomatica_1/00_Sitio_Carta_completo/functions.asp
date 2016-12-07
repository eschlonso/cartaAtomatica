<%
Function ContarRs(rs)
  Cont = 0
   if not rs.eof then
	   while not rs.eof
	   
	     cont = cont + 1
	     rs.movenext
	   Wend
	   rs.moveFirst
	  end if
   ContarRs = Cont
End Function

function calculoPagActual(iSuma, cantPag, iPagActual, iPagProx)
	dim auxPagActual
	
	auxPagActual = iPagActual
	
	If auxPagActual = "" Then 
		auxPagActual = 0
	Else
	    If iSuma = "1" Then 	    
	    	auxPagActual = auxPagActual + cantPag
	    	do while (auxPagActual mod cantPag <> 0)
	    		auxPagActual = auxPagActual - 1
	    	loop
	    end if
	    If iSuma = "2" Then 	    
	    	auxPagActual = auxPagActual - cantPag
	    	do while ( (auxPagActual+1) mod cantPag <> 0)
	    		auxPagActual = auxPagActual + 1
	    	loop
			end if
	    If iSuma = "4" Then	      auxPagActual = iPagProx
	End If
		
	calculoPagActual = auxPagActual
end function

function muestroPaginacionFront(iCantTotal, iPagActual, cantPag, iPagTotal, strPagina, strQuery)
dim intPaginaSiguiente
dim intPaginaAnterior
%>
	<table width="80%" height="25" border="0" cellpadding="0" cellspacing="0" align="center"><tr> 
		<!--<td width="5" height="5" valign="bottom"><img src="../images/i_footL.gif" width="5" height="5"></td>-->
		<td align="center" class="pagina">
<%
		'ANTERIORES
		if iCantTotal > 0 then
			auxPagActual = iPagActual
			intPaginaAnterior = iPagActual - 1
			do while (auxPagActual mod cantPag <> 0)
				auxPagActual = auxPagActual - 1
			loop

			'BEGIN anteriores cantpag
			if auxPagActual > 0 then
%>
	      <a class="pagina" href="<% = strPagina %>?suma=2&pagactual=<% = iPagActual %><% = strQuery %>" class="pagina"><<</a>&nbsp;
<%
	    end if
	    'END

	    'BEGIN anterior
	    if iPagActual > 0 then
%>
				<a class="pagina" href="<% = strPagina %>?suma=4&pagactual=<% = iPagActual %>&pagprox=<% = intPaginaAnterior %><% = strQuery %>" class="pagina">&laquo; Anterior</a>&nbsp;
<%
			else
				if iPagTotal > 1 then
%>
				
					<span class="pagina">&laquo; Anterior</span>&nbsp;
<%
				end if
			end if
			'END
		end if
	
		'LISTADO DE PÁGINAS
		auxPagActual = iPagActual
		do while (auxPagActual mod cantPag <> 0)
			auxPagActual = auxPagActual - 1
		loop
		
		cont = 1
		do while (cint(cont) <= cint(cantPag) AND cint(auxPagActual) < cint(iPagTotal))
			if (auxPagActual mod cantPag <> 0) then
				response.write "&nbsp;|&nbsp;"
			end if
			
			if (cint(auxPagActual) <> cint(iPagActual)) then
%>
				<a class="pagina" href="<% = strPagina %>?suma=4&pagactual=<% = iPagActual %>&pagprox=<% = auxPagActual %><% = strQuery %>" class="pagina"><% = (auxPagActual+1) %></a>
<%
			else
				if cint(iPagTotal) > 1 then
					intPaginaSiguiente = auxPagActual+1
%>
					<span class="pagina"><strong><% = (auxPagActual+1) %></strong></span>
<%
				end if
			end if
			
			cont = cont + 1
			auxPagActual = auxPagActual + 1
		loop
	
	  'PROXIMAS
		if iCantTotal > 0 then
	  	auxPagActual = iPagActual + cantPag
	  	do while (auxPagActual mod cantPag <> 0)
	  		auxPagActual = auxPagActual - 1
	  	loop

	    'BEGIN siguiente
	    if cint(iPagActual)+1 < cint(iPagTotal) then
			
%>
				&nbsp;<a class="pagina" href="<% = strPagina %>?suma=4&pagactual=<% = iPagActual %>&pagprox=<% = intPaginaSiguiente %><% = strQuery %>" class="pagina">Siguiente &raquo;</a>
<%
			else
				if iPagTotal > 1 then
%>
					&nbsp;<span class="pagina">Siguiente &raquo;</span>
<%
				end if
			end if
			'END

			'BEGIN proximas cantpag
	    if (auxPagActual < iPagTotal) and iPagTotal <> 0 then
%>
	    	
	    	&nbsp;<a class="pagina" href="<% = strPagina %>?suma=1&pagactual=<% = iPagActual %><% = strQuery %>" class="pagina">>></a>
				
<%
	    end if
	    'END
		end if
%>
		</td>
		<!--<td width="5" height="5" valign="bottom"><img src="../images/i_footR.gif" width="5" height="5"></td>-->
	</tr></table>
<%
end function

%>
