var timHideMenu = false;

function menuShow(strLayer, blnMode, intLeft, intTop){

	if (!intLeft)
		intLeft = 151;

	if (!intTop)
		intTop = 0;

	var strNombreLayer = "layer" + strLayer;
	var strNombreImagen = "img" + strLayer;

	if (blnMode){
		setLayerPosition(getLayerName(strNombreLayer), strNombreImagen, intTop, intLeft);
		MM_showHideLayers(strNombreLayer, '', 'show');
	}else{
		if (!timHideMenu)
			timHideMenu = setTimeout("MM_showHideLayers('" + strNombreLayer + "', '', 'hide')", 1000);
		else{
			clearTimeout(timHideMenu);
			timHideMenu = setTimeout("MM_showHideLayers('" + strNombreLayer + "', '', 'hide')", 1000);
		}
	}
}

function stopHide(){
	if (timHideMenu){
		clearTimeout(timHideMenu);
		timHideMenu = false;
	}
}