<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Carta Automatica</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background-image: url(images/fondo.gif);
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.negro2 a p {
	text-decoration: none;
	color: #333;
	font-size: 8.pt;
	font-size: 8pt;
}
-->
</style>
<link href="estilos.css" rel="stylesheet" type="text/css">
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script language="JavaScript1.2">

isIE=document.all;
isNN=!document.all&&document.getElementById;
isN4=document.layers;
isHot=false;

function ddInit(e){
  topDog=isIE ? "BODY" : "HTML";
  whichDog=isIE ? document.all.theLayer : document.getElementById("theLayer");  
  hotDog=isIE ? event.srcElement : e.target;  
  while (hotDog.id!="titleBar"&&hotDog.tagName!=topDog){
    hotDog=isIE ? hotDog.parentElement : hotDog.parentNode;
  }  
  if (hotDog.id=="titleBar"){
    offsetx=isIE ? event.clientX : e.clientX;
    offsety=isIE ? event.clientY : e.clientY;
    nowX=parseInt(whichDog.style.left);
    nowY=parseInt(whichDog.style.top);
    ddEnabled=true;
    document.onmousemove=dd;
  }
}

function dd(e){
  if (!ddEnabled) return;
  whichDog.style.left=isIE ? nowX+event.clientX-offsetx : nowX+e.clientX-offsetx; 
  whichDog.style.top=isIE ? nowY+event.clientY-offsety : nowY+e.clientY-offsety;
  return false;  
}

function ddN4(whatDog){
  if (!isN4) return;
  N4=eval(whatDog);
  N4.captureEvents(Event.MOUSEDOWN|Event.MOUSEUP);
  N4.onmousedown=function(e){
    N4.captureEvents(Event.MOUSEMOVE);
    N4x=e.x;
    N4y=e.y;
  }
  N4.onmousemove=function(e){
    if (isHot){
      N4.moveBy(e.x-N4x,e.y-N4y);
      return false;
    }
  }
  N4.onmouseup=function(){
    N4.releaseEvents(Event.MOUSEMOVE);
  }
}

function hideMe(){
  if (isIE||isNN) whichDog.style.visibility="hidden";
  else if (isN4) document.theLayer.visibility="hide";
}

function showMe(){
  if (isIE||isNN) whichDog.style.visibility="visible";
  else if (isN4) document.theLayer.visibility="show";
}

document.onmousedown=ddInit;
document.onmouseup=Function("ddEnabled=false");

</script>

<script type="text/javascript">

	function cerrar(){
	var fb = document.getElementById("fb");
	var cerrar = document.getElementById("cerrar1");
	fb.style.display="none";};

</script>

	<script src="js/jquery-1.6.2.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery.ui.mouse.js"></script>
	<script src="js/jquery.ui.draggable.js"></script>
	<script>
$(function() {
		$( "#fb" ).draggable();
	});
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
    </script>
<script type="text/javascript">

 

  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-42658052-1']);

  _gaq.push(['_setDomainName', 'cartaautomatica.com.ar']);

  _gaq.push(['_trackPageview']);

 

  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();

 

</script>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');
 
fbq('init', '871689669550804');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=871689669550804&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
<!-- google analytics code 02-06-2016 -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
 
  ga('create', 'UA-42658052-1', 'auto');
  ga('send', 'pageview');
 
</script>
<!-- end google analytics code -->
</head>

<body>
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-WVX3DM"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WVX3DM');</script>
<!-- End Google Tag Manager -->



<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <th valign="top" scope="col"> </th>
        <th scope="col"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="9" background="images/left.gif">&nbsp;</td>
            <td bgcolor="#FFFFFF"><table width="752" border="0" cellspacing="0" cellpadding="0">
              <tr>
            <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="752" height="100">
              <param name="movie" value="images/top.swf">
              <param name="quality" value="high">
              <param name="wmode" value="opaque">
              <embed src="images/top.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="752" height="100"></embed>
            </object></td>
              </tr>
              <tr>
                <td><table width="752" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="190" valign="top"><!--#include file="inc_banners_left_portada.asp" --></td>
                    <td width="7" valign="top"></td>
                    <td width="555" valign="top"><table width="555" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="10" colspan="3" valign="top"></td>
                      </tr>
                      <tr>
                        <td colspan="3"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="555" height="240">
                          <param name="movie" value="promos.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="promos.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="555" height="240"></embed>
                        </object></td>
                      </tr>
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                      <tr>
                        <td width="277" align="left"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="270" height="180">
                          <param name="movie" value="banner_chico_izq.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="banner_chico_izq.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="270" height="180"></embed>
                        </object></td>
                        <td width="2">&nbsp;</td>
                        <td width="276" align="right"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="270" height="180">
                          <param name="movie" value="banner_chico_der.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="banner_chico_der.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="270" height="180"></embed>
                        </object></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="9" background="images/right.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="9"><img src="images/corner_left.gif" alt="" width="9" height="9"></td>
            <td height="9" background="images/down.gif"><img src="images/down.gif" alt="" width="1" height="9"></td>
            <td height="9"><img src="images/corner_right.gif" alt="" width="9" height="9"></td>
          </tr>
          </table>
          <table width="770" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th scope="col">&nbsp;</th>
            </tr>
            <tr>
              <td valign="bottom"><img src="images/arriba.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td align="left" background="images/fondob.gif" class="negro2"><p style="margin-left:25px; margin-right:25px; text-align:justify;"><strong>COMISIONES: Tarjeta Carta Mastercard: </strong>Comisi&oacute;n anual por renovaci&oacute;n de la Tarjeta (COM. P/SERVICIO): $404.49. Comisi&oacute;n de mantenimiento de cuenta: $62.34. Comisi&oacute;n por reposici&oacute;n de tarjeta $38.84. <a href="cargo.pdf" target="_blank"><span class="rojo"><strong>+Mas Info</strong></span></a>. <a href="contrato-tarjeta-de-credito.pdf" target="_blank"><span class="rojo"><strong>Contrato de tarjeta de cr&eacute;dito</strong></span></a>. <strong>Tarjeta Carta Autom&aacute;tica:</strong> Comisi&oacute;n anual por renovaci&oacute;n de la Tarjeta: $250. Comisi&oacute;n de mantenimiento de cuenta: $48.50. <a href="cargo2.pdf" target="_blank"><span class="rojo"><strong>+Mas Info</strong></span></a></p></td>
            </tr>
            <tr>
              <td valign="top"><img src="images/abajo.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
              <td valign="bottom"><img src="images/arriba.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td align="left" background="images/fondob.gif" class="negro2">
                <img src="images/atencion-al-cliente.jpg" alt="Atencion al cliente" style="margin-left:20px;">
              </td>
            </tr>
            <tr>
              <td valign="top"><img src="images/abajo.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
              <td valign="bottom"><img src="images/arriba.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td align="left" background="images/fondob.gif" class="negro2"><a href="etica.asp"><img src="images/bannerEticaPortada.png" style="margin-left:25px;" alt="etica"></a></td>
            </tr>
            <tr>
              <td valign="top"><img src="images/abajo.gif" width="770" height="10"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="5" align="right" style="color: #333333"><a href="#" class="blanco" style="color: #666" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')">Pol<span style="color: #666666"></span><span style="color: #999999"></span>&iacute;tica de Usuario</a></td>
                  <td align="left" class="blanco-1" style="color: #666666"><a href="sitemap.asp" class="blanco" style="color: #666666">&nbsp;- Mapa del Sitio</a> <span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2013</span></td>
                </tr>
              </table></td>
            </tr>
          </table>
        </body>
</html>