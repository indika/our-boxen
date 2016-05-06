class people::indika::networking {

  file { '/etc/hosts':
    ensure => present,
    mode => 644,
    source => 'puppet:///modules/people/etc_hosts.txt',
    recurse => false,
    owner => 'root',
    group => 'wheel',
  }

  file { '/Users/indika/.ssh':
    ensure   => link,
    target   => '/Users/indika/dev/private/ssh/cobalt',
    owner    => $user,
    group    => 'staff',
    mode     => 700
  }

}
