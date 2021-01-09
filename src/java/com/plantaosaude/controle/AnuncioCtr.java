/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.controle;

import com.plantaosaude.dao.AnuncioDao;
import com.plantaosaude.dao.GenericDao;
import com.plantaosaude.modelo.Anuncio;
import com.plantaosaude.modelo.Categoria;
import com.plantaosaude.modelo.Cidade;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neto
 */
@WebServlet(name = "AnuncioCtr", urlPatterns = {"/AnuncioCtr"})
public class AnuncioCtr extends HttpServlet {

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
            throws ServletException, IOException, Exception {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String mensagem = null;
        String id = request.getParameter("id");

        Categoria categoria = new Categoria();
        categoria.setId(Integer.parseInt(request.getParameter("categoria")));

        Cidade cidade = new Cidade();
        cidade.setId(Integer.parseInt(request.getParameter("cidade")));

        Anuncio anuncio = new Anuncio();
        anuncio.setNome(request.getParameter("nome"));
        anuncio.setRazaoSocial(request.getParameter("razaoSocial"));
        anuncio.setCnpj(request.getParameter("cnpj"));
        anuncio.setEndereco(request.getParameter("endereco"));
        anuncio.setNumero(request.getParameter("numero"));
        anuncio.setBairro(request.getParameter("bairro"));
        anuncio.setComplemento(request.getParameter("complemento"));
        anuncio.setEmail(request.getParameter("email"));
        anuncio.setSite(request.getParameter("site"));
        anuncio.setLocalizacao(request.getParameter("localizacao"));
        anuncio.setImagem(request.getParameter("imagem"));
        anuncio.setLogo(request.getParameter("logo"));
        anuncio.setCategoria(categoria);
        anuncio.setCidade(cidade);
        anuncio.setDomingoInicio(Integer.parseInt(request.getParameter("domingo_inicio")));
        anuncio.setDomingoTermino(Integer.parseInt(request.getParameter("domingo_termino")));
        anuncio.setSegundaInicio(Integer.parseInt(request.getParameter("segunda_inicio")));
        anuncio.setSegundaTermino(Integer.parseInt(request.getParameter("segunda_termino")));
        anuncio.setTercaInicio(Integer.parseInt(request.getParameter("terca_inicio")));
        anuncio.setTercaTermino(Integer.parseInt(request.getParameter("terca_termino")));
        anuncio.setQuartaInicio(Integer.parseInt(request.getParameter("quarta_inicio")));
        anuncio.setQuartaTermino(Integer.parseInt(request.getParameter("quarta_termino")));
        anuncio.setQuintaInicio(Integer.parseInt(request.getParameter("quinta_inicio")));
        anuncio.setQuintaTermino(Integer.parseInt(request.getParameter("quinta_termino")));
        anuncio.setSextaInicio(Integer.parseInt(request.getParameter("sexta_inicio")));
        anuncio.setSextaTermino(Integer.parseInt(request.getParameter("sexta_termino")));
        anuncio.setSabadoInicio(Integer.parseInt(request.getParameter("sabado_inicio")));
        anuncio.setSabadoTermino(Integer.parseInt(request.getParameter("sabado_termino")));
        anuncio.setStatus(Integer.parseInt(request.getParameter("status")));

        try {
            GenericDao anuncioDao = new AnuncioDao();
            if (id.equals("")) {
                if (anuncioDao.cadastrar(anuncio)) {
                    mensagem = "<div class=\'alert alert-success\'>Anúncio cadastrado com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao inserir Anúncio!</div>";
                }
            } else {
                anuncio.setId(Integer.parseInt(id));
                if (anuncioDao.alterar(anuncio)) {
                    mensagem = "<div class=\'alert alert-success\'>Anúncio alterado com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao alterar Anúncio!</div>";
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao inserir/alterar anuncioCTR " + e.getMessage());
        }
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("anuncio.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AnuncioCtr.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AnuncioCtr.class.getName()).log(Level.SEVERE, null, ex);
        }
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
