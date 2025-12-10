<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Voluntario</title>
</head>
<body>
<h1>Registro de Voluntario</h1>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form action="RegistroVoluntarioServlet" method="post">
    Disponibilidad:
    <select name="disponibilidad">
        <option value="ALTA">Alta</option>
        <option value="MEDIA">Media</option>
        <option value="BAJA">Baja</option>
        <option value="NO_DISPONIBLE">No disponible</option>
    </select>
    <br/>

    Experiencia:
    <select name="experiencia">
        <option value="NOVATO">Novato</option>
        <option value="INTERMEDIO">Intermedio</option>
        <option value="AVANZADO">Avanzado</option>
        <option value="EXPERTO">Experto</option>
    </select>
    <br/>

    <input type="submit" value="Registrarse">
</form>

</body>
</html>
