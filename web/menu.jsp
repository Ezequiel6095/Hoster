<%-- 
    Document   : menu
    Created on : 14/04/2023, 07:23:33 PM
    Author     : exedi
--%>
<%@ page session="true" %>

<%@include  file="controles/chequearsesion.jsp" %>

<%
    String usuariodelacceso = (String) request.getSession().getAttribute("nombre");
    String nivel = (String) sesionOk.getAttribute("nivel");
 %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Style_Menu.css" rel="stylesheet"/>
        <link rel="icon" href="IMG/LOGO.png">
        <title>Hoster Menu</title>
    </head>
    <body>
        
        <input type="checkbox" id="check"> <%-- Barra para Contraer o desplegar menu --%>
        
<header>
  <label for="check">
    <i class="fas fa-bars" id="sidebar_btn"></i>
  </label>
  <div class="left-area">
    <h3>Hoster 💼</h3>
  </div>
  <div class="right-area">
      <a href="gui_acceso.jsp" class="logout_btn">Salir</a> <%-- Salir del usuario--%>
  </div>
</header>
        
<div class="sidebar">
  <center>
      <img src="IMG/USER.png" alt="" class="profile_image">
      <div class="nombre">
        <%=usuariodelacceso%>
      </div>
  </center>
  <a href="gui_marcas.jsp"><i class="fas fa-desktop"></i><span>Referenciales</span></a>
  <a href="gui_Usuario.jsp"><i class="fas fa-cogs"></i><span>Perfiles</span></a>
  <a href="#"><i class="fas fa-table"></i><span>Movimientos</span></a>
  <a href="#"><i class="fas fa-info-circle"></i><span>Informe</span></a>
  <a href="#"><i class="fas fa-info-circle"></i><span>Salir</span></a>
</div>
<!--Sidebar end--->
<div class="content">
  
    
</div>
    </body>
</html>
