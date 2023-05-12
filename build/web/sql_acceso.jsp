<%@ page session="true" %>
<%@ page language="java" import="java.sql.*"  %>

<jsp:useBean id="conexion" class="prgs.bdconexion" scope="page" />
<jsp:useBean id="dataSource" class="prgs.enviosentenciasql" scope="page"/>

<%
    // Crear objeto de conexion al DB
    Connection cn = conexion.crearConexion();
    // Asignar conexin al objeto manejador de datos
    dataSource.setConexion(cn);
    
    //parametros recibidos de gui_acceso y los guarda en variables
    String usu = request.getParameter("usuario") != null ? request.getParameter("usuario") : "";
    String cla = request.getParameter("clave") != null ? request.getParameter("clave") : "";    
    //
    
    String sql = "select idUsuario,Nick,Pass,nivel,Estado,Nombre from usuario where Nick = '" + usu + "' and Pass = '" + cla + "' and Estado='Activo'" ;
    ResultSet rs = dataSource.obtenerDato(sql);
    //si encuentra y contrase�a es correcta y esta activo
    if (rs.next()) 
    {
        //variables para enviar a las diferentes paginas
        HttpSession sesionOk = request.getSession();
        sesionOk.setAttribute("usuario",rs.getString("Nick"));
        sesionOk.setAttribute("nivel", rs.getString("nivel")); 
        sesionOk.setAttribute("nombre", rs.getString("Nombre"));

        
        if(sesionOk.getAttribute("nivel").equals("1")){
            response.sendRedirect("menu.jsp");
        }
        else if(sesionOk.getAttribute("nivel").equals("0")){
            response.sendRedirect("PruebaInterfaz.jsp");
        }
    } 
    else  //no encuentra, o pass esta mal o esta inactivo
    {
%>
<jsp:forward page="gui_acceso.jsp">
    <jsp:param name="error" value="Usuario y/o clave incorrectos.<br>Vuelve a intentarlo Tambien verifique el Estado del Usuario."/>
</jsp:forward>
<%    }
%>
