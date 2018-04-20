<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach items="${item}" var="item">
		<div class="products-meusPedidos">
			<img class="img-product-details" src="<c:url value="/${item.produto.path}"/>">
			
			<div class="descrip-details">
				<p class="descriptProduct">${item.produto.descricao}</p>
				<p class="quantidade-product">${item.quantidade} unidade - R$ ${item.produto.preco}</p>
			</div>
		</div>
		
		<div class="img-status">
			<img class="img-status-details" src="<c:url value="/resources/imagens/imagensStatus/PedidoGerado.png"/>">
		</div>
		
		<div class="box-resumo-pedido">
			<div class="container-page-detalhes">
				<div class="resumo-pagamento">
					<p class="title-resumo-details">subtotal</p> 
					<span class="details-text-cart">R$<span class="sub-total-full text-inform-values">${pedido.subTotal}</span></span>
				</div>
	
				<div class="resumo-pagamento">
					<p class="title-resumo-details">entrega</p> 
					<span class="details-text-cart text-inform-values">frete(SEDEX) ${pedido.frete}</span>
				</div>
				<div class="resumo-pagamento">
					<p class="title-resumo-details">total</p>
					<span class="details-text-cart text-inform-values">R$ <span class="total-geral-ajax text-inform-values">${pedido.total}</span></span>
				</div>
			</div>
			
			<div class="container-page-detalhes">
				<p class="title-resumo-details">Endereço</p>
				<span class="total-geral-ajax text-inform-values">${endereco.logradouro}</span>
				<span class="total-geral-ajax text-inform-values">${endereco.bairro} - ${endereco.cidade},${endereco.uf}</span>
				<span class="total-geral-ajax text-inform-values">${endereco.cep}</span>
			</div>
		</div>
		
	</c:forEach>
