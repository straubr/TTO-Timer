# --
# Kernel/Language/hu_TTO_Timer.pm - Hungarian translations for TTO-Timer
# Copyright (C) 2016 Balázs Úr, http://www.otrs-megoldasok.hu
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_TTO_Timer;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    #Custom/Kernel/Output/HTML/Templates/Standard/TTOTimer.tt
    $Self->{Translation}->{'Show or hide the content'} = 'A tartalom megjelenítése vagy elrejtése';
    $Self->{Translation}->{'Time spent zoomed on ticket'} = 'Nagyítva eltöltött idő a jegyen';

    #Kernel/Config/Files/TTOTimer.xml
    $Self->{Translation}->{'This configuration registers an OutputFilter module that inserts a default time unit into the accounted time field.'} =
        'Ez a beállítás egy olyan kimenetszűrő modult regisztrál, amely egy alapértelmezett időegységet szúr be az elszámolt idő mezőbe.';
    $Self->{Translation}->{'Defines the default value that should be inserted.'} =
        'Azt az alapértelmezett értéket határozza meg, amelyet be kell szúrni.';
    $Self->{Translation}->{'Generate HTML comment hooks for the specified blocks so that filters can use them.'} =
        'HTML megjegyzéshorgok előállítása a megadott blokkokhoz azért, hogy a szűrők használhassák azokat.';
    $Self->{Translation}->{'Inject HTML and JavaScript to show a timer in AgentTicketZoom.'} =
        'HTML és JavaScript befecskendezése egy időzítő megjelenítéséhez az ügyintézői jegynagyításon.';
}

1;
