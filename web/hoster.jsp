<%-- 
    Document   : menu.jsp
    Created on : 28/03/2023, 06:45:46 PM
    Author     : Ezequiel Diaz
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Style.css" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"  rel="stylesheet" /> <!-- De Prueba -->
        <link rel="icon" href="IMG/LOGO.png">
        <title>Hoster💼</title>
    </head>
    
    <body>  

        <header>
        
            <nav class="bg-gray-800 border-gray-200 dark:bg-gray-900">
                <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                <a href="menu.jsp" class="flex items-center">
                    <img src="IMG/LOGO.png" class="h-8 mr-3" alt="Flowbite Logo" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Hoster</span>
                </a>
                <div class="flex md:order-2">
                    <a href="gui_acceso.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center mr-3 md:mr-0 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Acceder 👤</a>
                    
                </div>
                <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-cta">
                  <ul class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-900 rounded-lg bg-gray-800 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-gray-900 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"> <!-- AQUI --> 
                    <li>
                      <a href="#" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500" aria-current="page">Inicio</a>
                    </li>
                    <li>
                      <a href="#" class="block py-2 pl-3 pr-4 text-blue-50  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-dark md:dark:hover:bg-transparent dark:border-gray-700">Oferta</a>
                    </li>
                    <li>
                      <a href="#" class="block py-2 pl-3 pr-4 text-blue-50 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Sobre Nosotros </a>
                    </li>
                    <li>
                      <a href="#" class="block py-2 pl-3 pr-4 text-blue-50 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Mis Reserva</a>
                    </li>
                  </ul>
                </div>
                </div>
              </nav>
              
  
          <p class="small_txt"> ¡Realizar reservas para tus viajes de forma cómoda y rápida con Hoster! </p>
        </header>

      <main>

        <div class="contenedor">
          <img src="https://media.giphy.com/media/3otPoBnTKMSXegX2fK/giphy.gif" alt="Presentacion">
          <div class="texto">
            <h2 class="t1">30% OFF</h2>
            <p class="t2">Emiratos Árabes Unidos 3107</p>
            <p class="t3">Desde 80$ x noche individual o 100$ x noche dual.</p>
            <p class="enlaces"><a href="#">Más Información></a> <a href="#">Reserva Ya!></a></p>
          </div>
        </div>

        <div>
          <p class="small_txt">Hoster te ofrece estos beneficios! 🔝</p>
        </div>

        <!-- GRID -->
        <div class="grid">
          <div class="item">
            <img class="Recurso" src="https://media.giphy.com/media/mf8UbIDew7e8g/giphy-downsized-large.gif" alt="Reserva" loop="false">
            <div class="overlay-text">
              <h2 class="t1">RESERVA</h2>
              <p class="t4">CUANDO Y DONDE SEA</p>
              <a class="enlaces2" href="#">Reservar ahora</a>
            </div>
          </div>
        
          <div class="item">
            <img class="Recurso" src="VID/security.gif" alt="Seguridad" loop="false">
            <div class="overlay-text">
              <h2 class="t1">Seguridad</h2>
              <p class="t4">En Hoster te ofrecemos seguridad y privacidad durante tu estadía</p>
            </div>
          </div>
        </div>
        

      </main>  

      <!-- MODIFICAR -->
      <footer class="bg-transparent rounded-lg shadow m-4 dark:bg-transparent">
        <div class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
          <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2023 <a href="https://www.linkedin.com/in/ezequiel-dq/" class="hover:underline">Hoster</a>. PR2.
        </span>
        <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
            <li>
                <a href="#" class="mr-4 hover:underline md:mr-6 ">Acerca</a>
            </li>
            <li>
                <a href="#" class="mr-4 hover:underline md:mr-6">Inserte</a>
            </li>
            <li>
                <a href="#" class="mr-4 hover:underline md:mr-6">Inserte2</a>
            </li>
            <li>
                <a href="#" class="hover:underline">Inserte3</a>
            </li>
        </ul>
        </div>
      </footer>

      <!-- Prueba de Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.js"></script>

    </body>

    
</html>


    