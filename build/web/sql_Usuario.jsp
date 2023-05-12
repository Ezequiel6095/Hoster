<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="prgs.bdconexion" %>
<%
bdconexion con = new bdconexion();
Connection conexion = con.crearConexion();
%>

<%
if(request.getParameter("btnborrar") != null)
{  
    Statement instruccion=null;
    String id = request.getParameter("idUsuario");
    try 
    {
        instruccion = conexion.createStatement();
        instruccion.executeUpdate("delete from Usuario where idUsuario =" + id + ";");
        response.sendRedirect("gui_Usuario.jsp");
        instruccion.close();
    } catch(SQLException e) {
        out.println(e);
    }
}
%>


<%
if(request.getParameter("btngrabar") != null)
{
    Statement instruccion=null;
    String nick = request.getParameter("nick");
    String Pass  = request.getParameter("pass");
    String nivel   = request.getParameter("nivel");
    String estado   = request.getParameter("estado");
    String nombre   = request.getParameter("nombre");
    String direccion   = request.getParameter("direccion");
    String mail   = request.getParameter("mail");
    String telefono   = request.getParameter("telefono");
    try {
        instruccion = conexion.createStatement();
        instruccion.executeUpdate("INSERT INTO Usuario(nick,pass,nivel,estado,nombre,direccion,mail,telefono) values('" + nick + "','" + Pass + "'," + nivel + "," + estado + ",'" + nombre + "','" + direccion + "','" + mail + "','" + telefono + "')");
        response.sendRedirect("gui_Usuario.jsp");
        instruccion.close();
    } catch(SQLException e) {
        out.println(e);
    }
}
%>




<%--        
<%
if(request.getParameter("btnmodi") != null)
{
    Statement instruccion=null;
    instruccion = con.crearConexion().createStatement();

    String nick = request.getParameter("nick");
    String des = request.getParameter("Pass");
    String nivel   = request.getParameter("nivel");
    String precio   = request.getParameter("precio");
    String iva   = request.getParameter("iva");
    String marca   = request.getParameter("combomarcas");
    
    try {
    instruccion.executeUpdate("update producto set prd_Pass = '"+des+"',gru_codigo ="+nivel+",Prd_pvta ="+precio+",Prd_iva ="+iva+",mar_cod ="+marca+" where prd_codigo =" +nick+ ";");
    response.sendRedirect("gui_Usuario.jsp");
    instruccion.close();

    } catch(SQLException e) {out.println(e);};

}
%>
--%>
  

