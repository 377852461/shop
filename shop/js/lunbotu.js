// JavaScript Document
$(document).ready(function(){
	$('#templet4_select_btn li:first').css('border','none');
	if ($('#templet4_zSlider').length) {
		templet4_zSlider();
		$('#h_sns').find('img').hover(function(){
			$(this).fadeTo(200,0.5);
		}, function(){
			$(this).fadeTo(100,1);
		});
	}
	function templet4_zSlider(ID, delay){
		var ID=ID?ID:'#templet4_zSlider';
		var delay=delay?delay:5000;
		var currentEQ=0, picnum=$('#templet4_picshow_img li').size(), autoScrollFUN;
		$('#templet4_select_btn li').eq(currentEQ).addClass('current');
		$('#templet4_picshow_img li').eq(currentEQ).show();
		$('#templet4_picshow_tx li').eq(currentEQ).show();
		autoScrollFUN=setTimeout(autoScroll, delay);
		function autoScroll(){
			clearTimeout(autoScrollFUN);
			currentEQ++;
			if (currentEQ>picnum-1) currentEQ=0;
			$('#templet4_select_btn li').removeClass('current');
			$('#templet4_picshow_img li').hide();
			$('#templet4_picshow_tx li').hide().eq(currentEQ).slideDown(400);
			$('#templet4_select_btn li').eq(currentEQ).addClass('current');
			$('#templet4_picshow_img li').eq(currentEQ).show();
			autoScrollFUN = setTimeout(autoScroll, delay);
		}
		$('#templet4_picshow').hover(function(){
			clearTimeout(autoScrollFUN);
		}, function(){
			autoScrollFUN = setTimeout(autoScroll, delay);
		});
		$('#templet4_select_btn li').hover(function(){
			var picEQ=$('#templet4_select_btn li').index($(this));
			if (picEQ==currentEQ) return false;
			currentEQ = picEQ;
			$('#templet4_select_btn li').removeClass('current');
			$('#templet4_picshow_img li').hide();
			$('#templet4_picshow_tx li').hide().eq(currentEQ).slideDown(100);
			$('#templet4_select_btn li').eq(currentEQ).addClass('current');
			$('#templet4_picshow_img li').eq(currentEQ).show();
			return false;
		});
	};
})