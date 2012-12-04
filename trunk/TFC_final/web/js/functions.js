$(document).ready(function () {
    $(".cadastro-basico").click(function () {
        $("#big-menu-hidden").toggle("fast");
        $("#big-menu-hidden2").hide();
		$("#big-menu-hidden3").hide();
		$("#big-menu-hidden4").hide();
		
		
    });

    $(".cadastro-basico2").click(function () {
        $("#big-menu-hidden2").toggle("fast");
        $("#big-menu-hidden").hide();
		$("#big-menu-hidden3").hide();
		$("#big-menu-hidden4").hide();
		
		
		
    });
	
	$(".cadastro-basico3").click(function () {
        $("#big-menu-hidden3").toggle("fast");
        $("#big-menu-hidden").hide();
		$("#big-menu-hidden2").hide();
		$("#big-menu-hidden4").hide();
		
		
    });
	
	$(".cadastro-basico4").click(function () {
		$("#big-menu-hidden4").toggle("fast");
        $("#big-menu-hidden").hide();
		$("#big-menu-hidden2").hide();
		$("#big-menu-hidden3").hide();
		
	});
});
//The code is very easy. When user click (you can change it to .hover) a button with a "big-menu-launcher" class the div with id=big-menu-hidden is show and if the user clik other time or in close button the box is hidden