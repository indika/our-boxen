#
# These packages will be installed via Homebrew
#

class people::indika::homebrew_packages {

    homebrew::tap { 'homebrew/x11': }

    package {
      [
        'ag',               # The silver searcher
        'dos2unix',
        'fdupes',           # File duplicates
        #'gradle',          # TODO: Why do I need this?
        'fasd',             # On probation
        'fswatch',          # FileSystem watch
        'hub',
        'mobile-shell',
        'mtr',
        'pass',
        'pstree',
        'task',             # Task Warrior
        'terminal-notifier',
        'tree',
        'youtube-dl',
        'watch',
        'wget',
      ]:
    }

    # package { 'rdesktop':
    #     require => 'Package['XQuartz'],
    # }

}
