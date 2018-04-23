<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<div class="box-background">

</div>

<div class="user-check">	
		<security:authorize access="isAuthenticated()">
	    	<security:authentication property="principal" var="usuario"/>
    		<span class="name-user">${usuario.nome}</span>
		</security:authorize>
</div>



<div class="menu-container">
		
		<div class="box-massage erro-email">
			<p class="text-message">Esse email já possui cadastro, favor refazer o login</p>
		</div>
		
		<div class="box-massage erro-login">
			<p class="text-message">Login incorreto tente novamente</p>
		</div>
		
		<div class="box-massage erro-envio-senha">
			<p class="text-message">Email não possui cadastro</p>
		</div>	
			
				<div class="box-login">
					<div class="box-title-login">
						<p class="title-login">login</p>
					</div>
					
					<div class="box-label-login">
						<label class="label-input-login" for="UsuarioEmailLogin">Email</label>
						<input class="input-inform" id="UsuarioEmailLogin" name="username" type="email" required/>
					</div>
					
					<div class="box-label-login">
						<label class="label-input-login" for="UsuarioSenhaLogin">Senha</label>
						<input class="input-inform" id="UsuarioSenhaLogin" name="password" type="password" required/>
					</div>
					
					<a href="#" class="RecoverPassword">Esqueceu sua senha?</a>
					<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }"/>
					<button type="submit" class="btn-login">Entrar</button>
					
					<a href="#" class="customer-register-link">Criar conta</a>
				</div>
			
			
			
			
			
		<form action="/addUsuario" method="post">
			<div class="box-cadastro">
				<div class="box-title-login">
					<p class="title-login">Cadastro</p>
				</div>
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioName">Nome Completo</label>
						<input class="input-inform input-cadastro" id="UsuarioName" name="nome" type="text" required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioEmail">Email</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="email" class="input-inform input-cadastro" id="UsuarioEmail" required="required">
					</div>
					
				</div>	
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioEmailAlt">Email alternativo</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="emailAlternativo" class="input-inform input-cadastro" id="UsuarioEmailAlt" required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioSenha">Senha</label>
						<input class="input-inform input-cadastro" name="senha" id="UsuarioSenha" type="password" required="required">
					</div>
					
				</div>
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioTel">Telefone</label>
						<input class="input-inform input-cadastro" name="telefone" id="UsuarioTel" type="text" required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioCep">CEP</label>
						<input class="input-inform input-cadastro" id="UsuarioCep" type="text" name="cep" required="required" min="9" max="9">
					</div>
					
				</div>	
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioEstado">Estado</label>
						<input class="input-inform input-cadastro" id="UsuarioEstado" type="text" name="uf"required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioCId">Cidade</label>
						<input class="input-inform input-cadastro" id="UsuarioCId" type="text" name="cidade" required="required">
					</div>
					
				</div>
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioBairro">Bairro</label>
						<input class="input-inform input-cadastro" id="UsuarioBairro" type="text" name="bairro"required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioLogra">Logradouro</label>
						<input class="input-inform input-cadastro" id="UsuarioLogra" type="text" name="logradouro" required="required">
					</div>
				</div>
				
				<div class="box-inputs-cadastro">
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioNum">Número</label>
						<input class="input-inform input-cadastro" id="UsuarioNum" name="numero" type="text" required="required">
					</div>
					
					<div class="box-label-login label-cadastro">
						<label class="label-input-login" for="UsuarioComple">Complemento</label>
						<input class="input-inform input-cadastro" id="UsuarioComple" name="numero" type="text">
					</div>
				</div> 
				<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}"/>
				<button class="btn-login btn-cadastro">Cadastrar</button>
			</div>	
		</form>
		
			<div class="box-email-cadastro">
				<div class="box-title-login">
					<p class="title-login">Cadastro</p>
				</div>
				
				<div class="box-inputs-cadastro imputs-email-cadastro">
					<div class="box-label-login label-cadastro label-cadastro-email">
						<label class="label-input-login" for="UsuarioEmailVerifica">Email</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="email" class="input-inform input-cadastro input-cadastro-email" id="UsuarioEmailVerifica" required="required">
					</div>
				</div>	
				<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }"/>
				<button class="btn-verifica">Verificar</button>
			</div>	
			
			
			<div class="box-recovrer-password">
				<div class="box-title-login">
					<p class="title-login">Recuperação de senha</p>
				</div>
				
				<div class="box-inputs-cadastro imputs-email-cadastro">
					<div class="box-inform-recoverer">
						<p class="recovere-text">Identifique-se para enviarmos as informações necessarias para criação de uma nova senha</p> 
						<label class="label-input-login" for="UsuarioSenhaRecovere">Email</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="email" class="input-inform input-cadastro input-cadastro-email" id="UsuarioSenhaRecovere" required="required">
					</div>
				</div>	
				<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }"/>
				<button class="btn-envia-senha">Enviar senha</button>
			</div>
			
			<div class="box-recoverer-inform">
				<div class="box-title-login">
					<p class="title-login">Email enviado</p>
				</div>
				
				<div class="box-inputs-cadastro imputs-email-cadastro">
					<div class="box-inform-recoverer">
						<p class="recovere-text">Enviamos um email com as informações fornecidas para fazer a troca da senha. 
						Se o email não chegar em alguns minutos relize o processo novamento ou verifique sua caixa de spam</p> 
					</div>
				</div>	
			</div>
		
		<div class="contact-header">
			<div class="container-cantact">
				<p class="email-container">contatoImportHair@gmail.com</p>
				<span class="icon-email"></span>
				<spam class="barra-contact">|</spam>
				<span class="icon-mobile"></span>
				<p class="email-container">(11)96502-2976</p>
			</div>	
		</div>
		<div class="container-menu">
			<div class="menu-nav">
				<a href="/">
					<img class="logo-class"	src="<c:url value="/resources/imagens/logo1.png"/>">
				</a>
			</div>

			<div class="opçções-user">
				<a href="/" class="link-conta">
					<div class="user-details">
						<span class="icon-home5"></span>
						<p>home</p>
					</div>
				</a>

				<div class="user-details box-header-products">
					<span class="icon-shopping-basket"></span>
					<p>produtos</p>
				</div>
				
				<div class="user-details conta-link">
					<span class="icon-user-o"></span>
					<p>Minha conta</p>
				</div>

				<div class="user-details bag-header">
					<span class="icon-bag"><spam class="bag-quant">${pedido.quantidade}</spam></span>
					<p>Meu carrinho</p>
				</div>
				
				<div class="box-products-header">
					<a href="/product/?id=1" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Minoxidil 1 Mês</p>
						</div>
					</a>
					
					<a href="/product/?id=2" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Minoxidil 2 Mês</p>
						</div>
					</a>
					
					<a href="/product/?id=3" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Minoxidil 3 Mês</p>
						</div>
					</a>
					
					<a href="/product/?id=4" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Minoxidil 6 Mês</p>
						</div>
					</a>
				</div>
				
				<div class="box-account-header">
					<button class="btn-login-header">
						<span class="title-btn-cart">Entrar</span>
					</button>
					
					
					<span class="customer-register-link-header">cliente novo? - Criar conta</span>
					<!-- <a href="/importHair/minhaConta" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Minha conta</p>
						</div>
					</a>
					
					<a href="/importHair/meusPedidos" class="link-product-header">
						<div class="box-options-products">
							<p class="name-products-header">Meus pedidos</p>
						</div>			
					</a> -->
				</div>
				
			</div>
			
		</div>
		
	</div>
	
	<div class="container-car-box">
		<c:forEach var="item" items="${item }">
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
				<a href="/" style="text-decoration:  none;">
					<spam class="title-btn-cart">shopping cart</spam>
				</a>	
			</button>			
			<button class="btn-cart-check"><spam class="title-btn-cart">chek out</spam></button>
		</div>
	
	</div>
	
	
	
