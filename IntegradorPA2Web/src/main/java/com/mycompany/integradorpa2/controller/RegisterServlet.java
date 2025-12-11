package com.mycompany.integradorpa2.controller;
import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.logica.Voluntario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre     = request.getParameter("nombre");
        String email      = request.getParameter("email");
        String usuario    = request.getParameter("usuario");
        String password   = request.getParameter("password");
        String rol        = request.getParameter("rol"); // "VOLUNTARIO" o "FAMILIA"

        // Validaciones básicas
        if (nombre == null || email == null || usuario == null || password == null
                || nombre.isBlank() || email.isBlank() || usuario.isBlank() || password.isBlank()
                || rol == null) {

            request.setAttribute("error", "Completá todos los campos y elegí un rol.");
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);

        switch (rol) {
            case "VOLUNTARIO" -> {
                Voluntario vol = new Voluntario();
                vol.setNombre(nombre.trim());
                vol.setEmail(email.trim());
                vol.setUsuario(usuario.trim());
                vol.setContrasenia(password);

                // guardamos en sesión para el paso 2
                session.setAttribute("voluntarioNuevo", vol);

                // vamos a la pantalla de registro específico
                response.sendRedirect(request.getContextPath() + "/RegistroVoluntarioServlet");
            }
            case "FAMILIA" -> {
                Familia fam = new Familia();
                fam.setNombre(nombre.trim());
                fam.setEmail(email.trim());
                fam.setUsuario(usuario.trim());
                fam.setContrasenia(password);

                request.getSession().setAttribute("fam_base", fam);
                response.sendRedirect("RegistroFamiliaServlet");
            }
            default -> {
                request.setAttribute("error", "Rol no reconocido: " + rol);
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
            }
        }
    }

    // si querés que al entrar a /RegistroServlet por GET muestre el formulario:
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
