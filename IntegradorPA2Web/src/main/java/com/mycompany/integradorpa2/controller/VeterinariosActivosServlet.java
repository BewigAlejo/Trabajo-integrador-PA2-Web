package com.mycompany.integradorpa2.controller;



import com.mycompany.integradorpa2.dao.VeterinarioDAOJpa;
import com.mycompany.integradorpa2.logica.Veterinario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VeterinariosActivosServlet extends HttpServlet {

    private VeterinarioDAOJpa vetDAO = new VeterinarioDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Veterinario> veterinarios = vetDAO.listarTodos();

        request.setAttribute("veterinarios", veterinarios);

        request.getRequestDispatcher("veterinarios-activos.jsp").forward(request, response);
    }
}
