/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.util;

import java.sql.SQLException;

/**
 *
 * @author neto
 */
public class TestarConexao {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ConnectionFactory.getConexao();
    }

}
