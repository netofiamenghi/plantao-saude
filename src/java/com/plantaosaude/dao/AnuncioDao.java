/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.dao;

import com.plantaosaude.modelo.Anuncio;
import com.plantaosaude.modelo.Categoria;
import com.plantaosaude.modelo.Cidade;
import com.plantaosaude.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author neto
 */
public class AnuncioDao implements GenericDao {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public AnuncioDao() {
        try {
            this.conn = ConnectionFactory.getConexao();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao conectar ao banco de dados: " + e.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object object) throws Exception {

        HttpSession httpsession = request.getSession();
        
        
        Boolean retorno = true;
        try {
            String sql = "insert into anuncio (nome,razao_social,cnpj,endereco,numero,bairro,complemento,"
                    + "email,site,localizacao,imagem,logo,id_categoria,id_cidade,domingo_inicio,domingo_termino,"
                    + "segunda_inicio,segunda_termino,terca_inicio,terca_termino,quarta_inicio,quarta_termino,"
                    + "quinta_inicio,quinta_termino,sexta_inicio,sexta_termino,sabado_inicio,sabado_termino,"
                    + "status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            stmt = this.conn.prepareStatement(sql);
            Anuncio anuncio = (Anuncio) object;
            stmt.setString(1, anuncio.getNome());
            stmt.setString(2, anuncio.getRazaoSocial());
            stmt.setString(3, anuncio.getCnpj());
            stmt.setString(4, anuncio.getEndereco());
            stmt.setString(5, anuncio.getNumero());
            stmt.setString(6, anuncio.getBairro());
            stmt.setString(7, anuncio.getComplemento());
            stmt.setString(8, anuncio.getEmail());
            stmt.setString(9, anuncio.getSite());
            stmt.setString(10, anuncio.getLocalizacao());
            stmt.setString(11, anuncio.getImagem());
            stmt.setString(12, anuncio.getLogo());
            stmt.setInt(13, anuncio.getCategoria().getId());
            stmt.setInt(14, anuncio.getCidade().getId());
            stmt.setInt(15, anuncio.getStatus());
            stmt.setInt(16, anuncio.getDomingoInicio());
            stmt.setInt(17, anuncio.getDomingoTermino());
            stmt.setInt(18, anuncio.getSegundaInicio());
            stmt.setInt(19, anuncio.getSegundaTermino());
            stmt.setInt(20, anuncio.getTercaInicio());
            stmt.setInt(21, anuncio.getTercaTermino());
            stmt.setInt(22, anuncio.getQuartaInicio());
            stmt.setInt(23, anuncio.getQuartaTermino());
            stmt.setInt(24, anuncio.getQuintaInicio());
            stmt.setInt(25, anuncio.getQuintaTermino());
            stmt.setInt(26, anuncio.getSextaInicio());
            stmt.setInt(27, anuncio.getSextaTermino());
            stmt.setInt(28, anuncio.getSabadoInicio());
            stmt.setInt(29, anuncio.getSabadoTermino());

            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao inserir anuncioDao " + e.getMessage());
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
            String sql = "update anuncio set nome=?,razao_social=?,cnpj=?,endereco=?,"
                    + "numero=?,bairro=?,complemento=?,email=?,site=?,localizacao=?,"
                    + "imagem=?,logo=?,id_categoria=?,id_cidade=?,status=?,domingo_inicio=?,"
                    + "domingo_termino=?,segunda_inicio=?,segunda_termino=?,terca_inicio=?,"
                    + "terca_termino=?,quarta_inicio=?,quarta_termino=?,quinta_inicio=?,"
                    + "quinta_termino=?,sexta_inicio=?,sexta_termino=?,sabado_inicio=?,"
                    + "sabado_termino=? where id=?;";
            stmt = this.conn.prepareStatement(sql);
            Anuncio anuncio = (Anuncio) object;
            stmt.setString(1, anuncio.getNome());
            stmt.setString(2, anuncio.getRazaoSocial());
            stmt.setString(3, anuncio.getCnpj());
            stmt.setString(4, anuncio.getEndereco());
            stmt.setString(5, anuncio.getNumero());
            stmt.setString(6, anuncio.getBairro());
            stmt.setString(7, anuncio.getComplemento());
            stmt.setString(8, anuncio.getEmail());
            stmt.setString(9, anuncio.getSite());
            stmt.setString(10, anuncio.getLocalizacao());
            stmt.setString(11, anuncio.getImagem());
            stmt.setString(12, anuncio.getLogo());
            stmt.setInt(13, anuncio.getCategoria().getId());
            stmt.setInt(14, anuncio.getCidade().getId());
            stmt.setInt(15, anuncio.getStatus());
            stmt.setInt(16, anuncio.getDomingoInicio());
            stmt.setInt(17, anuncio.getDomingoTermino());
            stmt.setInt(18, anuncio.getSegundaInicio());
            stmt.setInt(19, anuncio.getSegundaTermino());
            stmt.setInt(20, anuncio.getTercaInicio());
            stmt.setInt(21, anuncio.getTercaTermino());
            stmt.setInt(22, anuncio.getQuartaInicio());
            stmt.setInt(23, anuncio.getQuartaTermino());
            stmt.setInt(24, anuncio.getQuintaInicio());
            stmt.setInt(25, anuncio.getQuintaTermino());
            stmt.setInt(26, anuncio.getSextaInicio());
            stmt.setInt(27, anuncio.getSextaTermino());
            stmt.setInt(28, anuncio.getSabadoInicio());
            stmt.setInt(29, anuncio.getSabadoTermino());
            stmt.setInt(30, anuncio.getId());
            stmt.execute();

        } catch (Exception e) {
            System.out.println("Erro ao alterar anuncioDao " + e.getMessage());
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

        Date hoje = new Date();
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(hoje);
        int diaDaSemana = gc.get(GregorianCalendar.DAY_OF_WEEK);
        int horaDoDia = gc.get(GregorianCalendar.HOUR_OF_DAY);
        List<Object> lista = new ArrayList<Object>();
        try {
            String sql = "select * from anuncio order by nome";
            stmt = this.conn.prepareStatement(sql);
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                Anuncio anuncio = new Anuncio();
                anuncio.setId(rs.getInt("id"));
                anuncio.setNome(rs.getString("nome"));
                anuncio.setLogo(rs.getString("logo"));
                anuncio.setLocalizacao(rs.getString("localizacao"));
                anuncio.setSite(rs.getString("site"));
                anuncio.setDomingoInicio(rs.getInt("domingo_inicio"));
                anuncio.setDomingoTermino(rs.getInt("domingo_termino"));
                anuncio.setSegundaInicio(rs.getInt("segunda_inicio"));
                anuncio.setSegundaTermino(rs.getInt("segunda_termino"));
                anuncio.setTercaInicio(rs.getInt("terca_inicio"));
                anuncio.setTercaTermino(rs.getInt("terca_termino"));
                anuncio.setQuartaInicio(rs.getInt("quarta_inicio"));
                anuncio.setQuartaTermino(rs.getInt("quarta_termino"));
                anuncio.setQuintaInicio(rs.getInt("quinta_inicio"));
                anuncio.setQuintaTermino(rs.getInt("quinta_termino"));
                anuncio.setSextaInicio(rs.getInt("sexta_inicio"));
                anuncio.setSextaTermino(rs.getInt("sexta_termino"));
                anuncio.setSabadoInicio(rs.getInt("sabado_inicio"));
                anuncio.setSabadoTermino(rs.getInt("sabado_termino"));

                switch (diaDaSemana) {
                    case 1:
                        if ((anuncio.getDomingoInicio() <= horaDoDia)
                                && (anuncio.getDomingoTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 2:
                        if ((anuncio.getSegundaInicio() <= horaDoDia)
                                && (anuncio.getSegundaTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 3:
                        if ((anuncio.getTercaInicio() <= horaDoDia)
                                && (anuncio.getTercaTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 4:
                        if ((anuncio.getQuartaInicio() <= horaDoDia)
                                && (anuncio.getQuartaTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 5:
                        if ((anuncio.getQuintaInicio() <= horaDoDia)
                                && (anuncio.getQuintaTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 6:
                        if ((anuncio.getSextaInicio() <= horaDoDia)
                                && (anuncio.getSextaTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    case 7:
                        if ((anuncio.getSabadoInicio() <= horaDoDia)
                                && (anuncio.getSabadoTermino() >= horaDoDia)) {
                            anuncio.setAberto(true);
                        } else {
                            anuncio.setAberto(false);
                        }
                        break;
                    default:
                        anuncio.setAberto(false);
                        break;
                }

                lista.add(anuncio);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar anuncioDAO " + e.getMessage());
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

        Anuncio anuncio = new Anuncio();
        try {
            String sql = "select * from anuncio where id = ?";
            stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = this.stmt.executeQuery();
            rs.next();

            Categoria categoria = new Categoria();
            categoria.setId(rs.getInt("id_categoria"));

            Cidade cidade = new Cidade();
            cidade.setId(rs.getInt("id_cidade"));

            anuncio.setId(rs.getInt("id"));
            anuncio.setNome(rs.getString("nome"));
            anuncio.setRazaoSocial(rs.getString("razao_social"));
            anuncio.setCnpj(rs.getString("cnpj"));
            anuncio.setEndereco(rs.getString("endereco"));
            anuncio.setNumero(rs.getString("numero"));
            anuncio.setBairro(rs.getString("bairro"));
            anuncio.setComplemento(rs.getString("complemento"));
            anuncio.setEmail(rs.getString("email"));
            anuncio.setSite(rs.getString("site"));
            anuncio.setLocalizacao(rs.getString("localizacao"));
            anuncio.setImagem(rs.getString("imagem"));
            anuncio.setLogo(rs.getString("logo"));
            anuncio.setCategoria(categoria);
            anuncio.setCidade(cidade);
            anuncio.setStatus(rs.getInt("status"));
            anuncio.setDomingoInicio(rs.getInt("domingo_inicio"));
            anuncio.setDomingoTermino(rs.getInt("domingo_termino"));
            anuncio.setSegundaInicio(rs.getInt("segunda_inicio"));
            anuncio.setSegundaTermino(rs.getInt("segunda_termino"));
            anuncio.setTercaInicio(rs.getInt("terca_inicio"));
            anuncio.setTercaTermino(rs.getInt("terca_termino"));
            anuncio.setQuartaInicio(rs.getInt("quarta_inicio"));
            anuncio.setQuartaTermino(rs.getInt("quarta_termino"));
            anuncio.setQuintaInicio(rs.getInt("quinta_inicio"));
            anuncio.setQuintaTermino(rs.getInt("quinta_termino"));
            anuncio.setSextaInicio(rs.getInt("sexta_inicio"));
            anuncio.setSextaTermino(rs.getInt("sexta_termino"));
            anuncio.setSabadoInicio(rs.getInt("sabado_inicio"));
            anuncio.setSabadoTermino(rs.getInt("sabado_termino"));

        } catch (Exception e) {
            System.out.println("Erro ao carregar anuncioDAO " + e.getMessage());
        } finally {
            try {
                ConnectionFactory.close(conn, rs, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar conexão: " + ex.getMessage());
            }
        }
        return anuncio;
    }

}
