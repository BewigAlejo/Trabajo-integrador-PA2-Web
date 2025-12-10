<!DOCTYPE html>
<html>
<head>
    <title>Happy Paws - Login</title>
    <meta charset="UTF-8">
</head>
<body>

<h1>Happy Paws</h1>

<form action="LoginServlet" method="post">

    <label>Tipo de usuario:</label><br>
    <input type="radio" name="rol" value="VETERINARIO"> Veterinario
    <input type="radio" name="rol" value="VOLUNTARIO"> Voluntario
    <input type="radio" name="rol" value="FAMILIA"> Familia
    <input type="radio" name="rol" value="ADMIN"> Admin
    <br><br>

    <label>Usuario:</label><br>
    <input type="text" name="usuario">
    <br><br>

    <label>Contraseña:</label><br>
    <input type="password" name="password">
    <br><br>

    <button type="submit">Entrar</button>
</form>

<br>
<a href="register.jsp">Registrarse</a>

</body>
</html>

