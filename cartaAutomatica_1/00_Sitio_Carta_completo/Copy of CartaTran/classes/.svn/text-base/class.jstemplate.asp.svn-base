<SCRIPT RUNAT="SERVER" LANGUAGE="JavaScript">
/*******************************************************************************
*                                  jsTemplate                                  *
*                         Copyright©2001 Emil Malinov                          *
*                       jstemplate.asp, v 0.2 2001/08/03                       *
*******************************************************************************/
// jsTemplate Constructor ------------------------------------------------------
function jsTemplate(root, unknowns, debug, haltonerror) {
	// Storage
	this.f_strRoot        = Server.MapPath("."); // Relative filenames: relative to this pathname
	this.f_strUnknowns    = "remove";            // Undefined variables: "remove","comment","keep"
	this.f_blnDebug       = false;               // Assignments: echo if set to True
	this.f_strHaltOnError = "yes";               // Errors: "yes", "no", "report"
	this.f_strLastError   = "No error storred."; // Errors: last error message is retained here
	this.f_arrFile        = new Array();         // Template files: storred here
	this.f_arrVars        = new Array();         // Template variables: storred here

	// Methods
	this.haltMsg        = jst_haltMsg;
	this.halt           = jst_halt;
	this.loadFile       = jst_loadFile;
	this.finish         = jst_finish;
	this.setRoot        = jst_setRoot;
	this.getRoot        = new Function("return(this.f_strRoot);");
	this.setUnknowns    = jst_setUnknowns;
	this.getUnknowns    = new Function("return(this.f_strUnknowns);");
	this.setDebug       = jst_setDebug;
	this.getDebug       = new Function("return(this.f_blnDebug);");
	this.setHaltOnError = jst_setHaltOnError;
	this.getHaltOnError = new Function("return(this.f_strHaltOnError);");
	this.getLastError   = new Function("return(this.f_strLastError);");
	this.setFile        = jst_setFile;
	this.setVar         = jst_setVar;
	this.resetVar       = jst_resetVar;
	this.setBlock       = jst_setBlock;
	this.getVar         = jst_getVar;
	this.getVars        = jst_getVars;
	this.subst          = jst_subst;
	this.psubst         = jst_psubst;
	this.parse          = jst_parse;
	this.pparse         = jst_pparse;
	this.print          = jst_print;
	this.get            = jst_get;

	// Initialization
	if (root        != null) this.setRoot(root);
	if (unknowns    != null) this.setUnknowns(unknowns);
	if (debug       != null) this.setDebug(debug);
	if (haltonerror != null) this.setHaltOnError(haltonerror);

} // jsTemplate Constructor End ------------------------------------------------

// Implementation  =============================================================
// "Private" methods
function jst_haltMsg(msg) {
	Response.Write("<b>Template Error:</b> " + msg + "<br>\n");
}

function jst_halt(msg) {
	this.f_strLastError = msg;
	if (this.f_strHaltOnError != "no") {
		this.haltMsg(msg);
	}

	if (this.f_strHaltOnError == "yes") {
		with (Response) {
			Write("<B>Halted.</B>");
			End;
		}
	}
}

function jst_loadFile(shandle)
{
  var filename, fs, fl, ts, str;
  if (typeof(this.f_arrVars[shandle]) != "undefined")
    if (this.f_arrVars[shandle] != "")
      return(true);
  if (typeof(this.f_arrFile[shandle]) == "undefined")
  {
    this.halt("loadFile: '" + shandle + "' is not a valid handle.");
    return(false);
  }
  fs = new ActiveXObject("Scripting.FileSystemObject");
  filename = fs.BuildPath(this.getRoot(), this.f_arrFile[shandle]);
  if (!fs.FileExists(filename))
  {
    this.halt("loadFile: while loading '" + shandle + "', '" + filename + "' does not exits.");
    return(false);
  }
  fl = fs.GetFile(filename);
  ts = fl.OpenAsTextStream(1,0);
  str = ts.Read(fl.Size);
  if (str == "")
  {
    this.halt("loadFile: while loading '" + shandle + "', '" + filename + "' is empty.");
    return(false);
  }
  this.setVar(shandle, str);
  return(true);
}

function jst_finish(str)
{
  switch (this.f_strUnknowns)
  {
    case "remove":
      str = str.replace(/{[^ \t\r\n}]+}/g, "");
      break;
    case "comment":
      str = str.replace(/{([^ \t\r\n}]+)}/g, "\<\!-- JSTemplate: Variable $1 undefined -->");
      break;  
  } 
  return(str);  
}

//"Properties" set/get
function jst_setRoot(root)
{
  var fs;
  fs = new ActiveXObject("Scripting.FileSystemObject");
  if (!fs.FolderExists(root))
    this.halt("setRoot: folder '" + root + "' does not exist.");
  else
    this.f_strRoot = root;
}

function jst_setUnknowns(unknowns)
{
  if ((unknowns == "remove") || (unknowns == "comment") || (unknowns == "keep"))
    this.f_strUnknowns = unknowns;
}

function jst_setDebug(debug)
{
  if (typeof(debug) == "boolean")
    this.f_blnDebug = debug;
}

function jst_setHaltOnError(haltonerror)
{
  if ((haltonerror == "yes") || (haltonerror == "no") || (haltonerror == "report"))
    this.f_strHaltOnError = haltonerror;
}

// "Public" methods
function jst_setFile(handle, sfilename) {
	var key;
	if (typeof(handle) == "object") {
		for (key in handle) {
			this.f_arrFile[key] = handle[key];
		}
	} else {
		if (sfilename == "") {
			this.halt("SetFile: for handle '" + handle + "' sfilename is empty.");
			return(false);
		}

		this.f_arrFile[handle] = sfilename;
	}
}

function jst_setVar(varname, svarvalue)
{
  var key;
  if (typeof(varname) == "object")
  {
    for (key in varname) 
    {
      this.f_arrVars[key] = varname[key]; 
      if (this.f_blnDebug)
        Response.Write("array: set '" + key + "' to '" + varname[key] + "'.<br>\n");
    }
  }
  else
  {
  	if (typeof(svarvalue) == "number") {
		svarvalue = String(svarvalue);
	}

    if (typeof(svarvalue) == "string")
    {
      this.f_arrVars[varname] = svarvalue;
      if (this.f_blnDebug)
        Response.Write("scalar: set '" + varname + "' to '" + svarvalue + "'.<br>\n");
    }
  }  
}

function jst_resetVar(varname)
{
  var key;
  if (typeof(varname) == "object")
    for (key in varname) 
      this.f_arrVars[key] = ""; 
  else
    this.f_arrVars[varname] = ""; 
}

function jst_setBlock(sparent, svarname, sname) {
	var father, child, rx, pattern, arr;

	if(!this.loadFile(sparent)) {
		this.halt("setBlock: unable to load '" + sparent + ".");
		return(false);
	}

	if((sname == "") || (sname == null)) {
		sname = svarname;
	}
	father = this.getVar(sparent);

	pattern = "\<\!--\\s+BEGIN_BLOCK\\s+" + svarname + "\\s+-->(.|\\n)*\<\!--\\s+END_BLOCK\\s+" + svarname + "\\s+-->";
	rx = new RegExp(pattern);
	arr = rx.exec(father);
	father = father.replace(rx, "{" + sname + "}");
	pattern = "\<\!--\\s+BEGIN_BLOCK\\s+" + svarname + "\\s+-->";
	rx.compile(pattern);
	child = arr[0].replace(rx, "");
	pattern = "\<\!--\\s+END_BLOCK\\s+" + svarname + "\\s+-->";
	rx.compile(pattern);
	child = child.replace(rx, "");

	this.setVar(svarname, child);
	this.setVar(sparent, father);
	return(true); 
}

function jst_getVar(varname)
{
  var key, result;
  if (typeof(varname) == "object")
    for (key in varname)
      result[key] = this.f_arrVars[key];
  else
    result = this.f_arrVars[varname];
  if (typeof(result) == "undefined")
    result = "";
  return(result);
}

function jst_getVars()
{
  var key, result;
  result = new Array();
  for (key in this.f_arrVars)
    result[key] = this.f_arrVars[key];
  return(result); 
}

function jst_subst(svarname)
{
  var str, key, rx, pattern;
  if (!this.loadFile(svarname))
  {
    this.halt("subst: unable to load '" + svarname + "'.");
    return(false);
  }
  str = this.getVar(svarname); 
  pattern = "";
  rx = new RegExp(pattern);
  for (key in this.f_arrVars)
  {
    pattern = "{" + key + "}";
    rx.compile(pattern, "g");
    str = str.replace(rx, this.f_arrVars[key]);
  } 
  return(str);
}

function jst_psubst(svarname)
{
  Response.Write(this.subst(svarname));
}

function jst_parse(target, svarname, bappend)
{
  var key, str;
  if (typeof(target) == "object")
  {
    for (key in target)
    {
      str = this.subst(target[key]);
      this.setVar(key, str);
    }
  }
  else
  {
    str = this.subst(svarname);
    if (bappend)
      this.setVar(target, this.getVar(target) + str);
    else
      this.setVar(target, str);
  }
  return(str);
}

function jst_pparse(target, svarname, bappend)
{
  Response.Write(this.parse(target, svarname, bappend));
}

function jst_print(varname)
{
  var str;
  str = this.getVar(varname);
  Response.Write(this.finish(str));
}

function jst_get(varname)
{
  var str;
  str = this.getVar(varname);
  return(this.finish(str));
}

</SCRIPT>