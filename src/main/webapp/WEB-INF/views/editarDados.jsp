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
				<a href="/importHair/editarDados" class="link-conta">
					<div class="opcoes-conta page-edit">
						<p class="nome-opcao text-page-edit">Meus dados</p>
					</div>
				</a>
				
				<a href="/importHair/meusPedidos" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">pedidos</p>
					</div>
				</a>
				
				<a href="/importHair/editarEndereco" class="link-conta">
					<div class="opcoes-conta">
						<p class="nome-opcao">Endereços</p>
					</div>
				</a>		
				<div class="opcoes-conta">
					<p class="nome-opcao">Sair</p>
				</div>
			</div>
		</div>
		
		<div class="box-direito-minhaConta">
			<p class="message-alteracao-sucesso"><span class="icon-check"></span> Sua alteração foi realizada com sucesso.</p>
			<p class="message-alteracao-erro"><span class="icon-close2"></span> Preencha todos os campos.</p>
			
			
			<div class="atualiza-dadosPessoais">
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioNameAtualiza">Nome Completo</label>
						<input class="input-inform input-editaDados" id="UsuarioNameAtualiza" name="nome" type="text" value="${usuario.nome}" "required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioEmailAtualiza">Email</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="email" class="input-inform input-editaDados" value="${usuario.email}" id="UsuarioEmailAtualiza" required="required">
					</div>
				</div>
				
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioEmailAltAtualiza">Email alternativo</label>
						<input pattern="[^ @]*@[^ @]*" type="email" name="emailAlternativo" class="input-inform input-editaDados" value="${usuario.emailAlternativo}"id="UsuarioEmailAltAtualiza" required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioTelAtualiza">Telefone</label>
						<input class="input-inform input-editaDados" name="telefone" value="${usuario.telefone}" id="UsuarioTelAtualiza" type="text" required="required">
					</div>
				</div>
				<button class="btn-atualizaDados dadosUsuario"><spam class="title-btn-email">atualizar</spam></button>
			</div>
			
			<div class="box-title-senha">
				<p class="text-title-senha">Alteração de senha</p>
			</div>
			<form action="/importHair/atualizaSenha" method="post">
				<div class="container-alteraSenha">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioSenhaAtual">Senha atual</label>
						<input type="password" name="senhaAtual" class="input-inform input-editaSenha" value="${usuario.senha}"id="UsuarioSenhaAtual" required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioSenhaNova">Senha nova</label>
						<input type="password" name="senhaNova" class="input-inform input-editaSenha" id="UsuarioSenhaNova" required="required">
					</div>
				
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioConfirmaSenha">Confirme a senha</label>
						<input type="password" name="conrfirmaSenha" class="input-inform input-editaSenha" id="UsuarioConfirmaSenha" required="required">
					</div>
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<button type="submit" class="btn-atualizaDados"><spam class="title-btn-email">atualizar</spam></button>
				</div>
			</form>		
		</div>
	</div>

</tags:pageTemplate>