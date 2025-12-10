package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Adopcion;
import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.service.AdopcionService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/familia/adopciones")
public class VerAdopcionesServlet extends HttpServlet {

    private final AdopcionService adopcionService = new AdopcionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Familia f = (Familia) request.getSession().getAttribute("usuarioLogueado");

        if (f == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("listaAdopciones",
                adopcionService.listarAdopcionesDeFamilia(f.getId()));

        request.getRequestDispatcher("/familia-adopciones.jsp")
               .forward(request, response);
    }
}

