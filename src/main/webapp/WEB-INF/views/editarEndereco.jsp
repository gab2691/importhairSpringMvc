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
					<div class="opcoes-conta page-edit">
						<p class="nome-opcao text-page-edit">Endereços</p>
					</div>
				</a>
						
				<a href="/logout" class="link-conta">
					<div class="opcoes-conta page-edit">
						<p class="nome-opcao text-page-edit">sair</p>
					</div>
				</a>
			</div>
		</div>
		
		<div class="box-direito-minhaConta">
			<p class="message-alteracao-sucesso"><span class="icon-check"></span> Sua alteração foi realizada com sucesso.</p>
			<p class="message-alteracao-erro"><span class="icon-close2"></span> Preencha todos os campos.</p>
			
			
			<div class="atualiza-dadosPessoais box-editarEndereco">
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="UsuarioAtualizaCep">Cep</label>
						<input class="input-inform input-editaDados" id="UsuarioAtualizaCep" name="cep" type="text" value="${endereco.cep}" "required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaUf">Estado</label>
						<input pattern="[^ @]*@[^ @]*" type="text" name="uf" class="input-inform input-editaDados" value="${endereco.uf}" id="EnderecoAtualizaUf" required="required">
					</div>
				</div>
				
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaCidade">Cidade</label>
						<input pattern="[^ @]*@[^ @]*" type="text" name="cidade" class="input-inform input-editaDados" value="${endereco.cidade}"id="EnderecoAtualizaCidade" required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaBairro">Bairro</label>
						<input class="input-inform input-editaDados" name="bairro" value="${endereco.bairro}" id="EnderecoAtualizaBairro" type="text" required="required">
					</div>
				</div>
				
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaLogradouro">Logradouro</label>
						<input pattern="[^ @]*@[^ @]*" type="text" name="logradouro" class="input-inform input-editaDados" value="${endereco.logradouro}"id="EnderecoAtualizaLogradouro" required="required">
					</div>
					
					<div class="box-label-editaDados">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaNumero">Número</label>
						<input class="input-inform input-editaDados" name="numero" value="${endereco.numero}" id="EnderecoAtualizaNumero" type="text" required="required">
					</div>
				</div>
				
				<div class="box-inputs-editaDados">
					<div class="box-label-editaDados box-complemento">
						<label class="label-input-login label-editarDados" for="EnderecoAtualizaComplemento">Complemento</label>
						<input pattern="[^ @]*@[^ @]*" type="text" name="complemento" class="input-inform input-editaDados" value="${endereco.complemento}"id="EnderecoAtualizaComplemento" required="required">
					</div>
				</div>
				<button class="btn-atualizaDados EnderecoAtualiza"><spam class="title-btn-email">atualizar</spam></button>
			</div>
		</div>
	</div>

</tags:pageTemplate>