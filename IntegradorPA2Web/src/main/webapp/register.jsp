<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrarse - Happy Paws</title>
</head>
<body>
<h1>Registrarse</h1>

<% String msg = (String) request.getAttribute("mensaje");
   if (msg != null) { %>
    <p style="color:red;"><%= msg %></p>
<% } %>

<form action="RegisterServlet" method="post">

    <label>Nombre:
        <input type="text" name="nombre">
    </label><br><br>

    <label>Email:
        <input type="email" name="email">
    </label><br><br>

    <label>Usuario:
        <input type="text" name="usuario">
    </label><br><br>

    <label>Contraseña:
        <input type="password" name="password">
    </label><br><br>

    <p>Rol:</p>
    <label><input type="radio" name="rol" value="VOLUNTARIO"> Voluntario</label>
    <label><input type="radio" name="rol" value="FAMILIA"> Familia</label>
    <!-- si después querés, agregamos VETERINARIO/ADMIN -->

    <br><br>
    <input type="submit" value="Continuar">
</form>

<p><a href="LoginServlet">Volver al login</a></p>

</body>
</html>
