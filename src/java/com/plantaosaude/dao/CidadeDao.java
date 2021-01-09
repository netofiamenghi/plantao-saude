package com.plantaosaude.dao;

import com.plantaosaude.modelo.Cidade;
import com.plantaosaude.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CidadeDao implements GenericDao {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public CidadeDao() {
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
            String sql = "insert into cidade (nome,cep,estado) values (?,?,?);";
            stmt = this.conn.prepareStatement(sql);
            Cidade cidade = (Cidade) object;
            stmt.setString(1, cidade.getNome());
            stmt.setString(2, cidade.getCep());
            stmt.setString(3, cidade.getEstado());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao inserir cidadeDAO " + e.getMessage());
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
            String sql = "update cidade set nome=?,cep=?,estado=? where id = ?";
            stmt = this.conn.prepareStatement(sql);
            Cidade cidade = (Cidade) object;
            stmt.setString(1, cidade.getNome());
            stmt.setString(2, cidade.getCep());
            stmt.setString(3, cidade.getEstado());
            stmt.setInt(4, cidade.getId());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao alterar cidadeDAO " + e.getMessage());
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
            String sql = "select * from cidade order by nome";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getInt("id"));
                cidade.setNome(rs.getString("nome"));
                cidade.setCep(rs.getString("cep"));
                cidade.setEstado(rs.getString("estado"));
                lista.add(cidade);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar cidadeDAO " + e.getMessage());
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

        Cidade cidade = new Cidade();
        try {
            String sql = "select * from cidade where id = ?";
            stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = this.stmt.executeQuery();
            rs.next();
            cidade.setId(rs.getInt("id"));
            cidade.setNome(rs.getString("nome"));
            cidade.setCep(rs.getString("cep"));
            cidade.setEstado(rs.getString("estado"));
        } catch (Exception e) {
            System.out.println("Erro ao carregar cidadeDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return cidade;
    }
}
