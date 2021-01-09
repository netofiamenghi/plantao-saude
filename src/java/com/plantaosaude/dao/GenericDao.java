/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.dao;

import java.util.List;

/**
 *
 * @author neto
 */
public interface GenericDao {

    public Boolean cadastrar(Object object) throws Exception;

    public Boolean alterar(Object object) throws Exception;

    public Boolean excluir(int id) throws Exception;

    public List<Object> listar() throws Exception;

    public Object carregar(int id) throws Exception;

}
