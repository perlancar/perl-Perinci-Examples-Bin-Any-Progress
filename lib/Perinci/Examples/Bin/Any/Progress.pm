package Perinci::Examples::Bin::Any::Progress;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::Any '$log';

use Time::HiRes qw(sleep);

our %SPEC;

$SPEC{progress1} = {
    v => 1.1,
    summary => 'Show progress and print log message',
    features => {
        progress => 1,
    },
};
sub progress1 {
    my %args = @_;

    my $progress = $args{-progress};

    $progress->pos(0) if $progress;
    $progress->target(10) if $progress;
    for (1..10) {
        $log->info("Log #$_") if $_ % 3 == 0;
        $progress->update(pos => $_, message => "Update #$_ ...")
            if $progress;
        sleep 0.1;
    }
    $progress->finish if $progress;

    [200, "OK"];
}

1;
# ABSTRACT: Example CLI scripts that use progress indicator

=head1 DESCRIPTION

This distribution contains the following scripts:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<Perinci::Examples::Bin> and other C<Perinci::Examples::Bin::*> distros.
