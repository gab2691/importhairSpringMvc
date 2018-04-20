<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\reset.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.5.0/slick.css"/>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.5.0/slick-theme.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fontawesome-stars.css"/>">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/importHair.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/product.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/carrinho.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/novaSenha.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/transicoes.css"/>">					
	<title>ImportHair</title>
</head>

<div class="box-login">
	<div class="box-title-login">
		<p class="title-login">login</p>
	</div>

	<div class="box-label-login">
		<label class="label-input-login" for="UsuarioEmailLogin">Email</label>
		<input class="input-inform" id="UsuarioEmailLogin" name="username"
			type="email" required="nao funciona" />
	</div>

	<div class="box-label-login">
		<label class="label-input-login" for="UsuarioSenhaLogin">Senha</label>
		<input class="input-inform" id="UsuarioSenhaLogin" name="password"
			type="password" required="nao funciona" />
	</div>

	<a href="#" class="RecoverPassword">Esqueceu sua senha?</a> <input
		type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<button class="btn-login">Entrar</button>

	<a href="#" class="customer-register-link">Criar conta</a>
</div>	