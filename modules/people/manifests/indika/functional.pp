class people::indika::functional {

  include brewcask
  package { 'haskell-platform': provider => 'brewcask' }

  #This takes too long
  #package { 'haskell-stack': }

  vcsrepo { "/Users/indika/dev/functional":
    ensure   => present,
    provider => git,
    source   => "https://github.com/indika/functional.git",
    owner    => 'indika',
    group    => 'staff',
  }

  # require sublime_text::config

  # This might work, but I know for sure that adding this to sublime:
  # https://github.com/SublimeHaskell/SublimeHaskell/tree/hsdev
  # does work

  # so does symlinking my User


  # vcsrepo { "${sublime_text::config::packagedir}/SublimeHaskell":
  #   ensure   => latest,
  #   provider => git,
  #   source   => 'https://github.com/SublimeHaskell/SublimeHaskell',
  #   revision => 'hsdev',
  #   owner    => 'indika',
  #   group    => 'staff',
  # }

  # This needs to be cabal built
  vcsrepo { "/Users/indika/dev/tools/sublimehaskell-sandbox":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/indika/sublimehaskell-sandbox.git',
    owner    => 'indika',
    group    => 'staff',
  }

}
