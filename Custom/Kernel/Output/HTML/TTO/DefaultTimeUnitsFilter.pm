package Kernel::Output::HTML::TTO::DefaultTimeUnitsFilter;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # Get needed Objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Get dynamic value
    my $TimerTimeUnits = $ParamObject->GetParam ( Param => "TimerTimeUnits" );

    # Get value from timer param or config
    my $Default_TimeUnits = $TimerTimeUnits || $ConfigObject->Get ('TTO::OutputFilter::Config::DefaultTimeUnitsValue');

    # manipulate HTML content
    $LayoutObject->AddJSOnDocumentComplete ( Code => <<"EOF");
        if ('TimeUnits') {
           \$('#TimeUnits').val( \"$Default_TimeUnits\" );
        }
EOF

    return $Param{Data};

}

1;
