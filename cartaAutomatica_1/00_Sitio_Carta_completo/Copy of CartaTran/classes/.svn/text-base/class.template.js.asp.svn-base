<%
	function Template() {
		this.strHead = ""
		this.strBody = ""
		this.strFoot = ""	
		this.strDelimiter = "%"
		this.arrItems = new Array()

		// Métodos
		this.add        = Template_add
		this.getContent = Template_getContent
		this.clearArray = Template_clearArray
	}

	// Template::add
	function Template_add(arrParams) {
		this.strContent = this.strBody

		for(key in arrParams) {
			tag = this.strDelimiter + key + this.strDelimiter
			while(this.strContent.search(tag) != -1) {
				this.strContent = this.strContent.replace(tag, arrParams[key])
			}
		}

		this.arrItems[this.arrItems.length] = this.strContent
	}

	// Template::getContent
	function Template_getContent() {
		if(this.arrItems.length == 0) {
			return this.strHead + this.strBody + this.strFoot
		}

		return this.strHead + this.arrItems.join("") + this.strFoot
	}

	// Template::clearArray
	function Template_clearArray() {
		while(this.arrItems.length > 0) {
			this.arrItems.pop()
		}
	}
%>