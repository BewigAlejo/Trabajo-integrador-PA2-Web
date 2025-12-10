/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import com.mycompany.integradorpa2.logica.Adopcion;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.logica.enums.EstadoAdopcion;
import com.mycompany.integradorpa2.service.AdopcionService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Usuario
 */
@WebServlet("/VoluntarioAsignarGatoServlet")
public class VoluntarioAsignarGatoServlet extends HttpServlet {

    private final AdopcionService adopcionService = new AdopcionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idGato = req.getParameter("idGato");

        // ==== 1) Si NO seleccionó gato → mostrar lista de gatos ====
        if (idGato == null) {

            List<Gato> gatos = adopcionService.listarGatosConAdopcionEnProceso();

            // Cantidad de solicitudes por gato
            Map<Long, Long> solicitudesPorGato = new java.util.HashMap<>();
            for (Gato g : gatos) {
                long cant = adopcionService.listarAdopcionesDeGato(g.getId()).stream()
                        .filter(a -> a.getEstado() == EstadoAdopcion.EN_PROCESO)
                        .count();
                solicitudesPorGato.put(g.getId(), cant);
            }

            req.setAttribute("gatos", gatos);
            req.setAttribute("solicitudesPorGato", solicitudesPorGato);

            req.getRequestDispatcher("voluntario-asignar-gato.jsp").forward(req, resp);
            return;
        }

        // ==== 2) Si seleccionó un gato → ver familias interesadas ====
        Long gatoId = Long.parseLong(idGato);

        List<Adopcion> familias = adopcionService
                .listarAdopcionesDeGato(gatoId).stream()
                .filter(a -> a.getEstado() == EstadoAdopcion.EN_PROCESO)
                .toList();

        req.setAttribute("familias", familias);
        req.setAttribute("gatoId", gatoId);

        req.getRequestDispatcher("voluntario-asignar-gato-familias.jsp")
                .forward(req, resp);
        return;
    }

    @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    Long adopcionId = Long.parseLong(req.getParameter("adopcionId"));

    try {
        adopcionService.aprobarAdopcion(adopcionId);
        // Redirige para evitar reenvío de formulario
        resp.sendRedirect("VoluntarioAsignarGatoServlet?msg=ok");
        return;
    } catch (Exception e) {
        resp.sendRedirect("VoluntarioAsignarGatoServlet?error=" + e.getMessage());
        return;
    }
}

}


