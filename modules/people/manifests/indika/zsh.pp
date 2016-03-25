class people::indika::zsh {

  package { 'zsh': }

  #TODO: THis has to be dependant on the dev directory
  #Or perhaps a basic infrastructure class
  repository { 'oh-my-zsh':
    source   => 'https://github.com/indika/oh-my-zsh.git',
    path     => '/Users/indika/dev/oh-my-zsh',
    provider => 'git',
  }

  vcsrepo { "/Users/indika/.zprezto":
    ensure     => present,
    provider   => git,
    source     => 'https://github.com/indika/prezto',
    owner      => 'indika',
    group      => 'staff',
  }

#TODO: I could make architectures a submodule

  file { "/Users/${::boxen_user}/.zlogin":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zlogin",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }

  file { "/Users/${::boxen_user}/.zlogout":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zlogout",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }

  file { "/Users/${::boxen_user}/.zprofile":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zprofile",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }

  file { "/Users/${::boxen_user}/.zshenv":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zshenv",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }

  file { "/Users/${::boxen_user}/.zshrc":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zshrc",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }

  file { "/Users/${::boxen_user}/.zpreztorc":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zpreztorc",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }


  #TODO: Learn how to join strings

  # case $::hostname {
  #   'cobalt': {
  #     notice("This is Cobalt. Creating the link.")

  #     file { '/Users/indika/.zshrc':
  #       ensure => 'link',
  #       target => '/Users/indika/.oh-my-zsh/dotzshrcs/dotzshrc_cobalt',
  #       owner => $user,
  #       group => 'staff',
  #       require => Repository['oh-my-zsh'],
  #     }
  #   }

  #   'wings': {
  #     notice("This is Wings. Creating the link.")

  #     file { '/Users/indika/.zshrc':
  #       ensure => 'link',
  #       target => '/Users/indika/.oh-my-zsh/dotzshrcs/dotzshrc_wings',
  #       owner => $user,
  #       group => 'staff',
  #       require => Repository['oh-my-zsh'],
  #     }
  #   }

  #   default: {
  #     #TODO: I should raise an error
  #     notice("Do not know who this is")
  #   }
  # }


  require boxen::config

  file_line { 'add zsh to /etc/shells':
     path    => '/etc/shells',
     line    => "${boxen::config::homebrewdir}/bin/zsh",
     require => Package['zsh'],
  }

  #TODO: This fails because: Invalid resource type
  osx_chsh { $::luser:
    shell   => "${boxen::config::homebrewdir}/bin/zsh",
    require => File_line['add zsh to /etc/shells'],
  }

}
