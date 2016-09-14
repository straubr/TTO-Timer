package Kernel::Language::de_TTO_Timer;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    #Custom/Kernel/Output/HTML/Templates/Standard/TTOTimer.tt
    $Self->{Translation}->{'Time spent zoomed on ticket'} = 'Zeit im Zoom verbracht';

    #Kernel/Config/Files/TTOTimer.xml
    $Self->{Translation}->{'This configuration registers an OutputFilter module that inserts a default time unit into the accounted time field.'} = 'Registriert einen OutputFilter der einen Standardwert in das Zeitfeld einfügt.';
    $Self->{Translation}->{'Defines the default value that should be inserted.'} = 'Konfigurierbarer Standardwert, der eingefügt werden soll.';
    $Self->{Translation}->{'Generate HTML comment hooks for the specified blocks so that filters can use them.'} = 'Erstellt HTML Kommentare im Quelltext, so dass die Filter diese nutzen können.';
    $Self->{Translation}->{'Inject HTML and JavaScript to show a timer in AgentTicketZoom.'} = 'Fügt HTML und JavaScript dem Quelltext hinzu, so dass ein Timer angezeigt wird.';
}

1;
