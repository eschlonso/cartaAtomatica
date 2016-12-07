<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="25" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="25" height="19"></td>
	</tr>
</table>
<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td>&nbsp;</td>
		<td><p class="titulotabla">LIQUIDACIONES PREVIAS</p></td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
		<td>

			<table width="473" border="0" cellpadding="3" cellspacing="0" class="hometexto" height=40>

			<tr class="hometexto" bgcolor="#DAEEFC" border="0" height=40>

			<td colspan="1" align="center" width="473" border="0" height=40>
				<INPUT type="radio" name="strLoginType" value="1" onClick="JavaScript: document.getElementById('FechaLiq').style.display = 'block'; document.getElementById('FechaPago').style.display = 'none';" checked> 
				Por Fecha de Liquidación
			</td>
			<td colspan="1" align="center" width="473" border="0" height=40>
				<INPUT type="radio" name="strLoginType" value="2" onClick="JavaScript: document.getElementById('FechaLiq').style.display = 'none'; document.getElementById('FechaPago').style.display = 'block';"> 
				Por Fecha de Pago <BR/>
			</td>

			</tr>

			</table>

			<DIV id="FechaLiq" style="display: block;">

			<table width="473" border="0" cellpadding="2" cellspacing="1" class="hometexto">

				<tr bgcolor="#DAEEFC" class="hometexto">
					<td width="80" align="center"><b>Fecha</b></td>
					<td width="73" align="center"><b>N&uacute;mero</b></td>
					<td width="80" align="right">
                    			<p align="center"><b class="total">$ Bruto Liq.</b></td>
					<td width="80" align="right">
                    			<p align="center"><b class="total">$ Neto Liq.</b></td>
					<td width="74" align="center"><b>Fecha Pago</b></td>
					<td width="86" align="center"><b>Consumos</b></td>
				</tr>
			{liqPrevMes}
			</table>

			</DIV>

			<DIV id="FechaPago" style="display: none;">

			<table width="473" border="0" cellpadding="2" cellspacing="1" class="hometexto">
				<tr bgcolor="#DAEEFC" class="hometexto">
					<td width="80" align="center"><b>Fecha</b></td>
					<td width="73" align="center"><b>N&uacute;mero</b></td>
					<td width="80" align="right">
                    			<p align="center"><b class="total">$ Bruto Liq.</b></td>
					<td width="80" align="right">
                    			<p align="center"><b class="total">$ Neto Liq.</b></td>
					<td width="74" align="center"><b>Fecha Pago</b></td>
					<td width="86" align="center"><b>Consumos</b></td>
				</tr>
			{liqPrevMesAnt}
			</table>

			</DIV>

		</td>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
</table>
<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>
<br>
<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celesteizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste.gif" width="20" height="19"></td>
	</tr>
</table>
<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td>&nbsp;</td>
		<td><p class="titulotabla">ULTIMA LIQUIDACION EMITIDA</p></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
		<td>
			<table width="473" border="0" cellpadding="2" cellspacing="1" class="hometexto">
				<tr bgcolor="#DAEEFC" class="hometexto">
					<td width="100" align="center"><b>Fecha</b></td>
					<td width="98" align="center"><b>N&uacute;mero</b></td>
					<td width="95" align="center"><b>$ Bruto Liq.</b></td>
					<td width="95" align="center"><b>$ Neto Liq.</b></td>
					<td width="85" align="center"><b>Fecha Pago</b></td>
				</tr>
				<tr bgcolor="#F1F9FE">
					<td width="100" align="center">{ultLiqFecha}</td>
					<td width="98" align="center">{ultLiqId}</td>
					<td width="95" align="right" class="total">{ultLiqBruto}</td>
					<td width="95" align="right" class="total">{ultLiqImporte}</td>
					<td width="85" align="center">{ultLiqFechaPago}</td>
				</tr>
			</table>
		</td>
		<td width="10" bgcolor="#E4F3FD">&nbsp;</td>
	</tr>
</table>
<table width="485" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#E4F3FD">
		<td><img src="images/borde_celeste_bottomizq.gif" width="20" height="19"></td>
		<td align="right"><img src="images/borde_celeste_bottom.gif" width="20" height="19"></td>
	</tr>
</table>