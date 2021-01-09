package com.plantaosaude.controle;

import com.plantaosaude.dao.CategoriaDao;
import com.plantaosaude.modelo.Categoria;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author neto
 */
@MultipartConfig
@WebServlet(name = "CategoriaCtr", urlPatterns = {"/CategoriaCtr"})
public class CategoriaCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;
    //private static final String CAMINHO_IMAGEM = "/home/neto/img/"; // servidor
    private static final String CAMINHO_IMAGEM = "/Users/neto/img/";  // local
    private String caminho = null;
    private String fileName = null;
    private Part arquivo = null;

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
        
        try {
            CategoriaDao categoriaDao = new CategoriaDao();
            Categoria categoria = new Categoria();
            categoria.setDescricao(request.getParameter("descricao"));

            for (Part part : request.getParts()) {
                if (part.getName().equals("imagem")) {
                    if(!getFileName(part).equalsIgnoreCase("")){
                        fileName = categoriaDao.proximoId() + getFileName(part);
                        caminho = CAMINHO_IMAGEM + fileName;
                        arquivo = part;
                        categoria.setImagem(caminho);
                    }else{
                        categoria.setImagem("");
                    }
                }
            }    
             
            categoria.setStatus(Integer.parseInt(request.getParameter("status")));

            if (id.equals("")) {
                if (categoriaDao.cadastrar(categoria)) {
                    upload(arquivo, request, caminho);
                    mensagem = "<div class=\'alert alert-success\'>Categoria cadastrada com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao inserir Categoria!</div>";
                }
            } else {
                categoria.setId(Integer.parseInt(id));
                if (categoriaDao.alterar(categoria)) {
                    mensagem = "<div class=\'alert alert-success\'>Categoria alterada com sucesso!</div>";
                } else {
                    mensagem = "<div class=\'alert alert-danger\'>Erro ao alterar Categoria!</div>";
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao inserir/alterar categoriaCTR " + e.getMessage());
        }
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("categoria.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        String partHeader = part.getHeader("content-disposition");
        System.out.println("Part Header = " + partHeader);
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }

    public void upload(Part arquivo, HttpServletRequest request, String caminho) throws IOException, ServletException {

        // upload de imagem
        InputStream is = request.getPart(arquivo.getName()).getInputStream();
        int i = is.available();
        byte[] b = new byte[i];
        is.read(b);
        System.out.println("Tamanho : " + b.length);
        System.out.println("Nome do Arquivo : " + caminho);
        FileOutputStream os = new FileOutputStream(caminho);
        os.write(b);
        is.close();
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
