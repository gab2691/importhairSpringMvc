<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>

	<form action="/atualizaUsuario" method="post">
		<div class="box-atualiza-user">
			<div class="box-title-login">
				<p class="title-login">Informações pessoais</p>
			</div>
			
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioNameAtualiza">Nome Completo</label>
					<input class="input-inform input-cadastro" id="UsuarioNameAtualiza" name="nome" type="text" value="${usuario.nome}" "required="required">
				</div>
				
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioEmailAtualiza">Email</label>
					<input pattern="[^ @]*@[^ @]*" type="email" name="email" class="input-inform input-cadastro" value="${usuario.email}" id="UsuarioEmailAtualiza" required="required">
				</div>
				
			</div>	
				
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioEmailAltAtualiza">Email alternativo</label>
					<input pattern="[^ @]*@[^ @]*" type="email" name="emailAlternativo" class="input-inform input-cadastro" value="${usuario.emailAlternativo}"id="UsuarioEmailAltAtualiza" required="required">
				</div>
				
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioTelAtualiza">Telefone</label>
					<input class="input-inform input-cadastro" name="telefone" value="${usuario.telefone}" id="UsuarioTelAtualiza" type="text" required="required">
				</div>
				
			</div>
			
			<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }"/>
			<button class="btn-atualiza-user">Atualizar</button>
		</div>	
	</form>
	
	
	<form action="/atualizaEndereco" method="post">
		<div class="box-atualiza-endereco">
			<div class="box-title-login">
				<p class="title-login">Informações de Entrega</p>
			</div>
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaCep">CEP</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaCep" type="text" name="cep" value = "${endereco.cep}"required="required" min="9" max="9">
				</div>
				
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaEstado">Estado</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaEstado" type="text" value = "${endereco.uf}" name="uf"required="required">
				</div>
			</div>	
			
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaCid">Cidade</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaCid" type="text" value = "${endereco.cidade}" name="cidade" required="required">
				</div>
				
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaBairro">Bairro</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaBairro" type="text" value = "${endereco.bairro}" name="bairro"required="required">
				</div>
			</div>
				
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaLogra">Logradouro</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaLogra" type="text" value = "${endereco.logradouro}" name="logradouro" required="required">
				</div>
				
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaNum">Número</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaNum" name="numero"value = "${endereco.numero}"  type="text" required="required">
				</div>
			</div>
			
			<div class="box-inputs-cadastro">
				<div class="box-label-login label-cadastro">
					<label class="label-input-login" for="UsuarioAtualizaComple">Complemento</label>
					<input class="input-inform input-cadastro" id="UsuarioAtualizaComple" value = "${endereco.complemento}" name="numero" type="text">
				</div>
			</div> 

			
			<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }"/>
			<button class="btn-atualiza-end">Atualizar</button>
		</div>	
	</form>
	<div class="container-confirm-page">
		<div class="container-editi-inform">
			
			<div class="box-details-inform">
				<div class="box-title-details">
					<span class="icon-user-circle-o"></span>
					<p class="title-details-inform">Informações pessoais</p>
					<a href="#" class="link-details-inform edit-user">Editar</a>
				</div>
				<p class="title-details-inform custom-size">Bem vindo ${usuario.nome}!!!!</p>
				
				<div class="user-inform-details">
					<p class="link-details-inform">${usuario.email}</p>
					<p class="link-details-inform">${usuario.telefone}</p>
				</div>
			</div>
			
			<div class="box-details-inform">
				<div class="box-title-details">
					<span class="icon-location"></span>
					<p class="title-details-inform">Endereço de entrega</p>
					<a href="#" class="link-details-inform link-end">Editar</a>
				</div>
				<p class="title-details-inform custom-size">Bem vindo ${usuario.nome}!!!!</p>
				
				<div class="user-inform-details">
					<p class="link-details-inform">${endereco.logradouro}, ${endereco.numero}</p>
					<p class="link-details-inform">${endereco.complemento}</p>
					<p class="link-details-inform">${endereco.bairro} - ${endereco.cidade}/${endereco.uf}</p>
					<p class="link-details-inform">CEP: ${endereco.cep}</p>
				</div>
			</div>
			
			<div class="box-details-inform">
				<div class="box-title-details">
					<span class="icon-credit-card"></span>
					<p class="title-details-inform payment-title">Formas de pagamento</p>
				</div>
				<p class="link-details-inform text-paymente">Selecione a sua forma de pagamento!!</p>
				<div class="user-inform-details box-paytment">
					<p class="link-details-inform title-payment"><span class="icon-dollar"></span> Pagseguro</p>
				</div>
			</div>
			
		</div>
		
		
		<div class="container-pedido-resumo">
			<p class="title-resumo">Seu pedido</p>
			<c:forEach var="item" items="${item }">
				<div class="box-product-car box-page-confirm">
					<p class="total-item-cart qtn-cart-header">${item.quantidade} </p>	
					<img class="image-product img-cart-header" src="<c:url value="/${item.produto.path}"/>">
					<p class="name-products name-cart-header confirm-page">${item.produto.descricao}</p>
					<p class="id-product">${item.produto.id}</p>
					<span class="total-item-cart confirm-page">R$<span class="vl">${pedido.getValorTotalItem(item)}</span></span>
				</div>
			</c:forEach>
			
			<div class="container-resume-cart">
				<div class="inform-text-cart title-cart confirm-page-text">subtotal 
					<span class="details-text-cart">R$<spam class="sub-total-full">${pedido.subTotal}</spam></span>
				</div>
				
				<div class="inform-text-cart title-cart confirm-page-text">entrega 
					<span class="details-text-cart">frete(SEDEX) ${pedido.getFrete()}</span>
				</div>
				<div class="inform-text-cart title-cart confirm-page-text">total <span class="details-text-cart">R$ <span class="total-geral-ajax">${pedido.totalgeral}</span></span></div>
			</div>
			
			<button type="submit" class="btn-form-email btn-page-confirm">
				<a href="" style="text-decoration:  none;margin:  auto;">
					<span class="title-btn-email">Finalizar pedido</span>
				</a>	
			</button>
		</div>
	
	</div>


</tags:pageTemplate>