package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.GatoDAO;
import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.dao.ZonaDAO;
import com.mycompany.integradorpa2.dao.ZonaDAOJpa;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.logica.Zona;
import com.mycompany.integradorpa2.logica.enums.EstadoSalud;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/VoluntarioRegistrarGatoServlet")
public class VoluntarioRegistrarGatoServlet extends HttpServlet {

    private final GatoDAO gatoDao = new GatoDAOJpa();
    private final ZonaDAO zonaDao = new ZonaDAOJpa();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Zona> zonas = zonaDao.listarTodos();
        req.setAttribute("zonas", zonas);
        req.getRequestDispatcher("voluntario-registrar-gato.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String nombre = req.getParameter("nombre");
            String raza = req.getParameter("raza");
            int edad = Integer.parseInt(req.getParameter("edad"));
            EstadoSalud salud = EstadoSalud.valueOf(req.getParameter("salud"));
            boolean adoptado = Boolean.parseBoolean(req.getParameter("adoptado"));
            Long zonaId = Long.parseLong(req.getParameter("zona"));

            Zona zona = zonaDao.buscarPorId(zonaId)
            .orElseThrow(() -> new IllegalArgumentException("Zona no encontrada: " + zonaId));


            Gato g = new Gato();
            g.setNombre(nombre);
            g.setRaza(raza);
            g.setEdad(edad);
            g.setEstadoDeSalud(salud);
            g.setAdoptado(adoptado);
            g.setZona(zona);

            gatoDao.crear(g);

            req.setAttribute("msg", "Gato registrado correctamente.");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }

        doGet(req, resp);
    }
}
