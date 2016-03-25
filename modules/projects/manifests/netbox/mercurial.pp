class projects::netbox::mercurial {


  package { 'mercurial': }

  vcsrepo { "/Users/indika/dev/tools/crecord":
    ensure   => latest,
    provider => hg,
    source   => 'https://bitbucket.org/edgimar/crecord',
    owner    => 'indika',
    group    => 'staff',
  }

  file { '/Users/indika/.hgignore':
    ensure   => link,
    target   => '/Users/indika/dev/config/mercurial/.hgignore',
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/dev/config']
  }

  file { '/Users/indika/.hgrc':
    ensure   => link,
    target   => '/Users/indika/dev/config/mercurial/.hgrc_nb',
    owner    => $user,
    group    => 'staff',
    mode     => 644,
    require => Vcsrepo['/Users/indika/dev/config']
  }

}
