<%@ page contentType="text/html; charset=UTF-8" %>
<% 
    // Invalidar la sesión
    session.invalidate(); 

    // Redirigir a la página de inicio
    response.sendRedirect("index.jsp");
%>
