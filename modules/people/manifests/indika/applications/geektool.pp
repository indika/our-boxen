class people::indika::applications::geektool(
  $version = '3.3.1-311',
){

  # TODO: This does not work because "Couldn't read PKZip signature"
  # package { 'geektool':
  #   ensure   => installed,
  #   source   => "http://download.tynsoe.org/GeekTool-${version}.zip",
  #   provider => compressed_app,
  # }

  file { '/Users/indika/Library/Preferences/org.tynsoe.GeekTool.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/geektool/org.tynsoe.GeekTool.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Vcsrepo['/Users/indika/dev/config'] ]
  }

  file { '/Users/indika/Library/Preferences/org.tynsoe.geeklet.shell.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/geektool/org.tynsoe.geeklet.shell.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Vcsrepo['/Users/indika/dev/config'] ]
  }

  file { '/Users/indika/Library/Preferences/org.tynsoe.geektool3.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/geektool/org.tynsoe.geektool3.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Vcsrepo['/Users/indika/dev/config'] ]
  }

}
