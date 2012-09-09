
// jQuery plugin to allow animation on background-position.
// http://www.protofunc.com/scripts/jquery/backgroundPosition/
/**
 * @author Alexander Farkas
 * v. 1.22
 */
(function($) {
	if(!document.defaultView || !document.defaultView.getComputedStyle){ // IE6-IE8
		var oldCurCSS = $.curCSS;
		$.curCSS = function(elem, name, force){
			if(name === 'background-position'){
				name = 'backgroundPosition';
			}
			if(name !== 'backgroundPosition' || !elem.currentStyle || elem.currentStyle[ name ]){
				return oldCurCSS.apply(this, arguments);
			}
			var style = elem.style;
			if ( !force && style && style[ name ] ){
				return style[ name ];
			}
			return oldCurCSS(elem, 'backgroundPositionX', force) +' '+ oldCurCSS(elem, 'backgroundPositionY', force);
		};
	}

	var oldAnim = $.fn.animate;
	$.fn.animate = function(prop){
		if('background-position' in prop){
			prop.backgroundPosition = prop['background-position'];
			delete prop['background-position'];
		}
		if('backgroundPosition' in prop){
			prop.backgroundPosition = '('+ prop.backgroundPosition;
		}
		return oldAnim.apply(this, arguments);
	};

	function toArray(strg){
		strg = strg.replace(/left|top/g,'0px');
		strg = strg.replace(/right|bottom/g,'100%');
		strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
		var res = strg.match(/(-?[0-9\.]+)(px|%|em|pt)\s(-?[0-9\.]+)(px|%|em|pt)/);
		return [parseFloat(res[1]),res[2],parseFloat(res[3]),res[4]];
	}

	$.fx.step. backgroundPosition = function(fx) {
		if (!fx.bgPosReady) {
			var start = $.curCSS(fx.elem,'backgroundPosition');
			if(!start){//FF2 no inline-style fallback
				start = '0px 0px';
			}

			start = toArray(start);
			fx.start = [start[0],start[2]];
			var end = toArray(fx.end);
			fx.end = [end[0],end[2]];

			fx.unit = [end[1],end[3]];
			fx.bgPosReady = true;
		}
		//return;
		var nowPosX = [];
		nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
		nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];
		fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];

	};
})(jQuery);

/* imported script from Syncode website for menu */
// define menu positions
var menuHeight = 45;
var menuItems = new Array();
menuItems['home'] = 50;
menuItems['apps'] = 145;
menuItems['idaccount'] = 255;
menuItems['blog'] = 375;
menuItems['aboutus'] = 460;
menuItems['support'] = 585;
menuItems['contact'] = 715;

$(function() {
	// menu setup
	var menuHold = false;
	$("#sprite").css({backgroundPosition: menuItems[$('.selected').attr("id")] + 'px ' + menuHeight + 'px'});
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mouseover(function(){
		$("#sprite").stop().animate({backgroundPosition: menuItems[$(this).attr("id")] + 'px ' + menuHeight + 'px'}, {duration:320});
	});
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mouseout(function(){
		if(!menuHold)
			$("#sprite").stop().animate({backgroundPosition: menuItems[$('.selected').attr("id")] + 'px ' + menuHeight + 'px'}, {duration:320});
	});
	$("#home,#apps,#blog,#aboutus,#support,#idaccount,#contact").mousedown(function(){ menuHold = true; });

	// adjust content height to match animation
	var content = $('#content_data');
	setContent(content, content.html());
});

function measureContent(content)
{
	var div = document.createElement('div');
	document.body.appendChild(div);
	var height = $(div).hide().html(content).height();
	document.body.removeChild(div);
	return height;
}

function setContent(target, content)
{
	// measure content
	var height = measureContent(content) + 75; // h1

	target.stop().hide();
	target.html(content);

	// if message box is in content, make it animate
	var msg = $('#message');
	if(msg)
	{
		var msgHeight = 60; //measureContent(msg.html()) + 20 + 4;  // padding & border
		msg.show().css({ width: 0, height: msgHeight }).animate({ width: '60%' });
		height += msgHeight;
	}

	// don't trust slideDown() so do it ourselves
	target.show().animate({ height: height + 'px' });
}

// Ajax loader
function loadContentViaAjax(href, postData, dest)
{
	dest = $((dest === undefined || dest == null) ? '#content_data' : dest);
	dest.slideUp().html('').addClass('ajaxLoading');
	$.ajax({
		type: (postData === undefined || postData == null) ? 'GET' : 'POST',
		url: href,
		data: postData,
		success: function(receivedData)
		{
			setContent(dest, receivedData);
			dest.removeClass('ajaxLoading');
		},
		error: function(xhr, status, httpError)
		{
			dest.removeClass('ajaxLoading');
			alert('Sorry, cannot process your submission to the server. This may be because your connection to the server is not secure.');
			window.location = 'https://account.syncode.co.uk';
		}
	});
	return false;
}
