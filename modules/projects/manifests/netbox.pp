class projects::netbox {

    # include python

    package { 'python': }
    include projects::netbox::mercurial

    # MailArchive stuff
    include postgresql
    postgresql::db { 'mailarchive': }

    package { 'awscli': }

  #   # They end up here
  #   #/opt/boxen/pyenv/versions

    # I'd rather have Homebrew's version of pyenv
    # Not sure, perhaps I shouldn't have the Homebrew's version of it
    # package { 'pyenv': ensure => "latest" }
    # package { 'pyenv-virtualenv': ensure => "latest" }

  #   #TODO: Upgrade to 2.7.9
  #   # Watch it: https://github.com/mloberg/puppet-python/tags.atom
    $version2 = '2.7.8'
    python::version { $version2: }

    # Install the latest version of virtualenv
    python::package { "virtualenv for ${version2}":
        package => 'virtualenv',
        python  => $version2,
    }

  # Python Dependencies
  # click enum34 pydns simplejson mercurial mercurial-keyring httplib2 Fabric Twisted==13.0.0

    python::package { "click for ${version2}":
      package => 'click',
      python  => '2.7.8',
    }
    python::package { "enum34 for ${version2}":
      package => 'enum34',
      python  => '2.7.8',
    }
    python::package { "pydns for ${version2}":
      package => 'pydns',
      python  => '2.7.8',
    }
    python::package { "simplejson for ${version2}":
      package => 'simplejson',
      python  => '2.7.8',
    }
    python::package { "mercurial for ${version2}":
      package => 'mercurial',
      python  => '2.7.8',
    }
    python::package { "mercurial-keyring for ${version2}":
      package => 'mercurial-keyring',
      python  => '2.7.8',
    }
    python::package { "httplib2 for ${version2}":
      package => 'httplib2',
      python  => '2.7.8',
    }
    python::package { "Fabric for ${version2}":
      package => 'Fabric',
      python  => '2.7.8',
    }
    python::package { "Twisted for ${version2}":
      package => 'Twisted',
      python  => '2.7.8',
      version => '>=13.0.0,<=15.4.0',
    }

    # I need lxml for some of my scripts
    # python::package { "Fabric for ${version2}":
    #   package => 'Fabric',
    #   python  => '2.7.8',
    # }


    # Python web dev dependencies
    python::package { "watchdog for ${version2}":
      package => 'watchdog',
      python  => '2.7.8',
    }



    $version3 = '3.4.1'
    python::version { $version3: }

    # Install the latest version of virtualenv
    python::package { "virtualenv for ${version3}":
        package => 'virtualenv',
        python  => $version3,
    }

    # ensure a certain python version is used in a dir
    python::local { '/Users/indika/dev/box/mailarchive':
      version => '3.4.1'
    }

    python::package { "sqlalchemy for ${version3}":
      package => 'sqlalchemy',
      python  => '3.4.1',
    }

  #   # Installing a pyenv plugin
  #   python::plugin { 'pyenv-virtualenvwrapper':
  #     ensure => 'v20140609',
  #     source => 'yyuu/pyenv-virtualenvwrapper',
  #   }

  #   # Running a package script
  #   # pyenv-installed gems cannot be run in the boxen installation environment which uses the system
  #   # python. The environment must be cleared (env -i) so an installed python (and packages) can be used in a new shell.
  #   exec { "env -i bash -c 'source /opt/boxen/env.sh && PYENV_VERSION=${version3} virtualenv venv'":
  #     provider => 'shell',
  #     cwd => "/Users/indika/dev/test_project",
  #     require => Python::Package["virtualenv for ${version3}"],
  #   }

  #   # Set up the PIP configuration
  #   file { 'pip_conf_dir':
  #       ensure   => directory,
  #       path     => '/Users/indika/.pip',
  #       owner    => 'indika',
  #       group    => 'staff',
  #       mode     => 755,
  #   }

  #   file { '/Users/indika/.pip/pip.conf':
  #       ensure   => present,
  #       source => 'puppet:///modules/projects/dot-pip-conf.txt',
  #       owner    => 'indika',
  #       group    => 'staff',
  #       mode     => 644,
  #   require => File['pip_conf_dir']
  # }


}
