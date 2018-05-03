<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>

	<div class="box-title-cart page-account">
		<p class="title-cart">Minha conta</p>
	</div>
	
	<div class="container-page-account">
		
		<div class="box-painel-user">
			<div class="box-title-user">
				<span class="icon-user-circle-o"></span>
				<p class="name-user-account">${usuario.nome}</p>
			</div>
			
			<div class="box-conta-opcao">
				<a href="/editarDados" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">Meus dados</p>
					</div>
				</a>
				
				<a href="/meusPedidos" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">pedidos</p>
					</div>
				</a>
				
				<a href="/editarEndereco" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">Endereços</p>
					</div>
				</a>
				
				<a href="/logout" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">sair</p>
					</div>
				</a>
			</div>
		</div>
		
		<div class="box-direito-opcoes">
			<div class="box-question box-page-acount">
				<div class="title-box">
					<p>Meus dados</p>
					<span class="icon-database"></span>
				</div>
				
				<div class="text-box">
					<p>
						Edite seus dados pessoas com segurança e praticidade
					</p>
				</div>
				<a href="/editarDados" class="link-myAccount">
					<div class="link-box">
						<p>Continuar</p>
						<hr class="linha-link-box linha-myAccount">
					</div>
				</a>
			</div>
			
			<div class="box-question box-page-acount">
				<div class="title-box">
					<p>PEDIDOS</p>
					<span class="icon-clipboard2"></span>
				</div>
				
				<div class="text-box">
					<p>
						Veja o Status de todos seus pedidos já realizados.
					</p>
				</div>
				
				<a href="/meusPedidos" class="link-myAccount">
					<div class="link-box">
						<p>Continuar</p>
						<hr class="linha-link-box linha-myAccount">
					</div>
				</a>
			</div>
			
			<div class="box-question box-page-acount">
				<div class="title-box">
					<p>Endereço de entrega</p>
					<span class="icon-database"></span>
				</div>
				
				<div class="text-box">
					<p>
						Edite seus dados de entrega.
					</p>
				</div>
				
				<a href="/editarEndereco" class="link-myAccount">
					<div class="link-box">
						<p>Continuar</p>
						<hr class="linha-link-box linha-myAccount">
					</div>
				</a>
			</div>
		</div>
	</div>

</tags:pageTemplate>