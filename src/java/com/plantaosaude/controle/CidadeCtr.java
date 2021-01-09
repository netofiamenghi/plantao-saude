/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.controle;

import com.plantaosaude.dao.CidadeDao;
import com.plantaosaude.dao.GenericDao;
import com.plantaosaude.modelo.Cidade;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neto
 */
@WebServlet(name = "CidadeCtr", urlPatterns = {"/CidadeCtr"})
public class CidadeCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String mensagem = null;
        String id = request.getParameter("id");
        Cidade cidade = new Cidade();
        cidade.setNome(request.getParameter("nome"));
        cidade.setCep(request.getParameter("cep"));
        cidade.setEstado(request.getParameter("estado"));

        try {
            GenericDao cidadeDao = new CidadeDao();
            if (id.equals("")) {
                if (cidadeDao.cadastrar(cidade)) {
                    mensagem = "<div class=\'alert alert-success\'>Cidade cadastrada com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao inserir Cidade!</div>";
                }
            } else {
                cidade.setId(Integer.parseInt(id));
                if (cidadeDao.alterar(cidade)) {
                    mensagem = "<div class=\'alert alert-success\'>Cidade alterada com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao alterar Cidade!</div>";
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao inserir/alterar cidadeCTR " + e.getMessage());
        }
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("cidade.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
