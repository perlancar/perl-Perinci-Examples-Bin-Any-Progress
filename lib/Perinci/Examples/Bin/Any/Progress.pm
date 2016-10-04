package Perinci::Examples::Bin::Any::Progress;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC:

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

    $progress->set(0) if $progress;
    for (1..10) {
        $log->info("") if $_ % 3 == 0;
        $progress->update(pos => $_, message => "Update #$_ ...")
            if $progress;
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
