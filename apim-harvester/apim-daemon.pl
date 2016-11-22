#!/usr/bin/env perl
use warnings;
use strict;
use Daemon::Control;
 
exit Daemon::Control->new(
    name        => "ActiveMQ Message Logger",
    lsb_start   => '$syslog $remote_fs',
    lsb_stop    => '$syslog',
    lsb_sdesc   => 'Phaidra agent: api-m message logger',
    lsb_desc    => 'Takes api-m messages and logs them to mongo.',
    path        => '/usr/local/fedora/phaidra-agents/apim-harvester/apim-harvester',
 
    program     => '/usr/local/fedora/phaidra-agents/apim-harvester/apim-harvester.pl',
  #  program_args => [ '--debug' ], for debugging the harvester
 
    pid_file    => '/usr/local/fedora/phaidra-agents/apim-harvester/apim-harvester.pid',
    stderr_file => '/var/log/phaidra/apim-harvester.out',
    stdout_file => '/var/log/phaidra/apim-harvester.out',
 
    fork        => 2,
 
)->run;
