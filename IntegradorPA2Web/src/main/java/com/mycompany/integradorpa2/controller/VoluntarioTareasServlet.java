package com.mycompany.integradorpa2.controller;

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

        // === Mostrar menú de tareas ===
        if (action == null || action.equals("menu")) {

            List<Tarea> tareas = tareaService.listarTodas();
            req.setAttribute("tareas", tareas);

            req.getRequestDispatcher("voluntario-tareas.jsp")
                    .forward(req, resp);
            return;
        }

        // === Seleccionar gato para nueva tarea ===
        if (action.equals("seleccionarGato")) {

            req.setAttribute("gatos", tareaService.listarGatos());
            req.getRequestDispatcher("voluntario-seleccionar-gato.jsp")
                    .forward(req, resp);
            return;
        }

        // === Registrar una nueva tarea ===
        if (action.equals("nueva")) {
            req.getRequestDispatcher("voluntario-registrar-tarea.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("guardarTarea".equals(action)) {

            int voluntarioId =
                    ((com.mycompany.integradorpa2.logica.Voluntario)
                            req.getSession().getAttribute("usuarioLogueado"))
                            .getId();

            Long gatoId = Long.parseLong(req.getParameter("gatoId"));
            String descripcion = req.getParameter("descripcion");
            String tipo = req.getParameter("tipo");

            tareaService.crearTarea(
                    voluntarioId,
                    gatoId,
                    tipo,
                    descripcion
            );

            resp.sendRedirect("VoluntarioTareasServlet?action=menu");
        }
    }
}
