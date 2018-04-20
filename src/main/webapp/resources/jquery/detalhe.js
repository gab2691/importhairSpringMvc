var addColorBtn = function() {
	$(this).addClass("btn-cart-page");
}

var removeColorBtn = function() {
	$(this).removeClass("btn-cart-page");
}

$(".btn-login-header").on("mouseenter", addColorBtn).on("mouseleave",	removeColorBtn);


var somaQtn = function() {
	var qtn = parseInt($(this).parent().find(".qtn-car").val());
	$(this).parent().find(".qtn-car").val(qtn + 1);
	var $this = $(this);

	$.ajax({
		type : "GET",
		url : "/importHair/atualizaTotal",
		data : {
			"id" : $(this).parent().find(".id").val(),
			"quantidade" : qtn + 1,
		},

		success : function(resultado) {
			$this.parent().parent().find(".vl").text(resultado.valorTotalItem);
			$(".sub-total-full").text(resultado.subTotal);

			$(".total-geral-ajax").html(resultado.totalgeral);

			$(".bag-quant").html(resultado.qtn);
		}
	})
}

$(".mais").on("click", somaQtn);

var subtraiQtn = function() {
	var qtn = parseInt($(this).parent().find(".qtn-car").val());
	$(this).parent().find(".qtn-car").val(qtn - 1);
	var $this = $(this);

	if ($this.parent().find(".qtn-car").val() == 0) {
		$(this).parent().parent().parent().fadeOut();
	}

	$.ajax({
		type : "GET",
		url : "/importHair/atualizaTotal",
		contentType : "application/json; charset=utf-8",
		data : {
			"id" : $(this).parent().find(".id").val(),
			"quantidade" : qtn -1,
		},

		success : function(resultado) {
			$this.parent().parent().find(".vl").text(resultado.valorTotalItem);
			$(".sub-total-full").text(resultado.subTotal);

			$(".total-geral-ajax").html(resultado.totalgeral);

			$(".bag-quant").html(resultado.qtn);
		}
	})
}

$(".menos").on("click", subtraiQtn);

var showFrete = function() {
	$(".text-frete").fadeOut();

	setTimeout(function() {
		$(".box-frete").fadeIn().css("display", "flex");
	}, 500)
}

$(".text-frete").on("click", showFrete);

var frete = function() {

	$.ajax({
		type : "GET",
		url : "/importHair/calculaFrete",
		data : {
			"cep" : $(".input-caep").val()
		},

		success : function(resultado) {
			console.log(resultado);
			
			$(".box-frete").addClass("text-frete-ajax");
			$(".box-frete").html(resultado.cep);
			$(".inform-frete-none").html(resultado.freteString);
			$(".btn-page-check").addClass("btn-cheout");
			$(".title-btn-check").css("color", "white");
			$(".btn-page-check").on("mouseenter", addColorBtn).on("mouseleave",	removeColorBtn);
			
			$.ajax({
				type : "GET",
				url : "/importHair/totalGeral",
				data : {},

				success : function(resultado) {
					$(".total-geral-ajax").html(resultado);
				}
			})
		}
	})
}

$(".btn-frete").on("click", frete);


var showLogin = function() {
	$(".box-login").removeClass("remove-login");
	$(".box-background").css("display", "flex");
	$(".box-login").addClass("show-login");
}

var verificaLogin = function() {
	showFrete();
	var frete = parseFloat($(".inform-frete-none").text());
	
	if (frete >= 1) {

		$.ajax({
			type : "GET",
			url : "/importHair/checkOut",
			data : {},

			success : function(resultado) {
				if (resultado == "logar") {
					$('html,body').animate({scrollTop : 10}, 'slow');
					$(".box-background").css("display", "flex");
					$(".box-login").removeClass("remove-login");
					$(".box-login").removeClass("show-login");
					$(".box-login").addClass("show-login");
				}
				
				if (resultado == "checkout") {
					$(location).attr('href', "/importHair/confirmacao");
				}
			}
		})
	}
}	

$(".btn-page-check").on("click", verificaLogin);
