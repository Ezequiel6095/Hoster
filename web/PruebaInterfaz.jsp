<%@ page session="true" %>

<%@include  file="controles/chequearsesion.jsp" %>

<%
    String usuariodelacceso = (String) request.getSession().getAttribute("nombre");
    String nivel = (String) sesionOk.getAttribute("nivel");
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de reserva</title>
    <link rel="stylesheet" href="CSS/Style_Interfaz.css">
    <link rel="icon" href="IMG/LOGO.png">
</head>

<body>

    <form action="#">

        <h1>Datos de la reserva</h1>
        <div class="Usuario">
        <spam>Usuario:</spam> <%=usuariodelacceso%>
        </div>

        <fieldset id="datos_personales">
            <p>Por favor, rellene todos los campos. </p>

            <label for="nombre">Nombre:
                <input type="text" id="nombre"></input>
            </label>
            <label for="apellidos"> Apellidos:
                <input type="text" id="nombre"> </input>
            </label>
            <label for="telefono"> Teléfono de contacto:
                <input type="text" id="telefono"> </input>
            </label>
            <label for="email"> Email:
                <input type="email" id="email"> </input>
            </label>




        </fieldset>

        <fieldset class="datos_reserva">
            <label for="dia">Fecha de entrada:
                <input type="date" id="dia"></input>
            </label>
            <label for="noches"> Número de noches:
                <input type="number" id="noches"> </input>
            </label>


            <p>Tipo de habitación:</p>
            <input type="radio" name="tipo_habitacion" value="simple">Simple</input>
            <input type="radio" name="tipo_habitacion" value="doble">Doble</input>
            <input type="radio" name="tipo_habitacion" value="matrimonio">Matrimonio</input>

            <p>Extras:</p>
            <input type="checkbox" name="extras"> Desayuno incluído</input> <br>
            <input type="checkbox" name="extras"> Almuerzo incluído</input> <br>
            <input type="checkbox" name="extras"> Cena incluída</input> <br>
            <input type="checkbox" name="extras"> Cama supletoria</input> <br>


        </fieldset>

        <fieldset>
            <p>Comentarios: (opcional) </p>
            <textarea name="comentarios" cols="50" rows="5"></textarea>
        </fieldset>

        <fieldset class="enviar">
            <p>Enviar formulario: </p>
            <button id="enviar" type="submit">Enviar</button>
            <button id="resetear" type="reset">Restablecer</button>
        </fieldset>

    </form>

</body>

</html>