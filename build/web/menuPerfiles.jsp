<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page language="java" import="java.sql.*" errorPage="../Error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include  file="controles/chequearsesion.jsp" %>
<%
    String usuariodelacceso = (String) request.getSession().getAttribute("nombre");
    String nivel = (String) sesionOk.getAttribute("nivel");
 %>

<jsp:useBean id="conexion" class="prgs.bdconexion" scope="page"/>
<jsp:useBean id="dataSource" class="prgs.enviosentenciasql" scope="page">    
<jsp:setProperty name="dataSource" property="*"/>
</jsp:useBean>

<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Style_Menu.css" rel="stylesheet"/>
        <title>Perfiles</title>
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
  <a href="#"><i class="fas fa-desktop"></i><span>Panel</span></a>
  <a href="menuPerfiles.jsp"><i class="fas fa-cogs"></i><span>Perfiles</span></a>
  <a href="#"><i class="fas fa-table"></i><span>Reservas</span></a>
  <a href="#"><i class="fas fa-info-circle"></i><span>Referencias</span></a>
</div>
<!--Sidebar end--->
<div class="content">
  <script language="javascript">
            function buscar(url){
                open(url,'Busqueda','toolbar=no, width=600, height=600,\n\ status=yes, scrollbars=no, resize=yes, menubar=no');
            }
        </script>    
                         
        <form action="sql_marcas.jsp" name="gui_marcas" method="POST">         
                                      
          <table  align="center"  id="referenciales" border="1">    
           <tr>  
                  <td  colspan="3" class="GridHeader"> <center><B>Perfiles</B> </center></td>                 
           </tr>
          
          <%-- 
                LOS OBJETOS LOS TEXT
          --%>

           <tr>
              <td COLSPAN="1" align="left">                 
              <td align="left">Usuario</td>
              <td><input class="borderColorText" maxlength="15" type="number" name="Nick" size= 10  value="" value="<%=request.getParameter("codigomar")%>" >  </td> 
           </tr>   
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Nivel</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="nivel" size=50 disabled="true" value="" value="<%=request.getParameter("descrip")%>" > </td>         
           </tr>                                                       
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Estado</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="Estado" size=50 disabled="true" value="" value="<%=request.getParameter("procede")%>" > </td>         
           </tr>    
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Nombre</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="Nombre" size=50 disabled="true" value="" value="<%=request.getParameter("procede")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Correo</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="mail" size=50 disabled="true" value="" value="<%=request.getParameter("procede")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Telefono</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="Telefono" size=50 disabled="true" value="" value="<%=request.getParameter("procede")%>" > </td>         
           </tr>  
           
           
            <%-- 
                LOS BOTONES
            --%>
          
           <tr> 
                 <td COLSPAN="1" align="left"> 
                 <td> <input class="boton" type="button" value="Nuevo" name="btnnuevo" onclick="gen_cod(),des_btn(),hab_txt()"> </td>             
                 <td> <input class="boton" type="submit" value="Modificar" disabled="true" value="<%=request.getParameter("btnmodi")%>" name="btnmodi" onclick="mensaje_editar()" > </td>              
                 
           </tr>   
           
           <tr> 
               <td COLSPAN="1" align="left">  
               <td> <input class="boton" type="submit" value="Borrar" disabled="true" value="<%=request.getParameter("btnborrar")%>" name="btnborrar" onclick="mensaje_borrar()">  </td>                             
                               
               <td> <input class="boton" type="reset"  value="Cancelar" name="btncancelar" disabled="true" onclick="des_text(),hab_btn(),clear_text()"> </td>
                
           </tr> 
           
           <tr> 
                <td COLSPAN="1" align="left">               
                <td> <input class="boton" type="button" value="Salir" name="btnsalir" onclick="location.href='MenuPrincipal.jsp'"> </td>
                <td> <input class="boton" type="submit" value="Grabar" name="btngrabar" value="<%=request.getParameter("btngrabar")%>" disabled="disabled" onclick="mensaje_agregar()"> </td>
                
           </tr> 
                     
        </table>   
        
        <%-- 
                CARGA LA GRILLA
        --%>
       
        <%
        Connection conn2 = conexion.crearConexion();
        dataSource.setConexion(conn2);
        StringBuffer sql2 = new StringBuffer("");
        sql2.append("SELECT Nick,nivel,Estado,Nombre,Mail,Telefono FROM usuario");
        ResultSet tabla= dataSource.ObtenerDatogrilla(sql2.toString());
        out.println("<table width='600' HEIGHT='20' align='center' border=3 CellPadding=3><tr bgcolor='#E3E0E0'>");
        out.println("<th>Nick</th><th>nivel</th><th>Estado</th><th>Nombre</th>><th>Mail</th>><th>Telefono</th></tr>");
        while(tabla.next())
        {
          out.println("<tr>");
          out.println("<td>"+tabla.getString(1)+"</td>");
          out.println("<td>"+tabla.getString(2)+"</td>"); 
          out.println("<td>"+tabla.getString(3)+"</td>"); 
          out.println("<td>"+tabla.getString(4)+"</td>");
          out.println("<td>"+tabla.getString(5)+"</td>");
          out.println("<td>"+tabla.getString(6)+"</td>");
          
         %>
         
        <td align='center'>  <a method='post' action='' style='display:inline;' name='' 
        href='javascript:retornar("<%=tabla.getString(1)%>","<%=tabla.getString(2)%>","<%=tabla.getString(3)%>","<%=tabla.getString(4)%>","<%=tabla.getString(5)%>","<%=tabla.getString(6)%>")'><img
        src='imagenes/lapiz.png' border='0' alt='Elegir'></a></td>
         
        <%    
          out.println("</tr>");
        }
        out.println("</table>");
        tabla.close();
        %>        
        
        <%-- 
                LOS MENSAJES
        --%>
        
            <table  align="center"  id="referenciales" border="0">    
              <tr>  
                  <td> <b>Usuario Activo:</b> <%=vusuario%> </td>                
              </tr>
           </table> 
            
            <table  align="center"  id="referenciales" border="0">    
                 <tr> 
                    <td> <b>MENSAJE</b></td>  
                    <td><input class="borderColorText" maxlength="50" type="text" name="mensaje" size=50 value="" value="<%=request.getParameter("mensaje")%>" > </td>
                  </tr>
            </table> 
                
        </form>
        
       <hr>                 
    </body>
    
    
     <%-- 
        LAS FUNCIONES 
     --%>
    
    <script lenguage="javascript">
        function gen_cod()
        {           
            //document.frmcargo.descrip.disabled=false;
           <%
            Connection conn = conexion.crearConexion();
            dataSource.setConexion(conn);
            StringBuffer sql = new StringBuffer("");
            sql.append("SELECT IFNULL(MAX(idUsuario),0)+1 AS cod FROM usuario");
            ResultSet res1= dataSource.obtenerDato(sql.toString());
            res1.next();
            String codigo = res1.getString("cod");

          %>           
           document.gui_marcas.codigomar.value="<%=codigo%>";
        }
        
        function hab_txt()
        {
            document.gui_marcas.descrip.disabled=false;
            document.gui_marcas.procede.disabled=false;
         }
        function des_btn()
        {
            document.gui_marcas.btnnuevo.disabled=true;
            document.gui_marcas.btnmodi.disabled=true;
            document.gui_marcas.btnborrar.disabled=true;
            document.gui_marcas.btnsalir.disabled=true;
            document.gui_marcas.btngrabar.disabled=false;
            document.gui_marcas.btncancelar.disabled=false;
        }
        function hab_btn()
        {
            document.gui_marcas.btnnuevo.disabled=false;
            document.gui_marcas.btnmodi.disabled=true;
            document.gui_marcas.btnborrar.disabled=true;
            document.gui_marcas.btnsalir.disabled=false;
            document.gui_marcas.btngrabar.disabled=true;
            document.gui_marcas.btncancelar.disabled=true;
        }

        function hab_boton()
        {
            document.gui_marcas.btnnuevo.disabled=true;
            document.gui_marcas.btnmodi.disabled=false;
            document.gui_marcas.btnborrar.disabled=false;
            document.gui_marcas.btnsalir.disabled=true;
            document.gui_marcas.btngrabar.disabled=true;
            document.gui_marcas.btncancelar.disabled=false;
        }
        
      
        function des_descri()
        {
            document.gui_marcas.descrip.disabled=false;
        }
        
        function des_text()
        {
            document.gui_marcas.codigomar.disabled=true;
            document.gui_marcas.descrip.disabled=true;
            document.gui_marcas.procede.disabled=true;
        }
        
        function clear_text()
        {
            document.gui_marcas.codigomar.value="";
            document.gui_marcas.descrip.value="";
            document.gui_marcas.procede.value="";
        }
        
        function retornar(campo1,campo2,campo3)
        {
           document.gui_marcas.codigomar.value=campo1;
           document.gui_marcas.descrip.value=campo2;
           document.gui_marcas.procede.value=campo3;
            
           hab_txt();
           hab_boton();
        }
       
        function mensaje_agregar()
        {
            document.gui_marcas.mensaje.disabled=true;
            document.gui_marcas.mensaje.value="El registro ha sido insertado";
        }
        
        function mensaje_borrar()
        {
            document.gui_marcas.mensaje.disabled=true;
            document.gui_marcas.mensaje.value="El registro ha sido borrardo";
        }
        
        function mensaje_editar()
        {
            document.gui_marcas.mensaje.disabled=true;
            document.gui_marcas.mensaje.value="El registro ha sido modificado";
        }
       
    </script>
</div>
    </body>
</html>
