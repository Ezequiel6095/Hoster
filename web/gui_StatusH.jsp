
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page language="java" import="java.sql.*" errorPage="../error.jsp"%>
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
        <link href="CSS/Style_StatusH.css" rel="stylesheet"/> 
        <link rel="icon" href="IMG/LOGO.png">
        <title>Status Habitaciones</title>
    </head> 
               
        <script language="javascript">
            function buscar(url){
                open(url,'Busqueda','toolbar=no, width=600, height=600,\n\ status=yes, scrollbars=no, resize=yes, menubar=no');
            }
        </script>    
                         
        <form action="sql_StatusH.jsp" name="gui_StatusH" method="POST">         
                     
          <table  align="center"  id="referenciales" border="0">    
           <tr>  
                  <td  colspan="3" class="GridHeader"> <center><B>Estado de Habitaciones</B> </center></td>                 
           </tr>
          
           <%-- INICIO DE LAS TABLAS --%>
           <tr>
              <td COLSPAN="1" align="left">                 
              <td align="left">IdHabitacion</td>
              <td><input class="borderColorText" maxlength="15" type="number" name="codigo" size=10  value="" value="<%=request.getParameter("codigo")%>" ></td> 
           </tr>   
           
           <%-- Inicio de la tabla con FK--%>
           <tr>
                <td align="left"></td>
              <td align="left">Tipo De Habitacion</td>   
              <td>   
                  <select id="<%=request.getParameter("tipo1")%>" name="tipo" disabled="true">
                    <option value=""> &lt;---Seleccione una opción---></option>
                    <%
                    Connection cone1 = conexion.crearConexion();
                    dataSource.setConexion(cone1);
                    StringBuffer s1 = new StringBuffer("");
                    s1.append("SELECT idTipoHabitacion, tipo_habitacion FROM tipohabitacion");
                    ResultSet rs1 = dataSource.ObtenerDatoCombo(s1.toString());

                    while(rs1.next())
                        {
                        String id = rs1.getString(1);  
                        String name = rs1.getString(2);
                        out.println("<option value=\"" + id + "\">" + id + " " + name + "</option>");
                        }
                        rs1.close();
                        %>
                </select>
               </td>   
           </tr>
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Estado</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="estado" size=50 required=”required” disabled="true" value="" value="<%=request.getParameter("estado")%>"></td>         
           </tr> 
           
           <tr>
              <td COLSPAN="1" align="left"> 
              <td align="left">Descripcion</td>
              <td><input class="borderColorText" maxlength="50" type="text" name="descripcion" size=50 required=”required” disabled="true" value="" value="<%=request.getParameter("descripcion")%>"></td>         
           </tr>
           
           
           
          
          
          <%-- Inicio de botones--%>
          
            <tr> 
                 <td COLSPAN="1" align="left"> 
                 <td> <input class="boton" type="button" value="Nuevo" name="btnnuevo" onclick="gen_cod(),des_btn(),hab_text()"> </td>             
                 <td> <input class="boton" type="submit" value="Modificar" value="<%=request.getParameter("btnmodi")%>" name="btnmodi" disabled="disabled" onclick="mensaje_editar()" > </td>              
                 
           </tr>   
           
           <tr> 
               <td COLSPAN="1" align="left">  
               <td> <input class="boton" type="submit" value="Borrar" value="<%=request.getParameter("btnborrar")%>" name="btnborrar" disabled="disabled" onclick="des_text(),mensaje_borrar()">  </td>                             
                               
               <td> <input class="boton" type="reset"  value="Cancelar" name="btncancelar" disabled="disabled" onclick="des_text(),hab_btn(),clear_text()"> </td>
                
           </tr> 
           
           <tr> 
                <td COLSPAN="1" align="left">               
                <td> <input class="boton" type="button" value="Salir" name="btnsalir" onclick="location.href='menu.jsp'"> </td>
                <td> <input class="boton" type="submit" value="Grabar" name="btngrabar" value="<%=request.getParameter("btngrabar")%>" disabled="disabled" onclick="mensaje_agregar()"> </td>
                
           </tr> 
                     
        </table>   
        
        <%--CARGA LA GRILLA --%> 
                
        <%
        Connection conn2 = conexion.crearConexion();
        dataSource.setConexion(conn2);
        StringBuffer sql2 = new StringBuffer("");
        sql2.append("SELECT idHabitacion, idTipoHabitacion, estado, descripcion FROM habitacion");
        ResultSet tabla= dataSource.ObtenerDatogrilla(sql2.toString());
        out.println("<table width='600' HEIGHT='20' align='center' border=3 CellPadding=3><tr bgcolor='#E3E0E0'>");
        out.println("<th>IdHabitacion</th><th>IdTipoHabitacion</th><th>Estado</th><th>Descripcion</th></tr>");
        while(tabla.next()){
          out.println("<tr>");
          out.println("<td>"+tabla.getString(1)+"</td>");
          out.println("<td>"+tabla.getString(2)+"</td>");
          out.println("<td>"+tabla.getString(3)+"</td>");
          out.println("<td>"+tabla.getString(4)+"</td>");
         %>
         
        <td align='center'>  <a method='post' action='' style='display:inline;' name='' 
        href='javascript:retornar("<%=tabla.getString(1)%>","<%=tabla.getString(2)%>","<%=tabla.getString(3)%>","<%=tabla.getString(4)%>")'>
        <img src='IMG/editar.png' class="imagen" border='0' alt='Elegir'></a></td>
         
         
        <%
               
          out.println("</tr>");
        }
        out.println("</table>");
        tabla.close();
        %>        
            
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

       
    </body>     

    <script language="javascript">
        function gen_cod(){           
            //document.frmcargo.descrip.disabled=false;
           <%
            Connection conn = conexion.crearConexion();
            dataSource.setConexion(conn);
            StringBuffer sql = new StringBuffer("");
            sql.append("SELECT IFNULL(MAX(idHabitacion),0)+1 AS cod FROM habitacion");
            ResultSet res1= dataSource.obtenerDato(sql.toString());
            res1.next();
            String codigo = res1.getString("cod");

          %>           
           document.gui_StatusH.codigo.value="<%=codigo%>";
        }

        function des_btn(){
            document.gui_StatusH.btnnuevo.disabled=true;
            document.gui_StatusH.btnmodi.disabled=true;
            document.gui_StatusH.btnborrar.disabled=true;
            document.gui_StatusH.btnsalir.disabled=true;
            document.gui_StatusH.btngrabar.disabled=false;
            document.gui_StatusH.btncancelar.disabled=false;
        }
        function hab_btn(){
            document.gui_StatusH.btnnuevo.disabled=false;
            document.gui_StatusH.btnmodi.disabled=true;
            document.gui_StatusH.btnborrar.disabled=true;
            document.gui_StatusH.btnsalir.disabled=false;
            document.gui_StatusH.btngrabar.disabled=true;
            document.gui_StatusH.btncancelar.disabled=true;
        }

        function hab_boton(){
            document.gui_StatusH.btnnuevo.disabled=true;
            document.gui_StatusH.btnmodi.disabled=false;
            document.gui_StatusH.btnborrar.disabled=false;
            document.gui_StatusH.btnsalir.disabled=true;
            document.gui_StatusH.btngrabar.disabled=true;
            document.gui_StatusH.btncancelar.disabled=false;
        }
        
        function hab_text()
        {
            document.gui_StatusH.codigo.disabled=false;
            document.gui_StatusH.tipo.disabled=false;
            document.gui_StatusH.estado.disabled=false;           
            document.gui_StatusH.descripcion.disabled=false;   

        }
         
         
        function des_text()
        {
            
            document.gui_StatusH.tipo.disabled=true;
            document.gui_StatusH.estado.disabled=true;           
            document.gui_StatusH.descripcion.disabled=true; 

        }
        
        function retornar(campo1,campo2,campo3,campo4)
        {
           document.gui_StatusH.codigo.value=campo1;
           document.gui_StatusH.tipo.value=campo2;
           document.gui_StatusH.descripcion.value=campo3;
           document.gui_StatusH.estado.value=campo4;
                
           
           hab_text();
           hab_boton();
        }
        
         function clear_text()
        {
            document.gui_StatusH.codigo.value="";
            document.gui_StatusH.tipo.value="";
            document.gui_StatusH.descripcion.value="";
            document.gui_StatusH.estado.value="";
        }
        
        function mensaje_agregar()
        {
            document.gui_StatusH.mensaje.disabled=true;
            document.gui_StatusH.mensaje.value="El registro ha sido agregado";
        }
        
        function mensaje_borrar()
        {
            document.gui_StatusH.mensaje.disabled=true;
            document.gui_StatusH.mensaje.value="El registro ha sido borrardo";
        }
        
        function mensaje_editar()
        {
            document.gui_StatusH.mensaje.disabled=true;
            document.gui_StatusH.mensaje.value="El registro ha sido modificado";
        }
       
    </script>
              
</html>
