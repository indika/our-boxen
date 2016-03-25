class people::indika::networking {

  file { '/etc/hosts':
    ensure => present,
    mode => 644,
    source => 'puppet:///modules/people/etc_hosts.txt',
    recurse => false,
    owner => 'root',
    group => 'wheel',
  }

  file { 'ssh_home':
    ensure   => directory,
    path     => '/Users/indika/.ssh',
    owner    => 'indika',
    group    => 'staff',
    mode     => 755, #TODO: Find out what this should be,
  }

  file { '/Users/indika/.ssh/config':
    ensure => present,
    mode => 600,
    source => 'puppet:///modules/people/ssh_config.txt',
    recurse => false,
    owner => 'indika',
    group => 'staff',
    require => File['ssh_home']
  }

  file { 'ssh_config_control':
    ensure   => directory,
    path     => '/Users/indika/.ssh/control/',
    owner    => 'indika',
    group    => 'staff',
    mode     => 700,
    require => File['ssh_home']
  }

}
