<% ' Insert.asp %>
<!--#include file="Loader.asp"-->
<%
   Response.Buffer = True
   if	Request.TotalBytes <150000 then
	   ' load object
	   Dim load
	   
		  Set load = new Loader
		  
		  ' calling initialize method
		  load.initialize

	   ' File binary data
	   Dim fileData
		  fileData = load.getFileData("file")
		  
	   ' File name
	   Dim fileName
		  fileName = LCase(load.getFileName("file"))
		  
	   ' File path
	   Dim filePath
		  filePath = load.getFilePath("file")

		  ' File path complete
	   Dim filePathComplete
		  filePathComplete = load.getFilePathComplete("file")
	   ' File size
	   Dim fileSize
		  fileSize = load.getFileSize("file")
	   ' File size translated
	   Dim fileSizeTranslated
		  fileSizeTranslated = load.getFileSizeTranslated("file")
	   ' Content Type
	  
	   Dim contentType
		  contentType = load.getContentType("file")
		  
	   ' No. of Form elements
	   
	   Dim countElements
		  countElements = load.Count
	   ' Value of text input field "name"

	   Dim nameInput
		  nameInput = load.getValue("name")
	   ' Path where file will be uploaded

	   Dim pathToFile
		  pathToFile = Server.mapPath("cvs/") & "\" & fileName
	   ' Uploading file data
		Dim fileUploaded
			fileUploaded = load.saveToFile ("file", pathToFile)
		
	   ' destroying load object
	   Set load = Nothing
	else
		fileUploaded = False
		fileName = ""
	end if
  
%>
<script>
window.open("rrhh.asp?estado=<%=cstr(fileUploaded)%>&file=<%=fileName%>", "_self");
</script>
