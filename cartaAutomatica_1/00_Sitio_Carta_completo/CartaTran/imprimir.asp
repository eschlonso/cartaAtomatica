

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <style type="text/css">
        .style1
        {
            height: 79px;
        }
        .hometexto
        {
            width: 604px;
        }
        .style2
        {
            width: 85px;
        }
    </style>
 <link rel="stylesheet" href="EstilosImpresion.css" type="text/css" media="print" />
 <script language="javascript" type="text/javascript">

     function doPrint() {

        // document.getElementById("imp").style.visibility = 'hidden' 
        //document.all.item("imp").style.visibility = 'hidden' 
        window.print()
        //document.all.item("imp").style.visibility = 'visible'
        //document.getElementById("imp").style.visibility = 'visible' 
}
 
 </script>
    
</head>

<body>



<table border="0" cellspacing="0" cellpadding="0" style="width: 620px">
	<tr id="colorrow8" bgcolor="#E4F3FD">
	   
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width: 620px">
	<tr>
		<td id="colorrow6" colspan="3" bgcolor="#E4F3FD">&nbsp;
		 <img src="images/top_legales.gif" style="width: 603px" />
		</td>
	</tr>
	<tr>
		<td id="colorrow7" width="10" bgcolor="#E4F3FD">&nbsp;</td>
		<td>
			<table border="0" cellpadding="2" cellspacing="1" class="hometexto">
				<tr id="colorrow4" align="left" bgcolor="#DAEEFC" class="hometexto">
					<td class="style2"><b>Importe:</b></td>
					<td id="colorrow3" width="137" bgcolor="#DAEEFC"><b>NroCliente: </b></td>
					<td width="137"><b>Fecha Vencimiento: </b></td>
				</tr>
				<tr>
				<td colspan="3" class="style1" align="center">
				<div>
                <%
                              
               ' Response.Write("<img id=codbarraimg src=CreateImg.asp?BackColor=White&BarColor=Black&CheckDigit=False&CheckDigitToText=false&Data=705010032034250201210000080000012096176621005365547573&NarrowBarWidth=0.04&Orientation=0&Symbology=12&ShowText=ON&Wide2NarrowRatio=2.0>") 
                 Response.Write("<img id=codbarraimg src=CreateImg.asp?BackColor=White&BarColor=Black&CheckDigit=False&CheckDigitToText=false&Data=" + Request.QueryString("codbarra") + "&NarrowBarWidth=0.04&Orientation=0&Symbology=12&ShowText=ON&Wide2NarrowRatio=2.0>")

                 %>
                </div>
				    <br />
                    <br />
				</tr>		
				
			</table>
		</td>
		<td id="colorrow1" width="10" bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
	<tr>
		<td id="colorrow5" align="center" colspan="3" bgcolor="#E4F3FD">
		 <a id="imp" href="javascript:;" onclick="doPrint()">Imprimir</a>
		 <br>
		 <a href="javascript:history.back(1)">Volver Atrás</a>
		 
	</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width: 619px">
	<tr id="colorrow2" bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>
</body>
</html>
