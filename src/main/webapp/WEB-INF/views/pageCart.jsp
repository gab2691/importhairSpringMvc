<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach var="item" items="${item}">
			<div class="box-product-car">
				<p class="total-item-cart qtn-cart-header">${item.quantidade} </p>	
				<img class="image-product img-cart-header" src="<c:url value="/${item.produto.path}"/>">
				<p class="name-products name-cart-header">${item.produto.descricao}</p>
				<p class="id-product">${item.produto.id}</p>
				<span class="icon-close"></span>
				<span class="total-item-cart">R$<span class="vl">${pedido.getValorTotalItem(item)}</span></span>
			</div>
		</c:forEach>
		
		<div class="subTotal-cart-header">
			<p class="text-subtotal-cart">Subtotal: R$ <span class="verificarTtal">${pedido.subTotal}</span></p>
		</div>
		
		<div class="btns-cart-header">		
			<button type="submit" class="btn-cart-cont">
				<a href="/importHair" style="text-decoration:  none;">
					<spam class="title-btn-cart">shopping cart</spam>
				</a>	
			</button>			
			<button class="btn-cart-check"><spam class="title-btn-cart">chek out</spam></button>
		</div>
		
	<script src="<c:url value="/resources/jquery\jquery.js"/>"></script>
	<script src="<c:url value="/resources/jquery\jquery.barrating.min.js"/>"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/importHair.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/produto.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/detalhe.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/cart.js"/>" charset="utf-8"></script>