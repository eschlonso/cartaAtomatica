<!--

var tags_before_clock = "<div class='fecha'>"
var tags_middle_clock = "-  "
var tags_after_clock  = "</div>"

if(navigator.appName == "Netscape") {
document.write('<input type=text id="clock" class="fecha" style="border:0px; margin:0px; width:170px;"><br>');
}

if (navigator.appVersion.indexOf("MSIE") != -1){
document.write('<span  id="clock"></span>');
}

DaysofWeek = new Array()
  DaysofWeek[0]="Domingo"
  DaysofWeek[1]="Lunes"
  DaysofWeek[2]="Martes"
  DaysofWeek[3]="Miércoles"
  DaysofWeek[4]="Jueves"
  DaysofWeek[5]="Viernes"
  DaysofWeek[6]="Sábado"

Months = new Array()
  Months[0]="Enero"
  Months[1]="Febrero"
  Months[2]="Marzo"
  Months[3]="Abril"
  Months[4]="Mayo"
  Months[5]="Junio"
  Months[6]="Julio"
  Months[7]="Agosto"
  Months[8]="Septiembre"
  Months[9]="Octubre"
  Months[10]="Noviembre"
  Months[11]="Diciembre"

function upclock(){
var dte = new Date();
var hrs = dte.getHours();
var min = dte.getMinutes();
//var sec = dte.getSeconds();
var sec = "";//dte.getSeconds();
var day = DaysofWeek[dte.getDay()]
var date = dte.getDate()
var month = Months[dte.getMonth()]
var year = dte.getFullYear()

var col = ":";
var spc = " ";
var com = ",";
var dee = "de";
var apm;

if (date == 1 || date == 21 || date == 31)
  {ender = ""}
else
if (date == 2 || date == 22)
  {ender = ""}
else
if (date == 3 || date == 23)
  {ender = ""}

else
  {ender = " "}

if (hrs<=9) hrs="0"+hrs;
if (min<=9) min="0"+min;
if (sec<=9) sec="0"+sec;

if(navigator.appName == "Netscape") {
//document.clock.document.write(tags_before_clock+spc+day+spc+date+ender+spc+dee+spc+month+spc+dee+spc+year+tags_after_clock);
document.getElementById("clock").value=spc+day+spc+date+ender+spc+dee+spc+month+spc+dee+spc+year;
//document.clock.document.close();
}

if (navigator.appVersion.indexOf("MSIE") != -1){
//clock.innerHTML = tags_before_clock+spc+day+spc+spc+date+ender+spc+month+spc+spc+year+spc+tags_middle_clock+hrs+col+min+col+sec+spc+tags_after_clock;
//clock.innerHTML = tags_before_clock+spc+day+spc+spc+date+ender+spc+month+spc+spc+year+spc+tags_middle_clock+hrs+col+min+spc+tags_after_clock;
clock.innerHTML = tags_before_clock+spc+day+spc+date+ender+spc+dee+spc+month+spc+dee+spc+year+tags_after_clock;
}
}

setInterval("upclock()",1000);
//-->