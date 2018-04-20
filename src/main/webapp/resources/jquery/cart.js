var addColorBtnCart = function() {
	$(this).addClass("changeColor-btn-cart");
}

var removeColorBtnCart = function() {
	$(this).removeClass("changeColor-btn-cart");
}

$(".btn-cart-cont").on("mouseenter", addColorBtnCart).on("mouseleave",
		removeColorBtnCart)

var addColorBtn = function() {
	$(this).addClass("btn-cart-page");
}

var removeColorBtn = function() {
	$(this).removeClass("btn-cart-page");
}

$(".btn-cart-check").on("mouseenter", addColorBtn).on("mouseleave",
		removeColorBtn);

var removeItem = function() {
	var $this = $(this);

	$this.parent().find("id-product").text();

	$.ajax({
		type : "GET",
		url : "/importHair/removeItem",
		data : {"id" : $this.parent().find(".id-product").text()
				},

	success : function(resultado) {
		$this.parent().fadeOut();

		$.ajax({
			type : "GET",
			url : "/importHair/atualizaTotal",
			data : {},
	
			success : function(resultado) {
				$this.parent().parent().find(".vl").text(resultado.valorTotalItem);
				$(".sub-total-full").text(resultado.subTotal);
	
				$(".total-geral-ajax").html(resultado.totalgeral);
	
				$(".bag-quant").html(resultado.qtn);
	
				if ($(".verificarTtal").text() == "0") {
					$(".container-car-box").html("<p class=text-cart-empty>Seu carrinho está vazio</p>");
					}
				}
			})
		}
	})
}
$(".icon-close").on("click", removeItem);

var shorCart = function() {
	$(".container-car-box").removeClass("remove-drop-top-right");
	$(".container-car-box").addClass("drop-top-right");
}

var closeCart = function() {
	$(".container-car-box").addClass("remove-drop-top-right");
}

$(".bag-header").on("mouseenter", shorCart).on("mouseleave", closeCart)

var showCart = function() {
	$(".container-car-box").removeClass("remove-drop-top-right");
	$(".container-car-box").addClass("drop-top-right");
}

var closeCartbox = function() {
	$(".container-car-box").addClass("remove-drop-top-right");
}

$(".container-car-box").on("mouseenter", showCart).on("mouseleave",
		closeCartbox)

var ajaxCart = function() {

	$.ajax({
		type : "GET",
		url : "/importHair/cartPage",
		data : {},
	
		success : function(resultado) {
	
			if ($(".bag-quant").text() == "0") {
				$(".container-car-box").html("<p class=text-cart-empty>Seu carrinho está vazio</p>");
			}
		}
	})
}

$(".bag-header").on("mouseenter", ajaxCart)