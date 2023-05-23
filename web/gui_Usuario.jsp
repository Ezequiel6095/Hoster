<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page language="java" import="java.sql.*" errorPage="../Error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include  file="controles/chequearsesion.jsp" %>
<%
    String vusuario = (String) sesionOk.getAttribute("usuario");
%>

<jsp:useBean id="conexion" class="prgs.bdconexion" scope="page"/>
<jsp:useBean id="dataSource" class="prgs.enviosentenciasql" scope="page">    
<jsp:setProperty name="dataSource" property="*"/>
</jsp:useBean>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="imagenes/milogo.jpg" rel="shortcut icon">
        <link href="CSS/Style_MenuUsuario.css" rel="stylesheet"/> 
        <link rel="icon" href="IMG/LOGO.png">
        <title>Perfiles</title>
    </head>  
        
    <body>
        <script language="javascript">
            function buscar(url){
                open(url,'Busqueda','toolbar=no, width=600, height=600,\n\ status=yes, scrollbars=no, resize=yes, menubar=no');
            }
        </script>    
                         
        <form action="sql_Usuario.jsp" name="gui_Usuario" method="POST">         
                                      
          <table  align="center"  id="referenciales" border="1">    
           <tr>  
                  <td  colspan="3" class="GridHeader"> <center><B>Perfiles Registrados</B> </center></td>                 
           </tr>
          
          <%-- 
                LOS OBJETOS LOS TEXT
          --%>

            <tr>
              <td COLSPAN="1" align="left">                 
              <td align="left">idUsuario</td>
              <td><input class="codigomar borderColorText" maxlength="15" type="number" name="idUsuario" size= 10  value="" value="<%=request.getParameter("idUsuario")%>" >  </td> 
           </tr> 

           <tr>
              <td COLSPAN="1" align="left">                 
              <td align="left">Nick</td>
              <td><input class="borderColorText" maxlength="15" type="text" name="nick" size= 10  value="" value="<%=request.getParameter("nick")%>" >  </td> 
           </tr>   
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Password</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="pass" size=50 disabled="true" value="" value="<%=request.getParameter("pass")%>" > </td>         
           </tr>                                                       
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Nivel</td>
              <td><input class="borderColorText" maxlength="50" type="number" name="nivel" size=50 disabled="true" value="" value="<%=request.getParameter("nivel")%>" > </td>         
           </tr>    
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Estado</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="estado" size=50 disabled="true" value="" value="<%=request.getParameter("estado")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Nombre</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="nombre" size=50 disabled="true" value="" value="<%=request.getParameter("nombre")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Direccion</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="direccion" size=50 disabled="true" value="" value="<%=request.getParameter("direccion")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Correo</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="mail" size=50 disabled="true" value="" value="<%=request.getParameter("mail")%>" > </td>         
           </tr>  
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Telefono</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="telefono" size=50 disabled="true" value="" value="<%=request.getParameter("telefono")%>" > </td>         
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
                <td> <input class="boton" type="button" value="Salir" name="btnsalir" onclick="location.href='menu.jsp'"> </td>
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
        sql2.append("SELECT idUsuario,nick, pass, nivel,estado,nombre,direccion,mail,telefono FROM usuario");
        ResultSet tabla= dataSource.ObtenerDatogrilla(sql2.toString());
        out.println("<table width='600' HEIGHT='20' align='center' border=3 CellPadding=3><tr bgcolor='#E3E0E0'>");
        out.println("<th>idUsuario</th> <th>nick</th> <th>pass</th> <th>nivel</th> <th>estado</th> <th>nombre</th> <th>direccion</th> <th>mail</th> <th>telefono</th> </tr>");
        while(tabla.next())
        {
          out.println("<tr>");
          out.println("<td>"+tabla.getString(1)+"</td>");
          out.println("<td>"+tabla.getString(2)+"</td>"); 
          out.println("<td>"+tabla.getString(3)+"</td>"); 
          out.println("<td>"+tabla.getString(4)+"</td>");
          out.println("<td>"+tabla.getString(5)+"</td>");
          out.println("<td>"+tabla.getString(6)+"</td>");
          out.println("<td>"+tabla.getString(7)+"</td>");
          out.println("<td>"+tabla.getString(8)+"</td>");
          out.println("<td>"+tabla.getString(9)+"</td>"); 
          
         %>
         
        <td align='center'>  <a method='post' action='' style='display:inline;' name='' 
        href='javascript:retornar("<%=tabla.getString(1)%>","<%=tabla.getString(2)%>","<%=tabla.getString(3)%>","<%=tabla.getString(4)%>","<%=tabla.getString(5)%>","<%=tabla.getString(6)%>","<%=tabla.getString(7)%>","<%=tabla.getString(8)%>","<%=tabla.getString(9)%>")'>
                <img src='IMG/editar.png' class="imagen" border='0' alt='Elegir'></a></td>
         
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
                  <td> <b>Usuario:</b> <%=vusuario%> </td>                
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
    
    <script language="javascript">
        function gen_cod()
        {           
           <%
            Connection conn = conexion.crearConexion();
            dataSource.setConexion(conn);
            StringBuffer sql = new StringBuffer("");
            sql.append("SELECT IFNULL(MAX(idUsuario),0)+1 AS cod FROM usuario");
            ResultSet res1= dataSource.obtenerDato(sql.toString());
            res1.next();
            String codigo = res1.getString("cod");

          %>           
           document.querySelector(".codigomar").value="<%=codigo%>";
        }
        
        function hab_txt()
        {
           document.gui_Usuario.idUsuario.disabled=false;
           document.gui_Usuario.nick.disabled=false;
           document.gui_Usuario.pass.disabled=false;
           document.gui_Usuario.nivel.disabled=false;
           document.gui_Usuario.estado.disabled=false;
           document.gui_Usuario.nombre.disabled=false;
           document.gui_Usuario.direccion.disabled=false;
           document.gui_Usuario.mail.disabled=false;
           document.gui_Usuario.telefono.disabled=false;
         }
        function des_btn()
        {
            document.gui_Usuario.btnnuevo.disabled=true;
            document.gui_Usuario.btnmodi.disabled=true;
            document.gui_Usuario.btnborrar.disabled=true;
            document.gui_Usuario.btnsalir.disabled=true;
            document.gui_Usuario.btngrabar.disabled=false;
            document.gui_Usuario.btncancelar.disabled=false;
        }
        function hab_btn()
        {
            document.gui_Usuario.btnnuevo.disabled=false;
            document.gui_Usuario.btnmodi.disabled=true;
            document.gui_Usuario.btnborrar.disabled=true;
            document.gui_Usuario.btnsalir.disabled=false;
            document.gui_Usuario.btngrabar.disabled=true;
            document.gui_Usuario.btncancelar.disabled=true;
        }

        function hab_boton()
        {
            document.gui_Usuario.btnnuevo.disabled=true;
            document.gui_Usuario.btnmodi.disabled=false;
            document.gui_Usuario.btnborrar.disabled=false;
            document.gui_Usuario.btnsalir.disabled=true;
            document.gui_Usuario.btngrabar.disabled=true;
            document.gui_Usuario.btncancelar.disabled=false;
        }
        
        function des_text()
        {
           document.gui_Usuario.idUsuario.disabled=true;
           document.gui_Usuario.nick.disabled=true;
           document.gui_Usuario.pass.disabled=true;
           document.gui_Usuario.nivel.disabled=true;
           document.gui_Usuario.estado.disabled=true;
           document.gui_Usuario.nombre.disabled=true;
           document.gui_Usuario.direccion.disabled=true;
           document.gui_Usuario.mail.disabled=true;
           document.gui_Usuario.telefono.disabled=true;
        }
        
        function clear_text()
        {
           document.gui_Usuario.idUsuario.value="";
           document.gui_Usuario.nick.value="";
           document.gui_Usuario.pass.value="";
           document.gui_Usuario.nivel.value="";
           document.gui_Usuario.estado.value="";
           document.gui_Usuario.nombre.value="";
           document.gui_Usuario.direccion.value="";
           document.gui_Usuario.mail.value="";
           document.gui_Usuario.telefono.value="";
        }
        
        function retornar(campo0,campo1,campo2,campo3,campo4,campo5,campo6,campo7,campo8)
        {
           document.gui_Usuario.idUsuario.value=campo0;
           document.gui_Usuario.nick.value=campo1;
           document.gui_Usuario.pass.value=campo2;
           document.gui_Usuario.nivel.value=campo3;
           document.gui_Usuario.estado.value=campo4;
           document.gui_Usuario.nombre.value=campo5;
           document.gui_Usuario.direccion.value=campo6;
           document.gui_Usuario.mail.value=campo7;
           document.gui_Usuario.telefono.value=campo8;
            
           hab_txt();
           hab_boton();
        }
       
        function mensaje_agregar()
        {
            document.gui_Usuario.mensaje.disabled=true;
            document.gui_Usuario.mensaje.value="El registro ha sido insertado";
        }
        
        function mensaje_borrar()
        {
            document.gui_Usuario.mensaje.disabled=true;
            document.gui_Usuario.mensaje.value="El registro ha sido borrardo";
        }
        
        function mensaje_editar()
        {
            document.gui_Usuario.mensaje.disabled=true;
            document.gui_Usuario.mensaje.value="El registro ha sido modificado";
        }
       
    </script>
                                                        
</html>
