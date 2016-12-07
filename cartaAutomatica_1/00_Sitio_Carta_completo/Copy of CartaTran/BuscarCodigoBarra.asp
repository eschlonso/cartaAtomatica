<%@language=JScript%>
<!--#include file="includes/adojavas.inc"-->
<!--#include file="includes/config.dbconn.js.asp"-->
<!--#include file="classes/class.db.js.asp"-->
<%

		objDB = new DB(arrConn)
        //aca poner la session con el id del usuario
        sQuery = "EXEC UP_OBTENER_CODIGO_BARRA " + Session("userId")

        objDB.query(sQuery)

        rs = objDB.each()


        Response.Write(rs.CodigoBarra)
        Response.End()

    //    Response.Write(rs.CodigoBarra)
        
  //      Response.End
                
        Response.Redirect("imprimir.asp?codbarra=" + rs.CodigoBarra)
        
		//Response.Write("<img src=CreateImg.asp?BackColor=White&BarColor=Black&CheckDigit=False&CheckDigitToText=false&Data=70501003203425020121000008000001209617&NarrowBarWidth=0.04&Orientation=0&Symbology=12&ShowText=ON&Wide2NarrowRatio=2.0>")



%>