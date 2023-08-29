<%@include  file="controles/chequearsesion.jsp" %>
<%
    String vusuario = (String) sesionOk.getAttribute("usuario");
%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="imagenes/milogo.jpg" rel="shortcut icon">
        
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS/alertify.core.css">
        <link rel="stylesheet" type="text/css" href="CSS/alertify.default.css">
        <link rel="stylesheet" type="text/css" href="CSS/TipoH.css">
        
        <title>USUARIOS +</title>
    </head>
    <body>
        <h1 class="texto">USUARIOS +</h1>
        <div class="container" style="padding-top: 15px;">
            <div class="row">
                <div class="col-md-12">

                    <form id="formulario" class="form-horizontal" role="form">
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <label class="control-label" for="codigo">Código</label> 
                            </div>
                            <div class="col-md-2">
                                <input type="text" name="txtcodigo" id="txtcodigo" class="form-control" placeholder="Autoincrementable" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <label class="control-label" for="codigo">NICK</label> 
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="txtnick" id="txtnick" class="form-control" placeholder="Ingrese Ubicacion" disabled=""/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <label class="control-label" for="codigo">NIVEL</label> 
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="txtnivel" id="txtnivel" class="form-control" placeholder="Ingrese NIVEL" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <label class="control-label" for="codigo">ESTADO</label> 
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="txtestado" id="txtestado" class="form-control" placeholder="Ingrese ESTADO" />
                            </div>
                        </div>                     
                        
                         <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <label class="control-label" for="codigo">TELEFONO</label> 
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="txttelefono" id="txttelefono" class="form-control" placeholder="Ingrese TELEFONO" />
                            </div>
                        </div>
                        

                        <div class="form-group">
                            <div class="col-md-3"></div>
                            
                            <div class="col-md-2">
                                <input id="btnAgregar" type="button" class="form-control btn-primary" value="Agregar" onclick="agregar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnModificar" type="button" class="form-control btn-warning" value="Modificar" onclick="modificar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnBorrar" type="button" class="form-control btn-danger" value="Borrar" onclick="borrar();"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <input id="btnCancelar" type="button" class="form-control btn-info" value="Cancelar" disabled="" onclick="cancelar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnGrabar" type="button" class="form-control btn-success" value="Grabar" disabled="" onclick="grabar();"/>
                            </div>
                            <div class="col-md-2">
                                <a href="menu.jsp"><input id="btnSalir" type="button" class="form-control btn-default" value="Salir"></a>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-4">
                                <input type="text" name="txtbuscador" id="txtbuscador" class="form-control" placeholder="Ingrese datos a buscar"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnBuscar" type="button" class="form-control btn-primary" value="Buscar" onclick="get_datos($('#txtbuscador').val());$('#txtbuscador').val('');">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <table class="table table-hover" id="grilla">
                                    <thead>
                                        <tr>
                                            <th class="warning editable">Código</th>
                                            <th class="warning editable">Nick</th>
                                            <th class="warning editable">Nivel</th>
                                            <th class="warning editable">Estado</th>
                                            <th class="warning editable">Telefono</th>
                                        </tr>
                                    
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <input type="hidden" id="operacion"/>
                    </form>
                </div>
            </div>
        </div>
        <script src="JS/jquery-1.12.2.min.js"></script> 
        <script src="JS/bootstrap.min.js"></script> 
        <script src="JS/alertify.js"></script> 
        <script src="sql_ciudadBoot.js"></script>
    </body>
</html>
