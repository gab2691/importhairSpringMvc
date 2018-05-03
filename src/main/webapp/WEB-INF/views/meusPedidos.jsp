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
					<div class="opcoes-conta page-edit">
						<p class="nome-opcao text-page-edit">pedidos</p>
					</div>
				</a>
				
				<a href="/editarEndereco" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">Endereços</p>
					</div>
				</a>
				
				<a href="/logout" class="link-conta">
					<div class="opcoes-conta page-edit">
						<p class="nome-opcao text-page-edit">sair</p>
					</div>
				</a>
			</div>
		</div>
		
		<div class="box-direito-meusPedidos">
			<c:forEach var="pedidos" items="${pedidos}">
				<div class="box-pedidos">
					<div class="titles-boxPedidos">
						<div class="box-number">
							<p class="opções-text-titles">pedido</p>
						</div>
						
						<div class="box-data">
							<p class="opções-text-titles">data</p>
						</div>
						
						<div class="box-status">
							<p class="opções-text-titles">status</p>
						</div>
						
						<div class="box-total">
							<p class="opções-text-titles">total</p>
						</div>
						
						<div class="box-opcao">
							<p class="opções-text-titles">opções</p>
						</div>
					</div>
				
					<div class="titles-boxPedidos inform-boxPedido">
					
						<div class="box-number">
							<p class="opções-text-titles details-text">#${pedidos.id}</p>
						</div>
						
						<div class="box-data">
							<p class="opções-text-titles details-text">
								<fmt:formatDate pattern="dd/MM/yyyy"  value="${pedidos.data_pedido}"/>
							</p>
						</div>
						
						<div class="box-status">
							<p class="opções-text-titles details-text">${pedidos.status}</p>
						</div>
						
						<div class="box-total">
							<p class="opções-text-titles text-datails-total">R$${pedidos.total}</p>
						</div>
						
						<div class="box-opcao">
							<span class="pedidoId">${pedidos.id}</span>
							<button class="btn-details-pedido"><spam class="title-btn-email">visualizar</spam></button>
						</div>
					</div>
					
					
					<div class="datails-products">
						
					</div>
				</div>	
			</c:forEach>
		</div>
	</div>
		

</tags:pageTemplate>