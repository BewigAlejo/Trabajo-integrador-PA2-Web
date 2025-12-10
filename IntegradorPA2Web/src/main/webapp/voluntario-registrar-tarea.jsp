<h1>Crear tarea</h1>

<form action="VoluntarioTareasServlet" method="post">
<input type="hidden" name="action" value="crear">

Gato seleccionado:
<b><%= request.getAttribute("gatoNombre") %></b>
<br><br>

Tipo de tarea:
<select name="tipo">
    <option value="ALIMENTACION">ALIMENTACION</option>
    <option value="REVISION">REVISION</option>
    <option value="LIMPIEZA">LIMPIEZA</option>
</select>

<br><br><button type="submit">Crear</button>
</form>

<a href="panel-voluntario.jsp">Volver</a>
