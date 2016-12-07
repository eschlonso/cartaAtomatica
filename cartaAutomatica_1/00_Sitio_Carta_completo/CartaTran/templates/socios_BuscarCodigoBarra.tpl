
 <link rel="stylesheet" href="estilos.css" type="text/css" media="screen"/>
 <link rel="stylesheet" href="EstilosImpresion.css" type="text/css" media="print">
 <script language="javascript" type="text/javascript">

     function doPrint() {

         // document.getElementById("imp").style.visibility = 'hidden' 
         //document.all.item("imp").style.visibility = 'hidden' 
         window.print()
         //document.all.item("imp").style.visibility = 'visible'
         //document.getElementById("imp").style.visibility = 'visible' 
     }
     function validar(EsValida) {
        
        if (EsValida == false) {
            alert("Ud. no tiene saldo para pagar.");
            history.back(2);
        }
        
        
     }
     function ocultarImagenes() {
	     for (x=0;x<document.images.length;x++){
        
         	if(document.images[x].name == "codbarraimg")
		{
			document.images[x].style.visibility = 'hidden'
        	}
      	     }
    	}
     function ValidarPeriodo(EsValida) {
        
	
        if (EsValida == false) {
	ocultarImagenes()
//	document.getElementsById('codbarraimg').style.visibility = 'hidden'
//	alert(imagen.length);
//	document.getElementByTagId("mostrar").style.visibility = 'hidden'
        }
        
        
     }
	validar({EsValido})

  
 </script>
<FORM name="CodigoBarra">
<input name="strCodBarra"           type="hidden" value="{strCodBarra}"/>
<input name="strimporte"            type="hidden" value="{PAGO_TOTAL}"/>
<input name="strFechaVen"           type="hidden" value="{P_ACTUAL_CIERRE}"/>
<input name="strNumCliente"         type="hidden" value="{NRO_SOCIO}"/>
<input name="strNomCliente"         type="hidden" value="{NOMBRE}"/>
<input name="strPagoMin"            type="hidden" value="{PAGO_MINIMO}"/>

<table>
<tr>
<td id="imp" width="100%" class="imprimir" style="color:Black; font-weight:normal; padding-right:20px;">
Estimado socio, imprima este cup&oacute;n y abone su resumen de cuenta en Pago <br>
F&aacute;cil hasta el d&iacute;a 20 de cada mes. Para Mayor informaci&oacute;n, comun&iacute;quese al 
<br> 0810-999-9988.

</td>
</tr>

<tr>
<td id="tuto" width="100%" class="imprimir" style="color:Black; font-weight:normal; padding-right:20px;">
Si tiene problemas para descargar el archivo, por favor <a href="../CartaTran/Images/HabilitarDescargaIE.pdf" target="_blank">haga click aqui</a> <br>

</td>
</tr>

</table>

 <script language="javascript" type="text/javascript">

	window.open('cupon_pago_WS.asp', 'resumen', 'width=790,height=500,scrollbars,resizable');
  
 </script>