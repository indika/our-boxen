class people::indika::applications::pycharm (
  $version = '4.5.4',
) {


  $pycharm_home = "/Users/${::boxen_user}/Library/Preferences/PyCharm40"


  # https://download.jetbrains.com/python/pycharm-professional-2016.1.dmg
  # https://download.jetbrains.com/python/pycharm-professional-4.5.3.dmg
  # package { 'PyCharm':
  #   provider => 'appdmg',

  #   source   => "http://download.jetbrains.com/python/pycharm-professional-${version}.dmg",
  #   owner    => 'indika',
  #   group    => 'admin',
  # }


  notice("I need to backup my Pycharm keymaps and options once I am happy with it")

  # vcsrepo { "${pycharm_home}/keymaps":
  #   ensure   => latest,
  #   provider => git,
  #   source   => 'https://github.com/indika/PyCharm40-keymaps',
  #   revision => 'master',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }

  # file { "${pycharm_home}/options":
  #    ensure   => link,
  #    target   => '/Users/indika/dev/config/pycharm/options',
  #    owner    => 'indika',
  #    group    => 'staff',
  #    force    => 'true',
  #    mode     => 700,

  #   # TODO: Need to make it dependant on config as well
  #   # require => Package['Pycharm'],
  # }



}

# Need to recursively chown indika:admin

# Now clone the keymap repo, depending on the packaging having been installed
# /Users/indika/Library/Preferences/PyCharm40/keymaps

