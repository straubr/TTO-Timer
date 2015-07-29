# --
# Kernel/Output/HTML/DefaultTimeUnitsFilter.pm
# Based on this znuny template:
# Kernel/Output/HTML/OutputFilterPreExample.pm - ...
# --

package Kernel::Output::HTML::DefaultTimeUnitsFilter;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
);

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
    my $ParamObject = $LayoutObject->{ParamObject};

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