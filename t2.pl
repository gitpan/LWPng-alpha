#!/local/perl/bin/perl -w

use lib "./lib";

use LWP::MainLoop qw(mainloop_run);
#$LWP::EventLoop::DEBUG++;

require HTTP::Request;
require LWP::UA;

$ua = new LWP::UA;

for (1..2) {
    my $req = HTTP::Request->new(GET => "http://localhost/nph-slowdata.cgi");
    $req->header(Accept => "text/*");
    $ua->spool($req);
}

#use Data::Dumper; print Dumper($ua);


mainloop_run();

