package com.mycompany.integradorpa2.controller;



import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.logica.Gato;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GatosRegistradosServlet extends HttpServlet {

    private GatoDAOJpa gatoDAO = new GatoDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Gato> gatos = gatoDAO.listarTodos();

        request.setAttribute("gatos", gatos);

        request.getRequestDispatcher("gatos-registrados.jsp").forward(request, response);
    }
}
