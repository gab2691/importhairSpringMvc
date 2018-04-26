<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>
	
	
	<div class="box-title-cart">
		<p class="title-cart">shopping cart</p>
	</div>
	
	<div class="box-full-cart">
		<div class="container-car-itens">
			<div class="box-header-car">
				<div class="box-left-header">
					<p class="text-box-reader">produtos</p>
				</div>
				
				<div class="box-right-header">
					<p class="text-box-reader">preço</p>
					<p class="text-box-reader">quantidade</p>
					<p class="text-box-reader">total</p>
				</div>
			</div>
			<c:forEach items="${item}" var="item">
				<div class="box-itens-car">
					<div class="left-box-itens">
						<img class="img-car-itens" src="<c:url value="/${item.produto.path}"/>">
						<p class="name-product-car">${item.produto.descricao} </p>
					</div>
					
					<div class="right-box-items">
					
						<span class="text-inform-itens">R$<span class="vli">${item.produto.preco}</span></span>
						
						<div class="btns-box-car">
							<div class="box-btn menos">
								<spam class="simbol-box">-</spam>
							</div>
							<input type="text" class="qtn-car" value="${item.quantidade}">
							<input type="hidden" class="id" value="${item.produto.id}">
							<div class="box-btn mais">
								<spam class="simbol-box">+</spam>
							</div>
						</div>
						
						
						<span class="text-inform-itens">R$<span class="vl">${pedido.getValorTotalItem(item)}</span></span>
						
						
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="container-resume-cart">
			<div class="inform-text-cart title-cart">subtotal 
				<span class="details-text-cart">R$ 
					<spam class="sub-total-full">${pedido.subTotal}</spam>
				</span>
			</div>
			
			<div class="inform-text-cart title-cart">entrega
				<p class="inform-frete-none">${pedido.getFrete()}</p> 
				<span class="details-text-cart text-frete">calcular frete</span>
				
				
				<div class="box-frete">
					<input type="text" name="cep" class="input-caep" autofocus="autofocus">
					<button class="btn-form-email btn-frete">
							<spam class="title-btn-email">ok</spam>
					</button>
				</div>
				
			</div>
			<div class="inform-text-cart title-cart">total <span class="details-text-cart">R$ <span class="total-geral-ajax">${pedido.totalgeral}</span></span></div>
			<div class="btns-page-cart">
					<a class="btn-form-email btn-page-cart" href="/importHair" style="text-decoration:  none;">
						<spam class="title-btn-email">continue comprando</spam>
					</a>	
				<button class="btn-page-check"><spam class="title-btn-email title-btn-check">chek out</spam></button>
			</div>
		</div>
	</div>
	
	<div class="box-cart-emprty">
		<p class="text-empty-cart">Seu carrinho está vazio.</p>
		
	</div>

</tags:pageTemplate>