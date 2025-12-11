package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Tarea;
import com.mycompany.integradorpa2.logica.enums.EstadoTarea;
import com.mycompany.integradorpa2.service.TareaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/VoluntarioEditarTareaServlet")
public class VoluntarioEditarTareaServlet extends HttpServlet {

    private final TareaService tareaService = new TareaService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));

        Tarea t = tareaService.buscarPorId(id)
                .orElseThrow(() -> new RuntimeException("Tarea no encontrada"));

        req.setAttribute("tarea", t);
        req.setAttribute("estados", EstadoTarea.values());

        req.getRequestDispatcher("voluntario-editar-tarea.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));
        String nuevoEstado = req.getParameter("estado");
        String nuevaObservacion = req.getParameter("observacion");

        try {
            tareaService.actualizarEstadoYObservacion(
                    id,
                    EstadoTarea.valueOf(nuevoEstado),
                    nuevaObservacion
            );

            resp.sendRedirect("VoluntarioTareasServlet?action=menu");

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            doGet(req, resp);
        }
    }
}
