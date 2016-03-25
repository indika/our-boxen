class projects::blog {

  # What is wrong with this is that I'm installing Jekyll into a global Ruby rbenv

  vcsrepo { "/Users/indika/dev/blog":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/indika/blog.git',
    revision => '222',
    owner    => 'indika',
    group    => 'staff',
  }

  # ensure a certain ruby version is used in a dir
  ruby::local { '/Users/indika/dev/blog':
    version => '2.2.2',
    require => Vcsrepo['/Users/indika/dev/blog']
  }

  # ensure a gem is installed for a certain ruby version
  # note, you can't have duplicate resource names so you have to name like so
  $version = "2.2.2"
  ruby_gem { "jekyll for ${version}":
    gem          => 'jekyll',
    ruby_version => $version,
  }
  ruby_gem { "rdiscount for ${version}":
    gem          => 'rdiscount',
    ruby_version => $version,
  }

}
