/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.dao;

import com.plantaosaude.modelo.Contato;
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
public class ContatoDao implements GenericDao {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public ContatoDao() {
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
            String sql = "insert into contato (nome,telefone,email,mensagem,data) values (?,?,?,?,?);";
            stmt = this.conn.prepareStatement(sql);
            Contato contato = (Contato) object;
            stmt.setString(1, contato.getNome());
            stmt.setString(2, contato.getTelefone());
            stmt.setString(3, contato.getEmail());
            stmt.setString(4, contato.getMensagem());
            stmt.setDate(5, new java.sql.Date(contato.getData().getTime()));
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao inserir contatoDAO " + e.getMessage());
            retorno = false;
        } finally {
            ConnectionFactory.close(conn, rs, stmt);
        }
        return retorno;

    }

    @Override
    public Boolean alterar(Object object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean excluir(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> listar() throws Exception {

        List<Object> lista = new ArrayList<Object>();
        try {
            String sql = "select * from contato order by data";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setNome(rs.getString("nome"));
                contato.setTelefone(rs.getString("telefone"));
                contato.setEmail(rs.getString("email"));
                lista.add(contato);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar contatoDAO " + e.getMessage());
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

        Contato contato = new Contato();
        try {
            String sql = "select * from contato where id = ?";
            stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = this.stmt.executeQuery();
            rs.next();
            contato.setId(rs.getInt("id"));
            contato.setNome(rs.getString("nome"));
            contato.setEmail(rs.getString("email"));
            contato.setTelefone(rs.getString("telefone"));
            contato.setMensagem(rs.getString("mensagem"));
            contato.setData(rs.getDate("data"));
        } catch (Exception e) {
            System.out.println("Erro ao carregar contatoDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return contato;
    }

}
