class people::indika::applications::emacs {

  package { 'Aquamacs':
    provider => 'appdmg',
    source   => 'https://dl.dropboxusercontent.com/u/8261661/resjBlDEvhYB3liuvOX/Aquamacs-Emacs-3.2.dmg',
  }

  # Spacemacs configuration

  file { '/Users/indika/.spacemacs':
    ensure   => link,
    target   => '/Users/indika/dev/config/emacs/.spacemacs',
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/dev/config']
  }




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



# source   => 'http://braeburn.aquamacs.org/releases/Aquamacs-Emacs-2.5.dmg',

# http://aquamacs.org/download-release.shtml

# And read this:
# http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Main.MacOSX

}
