class people::indika::applications::chicken_of_the_vnc {

  package { 'Chicken_of_the_vnc':
    ensure   => installed,
    source   => 'http://downloads.sourceforge.net/chicken/Chicken-2.2b2.dmg',
    provider => 'appdmg'
  }

  file { '/Users/indika/Library/Preferences/net.sourceforge.chicken.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/chicken/net.sourceforge.chicken.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Package['Chicken_of_the_vnc'], Vcsrepo['/Users/indika/dev/config'] ]
  }

}
