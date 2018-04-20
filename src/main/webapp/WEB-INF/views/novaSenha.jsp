<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>
<form action="/importHair/contaUsuario/atualizaSenha" method="post">
	<div class="formAlteraSenha">
		<div class="box-title-login titleNovaSenha">
			<p class="title-login">Digite a senha nova</p>
		</div>
		
		<div class="box-inputs-cadastro page-nova">
			<div class="box-label-login label-cadastro page-nova-label">
				<label class="label-input-login" for="UsuarioAletarSenha">Nova senha</label>
				<input class="input-inform input-cadastro input-page-nova" id="UsuarioAletarSenha" name="senha" type="password" required="required">
			</div>
			
			<div class="box-label-login label-cadastro">
				<label class="label-input-login" for="UsuarioConfirmaSenha">Confirma Senha</label>
				<input type="password" name="confirmaSenha" class="input-inform input-cadastro input-page-nova" id="UsuarioConfirmaSenha" required="required">
				<input type="hidden" name="id" value="${usuario.id}">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			</div>
		</div>
		<button class="btn-form-email btn-page-nova"><spam class="title-btn-email">Salvar</spam></button>	
	</div>
</form>					

</tags:pageTemplate>