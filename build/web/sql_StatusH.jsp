<%@page import="prgs.bdconexion"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "prgs.bdconexion" %>
<%! bdconexion con = new bdconexion(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- FUNCA --%>

<%
if(request.getParameter("btnborrar") != null)
{  
    Statement instruccion=null;
    instruccion = con.crearConexion().createStatement();

    String id = request.getParameter("codigo");

    try 
    {
    instruccion.executeUpdate("DELETE from habitacion WHERE idHabitacion ="+id+";");
    response.sendRedirect("gui_StatusH.jsp");
    instruccion.close();

    } catch(SQLException e) {out.println(e);};
}
%>
 


<%
if(request.getParameter("btngrabar") != null)
{
Statement instruccion=null;
instruccion = con.crearConexion().createStatement();

String id = request.getParameter("codigo");
String idTipoHabitacion  = request.getParameter("tipo");
String estado   = request.getParameter("estado");
String descripcion   = request.getParameter("descripcion");

try {
instruccion.executeUpdate("INSERT INTO habitacion (idHabitacion, idTipoHabitacion, estado, descripcion) VALUES ("+id+", "+idTipoHabitacion+", '"+estado+"', '"+descripcion+"')");

response.sendRedirect("gui_StatusH.jsp");

instruccion.close();


} catch(SQLException e) {out.println(e);};

}
%>
        
<%
if(request.getParameter("btnmodi") != null)
{
    Statement instruccion=null;
    instruccion = con.crearConexion().createStatement();

    String id = request.getParameter("codigo");
    String idTipoHabitacion  = request.getParameter("tipo");
    String estado   = request.getParameter("estado");
    String descripcion   = request.getParameter("descripcion");
    
    try {
    instruccion.executeUpdate("update habitacion set idTipoHabitacion= '"+idTipoHabitacion+"',estado ='"+estado+"',descripcion ='"+descripcion+"' where idHabitacion =" +id+ ";");
    response.sendRedirect("gui_StatusH.jsp");
    instruccion.close();

    } catch(SQLException e) {
        out.println("Estado: " + estado + "\nId: " + id +
                "\nIdTipoHab: " + idTipoHabitacion + "\nDescripcion: " + descripcion);
        out.println(e);
    }

}
%>

  

