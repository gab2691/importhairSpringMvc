$(document).ready(function() {
	$('.slider').slick({
		slidesToShow : 1,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 3000,
		fade: true,
		cssEase: 'linear'
	})
});


var changeColor = function() {
	$(this).css({"transition" : ".25s"}).addClass("btn-cart");
	$(this).find(".text-btn-cart").css({"transition" : ".25s"}).addClass("name-btn-cart");
}

var removeColor = function() {
	$(this).css({"transition" : ".25s"}).removeClass("btn-cart");
	$(this).find(".text-btn-cart").css({"transition" : ".25s"}).removeClass("name-btn-cart");
}

$(".add-car").on("mouseenter", changeColor).on("mouseleave", removeColor);

var changeColorBtn = function() {
	$(this).css({"transition" : ".25s"}).addClass("btn-slider-change");
	$(this).find(".btn-slider-text").css({"transition" : ".25s"}).addClass("name-btn-slider");
}

var removeColorBtn = function() {
	$(this).css({"transition" : ".25s"}).removeClass("btn-slider-change");
	$(this).find(".btn-slider-text").css({"transition" : ".25s"}).removeClass("name-btn-slider");
}

$(".btn-slider").on("mouseenter", changeColorBtn).on("mouseleave", removeColorBtn);

var addLinkContinue = function() {
	$(this).css({"transition" : ".25s"}).addClass("color-link-continue");
	$(this).find(".link-continue").css({"transition" : ".25s"}).addClass("color-link-continue");
	$(this).find(".linha-link-box").css({"transition" : ".25s"}).addClass("linha-link-box-width");
}

var removeaLinkContinue = function() {
	$(this).css({"transition" : ".25s"}).removeClass("color-link-continue");
	$(this).find(".link-continue").css({"transition" : ".25s"}).removeClass("color-link-continue");
	$(this).find(".linha-link-box").css({"transition" : ".25s"}).removeClass("linha-link-box-width");

}

$(".link-box").on("mouseenter", addLinkContinue).on("mouseleave", removeaLinkContinue);

var addBtnEmailColor = function() {
	$(this).css({"transition" : ".25s"}).addClass("BtnEmailColor");
	$(this).find(".title-btn-email").css({"transition" : ".25s"	}).addClass("colorWhite");
}

var removeBtnEmailColor = function() {
	$(this).css({"transition" : ".25s"}).removeClass("BtnEmailColor");
	$(this).find(".title-btn-email").css({"transition" : ".25s"}).removeClass("colorWhite");
}

$(".btn-form-email").on("mouseenter", addBtnEmailColor).on("mouseleave",removeBtnEmailColor);

var addviewboxproducts = function() {
	$(this).parent().find(".box-view").addClass("view-box-products");

}

var removeviewboxproducts = function() {
	$(this).parent().find(".box-view").css({"transition" : "0.5s"}).removeClass("view-box-products");
}

var addbtnView = function() {
	$(this).parent().find(".box-view").addClass("name-btn-view");
	$(this).parent().find(".box-view").addClass("btn-view");
}

var removebtnView = function() {
	$(this).parent().find(".box-view").removeClass("name-btn-view");
	$(this).parent().find(".box-view").removeClass("btn-view");
}

$(".image-product").on("mouseenter", addviewboxproducts).on("mouseleave", removeviewboxproducts);
$(".box-view").on("mouseenter", addviewboxproducts).on("mouseleave", removeviewboxproducts);
$(".box-view").on("mouseenter", addbtnView).on("mouseleave", removebtnView);

var addColorLink = function() {
	$(this).find(".name-products-header").addClass("color-link-header");
}

var removeColorLink = function() {
	$(this).find(".name-products-header").removeClass("color-link-header");
}
$(".link-product-header").on("mouseenter", addColorLink).on("mouseleave", removeColorLink);


var showBoxProducts = function() {
	$(this).parent().find(".box-products-header").removeClass("remove-drop-top-right")
	$(this).parent().find(".box-products-header").addClass("drop-top-right")
	
	$(this).removeClass("remove-drop-top-right")
	$(this).addClass("drop-top-right")
}

var hideBoxProducts = function() {
	$(this).parent().find(".box-products-header").addClass("remove-drop-top-right")
}

$(".box-header-products").on("mouseenter", showBoxProducts).on("mouseleave", hideBoxProducts);


$(".box-products-header").on("mouseenter", showBoxProducts).on("mouseleave", hideBoxProducts);



var showBoxConta = function() {
	$(this).parent().find(".box-account-header").removeClass(
			"remove-drop-top-right")
	$(this).parent().find(".box-account-header").addClass("drop-top-right")

	$(this).removeClass("remove-drop-top-right")
	$(this).addClass("drop-top-right")

	if ($(".name-user").length == 1) {
		$(".box-account-header").html(
						"<a href='/importHair/minhaConta' class='link-product-header link-account-header'> "
								+ "<div class='box-options-products'>"
								+ "<p class='name-products-header'>Minha conta</p>"
								+ "</div>"
								+ "</a> "
								+ "<a href='/importHair/meusPedidos' class='link-product-header link-account-header'> "
								+ "<div class='box-options-products'>"
								+ "<p class='name-products-header'>Meus Pedidos</p>"
								+ "</div>"
								+ "</a>"
								+ "<a href='/importHair/logout' class='link-product-header link-account-header'> "
								+ "<div class='box-options-products'>"
								+ "<p class='name-products-header'>Sair</p>"
								+ "</div>" + "</a>")
								
		$(".box-account-header").css("width","11em");
		
		$(".box-account-header").css("left","52em");

		var addColorLinkAccount = function() {
			$(this).find(".name-products-header").addClass("color-link-header");
		}

		var removeColorLinkAccount = function() {
			$(this).find(".name-products-header").removeClass("color-link-header");
		}
		$(".link-account-header").on("mouseenter", addColorLinkAccount).on("mouseleave", removeColorLinkAccount);								
	}

}

var hideBoxConta = function() {
	$(this).parent().find(".box-account-header").removeClass("drop-top-right")
	$(this).parent().find(".box-account-header").addClass("remove-drop-top-right")
}

$(".conta-link").on("mouseenter", showBoxConta).on("mouseleave", hideBoxConta);


$(".box-account-header").on("mouseenter", showBoxConta).on("mouseleave", hideBoxConta);

var addColorLink = function() {
	$(this).find(".name-products-header").addClass("color-link-header");
}

var removeColorLink = function() {
	$(this).find(".name-products-header").removeClass("color-link-header");
}
$(".link-product-header").on("mouseenter", addColorLink).on("mouseleave", removeColorLink);

var showBoxCadastro = function() {
	$(".box-email-cadastro").removeClass("remove-login");
	$(".box-email-cadastro").removeClass("show-login");
	$(".box-background").css("display", "flex");
	$(".box-email-cadastro").addClass("show-login");
}

$(".customer-register-link-header").on("click",showBoxCadastro)

var addColorLinkHeader = function() {
	$(this).addClass("color-link-header");
}

var removeColorLinkHeader = function() {
	$(this).removeClass("color-link-header");
}

$(".customer-register-link-header").on("mouseenter",addColorLinkHeader).on("mouseleave",removeColorLinkHeader)

var showBoxKirkland = function() {
	$(".box-background").css("display", "flex");
	$(".kirkland").addClass("show-login");
}

$(".link-kirkland").on("click", showBoxKirkland)



var showBoxComoUsar = function() {
	$(".box-background").css("display", "flex");
	$(".como-usar").addClass("show-login");
}

$(".link-comoUsar").on("click", showBoxComoUsar)


var showBoxComoUsar = function() {
	$(".box-background").css("display", "flex");
	$(".efeitos-colaterais").addClass("show-login");
}

$(".link-EfeitosColaterais").on("click", showBoxComoUsar)


var pageProduct = function() {
	$(location).attr('href', "/product/?id=23");
}

$(".btn-slider").on("click", pageProduct)