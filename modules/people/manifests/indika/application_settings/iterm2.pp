class people::indika::application_settings::iterm2 {
  boxen::osx_defaults { 'Turn off prompt on quit':
    user   => $::luser,
    domain => 'com.googlecode.iterm2',
    key    => 'PromptOnQuit',
    type   => 'bool',
    value  => false,
  }

  file { '/Users/indika/Library/Preferences/com.googlecode.iterm2.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/iterm2/com.googlecode.iterm2.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Package['iTerm'], Vcsrepo['/Users/indika/dev/config'] ]
  }


  vcsrepo { "/Users/indika/Reconstruction/iTerm2-Color-Schemes":
    ensure   => latest,
    depth    => 1,
    provider => git,
    source   => 'https://github.com/mbadolato/iTerm2-Color-Schemes',
    owner    => 'indika',
    group    => 'staff',
  }

# https://github.com/mbadolato/iTerm2-Color-Schemes



# Fetch colors
# https://github.com/mbadolato/iTerm2-Color-Schemes/tarball/master

# define remote_file($remote_location=undef, $mode='0644'){
#   exec{"retrieve_${title}":
#     command => "/usr/bin/wget -q ${remote_location} -O ${title}",
#     creates => $title,
#   }

#   file{$title:
#     mode    => $mode,
#     require => Exec["retrieve_${title}"],
#   }
# }

# remote_file{'/home/vagrant/bin/lein':
#   remote_location => 'https://raw.github.com/technomancy/leiningen/stable/bin/lein',
#   mode            => '0755',
# }

}
