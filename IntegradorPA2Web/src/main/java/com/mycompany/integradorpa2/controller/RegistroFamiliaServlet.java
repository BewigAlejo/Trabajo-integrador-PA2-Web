package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.dao.FamiliaDAOJpa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistroFamiliaServlet")
public class RegistroFamiliaServlet extends HttpServlet {

    private FamiliaDAOJpa dao = new FamiliaDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recupera el objeto base desde sesión
        Familia fam = (Familia) request.getSession().getAttribute("fam_base");

        if (fam == null) {
            request.setAttribute("error", "No hay datos base de la familia.");
            request.getRequestDispatcher("registroFamilia.jsp").forward(request, response);
            return;
        }

        request.setAttribute("fam", fam);
        request.getRequestDispatcher("registroFamilia.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recupera el objeto base almacenado en sesión
        Familia fam = (Familia) request.getSession().getAttribute("fam_base");

        if (fam == null) {
            request.setAttribute("error", "No hay datos base de la familia.");
            request.getRequestDispatcher("registroFamilia.jsp").forward(request, response);
            return;
        }

        try {
            // Datos específicos de familia
            String direccion = request.getParameter("direccion");
            String coordenadas = request.getParameter("coordenadas");

            fam.setDireccion(direccion);
            fam.setCoordenadas(coordenadas);
            fam.setReputacion(1);

            // Guardar en BD
            dao.crear(fam);

            // limpiamos la sesión
            request.getSession().removeAttribute("fam_base");

            // mensaje ok + volver al login
            request.setAttribute("mensaje", "Familia registrada correctamente. ID = " + fam.getId());
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar familia: " + e.getMessage());
            request.getRequestDispatcher("registroFamilia.jsp").forward(request, response);
        }
    }
}
