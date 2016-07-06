$(function(){
    // Cache some selectors
    var clock = $('#clock');

    // returns (ceil-)rounded minutes
    function round (number) {
        return Math.ceil(number/60);
    }

    var StartTime = new Date();
    var TimerBaseLink = '';

    // On click send the current time as param to the note screen
    $('#clock').on('click', function () {
        // Add TicketID and timer units to link
        // first get baselink
        if (TimerBaseLink == '') {
            TimerBaseLink = $('#TimerLink').attr('href');
        }
        
        // Get the ID of the current ticket
        var baseURL = location.href.split('index.pl?');
        var params = baseURL[1].split(';');
        var TicketID = '';
        for (index = 0; index < params.length; ++index) {
            var curParam = params[index].split('=');
            if (curParam[0] == "TicketID"){
                TicketID = curParam[1];
            }
        }

        // Then create the link of the div
        var now = new Date();
        var total_time = round(Math.floor( (now.getTime() - StartTime.getTime() ) /1000 ));

        var NewLink = TimerBaseLink + "AgentTicketNote;TicketID=" + TicketID;
        NewLink += ";TimerTimeUnits=" + total_time;

        // And change it before the request is sent
        $('#TimerLink').attr('href', NewLink);
    
    });

    var total_time = 0;

    // Map digits to their names (this will be an array)
    var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

    // This object will hold the digit elements
    var digits = {};

    // Positions for the hours, minutes, and seconds
    var positions = [
        'h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2'
    ];

    // Generate the digits with the needed markup,
    // and add them to the clock

    var digit_holder = clock.find('.digits');

    $.each(positions, function(){

        if(this == ':'){
            digit_holder.append('<div class="dots">');
        }
        else{

            var pos = $('<div>');

            for(var i=1; i<8; i++){
                pos.append('<span class="d' + i + '">');
            }

            // Set the digits as key:value pairs in the digits object
            digits[this] = pos;

            // Add the digit elements to the page
            digit_holder.append(pos);
        }

    });

    function return_time (seconds) {
        // returns an array in format:
        // HHMMSS
        var hours = Math.floor(seconds/3600);
        var minutes = Math.floor((seconds - (hours * 3600)) / 60);
        var seconds = seconds - (hours * 3600) - (minutes * 60);
        if (hours < 10) {hours = "0" + hours;}
        if (minutes < 10) {minutes = "0" + minutes;}
        if (seconds < 10) {seconds = "0" + seconds;}
        return (hours + minutes + seconds).split("");
    }

    // Run a timer every second and update the clock
    (function update_time(){

        var now = new Date();
        var secondsDiff = Math.floor((now.getTime() - StartTime.getTime()) / 1000);
        var diff = return_time (secondsDiff); 

        digits.h1.attr('class', digit_to_name[diff[0]]);
        digits.h2.attr('class', digit_to_name[diff[1]]);
        digits.m1.attr('class', digit_to_name[diff[2]]);
        digits.m2.attr('class', digit_to_name[diff[3]]);
        digits.s1.attr('class', digit_to_name[diff[4]]);
        digits.s2.attr('class', digit_to_name[diff[5]]);

        // Schedule this function to be run again in 1 sec
        if (secondsDiff < 28800) { // 8 hours should suffice
            setTimeout(update_time, 1000);
        }
    })();
});
