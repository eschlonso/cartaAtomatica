
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
<br>
<br>
</td>
</tr>
</table>

<table id="Headerimg" width="100%">
<tr>
<td>

</td>
</tr>
</table>
<table id="cuerpoimg" 
   width="100%">
<tr>
        <td id="imprimir" width="100%" align="left" class="imprimir" style="
            padding-left: 25px; color:Black; font-weight:normal;">
            Nro. Socio: {NRO_SOCIO}
                <br>
                {NOMBRE}<br>
                {NUMERO_TARJETA}
        </td>
    </tr>
    <tr>
        <td align="center">
            <table width="100%" border="0" cellpadding="2" cellspacing="1"
                class="hometexto">
                <tr class="subtitulos">
                    <td colspan="4" align="center" width="100%">
                        <hr style="border-bottom-style: solid; color:Black; margin-right:15px;"></hr>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td id="imprimir" width="100%" align="left" class="imprimir" style="
            padding-left: 25px; color:Black; font-weight:normal;">
            <br>
                Pago M&iacute;nimo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{PAGO_MINIMO}<br>
                <br>
                Total del Mes:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{PAGO_TOTAL}<br>
                <br>
                Fecha Vencimiento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{P_ACTUAL_CIERRE}
            <br>
            <br>
        </td>
    </tr>
    <tr >
        <td align="left">
            <table width="100%" border="0" cellpadding="2" cellspacing="1"
                class="hometexto">
                <tr class="subtitulos">
                    <td  align="left" width="90%" style="padding-left: 8px;">
                        <img id="codbarraimg" name="codbarraimg" src="CreateImg.asp?BackColor=White&BarColor=Black&CheckDigit=true&CheckDigitToText=true&Data={strCodBarra}&NarrowBarWidth=0.04&Orientation=0&Symbology=37&ShowText=ON&Wide2NarrowRatio=2.0">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td  width="100%" align="center">
            <b>
                <br>
                <br> 
                <img src="images/LogCodigoBarra.jpg" width="200" height="80" >
            </b>
        </td>
    </tr>
  </table>
<table id="footerimg" width="100%">
<tr>
<td>
<br>
</td>
</tr>
</table>
<table id="Table1" width="100%" border="0" cellpadding="2" cellspacing="1" class="hometexto">
    <tr class="subtitulos">
        <td align="center" width="100%">
	<a id="imp" href="javascript:;" onclick="doPrint()" style="color:Black; font-style:oblique; font-family:Verdana; color:Navy; font-size:16px;" class="imprimir"><STRONG>Imprimir</STRONG></a>
        </td>
    </tr>
</table>
 <script language="javascript" type="text/javascript">

	ValidarPeriodo({EsValidoPeriodo})
  
 </script>