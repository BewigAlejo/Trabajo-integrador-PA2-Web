package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.VoluntarioDAO;
import com.mycompany.integradorpa2.dao.VoluntarioDAOJpa;
import com.mycompany.integradorpa2.logica.Voluntario;
import com.mycompany.integradorpa2.logica.enums.Disponibilidad;
import com.mycompany.integradorpa2.logica.enums.Experiencia;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegistroVoluntarioServlet", urlPatterns = {"/RegistroVoluntarioServlet"})
public class RegistroVoluntarioServlet extends HttpServlet {

    private final VoluntarioDAO dao = new VoluntarioDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Voluntario vol = (session != null)
                ? (Voluntario) session.getAttribute("voluntarioNuevo")
                : null;

        if (vol == null) {
            // Este es el mensaje que viste
            request.setAttribute("error", "No hay datos base del voluntario.");
        }

        // cargar opciones para los combos (por si usás JSTL o similar)
        request.setAttribute("disponibilidades", Disponibilidad.values());
        request.setAttribute("experiencias", Experiencia.values());

        response.sendRedirect("registroVoluntario.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null) {
            request.setAttribute("error", "Sesión expirada. Volvé a la pantalla de registro.");
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
            return;
        }

        Voluntario vol = (Voluntario) session.getAttribute("voluntarioNuevo");
        if (vol == null) {
            request.setAttribute("error", "No hay datos base del voluntario.");
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
            return;
        }

        try {
            String dispParam = request.getParameter("disponibilidad");
            String expParam  = request.getParameter("experiencia");

            Disponibilidad disp = Disponibilidad.valueOf(dispParam);
            Experiencia exp = Experiencia.valueOf(expParam);

            vol.setDisponibilidad(disp);
            vol.setExperiencia(exp);

            dao.crear(vol);

            // una vez guardado, limpio la sesión para no dejar basura
            session.removeAttribute("voluntarioNuevo");

            // mensaje y vuelta al login
            request.setAttribute("mensaje", "Voluntario registrado. ID = " + vol.getId());
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("error", "Error al crear voluntario: " + ex.getMessage());
            request.getRequestDispatcher("registroVoluntario.jsp").forward(request, response);
        }
    }
}
