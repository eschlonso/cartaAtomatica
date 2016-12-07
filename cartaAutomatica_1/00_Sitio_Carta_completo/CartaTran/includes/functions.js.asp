<%
/*
	#########################################################
	########## FUNCTION: str formateDate(str, int) ##########
	#########################################################
*/

	function formatDate(dateString, opt) {
		objDate = new Date(dateString)

		d = (objDate.getDate() > 9) ? String(objDate.getDate()) : "0" + String(objDate.getDate())
		m = (Number(objDate.getMonth()) + 1 > 9) ? String(Number(objDate.getMonth() + 1)) : "0" + String(Number(objDate.getMonth()) + 1)
		a = String(objDate.getYear())
		if(a.length == 2) {
			a = "19" + a
		}

		hh = (objDate.getHours() > 9) ? objDate.getHours() : "0" + objDate.getHours()
		mm = (objDate.getMinutes() > 9) ? objDate.getMinutes() : "0" + objDate.getMinutes()
		ss = (objDate.getSeconds() > 9) ? objDate.getSeconds() : "0" + objDate.getSeconds()

		switch(opt) {
			case 0:
				return d + "/" + m + "/" + a
				break
			case 1:
				return d + "/" + m + "/" + a + " " + hh + ":" + mm + ":" + ss
				break
			default:
				return false
		}
	}

/*
	######################################################
	########## FUNCTION: str formatPeriodo(str) ##########
	######################################################
*/
	function formatPeriodo(str) {
		var p = new String(str)
		return (Number(p.substr(0, p.length - 4)) > 9 ? p.substr(0, p.length - 4) : "0" + p.substr(0, p.length - 4)) + "/" + p.substr(p.length - 4)
	}
/*
	##########################################################
	########## FUNCTION: str alterPeriodo(str, int) ##########
	##########################################################
*/
	function alterPeriodo(str, int) {
		var p = new String(str)
		m = p.substr(0, p.length - 4)
		y = p.substr(p.length - 4)

		switch(int) {
			case 1:
				if(m == 12){
					m = "1"
					y++
				} else {
					m++
				}
				break
			case -1:
				if(m == 1){
					m = "12"
					y--
				} else {
					m--
				}
				break
		}
		return m + y
	}
%>