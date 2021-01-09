<%-- 
    Document   : login
    Created on : 26/10/2016, 20:21:15
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Plantão Saúde - Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/metisMenu.min.css" rel="stylesheet">
        <link href="css/sb-admin-2.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Por favor, efetue login</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" action="Logar" method="POST">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Login" name="login" type="text" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Senha" name="senha" type="password" value="">
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Lembre-me">Lembre-me
                                        </label>
                                    </div>
                                    <input type="submit" value="Logar" class="btn btn-lg btn-success btn-block"/>
                                </fieldset>
                            </form>
                        </div>
                        ${mensagem}
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/metisMenu.min.js"></script>
        <script src="js/sb-admin-2.js"></script>
    </body>
</html>
