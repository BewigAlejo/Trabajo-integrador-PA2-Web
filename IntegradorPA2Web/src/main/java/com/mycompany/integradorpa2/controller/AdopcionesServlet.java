package com.mycompany.integradorpa2.controller;



import com.mycompany.integradorpa2.dao.AdopcionDAOJpa;
import com.mycompany.integradorpa2.logica.Adopcion;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdopcionesServlet extends HttpServlet {

    private AdopcionDAOJpa adopDAO = new AdopcionDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Adopcion> lista = adopDAO.listarTodos();

        request.setAttribute("adoptados", lista);

        request.getRequestDispatcher("adopciones.jsp").forward(request, response);
    }
}
