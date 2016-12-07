<!--

var imgActiva=0;	// Tiene el numero de la imagen que esta activa ( 0 si ninguna )

var imagenes = new Array();
var imagenesHover;	// Hover original de la imagen que esta activa
var imagenesSrc;	// Src original de la imagen que esta activa

imagenes[0] = "../imas/bot_institu.gif";
imagenes[1] = "../imas/bot_institu_roll.gif";

imagenes[2] = "../imas/bot_perso.gif";
imagenes[3] = "../imas/bot_perso_roll.gif";

imagenes[4] = "../imas/bot_pymes.gif";
imagenes[5] = "../imas/bot_pymes_roll.gif";

imagenes[6] = "../imas/bot_empre.gif";
imagenes[7] = "../imas/bot_empre_roll.gif";

imagenes[8] = "../imas/bot_priva.gif";
imagenes[9] = "../imas/bot_priva_roll.gif";

imagenes[10] = "../imas/bot_clientes.gif";
imagenes[11] = "../imas/bot_clientes_roll.gif";

imagenes[12] = "../imas/bot_univer.gif";
imagenes[13] = "../imas/bot_univer_roll.gif";


function SwitchSrc(imgNro)
{
	if(imgNro!= imgActiva)
	{
		// Quiere decir que se pulso en alguna imagen que no estaba justamente activa
		// Debemos poner las imagenes originales en  su lugar siempre que no sea que cambio de 0 a X
		if(imgActiva!=0)
		{
			imagenes[(imgActiva*2)-2] = imagenSrc;	// Actualizo el src de la imagen
			imagenes[(imgActiva*2)-1] = imagenHov;  // Actualizo el hov de la imagen

			eval("document.Image"+imgActiva+".src = imagenes["+(imgActiva*2-2)+"];");
		}

		// Ahora preparamos la imagen nueva
		imgActiva = imgNro;

		// Se guardan las imagenes normales
		imagenSrc = imagenes[(imgNro*2)-2];
		imagenHov = imagenes[(imgNro*2)-1];

		// ponemos el src = hov para que no tenga efecto onMouseOver-Out

		imagenes[(imgNro*2)-2] = imagenes[(imgNro*2)-1];

		// Actualizamos el DOM
		eval("document.Image"+imgNro+".src = imagenes["+((imgNro*2)-2)+"];");

	//	ResetRightBar();
	}
}

function ThereIsNoSpoon(disableRight)
{
	// Desactiva todos los links
	if(imgActiva!=0)
	{
		imagenes[(imgActiva*2)-2] = imagenSrc;	// Actualizo el src de la imagen
		imagenes[(imgActiva*2)-1] = imagenHov;  // Actualizo el hov de la imagen

		eval("document.Image"+imgActiva+".src = imagenes["+(imgActiva*2-2)+"];");
		imgActiva = 0;
	}
	if(disableRight); //ResetRightBar()
}

//function ResetRightBar()
//{
//	alert(top.mainFrame.mainFrameRight.imgActiva);
//	if(window.imgActiva!=0)
	//{
		//window.ThereIsNoSpoon();
	//}
//}

function MouseOver(imgNro)
{
	eval("document.Image"+imgNro+".src = imagenes["+((imgNro*2)-1)+"];");
}

function MouseOut(imgNro)
{
	eval("document.Image"+imgNro+".src = imagenes["+((imgNro*2)-2)+"];");
}


function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
