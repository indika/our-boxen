class people::indika::networking {

  # Set hosts
  # file { '/etc/hosts':
  #   ensure => present,
  #   mode => 644,
  #   source => 'puppet:///modules/people/etc_hosts.txt',
  #   recurse => false,
  #   owner => 'root',
  #   group => 'wheel',
  # }

  $target = "/Users/indika/dev/private/ssh/${::hostname}"

  file { '/Users/indika/.ssh':
    ensure   => link,
    target   => $target,
    owner    => $user,
    group    => 'staff',
    mode     => 700
  }

}
