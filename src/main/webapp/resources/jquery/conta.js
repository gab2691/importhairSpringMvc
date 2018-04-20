var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document).ready(function() {
	$("#UsuarioCep").mask('00000-000');
	$("#UsuarioTel").mask('(00)00000-0000');
});

var showLogin = function() {
	$(".box-login").removeClass("remove-login");
	$(".box-background").css("display", "flex");
	$(".box-login").addClass("show-login");
}

$(".conta-link").on("click", showLogin);
$(".btn-login-header").on("click", showLogin);


var removeLogin = function() {
	$(".box-email-cadastro").removeClass("remove-login");
	$(".box-email-cadastro").removeClass("show-login");
	$(".kirkland").removeClass("show-login");
	$(".como-usar").removeClass("show-login");
	$(".efeitos-colaterais").removeClass("show-login");
	$(".box-background").css("display", "none");
	$(".box-login").addClass("remove-login");
	$(".box-cadastro").addClass("remove-login");
	$(".input-inform").val("");
	$(".box-massage").addClass("remove-login");
	$(".box-email-cadastro").addClass("remove-login");
	$(".erro-login").addClass("remove-login");
	$(".box-recovrer-password").addClass("remove-login");
	$(".box-recoverer-inform").addClass("remove-login");
	$(".box-atualiza-user").removeClass("show-login");
	$(".box-atualiza-endereco").removeClass("show-login");
}

$(".box-background").on("click", removeLogin);

var bordaVerde = function() {
	$(this).removeClass("input-borda");
	$(this).addClass("input-borda");
}

var bordaNormal = function() {
	$(this).removeClass("input-borda");
}

$(".input-inform").on("focus", bordaVerde).on("focusout", bordaNormal);

var linkStyle = function() {
	$(this).css("color", "#298888");
}

var removeStyle = function() {
	$(this).css("color", "#34b0b0");
}

$(".RecoverPassword").on("mouseenter", linkStyle).on("mouseleave", removeStyle)

var btnStyle = function() {
	$(this).css("backgroundColor", "#1a5050");
}

var removeBtnStyle = function() {
	$(this).css("backgroundColor", "#34b0b0");
}

$(".btn-login").on("mouseenter", btnStyle).on("mouseleave", removeBtnStyle)
$(".btn-atualiza-user").on("mouseenter", btnStyle).on("mouseleave", removeBtnStyle)

var showCadastro = function() {
	$(".box-email-cadastro").removeClass("show-login");
	$(".box-email-cadastro").removeClass("remove-login");
	$(".box-login").addClass("remove-login");
	$(".box-email-cadastro").addClass("show-login");
	$(".erro-email").removeClass("show-login");
}

$(".customer-register-link").on("click", showCadastro)

var cepAjax = function() {
	var cep = $(this).val();

	if ($(this).on("focusout").val().length <= 9
			&& $("#UsuarioBairro").val().length > 1) {
		return false;
	}

	$('.box-cadastro').LoadingOverlay("show", "slow")
	$.ajax({
		type : "GET",
		url : "/importHair/buscaEndereco",
		contentType : "application/json; charset=utf-8",
		data : {
			"cep" : cep,
		},

		success : function(resultado) {
			setTimeout(function() {
				$("#UsuarioEstado").val(resultado.uf);
				$("#UsuarioCId").val(resultado.cidade);
				$("#UsuarioBairro").val(resultado.bairro);
				$("#UsuarioLogra").val(resultado.rua)
			}, 800);
		},

	})
	setTimeout(function() {
		$('.box-cadastro').LoadingOverlay("hide");
	}, 1500);

}

$("#UsuarioCep").on("focusout", cepAjax)

var verificaEmail = function() {
	var email = $(".input-cadastro-email").val();

	$.ajax({
		type : "GET",
		url : "/importHair/verificaEmail",
		contentType : "application/json; charset=utf-8",
		data : {
			"email" : $(".input-cadastro-email").val(),
		},

		success : function(resultado) {
			console.log(resultado)
			if (resultado == "false") {
				$(".box-email-cadastro").addClass("remove-login");
				$(".box-cadastro").addClass("show-login");
				$("#UsuarioEmail").val(email);
			}

			if (resultado == "true") {
				console.log("vc ja tem cadastro");
				$(".box-email-cadastro").removeClass("show-login");
				$(".box-email-cadastro").removeClass("remove-login");
				$(".box-email-cadastro").addClass("remove-login");
				$(".box-login").removeClass("remove-login");
				$(".box-login").addClass("show-login ");
				$(".erro-email").addClass("show-login");
				$("#UsuarioEmailLogin").val(email);
				
				setTimeout(function() {
					$(".erro-email").addClass("remove-login");
				}, 1500)
			}
		},

	})

}

$(".btn-verifica").on("click", verificaEmail);

$(".btn-login").click(function() {

	var username = $("#UsuarioEmailLogin").val();
	var password = $("#UsuarioSenhaLogin").val();

	$.ajax({
		type : "POST",
		url : "/importHair/login",
		data : {
			"username" : username,
			"password" : password,
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("login-ajax", "true");
			xhr.setRequestHeader(header, token);
		},
		success : function(resultado) {
			if (resultado == "confirmacao") {
				$(location).attr('href', "/importHair/confirmacao");
			}
			
			if (resultado == "conta") {
				$(".box-login").addClass("remove-login");
				$(".box-cadastro").addClass("remove-login");
				$(".box-background").css("display", "none");
				$(location).attr('href', "/importHair/minhaConta");
				
			}
			
		},

		error : function(data, xhr) {
			console.log("login incorreto");
			$(".erro-login").removeClass("remove-login");
			$(".erro-login").removeClass("show-login");
			$(".erro-login").addClass("show-login");

			setTimeout(function() {
				$(".erro-login").addClass("remove-login");
			}, 1500)
		}
	})
});

var showRecoverer = function() {
	$(".box-recovrer-password").removeClass("remove-login");
	$(".box-recovrer-password").removeClass("show-login");
	$(".box-recovrer-password").addClass("show-login");
	$(".box-login").addClass("remove-login");
}

$(".RecoverPassword").on("click", showRecoverer)

var showInformRecoverer = function() {

	var email = $("#UsuarioSenhaRecovere").val();

	$.ajax({
		type : "GET",
		url : "/importHair/geraToken",

		data : {
			"email" : email,
		},

		success : function(resultado) {
			if(resultado == "false"){
				$(".erro-envio-senha").removeClass("remove-login");
				$(".erro-envio-senha").removeClass("show-login");
				$(".erro-envio-senha").addClass("show-login");
				return false;
			}
			
			
			$(".box-recoverer-inform").removeClass("remove-login");
			$(".box-recoverer-inform").removeClass("show-login");
			$(".box-recovrer-password").addClass("remove-login");
			$(".box-recoverer-inform").addClass("show-login");

			$(location).attr('href', resultado);
		},

	})

}

$(".btn-envia-senha").on("click", showInformRecoverer)