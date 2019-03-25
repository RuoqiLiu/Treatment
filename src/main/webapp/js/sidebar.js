$(function(){
	$(".sidebar_main dd").hide();
	$(".sidebar_main dt").click(function(){
		$(".sidebar_main dt").css({"background-color":"#9D2932"})
		$(this).css({"background-color": "#9C333C"});
		$(this).parent().find('dd').removeClass("menu_choice");
		$(".sidebar_main dt img").attr("src","images/icon.png");
		$(this).parent().find('img').attr("src","images/icon_af.png");
		$(".menu_choice").slideUp(); 
		$(this).parent().find('dd').slideToggle();
  		$(this).parent().find('dd').addClass("menu_choice");
  	});
  });