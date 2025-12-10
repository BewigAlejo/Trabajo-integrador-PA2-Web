package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Voluntario;
import com.mycompany.integradorpa2.logica.Tarea;
import com.mycompany.integradorpa2.service.TareaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/VoluntarioTareasServlet")
public class VoluntarioTareasServlet extends HttpServlet {

    private final TareaService tareaService = new TareaService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "menu";

        switch (action) {

            case "menu":
                req.getRequestDispatcher("voluntario-tareas.jsp").forward(req, resp);
                break;

            case "listar":
                listarTareas(req, resp);
                break;

            default:
                req.getRequestDispatcher("voluntario-tareas.jsp").forward(req, resp);
        }
    }

    private void listarTareas(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Voluntario vol = (Voluntario) req.getSession().getAttribute("usuarioLogueado");
        List<Tarea> tareas = tareaService.listarPorVoluntario(vol.getId());

        req.setAttribute("tareas", tareas);
        req.getRequestDispatcher("voluntario-tareas.jsp").forward(req, resp);
    }
}
