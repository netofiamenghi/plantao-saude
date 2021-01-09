/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.dao;

import com.plantaosaude.modelo.Usuario;
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
public class UsuarioDao implements GenericDao {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public UsuarioDao() {
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
            String sql = "insert into usuario (nome,email,login,senha,tipo,status) values (?,?,?,?,?,?);";
            stmt = this.conn.prepareStatement(sql);
            Usuario usuario = (Usuario) object;
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getLogin());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getTipo());
            stmt.setInt(6, usuario.getStatus());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao inserir usuarioDAO " + e.getMessage());
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
            String sql = "update usuario set nome=?,email=?,login=?,senha=?,tipo=?,status=? where id = ?";
            stmt = this.conn.prepareStatement(sql);
            Usuario usuario = (Usuario) object;
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getLogin());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getTipo());
            stmt.setInt(6, usuario.getStatus());
            stmt.setInt(7, usuario.getId());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao alterar usuarioDAO " + e.getMessage());
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
            String sql = "select * from usuario order by status desc, nome";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTipo(rs.getString("tipo"));
                usuario.setStatus(rs.getInt("status"));
                lista.add(usuario);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar usuarioDAO " + e.getMessage());
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

        Usuario usuario = new Usuario();
        try {
            String sql = "select * from usuario where id = ?";
            stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = this.stmt.executeQuery();
            rs.next();
            usuario.setId(rs.getInt("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setEmail(rs.getString("email"));
            usuario.setLogin(rs.getString("login"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setTipo(rs.getString("tipo"));
            usuario.setStatus(rs.getInt("status"));
        } catch (Exception e) {
            System.out.println("Erro ao carregar usuarioDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return usuario;
    }

    public Usuario logar(String login, String senha) throws Exception {
        
        Usuario usuario = new Usuario();
        try {
            String sql = "select * from usuario where login = ? and senha = ? and status = 1";
            stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();
            while (rs.next()) {
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setLogin(rs.getString("login"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTipo(rs.getString("tipo"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao logar usuarioDAO " +e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception e) {
                System.out.println("Erro ao fechar conexao");
            }
        }
        return usuario;
    }
}
