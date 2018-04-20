package br.com.importHair.models;

import javax.persistence.Id;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Produtos {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String descricao;
	private String codigo_alternativo;
	private Integer estoque_minimo;
	private Integer estoque_maximo;
	private String path;
	private BigDecimal peso;
	private BigDecimal preco;
	private BigDecimal precoCheio;
	

	public BigDecimal getPrecoCheio() {
		return precoCheio;
	}

	public void setPrecoCheio(BigDecimal precoCheio) {
		this.precoCheio = precoCheio;
	}

	public BigDecimal getPeso() {
		return peso;
	}

	public void setPeso(BigDecimal peso) {
		this.peso = peso;
	}

	@Override
	public String toString() {
		return "Produtos [id=" + id + ", descricao=" + descricao + ", codigo_alternativo=" + codigo_alternativo
				+ ", estoque_minimo=" + estoque_minimo + ", estoque_maximo=" + estoque_maximo + ", path=" + path
				+ ", preco=" + preco + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCodigo_alternativo() {
		return codigo_alternativo;
	}

	public void setCodigo_alternativo(String codigo_alternativo) {
		this.codigo_alternativo = codigo_alternativo;
	}

	public Integer getEstoque_minimo() {
		return estoque_minimo;
	}

	public void setEstoque_minimo(Integer estoque_minimo) {
		this.estoque_minimo = estoque_minimo;
	}

	public Integer getEstoque_maximo() {
		return estoque_maximo;
	}

	public void setEstoque_maximo(Integer estoque_maximo) {
		this.estoque_maximo = estoque_maximo;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public BigDecimal getPreco() {
		return preco;
	}

	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codigo_alternativo == null) ? 0 : codigo_alternativo.hashCode());
		result = prime * result + ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((estoque_maximo == null) ? 0 : estoque_maximo.hashCode());
		result = prime * result + ((estoque_minimo == null) ? 0 : estoque_minimo.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((path == null) ? 0 : path.hashCode());
		result = prime * result + ((peso == null) ? 0 : peso.hashCode());
		result = prime * result + ((preco == null) ? 0 : preco.hashCode());
		result = prime * result + ((precoCheio == null) ? 0 : precoCheio.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produtos other = (Produtos) obj;
		if (codigo_alternativo == null) {
			if (other.codigo_alternativo != null)
				return false;
		} else if (!codigo_alternativo.equals(other.codigo_alternativo))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (estoque_maximo == null) {
			if (other.estoque_maximo != null)
				return false;
		} else if (!estoque_maximo.equals(other.estoque_maximo))
			return false;
		if (estoque_minimo == null) {
			if (other.estoque_minimo != null)
				return false;
		} else if (!estoque_minimo.equals(other.estoque_minimo))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (path == null) {
			if (other.path != null)
				return false;
		} else if (!path.equals(other.path))
			return false;
		if (peso == null) {
			if (other.peso != null)
				return false;
		} else if (!peso.equals(other.peso))
			return false;
		if (preco == null) {
			if (other.preco != null)
				return false;
		} else if (!preco.equals(other.preco))
			return false;
		if (precoCheio == null) {
			if (other.precoCheio != null)
				return false;
		} else if (!precoCheio.equals(other.precoCheio))
			return false;
		return true;
	}
	
	
}
