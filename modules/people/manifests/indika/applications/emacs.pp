class people::indika::applications::emacs {


    package {
      [
        'emacs'   #TODO: How do I use head?
      ]:
    }

    file { 'dir_emacs_d':
      ensure   => directory,
      path     => '/Users/indika/.emacs.d',
      owner    => 'indika',
      group    => 'staff',
      mode     => 0700,
    }

    file { "/Users/${::boxen_user}/.emacs":
      ensure   => link,
      target   => "/Users/${::boxen_user}/dev/config/emacs/.emacs",
      owner    => $user,
      group    => 'staff',
      mode     => 644,
      require => Vcsrepo['/Users/indika/.zprezto']
    }

    $emacs_packages_dir = "/Users/${::boxen_user}/dev/osx-emacs-packages"

    # Emacs packages directory
    file { 'dir_emacs_packages_dir':
      ensure   => directory,
      path     => $emacs_packages_dir,
      owner    => 'indika',
      group    => 'staff',
      mode     => 755,
    }

    # Some color theme
    vcsrepo { "${emacs_packages_dir}/color-theme-sanityinc-tomorrow":
      ensure   => present,
      provider => git,
      source   => "https://github.com/purcell/color-theme-sanityinc-tomorrow",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_emacs_packages_dir']
    }


    # Wire in launch.d


  # package { 'Aquamacs':
  #   provider => 'appdmg',
  #   source   => 'https://dl.dropboxusercontent.com/u/8261661/resjBlDEvhYB3liuvOX/Aquamacs-Emacs-3.2.dmg',
  # }

  #TODO: Reconsider spacemacs. It was kewl.
  # # Spacemacs configuration
  # file { '/Users/indika/.spacemacs':
  #   ensure   => link,
  #   target   => '/Users/indika/dev/config/emacs/.spacemacs',
  #   owner    => $user,
  #   group    => 'staff',
  #   mode     => 644,
  #   require => Vcsrepo['/Users/indika/dev/config']
  # }




  # The following 4 is commented out because I am using Spacemacs now

  # file { '/Users/indika/.emacs.d/init.el':
  #   ensure   => link,
  #   target   => '/Users/indika/dev/config/emacs/init.el',
  #   owner    => $user,
  #   group    => 'staff',
  #   mode     => 644
  # }

  # vcsrepo { "/Users/indika/.emacs.d/ergoemacs-mode":
  #   ensure   => latest,
  #   provider => git,
  #   depth    => 1,
  #   source   => 'https://github.com/ergoemacs/ergoemacs-mode.git',
  #   revision => 'master',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }

  # #TODO: Caveat: run make
  # vcsrepo { "/Users/indika/.emacs.d/helm":
  #   ensure   => latest,
  #   provider => git,
  #   depth    => 1,
  #   source   => 'https://github.com/emacs-helm/helm.git',
  #   revision => 'master',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }

  # vcsrepo { "/Users/indika/.emacs.d/emacs-async":
  #   ensure   => latest,
  #   provider => git,
  #   depth    => 1,
  #   source   => 'https://github.com/jwiegley/emacs-async.git',
  #   revision => 'master',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }



}
