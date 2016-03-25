class projects::course {

  vcsrepo { "/Users/indika/dev/tutorials/opeleye":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/benkolera/talk-opaleye',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
  }

  vcsrepo { "/Users/indika/dev/tutorials/nicta-course":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/indika/course',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
  }

  vcsrepo { "/Users/indika/dev/tutorials/script-examples":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/Errorific/haskell-script-examples',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
  }


}
