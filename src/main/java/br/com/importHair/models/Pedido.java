package br.com.importHair.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;


@Entity
@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Temporal(TemporalType.DATE)
	private Date data_pedido;

	private String status;
	private String pagamento;
	private BigDecimal frete;
	private BigDecimal Total;
	private BigDecimal subTotal;
	
	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pedido", targetEntity = PedidoItem.class)
	private List<PedidoItem> itens = new ArrayList<PedidoItem>();

	@Override
	public String toString() {
		return "Pedido [id=" + id + ", data_pedido=" + data_pedido + ", status=" + status + ", pagamento=" + pagamento
				+ ", frete=" + frete + ", usuario=" + ", itens=" + itens + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getData_pedido() {
		return data_pedido;
	}

	public void setData_pedido(Date data_pedido) {
		this.data_pedido = data_pedido;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPagamento() {
		return pagamento;
	}

	public void setPagamento(String pagamento) {
		this.pagamento = pagamento;
	}

	public BigDecimal getFrete() {
		return frete;
	}

	public void setFrete(BigDecimal frete) {
		this.frete = frete;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<PedidoItem> getItens() {
		return itens;
	}

	public void setItens(List<PedidoItem> itens) {
		this.itens = itens;
	}

	public PedidoItem add(PedidoItem item) {
		for (PedidoItem pedidoitem : itens) {
			if (pedidoitem.equals(item)) {
				pedidoitem.setQuantidade(pedidoitem.getQuantidade() + 1);
				return pedidoitem;
			}
		}
		itens.add(item);
		return item;
	}
	
	public int getQuantidade(){
		Integer quantidadeTotal = 0;
		for (PedidoItem pedidoItem : itens) {
			quantidadeTotal = pedidoItem.getQuantidade() + quantidadeTotal;
		}
		
		return quantidadeTotal;
	}
	
	
	public Integer getQuantidade(PedidoItem item) {
		for (PedidoItem pedidoItem : itens) {
			if (item.equals(pedidoItem)) {
				return item.getQuantidade();
			}
		}
		return item.getQuantidade();
	}
	
	public BigDecimal getValorTotalItem(PedidoItem pedidoItem){
		BigDecimal quantidade = new BigDecimal(pedidoItem.getQuantidade());
		BigDecimal preco = pedidoItem.getProduto().getPreco();
		BigDecimal total = preco.multiply(quantidade);
		return total;
	}
	
	public BigDecimal getPeso(){
		BigDecimal peso = BigDecimal.ZERO;
		
		for (PedidoItem pedidoItem : itens) {
			BigDecimal peso2 = pedidoItem.getProduto().getPeso();
			peso  = peso2.multiply(new BigDecimal(pedidoItem.getQuantidade()));
		}
		return peso;
	}
	
	

	public BigDecimal getSubTotal(){
		BigDecimal totalItem =  BigDecimal.ZERO;
		for (PedidoItem pedidoItem : itens) {
			totalItem = totalItem.add(getValorTotalItem(pedidoItem));
		}
		
		return totalItem;
		
	}
	
	public BigDecimal getTotalgeral(){
		BigDecimal Total = this.getSubTotal();
		if(this.getFrete() ==  null){
			return this.getSubTotal();
		}
		Total = Total.add(getFrete());
		return Total;
	}
	
	
	public PedidoItem atualizaItem(PedidoItem pedidoItem){
		
		for (PedidoItem item : itens) {
			if(pedidoItem.equals(item) && pedidoItem.getQuantidade() > 0){
				item.setQuantidade(pedidoItem.getQuantidade());
				return item;
			}
			
			if(pedidoItem.equals(item) && pedidoItem.getQuantidade() == 0){
				itens.remove(pedidoItem);
				return item;
			}
		}
		itens.add(pedidoItem);
		return pedidoItem;
	}
	
	public void removeItem(PedidoItem item){
		itens.remove(item);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((data_pedido == null) ? 0 : data_pedido.hashCode());
		result = prime * result + ((frete == null) ? 0 : frete.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((itens == null) ? 0 : itens.hashCode());
		result = prime * result + ((pagamento == null) ? 0 : pagamento.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Pedido other = (Pedido) obj;
		if (data_pedido == null) {
			if (other.data_pedido != null)
				return false;
		} else if (!data_pedido.equals(other.data_pedido))
			return false;
		if (frete == null) {
			if (other.frete != null)
				return false;
		} else if (!frete.equals(other.frete))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (itens == null) {
			if (other.itens != null)
				return false;
		} else if (!itens.equals(other.itens))
			return false;
		if (pagamento == null) {
			if (other.pagamento != null)
				return false;
		} else if (!pagamento.equals(other.pagamento))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}

	public BigDecimal getTotal() {
		return Total;
	}

	public void setTotal(BigDecimal total) {
		Total = total;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}
	
}
