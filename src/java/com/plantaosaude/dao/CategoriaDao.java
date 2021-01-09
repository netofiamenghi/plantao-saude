/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.dao;

import com.plantaosaude.modelo.Categoria;
import com.plantaosaude.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author neto
 */
public class CategoriaDao implements GenericDao {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public CategoriaDao() {
        try {
            this.conn = ConnectionFactory.getConexao();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao conectar ao banco de dados: " + e.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object object) throws Exception {

        Boolean retorno = true;
        try {
            String sql = "insert into categoria (descricao,imagem,status) values (?,?,?);";
            stmt = this.conn.prepareStatement(sql);
            Categoria categoria = (Categoria) object;
            stmt.setString(1, categoria.getDescricao());
            stmt.setString(2, categoria.getImagem());
            stmt.setInt(3, categoria.getStatus());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao inserir categoriaDAO " + e.getMessage());
            retorno = false;
        } finally {
            ConnectionFactory.close(conn, rs, stmt);
        }
        return retorno;
    }

    @Override
    public Boolean alterar(Object object) throws Exception {

        Boolean retorno = true;
        try {
            String sql = "update categoria set descricao=?,imagem=?,status=? where id = ?";
            stmt = this.conn.prepareStatement(sql);
            Categoria categoria = (Categoria) object;
            stmt.setString(1, categoria.getDescricao());
            stmt.setString(2, categoria.getImagem());
            stmt.setInt(3, categoria.getStatus());
            stmt.setInt(4, categoria.getId());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao alterar categoriaDAO " + e.getMessage());
            retorno = false;
        } finally {
            ConnectionFactory.close(conn, rs, stmt);
        }
        return retorno;
    }

    @Override
    public Boolean excluir(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> listar() throws Exception {

        List<Object> lista = new ArrayList<Object>();
        try {
            String sql = "select * from categoria order by descricao";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setDescricao(rs.getString("descricao"));
                categoria.setImagem(rs.getString("imagem"));
                categoria.setStatus(rs.getInt("status"));
                lista.add(categoria);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar categoriaDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return lista;
    }

    @Override
    public Object carregar(int id) throws Exception {

        Categoria categoria = new Categoria();
        try {
            String sql = "select * from categoria where id = ?";
            stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = this.stmt.executeQuery();
            rs.next();
            categoria.setId(rs.getInt("id"));
            categoria.setDescricao(rs.getString("descricao"));
            categoria.setImagem(rs.getString("imagem"));
            categoria.setStatus(rs.getInt("status"));
        } catch (Exception e) {
            System.out.println("Erro ao carregar categoriaDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return categoria;
    }
    
    public int proximoId() throws Exception {

        int retorno = 0;
        try {
            String sql = "select id from categoria order by id desc limit 1";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            rs.next();
            retorno = rs.getInt("id");
        } catch (Exception e) {
            System.out.println("Erro ao pegar ultimoId categoriaDAO " + e.getMessage());
        }
        return ++retorno;
    }

}
