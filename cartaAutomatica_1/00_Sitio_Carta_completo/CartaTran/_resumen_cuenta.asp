
<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="includes/functions.js.asp"-->
<!--#include file="classes/class.jstemplate.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<%
	function formatearFecha(sDate) {
		oDate = new Date(sDate)
		var d = String(oDate.getDate())
		var m = String(oDate.getMonth() + 1)
		var y = String(oDate.getYear()).substr(2, 2)

		d = d.length < 2 ? "0" + d : d
		m = m.length < 2 ? "0" + m : m

		return d + "/" + m + "/" + y
	}

	var oDB = new DB(arrConn)
	var oTemplatesPath = Server.MapPath("templates/")
	var tResumenCuenta = new jsTemplate(oTemplatesPath)



//************************************************//
// *** Verifico que Haya un resumen			   ***//
//************************************************//

	sQuery = "EXEC esp_RESUMEN_CUENTA_Existe " + Session("userId")

	oDB.query(sQuery)
	rs = oDB.each()
	
	if(rs.Codigo == 0)
	{
	tResumenCuenta.setFile("MAIN", "resumen_cuenta_NoExistente.tpl")
	tResumenCuenta.pparse("OUT", "MAIN", false)

	}
	else
	{

	tResumenCuenta.setFile("MAIN", "resumen_cuenta.tpl")
	
//************************************************//
// *** ARMA LA CABECERA DEL RESUMEN			   ***//
//************************************************//

	sQuery = "EXEC esp_RESUMEN_CUENTA_Cabecera " + Session("userId")



	oDB.query(sQuery)
	rs = oDB.each()


	tResumenCuenta.setVar({
		"NRO_SOCIO"                : rs.SoliNume,
		"NOMBRE"                   : String(rs.Nombre).toUpperCase(),
		"DIRECCION"                : String(rs.Domicilio).toUpperCase(),
		"ENTRE_CALLES"             : String(rs.EntreCalles).toUpperCase(),
		"CP"                       : "?????",
		"LOCALIDAD"                : String(rs.Localidad).toUpperCase(),
		"PROVINCIA"                : "?????",
		"PAGO_MINIMO"              : Number(rs.PagoMinimo).toFixed(2),
		"PAGO_TOTAL"               : Number(rs.PagoTotal).toFixed(2),
		"P_ACTUAL_CIERRE"          : formatearFecha(rs.CalenCierreFecha),
		"P_ACTUAL_VENCIMIENTO"     : formatearFecha(rs.CalenVenciMiniPagoFecha),
		"P_ANTERIOR_CIERRE"        : formatearFecha(rs.CalenCierreFechaAnte),
		"P_ANTERIOR_VENCIMIENTO"   : formatearFecha(rs.CalenVenciMiniPagoFechaAnte),
		"P_PROXIMO_CIERRE"         : formatearFecha(rs.CalenCierreFechaProx),
		"P_PROXIMO_VENCIMIENTO"    : formatearFecha(rs.CalenVenciMiniPagoFechaProx),
		"LIMITE_PLANES_LARGOS"     : Number(rs.LimitePlanLargo).toFixed(2),
		"LIMITE_COMPRA"            : Number(rs.LimiteCompra).toFixed(2),
		"LIMITE_GLOBAL"            : Number(rs.LimiteGlobal).toFixed(2),
		"LIMITE_EXTRA"             : Number(rs.LimiteExtraLargo).toFixed(2),
		"LIMITE_ADELANTO_EFECTIVO" : Number(rs.LimiteAdelanto).toFixed(2),
		"IVA_OTRAS_OPERACIONES"    : Number(rs.IVATotal).toFixed(2),
		"IMPUESTO_SELLO"           : Number(rs.ImpuestoSelloImpor).toFixed(2),
		"MES1"                     : rs.Mes1,
		"MES2"                     : rs.Mes2,
		"MES3"                     : rs.Mes3,
		"CLAVE_ELECTRONICA" 	   : rs.ClaveBanelco
		
<!--                  Estas variables ya no se utilizan más						//-->
<!--	"FECHA_EMISION"            : formatearFecha(rs.FechaEmision), 			//-->
<!--	"IMPORTE_RETENCION"        : Number(rs.ImporteRetencion).toFixed(2), 	//-->
<!--	"TASA_FINANCIACION"        : Number(rs.TasaFinanciacion).toFixed(3),	//-->
<!--	"TASA_PUNITORIOS"          : Number(rs.TasaPunitorios).toFixed(3), 		//-->
<!--	"PAGO_MINIMO"              : Number(rs.PagoMinimo).toFixed(2) 			//-->
	})

//************************************************//
// *** LEE LAS LEYENDAS DEL RESÙMEN   ***//
//************************************************//

	sQuery = "EXEC esp_RESUMEN_CUENTA_Pie " + Session("userId")

	oDB.query(sQuery)
	Linea = ""
	while(rs = oDB.each()) {
		Linea += rs.Linea + '<br>'
		tResumenCuenta.setVar({
			"RESUMEN_PIE"       : Linea
		})
	}

	tResumenCuenta.setBlock("MAIN", "DETALLES", "BLOCK_DETALLES")

//************************************************//
// *** CICLA POR CADA MOVIMIENTO DEL RESUMEN   ***//
//************************************************//

	sQuery = "EXEC esp_RESUMEN_CUENTA_Movimientos " + Session("userId")

	oDB.query(sQuery)
	iPagoTotal = 0
	while(rs = oDB.each()) {
		iPagoTotal += Number(rs.Mes1Impor)
		tResumenCuenta.setVar({
			"FECHA"       : rs.FechaFormato,
			"REFERENCIA"  : rs.Referencia      ? rs.Referencia               : "&nbsp;",
			"ROMBITO"     : rs.Interes == "0"  ? "&#9674;"                   : "&nbsp;",
			"DETALLE"     : rs.ComercioDetalle ? rs.ComercioDetalle          : "&nbsp;",
			"ANTERIOR"    : rs.AnteriorImpor   ? rs.AnteriorImpor.toFixed(2) : "&nbsp;",
			"IMPORTEMES1" : rs.Mes1Impor       ? rs.Mes1Impor.toFixed(2)     : "&nbsp;",
			"IMPORTEMES2" : rs.Mes2Impor       ? rs.Mes2Impor.toFixed(2)     : "&nbsp;",
			"IMPORTEMES3" : rs.Mes3Impor       ? rs.Mes3Impor.toFixed(2)     : "&nbsp;",
			"FUTUROS"     : rs.FuturoImpor     ? rs.FuturoImpor.toFixed(2)   : "&nbsp;"
		})
		tResumenCuenta.parse("BLOCK_DETALLES", "DETALLES", true)
	}

	tResumenCuenta.setBlock("MAIN", "PlanCuotas", "BLOCK_PlanCuotas")

//**************************************//
// *** CICLA POR CADA OPCION DE PAGO ***//
//**************************************//

	sQuery  = "EXEC esp_PAGO_RESUMEN_Opciones " + Session("userId")
	
	if(oDB.query(sQuery)) {
		while(rs = oDB.each()) {
			tResumenCuenta.setVar({
				"strPA"			 : Number(rs.PagueAhora).toFixed(2),
				"strCuota"	     : rs.CuotaDescri, 
				"strDIS"		 : Number(rs.DescuentoServicios).toFixed(2) + "%"
			})

			tResumenCuenta.parse("BLOCK_PlanCuotas", "PlanCuotas", true)
		}
	}
	else {
		tResumenCuenta.setVar({
			"strPA"			 : "--",
			"strCuota"	     : "--",
			"strDIS"		 : "--"
		})

		tResumenCuenta.parse("BLOCK_PlanCuotas", "PlanCuotas", true)
	}

	tResumenCuenta.pparse("OUT", "MAIN", false)
	}
	
%>