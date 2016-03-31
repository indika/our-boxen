class people::indika::core_utils {

  # homebrew::tap { 'homebrew/x11': }

  package {
    [
      'coreutils',
      #'findutils',   # Already specified by Sir Boxen
      #'gnu-tar',     # Already specified by Sir Boxen
      'gnu-sed',
      'gawk',
      'gnutls',
      'gnu-indent',
      'gnu-getopt'
    ]:
  }

  # TODO: http://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities

}
