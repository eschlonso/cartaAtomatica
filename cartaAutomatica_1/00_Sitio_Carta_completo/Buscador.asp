<!--#include file="conexion.asp"-->
<script language="JavaScript">
	function buscar() {
		var frm = document.form1;
		
		var strError = '';
		if (frm.cmbZona.value==0 && frm.cmbRubro.selectedIndex==0 && frm.txtComercio.value==''){
			alert ("Debe seleccionar alg�n filtro.");
		}else {
			frm.submit();
		}
	}
</script>
<%
		set rs = server.CreateObject("adodb.recordset")
'		on error resume next
%>
<form name="form1" action="comercios.asp" method=post>
<input type="hidden" name="hidOperacion" value="<% = intOperacion %>">
<table width="555" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="555" valign="top"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" bgcolor="#CCEFF9" class="gris">
                        <tr>
                          <td align="center">
                          <%
                          		rs.Open "esp_SUCURSALES_Buscador ", Conn,3, 3
						  %>
                          <select name="cmbZona" class="selector" style="width: 80px;">
                              <option  value="0" selected>Zona</option>
                              <%while not rs.eof   %>
                               <option value="<%=cint(rs(0))%>" <%if cint(request("cmbZona")) = cint(rs(0)) then Response.Write " selected " %>><%=rs(1)%></option>
                              <%
                              rs.MoveNext
                              wend
                              rs.Close
                              rs.Open "esp_RUBROS_Buscador ", Conn,3, 3
                              %>
                          </select></td>
                          <td align="center"><select name="cmbRubro" style="width: 135px;" class="selector">
                              <option  value="0" selected>Rubro</option>
                              <%while not rs.eof 
									if rs(1)<>"SUCURSAL TA" then
                              %>
                               <option value="<%=cint(rs(0))%>" <%if cint(request("cmbRubro")) = cint(rs(0)) then Response.Write " selected " %>><%=rs(1)%></option>
                              <%
									end if
                              rs.MoveNext
                              wend
                              rs.Close
                              rs.Open "esp_COMERCIOS_Buscador_New ", Conn,3, 3

                              %>
                          </select></td>
                          <td align="center">Comercio:
							<input type="text" name="txtComercio" class="selector" size="17" value="<% = request("txtComercio") %>">                          </td>
                          <td align="center"><a href="javascript:buscar();"><img src="images/lupa_a.gif" name="Image6" width="24" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','images/lupa_b.gif',1)" height="24" border="0"></a></td>
                        </tr>
                    </table></td>
    </tr>
                  <tr>
                    <td align="left" valign="bottom" class="gris">Buscador de Comercios</td>
    </tr>
                </table>
</form>