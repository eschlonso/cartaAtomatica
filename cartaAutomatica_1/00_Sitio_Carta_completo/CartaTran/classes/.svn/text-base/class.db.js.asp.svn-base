<%
/*
	2004/09/10
	Agregué método para Stored Procedures:
*/
	// DB - Objeto para conectarse a la base de datos.
	function DB(conn) {
		this.initialize = DB_initialize
		this.close      = DB_close
		this.query      = DB_query
		this.sp         = DB_sp
		this.each       = DB_each
		this.initialize(conn)
	}

	// DB::initialize
	function DB_initialize(conn) {
		conn["provider"] = "Provider="        + conn["provider"] + ";"
		conn["hostname"] = "Data Source="     + conn["hostname"] + ";"
		conn["database"] = "Initial Catalog=" + conn["database"] + ";"
		conn["username"] = "User Id="         + conn["username"] + ";"
		conn["password"] = "Password="        + conn["password"] + ";"
	
		this.db = Server.CreateObject("ADODB.Connection")
		this.db.open(
			conn["provider"] +
			conn["hostname"] +
			conn["database"] +
			conn["username"] +
			conn["password"]
		)
	}

	// DB::close
	function DB_close() {
		this.db.close()
	}
	
	// DB::query
	function DB_query(sQuery) {
		this.rec = Server.CreateObject("ADODB.RecordSet")
		this.rec.ActiveConnection = this.db
		this.rec.CursorType = adOpenStatic
		this.rec.open(sQuery)

		if(!this.rec.state) {
			return false
		}

		if(this.rec.BOF && this.rec.EOF) {
			this.rec.close()
			return false
		} else {
			return true
		}
	}

	/* DB::sp
		Ejecuta un Stored Procedure y carga el RecordSet del objeto DB.
		Recibe string con el nombre del stored procedure y array asociativo de datos.
		Cada elemento del array asociativo debe tener un par de datos "etiqueta/valor", en
		donde la etiqueta será el nombre de la variable que se pasará al Stored Procedure,
		y el valor será un array de dos elementos, en donde el elemento 0 será el valor que
		tomará la variable, y el elemento 1 será una constante ADO que representa el tipo
		de datos del valor.
			sp(sStoredProcedureName, {sVariableName : {0 : value, 1 : iDataType}})

		Ejemplo:
			var arr = {
				"@id" : {
					0 : 5,
					1 : adInteger
				}
			};
		oDB.sp("sp_myStoredProcedure", arr)
	*/
	function DB_sp(sStoredProcedure, aParams) {
		this.cmd = Server.CreateObject("ADODB.Command")
		this.cmd.ActiveConnection = this.db
		this.cmd.CommandText = "{call " + sStoredProcedure + "(?)}"
		for(key in aParams) {
			var p = this.cmd.CreateParameter(key, aParams[key][1],  adParamInput)
			this.cmd.Parameters.Append(p)
			this.cmd(key) = aParams[key][0]
		}
		this.rec = this.cmd.Execute()

		if(!this.rec.state) {
			return false
		}

		if(this.rec.BOF && this.rec.EOF) {
			this.rec.close()
			return false
		} else {
			return true
		}
	}

	// DB::each
	function DB_each() {
		if(!this.rec.state) {
			return false
		}

		if(this.rec.BOF && this.rec.EOF) {
			this.rec.close()
			return false
		}

		aRecord = new Array()
		fields = new Enumerator(this.rec.fields)
		while(!fields.atEnd()) {
			field = fields.item()
			aRecord[field.name] = field.value
			fields.moveNext()
		}

		this.rec.movenext
		if(this.rec.EOF) {
			this.rec.close()
		}

		return aRecord
	}
%>