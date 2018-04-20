<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:pageTemplate>

<div class="container-produtc-page">
	<div class="main-product-page">
		<div class="box-image-product-page">
			<img class="image-product-page" src="<c:url value="/${produto.path}"/>">
		</div>
		
		<div class="box-details-product">
			<div class="box-ref-product-page">
				<p class="ref-product-page">
					ref: ${produto.codigo_alternativo}
				</p>
				<hr class="linha-link-box linha-produtc-ref">
			</div>
			<p class="name-product-page">
				${produto.descricao}
			</p>	
			
			<select class="example">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
			</select>
				
			<div class="preco-product-page">
				<p class="preco-cheio">R$ ${produto.precoCheio}</p>
				<p class="preco-final">R$ ${produto.preco}</p>
			</div>
			
			<div class="qtn-product-page">
				<label>
					<input type="text" class="input-qtn-product" value="1" min="0" pattern="[0-9]+$" required>
				</label>
				<div class="qtn-icon-input">
					<span class="icon-plus-square-o"></span>
					<span class="icon-minus-square-o"></span>
				</div>
				<form action='<c:url value = "/carrinho/add"/>' method="post">
					<button class="btn-form-email btn-product-page"><spam class="title-btn-email">comprar</spam></button>
					<input type="hidden" name="produtoId" value="${produto.id}" />
                    <input type="hidden" name="quantidade" value="1" />
                   	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />	
				</form>
			</div>
			
			<hr class="linha-link-box linha-produtc-end">
			
			<div class="share-procut-page">
				<spam class="title-share">share</spam>
				<div class="box-icon-share">
					<span class="icon-facebook-square"></span>
					<span class="icon-google-plus-square"></span>
					<span class="icon-envelope2"></span>
					<span class="icon-twitter-square"></span>
				</div>
			</div>
				
		</div>
	</div>
	
	<div class="container-info-products">
		<div class="main-titles-info">
			<div class="titles-info">
				<div class="box-title-info select-box">
					<spam class="title-info colorBlack">descrição</spam>
				</div>
				
				<div class="box-title-info click-extra-details">
					<spam class="title-info">detalhes adicionais</spam>
				</div>
				
				<div class="box-title-info box-review">
					<spam class="title-info">avaliações</spam>
				</div>
			</div>
		</div>
		<div class="box-descricao">	
			<div class="info-details-product">
				<div class="container-details-product">
					<p class="product-name-info">${produto.descricao}</p>
					
					<p class="descricao-info-datails">
						Minoxidil é desenvolvido para quem possui alopecia androgenética ("calvície hereditária"), que acaba afinando os fios 
						e ocasionando a morte do foliculo capilar, Minoxidil vai agir estimulando o  foliculo a produção fios novos e fortes. 
					</p>
					
					<p class="product-name-info">descrição</p>
					
					<p class="descricao-info-datails">
						O Minoxidil Kirkland possui o poder de conceder vida nova a raiz do cabelo, normalizando o ciclo do folículo, possibilitando 
						maior oxigenação na área aplicada, consequentemente estimulando a vascularização do couro cabeludo, a multiplicação celular da 
						raiz do cabelo e o prolongamento da fase anágena, isto é, a fase de crescimento dos fios capilares.
					</p>
					
					<p class="product-name-info">indicação de uso</p>
					
					<p class="descricao-info-datails">
						Apenas uso tópico, aplicação direta no couro cabeludo.
					</p>
					
					<p class="product-name-info">composição</p>
					
					<p class="descricao-info-datails">
						Ingrediente ativo - Minoxidil 5%, outros ingredientes - álcool, glicol do propylene (60%), purified a água.
					</p>
					
					<p class="product-name-info">validade</p>
					
					<p class="descricao-info-datails">
						02/2019
					</p>
					
							
				</div>
			</div>
		</div>
		
		<div class="extra-details">
				<p class="product-name-info">peso</p> 
				<span class="descricao-info-datails peso-produtc">${produto.peso}g</span>
		</div>
		
		<div class="review">
			<div class="container-review">
				<p class="review-titles">
					classificação
				</p>
				
				<select class="example">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				</select>
				
				<p class="review-titles">
					sua opnião
				</p>
				<label class="review-text">
					<textarea class="text-area" rows="8" cols="129"></textarea>
				</label>
				
				<div class="container-user-review">
					<div class="name-user-review">
						<p class="review-titles">
							nome
						</p>
						<label>
							<input class="input-review-user" type="text">
						</label>		
					</div>
					
					<div class="name-user-review">
						<p class="review-titles">
							email
						</p>
						<label>
							<input class="input-review-user" type="email">
						</label>		
					</div>
				</div>
				<button class="btn-form-email"><spam class="title-btn-email">enviar</spam></button>
			</div>
		</div>
			
	</div>
		<div class="main-produtcs product-page-main">
			<p class="product-name-info">produtos relacionados</p>
			<c:forEach items="${produtos}" var="produto">
				<div class="box-products">
					<a href="product/?id=${produto.id}" class="box-view">
						<p>detalhes</p>
					</a>	
					<img class="image-product" src="<c:url value="/${produto.path}"/>">
					<p class="name-products">${produto.descricao}</p>
					<spam class="preco-original">R$ <spam class="precoSeparado">${produto.precoCheio}</spam></spam>  
					<p class="preco-product">R$ ${produto.preco}</p>
					<button class="add-car"><spam class="text-btn-cart">Adicionar Carrinho</spam></button>
				</div>
			</c:forEach>
		</div>
	
	</div>
</div>






</tags:pageTemplate>