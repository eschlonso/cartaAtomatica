function check(strForm) {
	//Properties
	this.strForm = strForm;
	this.arrErrors = new Array();

	//Methods
	this.getInput = check_getInput;
	this.getNextPosition = check_getNextPosition;
	this.checkError = check_checkError;
	this.checkFixedError = check_checkFixedError;
	this.isDate = check_isDate;

	this.checkString = check_string;
	this.checkFixedString = check_fixedString;
	this.checkNumber = check_number;
	this.checkNumberPos = check_numberPos;
	this.checkFloat = check_float;
	this.checkDate = check_date;
	this.checkEmail = check_email;
	this.checkCombo = check_combo;
	this.compareDates = check_compareDates;
	this.toString = check_toString;
}

function check_getInput (strInput) {
	return eval("document." + this.strForm + "." + strInput);
}

function check_getNextPosition () {
	return this.arrErrors.length;
}

function check_checkError (objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, strErrorMessage) {
	var intPosition = this.getNextPosition();
	var objRegExp = new RegExp(strRegExp);
	
	if (!objInput.value.length) {
		if (!blnOptional){
			this.arrErrors[intPosition] = "El campo " + strNameShow + " no puede estar vacío";
			return false;
		}else
			return true;
	}else{
		if ((!objRegExp.test(objInput.value))) {
			this.arrErrors[intPosition] = "El campo " + strNameShow + (strErrorMessage ? strErrorMessage : " contiene caracteres inválidos" );
			return false;
		}else if (objInput.value.length < intMinLen) {
				this.arrErrors[intPosition] = "El campo " + strNameShow + " debe tener más de " + intMinLen + " caracteres";
				return false;
			}else if (objInput.value.length > intMaxLen) {
					this.arrErrors[intPosition] = "El campo " + strNameShow + " no debe tener más de " + intMaxLen + " caracteres";
					return false;
				}
				else
					return true;
	}
}

function check_checkFixedError (objInput, strNameShow, strRegExp, intLen, blnOptional, strErrorMessage) {
	var intPosition = this.getNextPosition();
	var objRegExp = new RegExp(strRegExp);
	
	if (!objInput.value.length) {
		if (!blnOptional){
			this.arrErrors[intPosition] = "El campo " + strNameShow + " no puede estar vacío";
			return false;
		}else
			return true;
	}else{
		if ((!objRegExp.test(objInput.value))) {
			this.arrErrors[intPosition] = "El campo " + strNameShow + (strErrorMessage ? strErrorMessage : " contiene caracteres inválidos" );
			return false;
		}else if (objInput.value.length != intLen) {
				this.arrErrors[intPosition] = "El campo " + strNameShow + " debe tener " + intLen + " caracteres";
				return false;
			} else
				return true;
	}
}

function check_isDate(datFecha) {
	var arrFecha = datFecha.split("/");
	var datFechaValida = new Date(arrFecha[2], arrFecha[1] - 1, arrFecha[0]);

	if ((arrFecha[0] == datFechaValida.getDate()) && 
		(arrFecha[1] == (datFechaValida.getMonth() + 1)) && 
		(arrFecha[2] == datFechaValida.getFullYear()))
		return true;
	else
		return false;
}

function check_string (strInput, strNameShow, intMinLen, intMaxLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[^<>']+$";

	return this.checkError(objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, false);
}

function check_fixedString (strInput, strNameShow, intLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[^<>']+$";

	return this.checkFixedError(objInput, strNameShow, strRegExp, intLen, blnOptional, false);
}

function check_number (strInput, strNameShow, intMinLen, intMaxLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[0-9]+$";

	return this.checkError(objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, false);
}

function check_numberPos (strInput, strNameShow, intMinLen, intMaxLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[0-9]+$";
	
	if (this.checkError(objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, "El campo " + strNameShow + " debe ser positivo")) {
		if (objInput.value > 0)
			return true;
		else {
			this.arrErrors[this.getNextPosition()] = "El campo " + strNameShow + " debe ser positivo";
			return false;
		}
	} else
		return false;
}

function check_float (strInput, strNameShow, intMinLen, intMaxLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[0-9]+(\\,[0-9]+)?$";

	return this.checkError(objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, false);
}

function check_date (strInput, strNameShow, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}";
	var intPosition;
	
	if ((objInput.value.length == 0) && (blnOptional)) return true;
	if (this.checkError(objInput, strNameShow, strRegExp, 8, 10, blnOptional, " no contiene una fecha válida"))
		if (!this.isDate(objInput.value)) {
			var intPosition = this.getNextPosition();
			this.arrErrors[intPosition] = "El campo " + strNameShow + " no contiene una fecha válida";
			return false;
		} else
			return true;
}

function check_email (strInput, strNameShow, intMinLen, intMaxLen, blnOptional) {
	var objInput = this.getInput(strInput);
	var strRegExp = "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$";

	return this.checkError(objInput, strNameShow, strRegExp, intMinLen, intMaxLen, blnOptional, false);
}

function check_combo (strInput, strNameShow, blnOptional) {
	var objInput = this.getInput(strInput);
	
	if (blnOptional) {
		return true;
	}
	else {
		if (objInput.selectedIndex > 0) {
			return true;
		}
		else {
			var intPosition = this.getNextPosition();
			this.arrErrors[intPosition] = "Debe elegir una opción para el campo " + strNameShow;

			return false;
		}
	}
}

function check_compareDates(strInput1, strInput2, strUnidad) {
	if ((!this.isDate(strInput1)) || (!this.isDate(strInput2)))
		return null;
	
//	Si son fechas válidas, las paso a arrays para compararlas.
	var arrFecha1 = strInput1.split("/");
	var datFechaValida1 = new Date(arrFecha1[2], arrFecha1[1] - 1, arrFecha1[0]);
	var arrFecha2 = strInput2.split("/");
	var datFechaValida2 = new Date(arrFecha2[2], arrFecha2[1] - 1, arrFecha2[0]);
	var intAjuste;
	
	switch (strUnidad) {
//		El resultado te lo devuelve en años
		case "a":
		case "A":
			intAjuste = 86400000 * 365;
			break;
//		El resultado te lo devuelve en horas
		case "h":
		case "H":
			intAjuste = 86400000 / 24;
			break;
//		El resultado te lo devuelve por default en días
		case "d":
		case "D":
		default:
			intAjuste = 86400000;
			break;
	}
	
	return ((datFechaValida1 - datFechaValida2) / intAjuste);
}

function check_toString () {
	var strErrors = "";
	var i;
	
	for (i = 0; i < this.arrErrors.length; i++) {
		strErrors = strErrors + this.arrErrors[i] + "\n";
	}
	
	return strErrors;
}