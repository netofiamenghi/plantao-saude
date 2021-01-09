<%-- 
    Document   : principal
    Created on : 26/10/2016, 20:31:34
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Plantão Saúde - Administração</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">       
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><%=request.getSession().getAttribute("boasVindas")%></h1>
                    </div>
                </div>               
            </div>
    </body>
</html>