package com.plantaosaude.modelo;

import java.io.Serializable;
import java.util.Objects;

public class Anuncio implements Serializable {

    private static final long serialVersionUID = 1297604199878551587L;
    private Integer id;
    private String nome;
    private String razaoSocial;
    private String cnpj;
    private String endereco;
    private String numero;
    private String bairro;
    private String complemento;
    private String email;
    private String site;
    private String localizacao;
    private String imagem;
    private String logo;
    private Categoria categoria;
    private Cidade cidade;
    private Integer domingoInicio;
    private Integer domingoTermino;
    private Integer segundaInicio;
    private Integer segundaTermino;
    private Integer tercaInicio;
    private Integer tercaTermino;
    private Integer quartaInicio;
    private Integer quartaTermino;
    private Integer quintaInicio;
    private Integer quintaTermino;
    private Integer sextaInicio;
    private Integer sextaTermino;
    private Integer sabadoInicio;
    private Integer sabadoTermino;
    private Integer status;
    private Boolean aberto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public Integer getDomingoInicio() {
        return domingoInicio;
    }

    public void setDomingoInicio(Integer domingoInicio) {
        this.domingoInicio = domingoInicio;
    }

    public Integer getDomingoTermino() {
        return domingoTermino;
    }

    public void setDomingoTermino(Integer domingoTermino) {
        this.domingoTermino = domingoTermino;
    }

    public Integer getSegundaInicio() {
        return segundaInicio;
    }

    public void setSegundaInicio(Integer segundaInicio) {
        this.segundaInicio = segundaInicio;
    }

    public Integer getSegundaTermino() {
        return segundaTermino;
    }

    public void setSegundaTermino(Integer segundaTermino) {
        this.segundaTermino = segundaTermino;
    }

    public Integer getTercaInicio() {
        return tercaInicio;
    }

    public void setTercaInicio(Integer tercaInicio) {
        this.tercaInicio = tercaInicio;
    }

    public Integer getTercaTermino() {
        return tercaTermino;
    }

    public void setTercaTermino(Integer tercaTermino) {
        this.tercaTermino = tercaTermino;
    }

    public Integer getQuartaInicio() {
        return quartaInicio;
    }

    public void setQuartaInicio(Integer quartaInicio) {
        this.quartaInicio = quartaInicio;
    }

    public Integer getQuartaTermino() {
        return quartaTermino;
    }

    public void setQuartaTermino(Integer quartaTermino) {
        this.quartaTermino = quartaTermino;
    }

    public Integer getQuintaInicio() {
        return quintaInicio;
    }

    public void setQuintaInicio(Integer quintaInicio) {
        this.quintaInicio = quintaInicio;
    }

    public Integer getQuintaTermino() {
        return quintaTermino;
    }

    public void setQuintaTermino(Integer quintaTermino) {
        this.quintaTermino = quintaTermino;
    }

    public Integer getSextaInicio() {
        return sextaInicio;
    }

    public void setSextaInicio(Integer sextaInicio) {
        this.sextaInicio = sextaInicio;
    }

    public Integer getSextaTermino() {
        return sextaTermino;
    }

    public void setSextaTermino(Integer sextaTermino) {
        this.sextaTermino = sextaTermino;
    }

    public Integer getSabadoInicio() {
        return sabadoInicio;
    }

    public void setSabadoInicio(Integer sabadoInicio) {
        this.sabadoInicio = sabadoInicio;
    }

    public Integer getSabadoTermino() {
        return sabadoTermino;
    }

    public void setSabadoTermino(Integer sabadoTermino) {
        this.sabadoTermino = sabadoTermino;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Boolean getAberto() {
        return aberto;
    }

    public void setAberto(Boolean aberto) {
        this.aberto = aberto;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 37 * hash + Objects.hashCode(this.id);
        hash = 37 * hash + Objects.hashCode(this.nome);
        hash = 37 * hash + Objects.hashCode(this.razaoSocial);
        hash = 37 * hash + Objects.hashCode(this.cnpj);
        hash = 37 * hash + Objects.hashCode(this.endereco);
        hash = 37 * hash + Objects.hashCode(this.numero);
        hash = 37 * hash + Objects.hashCode(this.bairro);
        hash = 37 * hash + Objects.hashCode(this.complemento);
        hash = 37 * hash + Objects.hashCode(this.email);
        hash = 37 * hash + Objects.hashCode(this.site);
        hash = 37 * hash + Objects.hashCode(this.localizacao);
        hash = 37 * hash + Objects.hashCode(this.imagem);
        hash = 37 * hash + Objects.hashCode(this.logo);
        hash = 37 * hash + Objects.hashCode(this.categoria);
        hash = 37 * hash + Objects.hashCode(this.cidade);
        hash = 37 * hash + Objects.hashCode(this.domingoInicio);
        hash = 37 * hash + Objects.hashCode(this.domingoTermino);
        hash = 37 * hash + Objects.hashCode(this.segundaInicio);
        hash = 37 * hash + Objects.hashCode(this.segundaTermino);
        hash = 37 * hash + Objects.hashCode(this.tercaInicio);
        hash = 37 * hash + Objects.hashCode(this.tercaTermino);
        hash = 37 * hash + Objects.hashCode(this.quartaInicio);
        hash = 37 * hash + Objects.hashCode(this.quartaTermino);
        hash = 37 * hash + Objects.hashCode(this.quintaInicio);
        hash = 37 * hash + Objects.hashCode(this.quintaTermino);
        hash = 37 * hash + Objects.hashCode(this.sextaInicio);
        hash = 37 * hash + Objects.hashCode(this.sextaTermino);
        hash = 37 * hash + Objects.hashCode(this.sabadoInicio);
        hash = 37 * hash + Objects.hashCode(this.sabadoTermino);
        hash = 37 * hash + Objects.hashCode(this.status);
        hash = 37 * hash + Objects.hashCode(this.aberto);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Anuncio other = (Anuncio) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.razaoSocial, other.razaoSocial)) {
            return false;
        }
        if (!Objects.equals(this.cnpj, other.cnpj)) {
            return false;
        }
        if (!Objects.equals(this.endereco, other.endereco)) {
            return false;
        }
        if (!Objects.equals(this.numero, other.numero)) {
            return false;
        }
        if (!Objects.equals(this.bairro, other.bairro)) {
            return false;
        }
        if (!Objects.equals(this.complemento, other.complemento)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.site, other.site)) {
            return false;
        }
        if (!Objects.equals(this.localizacao, other.localizacao)) {
            return false;
        }
        if (!Objects.equals(this.imagem, other.imagem)) {
            return false;
        }
        if (!Objects.equals(this.logo, other.logo)) {
            return false;
        }
        if (!Objects.equals(this.categoria, other.categoria)) {
            return false;
        }
        if (!Objects.equals(this.cidade, other.cidade)) {
            return false;
        }
        if (!Objects.equals(this.domingoInicio, other.domingoInicio)) {
            return false;
        }
        if (!Objects.equals(this.domingoTermino, other.domingoTermino)) {
            return false;
        }
        if (!Objects.equals(this.segundaInicio, other.segundaInicio)) {
            return false;
        }
        if (!Objects.equals(this.segundaTermino, other.segundaTermino)) {
            return false;
        }
        if (!Objects.equals(this.tercaInicio, other.tercaInicio)) {
            return false;
        }
        if (!Objects.equals(this.tercaTermino, other.tercaTermino)) {
            return false;
        }
        if (!Objects.equals(this.quartaInicio, other.quartaInicio)) {
            return false;
        }
        if (!Objects.equals(this.quartaTermino, other.quartaTermino)) {
            return false;
        }
        if (!Objects.equals(this.quintaInicio, other.quintaInicio)) {
            return false;
        }
        if (!Objects.equals(this.quintaTermino, other.quintaTermino)) {
            return false;
        }
        if (!Objects.equals(this.sextaInicio, other.sextaInicio)) {
            return false;
        }
        if (!Objects.equals(this.sextaTermino, other.sextaTermino)) {
            return false;
        }
        if (!Objects.equals(this.sabadoInicio, other.sabadoInicio)) {
            return false;
        }
        if (!Objects.equals(this.sabadoTermino, other.sabadoTermino)) {
            return false;
        }
        if (!Objects.equals(this.status, other.status)) {
            return false;
        }
        if (!Objects.equals(this.aberto, other.aberto)) {
            return false;
        }
        return true;
    }

}