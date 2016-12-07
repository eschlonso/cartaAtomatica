isDOM = (document.getElementById ? true : false);
isIE = (document.all ? true : false);

function MM_openBrWindow(theURL, winName, features) {
	window.open(theURL, winName, features);
}

function MM_swapImgRestore() {
	var i, x, a = document.MM_sr;

	for(i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) {
		x.src = x.oSrc;
	}
}

function MM_preloadImages() {
	var d = document;

	if(d.images) {
		if(!d.MM_p) {
			d.MM_p = new Array();
		}

		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;

		for(i = 0; i < a.length; i++) {
			if(a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
		}
	}
}

function MM_findObj(n, d) {
	var p, i, x;

	if(!d) {
		d=document;
	}

	if((p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}

	if(!(x = d[n]) && d.all) {
		x = d.all[n];
	}

	for(i = 0; !x && i < d.forms.length; i++) {
		x = d.forms[i][n];
	}

	for(i = 0; !x && d.layers && i < d.layers.length; i++) {
		x = MM_findObj(n, d.layers[i].document);
	}

	if(!x && d.getElementById) {
		x = d.getElementById(n);
	}

	return x;
}

function MM_swapImage() {
	var i, j = 0, x, a = MM_swapImage.arguments;

	document.MM_sr = new Array;

	for(i = 0; i < (a.length - 2); i+=3) {
		if((x = MM_findObj(a[i])) != null) {
			document.MM_sr[j++] = x;

			if(!x.oSrc) {
				x.oSrc = x.src;
			}

			x.src = a[i + 2];
		}
	}
}

function MM_showHideLayers() {
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function getLayerName(strLayerName) {
        var objLayerName;
        if (isDOM)
                objLayerName = document.getElementById(strLayerName).style;
        else if (isIE)
                objLayerName = document.all[strLayerName].style;
        else
                objLayerName = document.layers[strLayerName];
        return objLayerName;
}

function getObjectName(strObjectName) {
        var objObjectName;
        if (isDOM)
                objObjectName = document.getElementById(strObjectName);
        else if (isIE)
                objObjectName = document.all[strObjectName];
        else{
                if (document[strObjectName])
                        objObjectName = document[strObjectName];
                else{
                        for (i = 0; i < document.layers.length; i++){
                                if (document.layers[i].document[strObjectName]){
                                        objObjectName = document.layers[i].document[strObjectName];
                                        break;
                                }
                        }
                }
        }
        return objObjectName;
}

function setLayerPosition(objLayerName, strNamePositioner, intTop, intLeft) {
        var objNamePositioner;
        intTop = parseInt(intTop);
        intLeft = parseInt(intLeft);
        if (strNamePositioner){
                if (isDOM)
                        objNamePositioner = document.getElementById(strNamePositioner);
                else if (isIE)
                        objNamePositioner = document.all[strNamePositioner];
                else{
                        if (document[strNamePositioner])
                                objNamePositioner = document[strNamePositioner];
                        else if (objLayerName.document[strNamePositioner])
                                objNamePositioner = objLayerName.document[strNamePositioner];
                        else{
                                for (i = 0; i < document.layers.length; i++){
                                        if (document.layers[i].document[strNamePositioner]){
                                                objNamePositioner = document.layers[i].document[strNamePositioner];
                                                break;
                                        }
                                }
                        }
                }

                objLayerName.top = parseInt(getAbsY(objNamePositioner)) + intTop;
                objLayerName.left = parseInt(getAbsX(objNamePositioner)) + intLeft;
        }else{
                objLayerName.top = intTop;
                objLayerName.left = intLeft;
        }
}

function getAbsX(objElement){
        if (!(isDOM) && !(isIE)){
                var strNombreElemento = objElement.name;
                if (!document[strNombreElemento]){
                        for (i = 0; i < document.layers.length; i++){
                                if (document.layers[i].document[strNombreElemento]){
                                        objElement = document.layers[i].document[strNombreElemento];
                                        objLayer = document.layers[i];
                                        break;
                                }
                        }
                        return (objLayer.x + objElement.x);
                }else
                        return ((objElement.x) || (parseInt(objElement.x) == 0)) ? objElement.x : getAbsPos(objElement, "Left");
        }else
                return ((objElement.x) || (parseInt(objElement.x) == 0)) ? objElement.x : getAbsPos(objElement, "Left");
}

function getAbsY(objElement){
        if (!(isDOM) && !(isIE)){
                var strNombreElemento = objElement.name;
                if (!document[strNombreElemento]){
                        for (i = 0; i < document.layers.length; i++){
                                if (document.layers[i].document[strNombreElemento]){
                                        objElement = document.layers[i].document[strNombreElemento];
                                        objLayer = document.layers[i];
                                        break;
                                }
                        }
                        return (objLayer.y + objElement.y);
                }else
                        return ((objElement.y) || (parseInt(objElement.y) == 0)) ? objElement.y : getAbsPos(objElement,"Top");
        }else
                return ((objElement.y) || (parseInt(objElement.y) == 0)) ? objElement.y : getAbsPos(objElement,"Top");
}

function getAbsPos(objElement,which) {
        iPos = 0;
        while (objElement != null) {
                iPos += objElement["offset" + which];
                objElement = objElement.offsetParent;
        }
        return iPos;
}


var strOpenItemName = '';

function CutRenderLayer(strLayerName){
        var objLayerOpen = getLayerName (strLayerName);
        objLayerOpen.visibility = 'hidden';
        objLayerOpen.display = 'none';
}

function RenderLayer(strLayerName){
        var objLayerOpen = getLayerName (strLayerName);
        objLayerOpen.visibility = 'visible';
        objLayerOpen.display = 'block';
}

function RenderObject(obj){
        obj.style.display = 'block';
        obj.style.visibility = 'visible';

}

function DeRenderObject(obj){
        obj.style.visibility = 'hidden';
        obj.style.display = 'none';
}

function setPositionHideOpenItem (){
        var objLayerOpen = getLayerName (strOpenItemName);
        objLayerOpen.visibility = 'hidden';
        objLayerOpen.display = 'none';
        strOpenItemName = '';
}

function setPositionCloseOpen(strLayerName){
       	    var objLayerClick = getLayerName (strLayerName);

        if (strOpenItemName == strLayerName ){
                var objLayerOpen = getLayerName (strOpenItemName);
                objLayerOpen.visibility = 'hidden';
                objLayerOpen.display = 'none';
                strOpenItemName = '';
        }
        else{

                if (strOpenItemName != ''){
                        var objLayerOpen = getLayerName (strOpenItemName);
                        objLayerOpen.visibility = 'hidden';
                        objLayerOpen.display = 'none';
                }

                objLayerClick.visibility = 'visible';
                objLayerClick.display = 'block';
                strOpenItemName = strLayerName;
        }

}


function setPosition (strLayerName){

        var objLayerClick = getLayerName (strLayerName);

        if (strOpenItemName == strLayerName ){

        }
        else{

                if (strOpenItemName != ''){
                        var objLayerOpen = getLayerName (strOpenItemName);
                        objLayerOpen.visibility = 'hidden';
                        objLayerOpen.display = 'none';
                }

                objLayerClick.visibility = 'visible';
                objLayerClick.display = 'block';
                strOpenItemName = strLayerName;
        }
}


function setPosition2 (strLayerName){
	/* Hace los mismo que SetPosition */
        var objLayerClick = getLayerName (strLayerName);

        if (strOpenItemName == strLayerName ){

        }
        else{

                if (strOpenItemName != ''){
                        var objLayerOpen = getLayerName (strOpenItemName);
                        objLayerOpen.visibility = 'hidden';
                        objLayerOpen.display = 'none';
                }

                objLayerClick.visibility = 'visible';
                objLayerClick.display = 'block';
                strOpenItemName = strLayerName;
        }
}



function setClippingArea(objLayerScan, intTop, intRight, intBottom, intLeft){

        if (document.layers){
                intTop = parseInt(intTop);
                intLeft = parseInt(intLeft);
                intBottom = parseInt(intBottom);
                intRight = parseInt(intRight);
                objLayerScan.clip.top = intTop;
                objLayerScan.clip.bottom = intBottom;
                objLayerScan.clip.left = intRight;
                objLayerScan.clip.right = intLeft;
        }else
                objLayerScan.clip = 'rect(' + intTop + ' ' + intLeft + ' ' + intBottom + ' ' + intRight + ')';
}

function centrarLayers(){
        var strArgs = centrarLayers.arguments;
        for (i = 0; i < (strArgs.length) - 2; i += 3){
                setLayerPosition(getLayerName(strArgs[i]), 'imgReferencia', strArgs[i+1], strArgs[i+2]);
                MM_showHideLayers(strArgs[i], '', 'show');
        }
}


function autoTab(input,len, e)
{
        var keyCode = (isNN) ? e.which : e.keyCode;
        var filter = (isNN) ? [0,8,9] : [0,8,9,16,17,18,37,38,39,40,46];
        if(input.value.length >= len && !containsElement(filter,keyCode)) {
                input.value = input.value.slice(0, len);
                input.form[(getIndex(input)+1) % input.form.length].focus();
}

        return true;
}

var isNN = (navigator.appName.indexOf("Netscape")!=-1);

function getIndex(input) {
        var index = -1, i = 0, found = false;
        while (i < input.form.length && index == -1)
        if (input.form[i] == input)index = i;
        else i++;
        return index;
}
function containsElement(arr, ele) {
var found = false, index = 0;
while(!found && index < arr.length)
        if(arr[index] == ele)
                found = true;
        else
                index++;
        return found;
}

function emailCheck (emailStr) {
        var emailPat=/^(.+)@(.+)$/
        var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
        var validChars="\[^\\s" + specialChars + "\]"
        var quotedUser="(\"[^\"]*\")"
        var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
        var atom=validChars + '+'
        var word="(" + atom + "|" + quotedUser + ")"

        var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
        var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")

        var matchArray=emailStr.match(emailPat)
        if (matchArray==null) {
        return false
        }
        var user=matchArray[1]
        var domain=matchArray[2]

        // See if "user" is valid
        if (user.match(userPat)==null) {
           return false
        }

        var IPArray=domain.match(ipDomainPat)
        if (IPArray!=null) {
          for (var i=1;i<=4;i++) {
            if (IPArray[i]>255) {
                return false
            }
           }
           return true
        }

        // Domain is symbolic name
        var domainArray=domain.match(domainPat)
        if (domainArray==null) {
//                alert("The domain name doesn't seem to be valid.")
           return false
        }

        var atomPat=new RegExp(atom,"g")
        var domArr=domain.match(atomPat)
        var len=domArr.length
        if (domArr[domArr.length-1].length<2 ||
           domArr[domArr.length-1].length>3) {
          return false
        }


        if (len<2) {
          var errStr="This address is missing a hostname!"
          return false
        }

        return true;
}


function isValidDate(dateStr)
{
        var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
        var matchArray = dateStr.match(datePat); // is the format ok?
        if (matchArray == null)
        {
                return false;
        }
        dia = matchArray[3];
        mes = matchArray[1];
        ano = matchArray[4];
        if (mes < 1 || mes > 12)
        {
                // chequeo de mes
                return false;
        }
        if (dia < 1 || dia > 31)
        {
                // chequeo de dia
                return false;
        }
        if ((mes==4 || mes==6 || mes==9 || mes==11) && dia==31)
        {
                return false;
        }
        if (mes == 2)
        {
                var g = parseInt(ano / 4);
                if (dia > 29 || (dia == 29 && (ano / 4) != g))
                {
                        return false;
                }
        }
        return true;
}


function isCuit(val)
{
   var test1 = "0123456789"
   var c
   var cPersona

   if (val.length != 13)
      return false

   for (var i = 0; i < val.length; i++)
   {
      c = test1.indexOf(val.charAt(i))
      if (c < 0)
      {
         if (i!=2 && i!=11)
            return false
         else
            if (val.charAt(i) != '-')
               return false
      }
   }
   cPersona = val.charAt(0) + val.charAt(1)
   if (cPersona !="17" &&
       cPersona !="20" &&
       cPersona !="21" &&
       cPersona !="22" &&
       cPersona !="23" &&
       cPersona !="24" &&
       cPersona !="27" &&
       cPersona !="28" &&
       cPersona !="29" &&
       cPersona !="30" &&
       cPersona !="33" &&
       cPersona !="99" )
      return false

   return true
}
function ShowHideDiv(strNameDiv) { 
	var divs = document.getElementsByTagName('div'); 
	for(i=0;i<divs.length;i++){ 
		
		if(divs[i].id.match(strNameDiv)){ 
			if (document.getElementById) {
				divs[i].style.visibility="visible";
				divs[i].style.display="block"; 
			} else {
				if (document.layers) {// Netscape 4 
					document.layers[divs[i]].display = 'visible'; 
				} else {// IE 4 
					document.all.hideShow.divs[i].visibility = 'visible';
					document.all.hideShow.divs[i].display = 'block'; 
				}
			}
		} else {
			if ( (divs[i].id.match("divContainer")) || (divs[i].id.match("divContent")) || (divs[i].id.match("holdNews")) || (divs[i].id.match("wnNews")) || (divs[i].id.match("lyrNews")) ) { 
				//alert (divs[i].id);
			} else {			
				if (document.getElementById) { // DOM3 = IE5, NS6 
					divs[i].style.visibility="hidden";// show/hide 
					divs[i].style.display="none";// show/hide 
				} else { 
					if (document.layers){ // Netscape 4 
						document.layers[divs[i]].display = 'hidden'; 
					} else { // IE 4 
						document.all.hideShow.divs[i].visibility = 'hidden'; 
						document.all.hideShow.divs[i].display = 'none'; 
					}
				}
			}
		}
	}
}

//########## Funciones para validar formularios ##########
//Función boolean checkRequiredFields(str1, str2)
//Recibe:
//	str1:	Nombre del form.
//	str2:	Nombres de campos requeridos (separados por comas).
//Retorna:
//	true:	Si hay datos en todos los campos requeridos.
//	false:	Si algún campo requerido está vacío.
function checkRequiredFields(sFormName, sFields) {
	var aFields = new Array();
	aFields = sFields.split(',')
	for(var i = 0; i < aFields.length; i++){
		if(document.forms[sFormName][aFields[i]].value == "") {
			alert('Falta completar información.');
			document.forms[sFormName][aFields[i]].focus();
			return false;
		}
	}

	document.forms[sFormName].submit()
}

//Función boolean validateEmail(string1, string2)
//Recibe:
//	str1:	Nombre del form.
//	str2:	Nombres del campo para dirección e-mail.
//Retorna:
//	true:	Si la dirección e-mail es válida.
//	false:	Si la dirección e-mail no es válida.
function validateEmail(frm, fld) {
	if(document.forms[frm][fld].value.match(/^\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.[a-z]{2,3}$/)) {
			return true;
	}

	alert('Dirección de e-mail inválida.');
	document.forms[frm][fld].value = "";

	return false;
}

function showHideLayerById(strLayerId) {
	if(!document.getElementById(strLayerId).style.visibility || document.getElementById(strLayerId).style.visibility == 'hidden') {
		document.getElementById(strLayerId).style.display = 'block';
		document.getElementById(strLayerId).style.visibility = 'visible';
	} else {
		document.getElementById(strLayerId).style.display = 'none';
		document.getElementById(strLayerId).style.visibility = 'hidden';
	}
}
