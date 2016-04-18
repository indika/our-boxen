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

  file { "/Users/${::boxen_user}/.zpreztorc":
    ensure   => link,
    target   => "/Users/${::boxen_user}/.zprezto/runcoms/zpreztorc",
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/.zprezto']
  }


  case $::hostname {
    'cobalt': {
      notice("Linking Wings ZSH to .zprezto/architectures/osx-cobalt")

      file { "/Users/${::boxen_user}/.zshrc":
        ensure   => link,
        target   => "/Users/${::boxen_user}/.zprezto/architectures/osx-cobalt.sh",
        owner    => $user,
        group    => 'staff',
        mode     => 644,
        require => Vcsrepo['/Users/indika/.zprezto']
      }
    }

    'wings': {
      notice("Linking Wings ZSH to .zprezto/architectures/osx-wings")

      file { "/Users/${::boxen_user}/.zshrc":
        ensure   => link,
        target   => "/Users/${::boxen_user}/.zprezto/architectures/osx-wings.sh",
        owner    => $user,
        group    => 'staff',
        mode     => 644,
        require => Vcsrepo['/Users/indika/.zprezto']
      }
    }

    default: {
      #TODO: I should raise an error
      notice("Unhandled hostname")
    }
  }


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
