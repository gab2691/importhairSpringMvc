<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/confirmacao.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/minhaConta.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/editarDados.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/editarEndereco.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/meusPedidos.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/transicoes.css"/>">					
	<title>ImportHair</title>
</head>
<body class="body">

<%@ include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody />

<%@ include file="/WEB-INF/views/rodape.jsp" %>
	<script src="<c:url value="/resources/jquery\jquery.js"/>"></script>
	<script src="<c:url value="/resources/jquery\jquery.barrating.min.js"/>"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.6.0/src/loadingoverlay.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.6.0/extras/loadingoverlay_progress/loadingoverlay_progress.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/importHair.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/produto.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/detalhe.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/cart.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/confirmacao.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/conta.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/jquery.mask.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/editarDados.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/editarEndereco.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/meusPedidos.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/jquery.complexify.js"/>" charset="utf-8"></script>
	<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
</body>
</html>