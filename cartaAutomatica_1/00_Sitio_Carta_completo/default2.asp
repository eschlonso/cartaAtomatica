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
</head>

<body>

<div id="fb" style="position:absolute; z-index:1000; top:111px; left:510px;">
	<span style="position:absolute; cursor:pointer;" id="cerrar1" onclick="cerrar();"><img src="images/cerrar.png"></span>
    <a href="promo-caj.asp" target="_blank"><img src="images/pop-up.jpg" border="0"></a>
    
    </div>


<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <th valign="top" scope="col"><img src="images/petalos1.png" alt="" width="163" height="599"></th>
        <th scope="col"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="9" background="images/left.gif">&nbsp;</td>
            <td bgcolor="#FFFFFF"><table width="752" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><script type="text/javascript">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','752','height','100','src','images/top','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','images/top','menu','false' ); //end AC code</script>
                  <noscript>
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="752" height="100">
                      <param name="movie" value="images/top.swf" />
                      <param name="menu" value="false" />
                      <param name="quality" value="high" />
                      <embed src="images/top.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="752" height="100"></embed>
                    </object>
                  </noscript></td>
              </tr>
              <tr>
                <td><table width="752" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="190" valign="top"><!--#include file="inc_banners_left.asp" --></td>
                    <td width="7" valign="top"></td>
                    <td width="555" valign="top"><table width="555" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="38" colspan="3" valign="top"><!--#include file="buscador.asp"--></td>
                      </tr>
                      <tr>
                        <td colspan="3"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="555" height="240">
                          <param name="movie" value="promo_1.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="promo_1.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="555" height="240"></embed>
                        </object></td>
                      </tr>
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                      <tr>
                        <td width="277" align="left"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="272" height="182">
                          <param name="movie" value="images/banner_chico_izq.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="images/banner_chico_izq.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="272" height="182"></embed>
                        </object></td>
                        <td width="2">&nbsp;</td>
                        <td width="276" align="right"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="272" height="182">
                          <param name="movie" value="images/banner_chico_der.swf">
                          <param name="quality" value="high">
                          <param name="wmode" value="opaque">
                          <embed src="images/banner_chico_der.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="272" height="182"></embed>
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
          <tr>
            <td height="9">&nbsp;</td>
            <td height="9"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="4%" height="10"><a href="http://www.fancy-park.com" class="blanco">FP</a></td>
                <td width="45%" align="right"><a href="#" onMouseUp="MM_openBrWindow('acuerdo.htm','','scrollbars=yes,width=550,height=500')" class="blanco">Pol&iacute;tica de Usuario</a></td>
                <td width="51%" align="right" class="blanco-1">- <a href="sitemap.asp" class="blanco">Mapa del Sitio</a> <span class="blanco1">- Todos los derechos reservados &copy; Carta Autom&aacute;tica 2010</span></td>
              </tr>
            </table></td>
            <td height="9">&nbsp;</td>
          </tr>
        </table></th>
        <th valign="top" scope="col"><img src="images/petalos2.png" alt="" width="186" height="599"></th>
      </tr>
</table>
</body>
</html>
