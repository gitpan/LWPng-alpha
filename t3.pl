
BEGIN { $LWP::EventLoop::DEBUG++; }

use lib "./lib";
use LWP::MainLoop qw(timeout readable forget mainloop_dump run);


#timeout(\*STDIN, 8);
readable(\*STDIN, sub { sysread(STDIN, $buf, 1); print "$buf"; });

#sleep(3);

require IO::Socket;
my $sock = IO::Socket::INET->new("localhost:70");
readable($sock);
timeout($sock, 5.3);

mainloop_dump;

# forget(\*STDIN);


mainloop_dump;
readable($sock, undef);
mainloop_dump;

run();


