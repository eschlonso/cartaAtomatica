<%
  dim strServer, strUserId, strPassword, strDataBase, strConnection, oCon
  'Pisol local
  strServer		= "192.168.1.201"
  strUserId		= "webuser"
  strPassword	= "PH0J3T21"
  strDataBase 	= "WebCarta"


  strConnection =  "DRIVER=SQL Server;SERVER=" & strServer & ";UID="& strUserId & ";APP=Microsoft Development Environment;DATABASE=" & strDataBase &  ";Network=DBMSSOCN;Address=" & strServer  &  ";User Id=" & strUserId  &  ";PASSWORD=" & strPassword &  ";LOGINTIMEOUT=60;Connect Timeout=60;pageTimeout=10;DBPROP_INIT_GENERALTIMEOUT=60;DBPROP_COMMANDTIMEOUT=0"
  Set Conn = server.CreateObject("ADODB.Connection")
  Conn.Open strConnection

%>