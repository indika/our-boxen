class people::indika::applications::pycharm {

  package { 'pycharm': provider => 'brewcask' }

  $pycharm_home = "/Users/${::boxen_user}/Library/Preferences/PyCharm2016.1"

  notice("I need to backup my Pycharm keymaps and options once I am happy with it")

  # vcsrepo { "${pycharm_home}/keymaps":
  #   ensure   => latest,
  #   provider => git,
  #   source   => 'https://github.com/indika/PyCharm40-keymaps',
  #   revision => 'master',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }

  file { "${pycharm_home}/options":
     ensure   => link,
     target   => '/Users/indika/dev/config/pycharm/options',
     owner    => 'indika',
     group    => 'staff',
     force    => 'true',
     mode     => 700,

    # TODO: Need to make it dependant on config as well
    require => Package['pycharm'],

  }

  file { "${pycharm_home}/templates":
     ensure   => link,
     target   => '/Users/indika/dev/config/pycharm/templates',
     owner    => 'indika',
     group    => 'staff',
     force    => 'true',
     mode     => 700,

    # TODO: Need to make it dependant on config as well
    require => Package['pycharm'],
  }

}


