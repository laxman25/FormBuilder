jQuery.fn.countDown = function(settings, to) {
	settings = jQuery.extend({
		startFontSize : '20px',
		duration : 1000,
		startNumber : 120,
		endNumber : 0,
		callBack : function() {
		}
	}, settings);
	return this.each(function() {
		//where do we start?
		if(!to && to != settings.endNumber) {
			to = settings.startNumber;
		}
		hours = Math.floor(to / 60);
		minutes = Math.round(to % 60);
		if(minutes < 10) {
			minutes = "0" + minutes;
		}

		//set the countdown to the starting number
		$(this).text(hours + ":" + minutes).css({
			'fontSize' : settings.startFontSize
		});

		//loopage
		$(this).animate({
			'fontSize' : settings.startFontSize
		}, settings.duration, '', function() {
			
			if(to > 60) {//console.log("1"+to);
				$(this).css('color', "#a95f0c");
				$(this).siblings().attr('src', 'images/timer_normal.png');
			} else {//console.log("2"+to);
				$(this).css('color', "#b8120e");
				$(this).siblings().attr('src', 'images/timer_red.png');
			}
			//this code below changes the timer values for every second
			if(to > settings.endNumber + 1) {
				$(this).css("fontSize", settings.startFontSize).text(to - 1).countDown(settings, to - 1);

			} else {
				settings.callBack($(document).find('form').submit());
			}

		});
	});
};
