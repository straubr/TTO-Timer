package Kernel::Output::HTML::FilterElementPost::TTOTimerHook;

use strict;
use warnings;

use JSON;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = \%Param;
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $Config = $ConfigObject->Get( 'Frontend::Output::FilterElementPost' );
    my $Templates = $Config->{TTOTimerHook}->{Templates};

    # return if not in configured view - should never happen
    return unless $Templates->{ $Param{TemplateFile} };

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $HookString = "<!--HookStartCustomerTable-->";
    my $TimerTemplate = $LayoutObject->Output(
        TemplateFile => 'TTOTimer',
    );

    ${ $Param{Data} } =~ s/$HookString/$TimerTemplate\n$HookString/;

    return 1;
}

1;

