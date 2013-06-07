package Marquee::Runtime;

use common::sense;
use Data::Dumper::Concise;
use Exporter;
use File::Slurp;
use JSON;

sub get_next_uid {
    my ($self, $rest) = @_;
    my $file = read_file("../etc/persistent.vars");
    my $hash = JSON::XS->new->decode($file);
    $hash->{seq}++;
    my $json = JSON::XS->new->encode($hash);
    write_file("../etc/persistent.vars", $json);
    return $hash->{seq};
};

1;
