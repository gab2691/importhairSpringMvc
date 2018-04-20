var addBoxChange = function() {
	$(".box-title-info").removeClass("select-box");
	$(".title-info").removeClass("colorBlack");
	$(this).toggleClass("select-box");
	$(this).find(".title-info").toggleClass("colorBlack");
}

$(".box-title-info").on("click", addBoxChange);


var showExtraDetails = function() {
	$(".box-descricao").css("display","none");
	$(".review").css("display","none");
	$(".extra-details").css("display","flex");
}

$(".click-extra-details").on("click", showExtraDetails);


var showDescricao = function() {
	$(".extra-details").css("display","none");
	$(".box-descricao").css("display","none");
	$(".review").css("display","none");
	$(".box-descricao").css("display","flex");
}

$(".select-box").on("click", showDescricao);


var showReview = function() {
	$(".box-descricao").css("display","none");
	$(".extra-details").css("display","none");
	$(".review").css("display","flex");
	
}

$(".box-review").on("click", showReview);

$(function() {
    $('.example').barrating({
      theme: 'fontawesome-stars'
    });
 });