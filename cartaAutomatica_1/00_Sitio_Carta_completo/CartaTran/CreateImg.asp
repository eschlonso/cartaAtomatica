<%
    Dim ActualWidth
    Dim ActualHeight 
    Dim Orientation
  Function GetColorValue(ColorName)
    dim ColorValue
		
	 if (ColorName = "White") then
		ColorValue = 255 + 255*256 + 255*256*256 
	 elseif (ColorName = "Blue") then
	    ColorValue = 255*256*256   
	 elseif (ColorName = "Green") then
	    ColorValue = 255*256 
	 elseif (ColorName = "Red") then
	    ColorValue = 255 
	 elseif (ColorName = "Black") then
	    ColorValue = 0
	 end if
	 GetColorValue = ColorValue
   End Function
   
   Function DevolverModo(CodBarra) 
       DIM MyModo 
       FOR i = 1 TO LEN(CodBarra)
            IF Mid(CodBarra,i,1) = "-" THEN 
                MyModo = TRUE
                EXIT FOR
            ELSE 
               MyModo = FALSE
            END IF
       NEXT
	   DevolverModo = MyModo
   End Function
    
   ' do clear-out
   Response.Expires = 0
   Response.Buffer = TRUE
   Response.Clear

   ' image is of PNG format.
   Response.ContentType = "image/png"
   
   ' output barcode PNG image
   Set MyBarcode = Server.CreateObject("MW6BarcodeASP.BarcodeASP")
   MyBarcode.BackColor = GetColorValue(Request.QueryString("BackColor"))
   MyBarcode.BarColor = GetColorValue(Request.QueryString("BarColor"))
   MyBarcode.CheckDigit =  DevolverModo(Request.QueryString("Data")) 'CBool(Request.QueryString("CheckDigit")="ON")
   MyBarcode.CheckDigitToText = DevolverModo(Request.QueryString("Data")) 'CBool(Request.QueryString("CheckDigitToText")="ON")
   MyBarcode.Data = Request.QueryString("Data")
   MyBarcode.NarrowBarWidth = CDbl(Request.QueryString("NarrowBarWidth"))
   MyBarcode.Orientation = CInt(Request.QueryString("Orientation"))
   MyBarCode.BarHeight = 1.1
   MyBarcode.SymbologyType = CInt(Request.QueryString("Symbology"))
   MyBarcode.ShowText = CBool(Request.QueryString("ShowText")="ON")
   MyBarcode.Wide2NarrowRatio = CDbl(Request.QueryString("Wide2NarrowRatio"))
    



   ' change barcode text font here 
   ' font name is "Arial", size is 16, no Bold, no Italic
   call MyBarcode.SetTextFont("Arial", 12, False, False)
   
   Orientation = CInt(Request.QueryString("Orientation"))
   
   ' Get actual barcode width and height
    MyBarcode.GetActualSize ActualWidth, ActualHeight
  
   ' Image size = barcode size + extra space   
   if (Orientation = 0 or Orientation = 2) then
       MyBarcode.Width = 550
       MyBarcode.Height = 60
   else
       MyBarcode.Height = ActualWidth + 50
       MyBarcode.Width = ActualHeight + 40
   end if
   
   Response.BinaryWrite(MyBarcode.PNGImage)
   set MyBarcode = Nothing
   
   Response.End()
   
%>
