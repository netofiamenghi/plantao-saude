/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 *
 * @author neto
 */
public class ConnectionFactory {

    private static final ResourceBundle configDB = ResourceBundle.getBundle("com.plantaosaude.util.config_bd");

    public static Connection getConexao() throws ClassNotFoundException, SQLException {

        Class.forName(configDB.getString("conexao.driver.postgresql"));
        return DriverManager.getConnection(configDB.getString("conexao.url"), configDB.getString("conexao.user"), configDB.getString("conexao.password"));
    }

    public static void close(Connection conn, ResultSet rs, PreparedStatement stmt) throws ClassNotFoundException, SQLException, Exception {

        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ex) {
            System.out.println("Erro ao fechar conexao" + ex.getMessage());
        }

    }
}
