/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.controle;

import com.plantaosaude.dao.GenericDao;
import com.plantaosaude.dao.UsuarioDao;
import com.plantaosaude.modelo.Usuario;
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
@WebServlet(name = "UsuarioCtr", urlPatterns = {"/UsuarioCtr"})
public class UsuarioCtr extends HttpServlet {

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
        Usuario usuario = new Usuario();
        usuario.setNome(request.getParameter("nome"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setLogin(request.getParameter("login"));
        usuario.setSenha(request.getParameter("senha"));
        usuario.setTipo(request.getParameter("tipo"));
        usuario.setStatus(Integer.parseInt(request.getParameter("status")));

        try {
            GenericDao usuarioDao = new UsuarioDao();
            if (id.equals("")) {
                if (usuarioDao.cadastrar(usuario)) {
                    mensagem = "<div class=\'alert alert-success\'>Usuário cadastrado com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao inserir Usuário!</div>";
                }
            } else {
                usuario.setId(Integer.parseInt(id));
                if (usuarioDao.alterar(usuario)) {
                    mensagem = "<div class=\'alert alert-success\'>Usuário alterado com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao alterar Usuário!</div>";
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao inserir/alterar usuarioCTR " + e.getMessage());
        }
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("usuario.jsp").forward(request, response);
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
