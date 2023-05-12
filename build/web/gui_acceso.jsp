<%@page contentType="text/html; charset=iso-8859-1"
session="true" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Hoster Login</title>
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
  <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
  <link href="CSS/Style_Acceso.css" rel="stylesheet"/>
  <link rel="icon" href="IMG/LOGO.png">
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form action="sql_acceso.jsp"  method="post">
					<label for="chk" aria-hidden="true">Crear Cuenta</label>
					<input type="text" name="txt" placeholder="User name" required="">
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button>Crear Cuenta</button>
				</form>
			</div>

			<div class="login">
				<form action="sql_acceso.jsp"  method="post">
					<label for="chk" aria-hidden="true">Iniciar Cuenta</label>

                                        
					<input type="text" name="usuario" placeholder="Usuario" required="">
					<input type="password" name="clave" placeholder="Contraseña" required="">

          <button type="submit" value="Ingresar">Ingresar</button>
					
				</form>
                            
                        <div class="error">
                            <%=request.getParameter("error") != null ? request.getParameter("error") : ""%>
                        </div>
                
			</div>

	</div>
  
  

</body>
</html>

