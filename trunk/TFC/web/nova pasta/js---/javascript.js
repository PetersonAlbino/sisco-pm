var contact_section = 'contact_syncode';
var x=new Array();
	x['contact_syncode']=0;
	x['individual_contact']=-169;
var sections=new Array();
	sections['contact_syncode']='individual_contact';
	sections['individual_contact']='contact_syncode';
$(document).ready(function(){
	lock =0;
	var height = 45;
	var items=new Array();
	items['home']=58;
	items['apps']=152;
	items['idaccount']=275;
	items['blog']=379;
	items['aboutus']=484;
	items['support']=604;
	items['contact']=720;
	$("#sprite").css({backgroundPosition:''+items[$('.selected').attr("id")]+'px '+height+'px'});
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mouseover(function(){ 
	$("#sprite").stop().animate({backgroundPosition:''+items[$(this).attr("id")]+'px '+height+'px'},{duration:320});});
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mouseout(function(){ if(lock == 0) { $("#sprite").stop().animate({backgroundPosition:''+items[$('.selected').attr("id")]+'px '+height+'px'},{duration:320}); } });
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mousedown(function(){ lock =1; });
	
	$("#contact_syncode,#individual_contact").mouseover(function(){  if(contact_section != $(this).attr("id")) { $("#"+$(this).attr("id")).css({backgroundPosition: x[$(this).attr("id")]+'px -46px'});   } });
	$("#contact_syncode,#individual_contact").mouseout(function(){  if(contact_section != $(this).attr("id")) { $("#"+$(this).attr("id")).css({backgroundPosition: x[$(this).attr("id")]+'px 0px'});   } });
	
	$("#contact_syncode,#individual_contact").mousedown(function(){ id = $(this).attr("id"); $("#"+id).css({backgroundPosition: x[id]+'px -92px'});     });
	
	$("#learn_more").mousedown(function(){ $(this).attr("src","images/home_centre_image_synotes_learn_more_pressed.png");      });
	
	$("#web_app").mousedown(function(){ $(this).attr("src","images/home_centre_image_synotes_web_app_pressed.png");      });

	$(".mouserover").mousedown(function(){ $(".mouserover").fadeOut("fast");     });
	$(".mouseclick").mousedown(function(){  $(".mouserover").fadeIn("fast"); $(".click_here").fadeOut("fast");  });
	
	$(".download,.syncopy_intro_download").mouseover(function(){ $(".syncopy_mac_box").show('slow');     });
	$(".download,.syncopy_intro_download").mouseout(function(){ $(".syncopy_mac_box").fadeOut();     });


	$(".syncopy_iphone_dot").mousedown(function(){
	 swap_screenshot( $(this).attr("id").replace("syncopy_iphone_dot_", ""), 1);   
	 });
	 $(".syncopy_iphone_next").mousedown(function(){
	 if(total_screenshots != current_screenshot)
	 {
	  swap_screenshot(current_screenshot+1, 1);
	 } 
	  });
	  $(".syncopy_iphone_prev").mousedown(function(){
	  
	 if(1 != current_screenshot)
	 {
	  swap_screenshot(current_screenshot-1, 1);
	 }
	 });
	 
	 
	 	$(".synotes_iphone_dot").mousedown(function(){
	 	 swap_screenshot( $(this).attr("id").replace("synotes_iphone_dot_", ""), 2);   
	 	 });
	 	 $(".synotes_iphone_next").mousedown(function(){
	 	 if(total_screenshots != current_screenshot)
	 	 {
	 	  swap_screenshot(current_screenshot+1, 2);
	 	 } 
	 	  });
	 	  
	 	  $(".synotes_iphone_prev").mousedown(function(){
	 	  
	 	 if(1 != current_screenshot)
	 	 {
	 	  swap_screenshot(current_screenshot-1, 2);
	 	 }
	     
	   });
	   
	 $(".android_dot").mousedown(function(){
	 swap_screenshot( $(this).attr("id").replace("android_dot_", ""), 3);   
	 });
	 $(".android_next").mousedown(function(){
	 if(total_screenshots != current_screenshot)
	 {
	  swap_screenshot(current_screenshot+1, 3);
	 } 
	  });
	  $(".android_prev").mousedown(function(){
	  
	 if(1 != current_screenshot)
	 {
	  swap_screenshot(current_screenshot-1, 3);
	 }
	 });
	   
	   
	if(window.location.hash == '#syncode')
	{
		swap_contact('contact_syncode')
	}
	else if(window.location.hash == '#individual')
	{
		swap_contact('individual_contact')
	}
	
	$(".mouseclick").mousedown(function(){  $(".mouserover").fadeIn("fast");  });
	
	
	
	
	$(".syncopy_iphone_simple").mousedown(function(){ 
	
	$('.syncopy_iphone_simple strong').attr('class', '');
	$("#"+$(this).attr('id')+" strong" ).attr('class', 'active');
	
	$('#feature_expanded_inner').fadeOut(160);
	setTimeout("$('#feature_expanded_inner').html('"+$(this).html()+"').fadeIn(160);",160);
	var pt = $(this).attr('id') * 51 - 110;
	$("#feature_expanded_outer").stop().animate({marginTop:pt+'px'},{duration:320});
	});
});
var current_screenshot = 1;
var total_screenshots = 6;
function swap_screenshot(image, where)
{
	if(where == 1)
	{
		app = 'syncopy_iphone';
		size = 321;
		margin = 81;
        app_2 = '';
		device = 'iphone';
	}
	else if( where == 2 )
	{
		app = 'synotes_iphone';
		app_2 = '_synotes';
		size = 278;
		margin = 121;
		device = 'iphone';
	}
	else if(where == 3)
	{
		app = 'android';
		size = 368;
		margin = 43;
        app_2 = '';
		device = 'android';
	}
		if(image != current_screenshot)
		{
		$("#"+app+"_dot_"+current_screenshot).attr('class', app+'_dot');
		
		if(current_screenshot > image)
		{
 			$("#"+device+"_screenshots"+app_2).animate({ opacity: 0, marginTop: (margin-30)+"px" }, 300 )
 			.animate({ marginTop: (margin+30)+"px" }, 1 )
 			.animate({ backgroundPosition: "0 " + (image*size-size) + "px" }, 1 )
 			.animate({ opacity: 1, marginTop: margin+"px" }, 300 );
		} else
		{
		$("#"+device+"_screenshots"+app_2).animate({ opacity: 0, marginTop: (margin+30)+"px" }, 300 )
		.animate({ marginTop: (margin-30)+"px" }, 1 )
		.animate({ backgroundPosition: "0 " + (image*size-size) + "px" }, 1 )
		.animate({ opacity: 1, marginTop: margin+"px" }, 300 );
		
		}
		
		current_screenshot = image;
		$("#"+app+"_dot_"+image).attr('class', app+'_dot '+app+'_dot_active');
		//syncopy_iphone_dot_active
		}	
}


function swap_contact(id)
{
	//body_individual_contact
	//body_contact_syncode
	old_section = contact_section;
	contact_section = sections[old_section];

	$("#"+sections[old_section]).css({backgroundPosition: x[sections[old_section]]+'px -92px'});  
	$("#"+old_section).css({backgroundPosition: x[old_section]+'px 0px'}); 
		
	$("#body_"+old_section).hide('fast');
	$("#body_"+contact_section).show('fast')
	
	
}
function fade_in(id)
{
	
	setTimeout ( $(id).show('slow'), 2000 );

}
function slideToggle(id)
{
	
	$('#'+id).slideToggle('slow')

}
function toggle(toggle)
{
		$(toggle).slideToggle('slow');
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
