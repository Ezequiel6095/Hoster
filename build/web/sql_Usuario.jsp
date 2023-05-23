
<%@page import="prgs.bdconexion"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%! bdconexion con = new bdconexion(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

if(request.getParameter("btnborrar") != null)
{ 
    Statement instruccion=null;
    instruccion = con.crearConexion().createStatement();

    String id = request.getParameter("idUsuario");

    try
    {
    instruccion.executeUpdate("delete from usuario where idUsuario ="+id+";");
    response.sendRedirect("gui_Usuario.jsp");
    instruccion.close();

    } catch(SQLException e) {out.println(e);};
}
%>
 
<%
if(request.getParameter("btngrabar") != null)
{
    Statement instruccion=null;
    instruccion = con.crearConexion().createStatement();

    String idUsuario    = request.getParameter("idUsuario");
    String nick   = request.getParameter("nick");
    String pass = request.getParameter("pass");
    String nivel = request.getParameter("nivel");
    String estado = request.getParameter("estado");
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String mail = request.getParameter("mail");
    String telefono = request.getParameter("telefono");
    // los demas values de los objetos de mi gui
    
    try 
    {
    instruccion.executeUpdate("insert into usuario(idUsuario,nick,pass,nivel,estado,nombre,direccion,mail,telefono) values("+idUsuario+","+nick+","+pass+","+nivel+","+estado+","+nombre+","+direccion+","+mail+","+telefono+");");

    response.sendRedirect("gui_Usuario.jsp");

    instruccion.close();


    } catch(SQLException e) {out.println(e);};

}
%>
       

<%
if(request.getParameter("btnmodi") != null)
{
   Statement instruccion=null;
   instruccion = con.crearConexion().createStatement();

    String idUsuario    = request.getParameter("idUsuario");
    String pass = request.getParameter("pass");
    String nivel = request.getParameter("nivel");
    String estado = request.getParameter("estado");
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String mail = request.getParameter("mail");
    String telefono = request.getParameter("telefono");
   
    try 
    {
    instruccion.executeUpdate("UPDATE usuario SET pass = '" + pass + "', nivel = '" + nivel + "', estado = '" + estado + "', nombre = '" + nombre + "', direccion = '" + direccion + "', mail = '" + mail + "', telefono = '" + telefono + "' WHERE idUsuario = " + idUsuario + ";");
    response.sendRedirect("gui_Usuario.jsp");
    instruccion.close();

    } catch(SQLException e) {out.println(e);};
}
%>


