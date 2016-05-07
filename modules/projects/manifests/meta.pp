class projects::meta {

    python::version { '2.7.10': }

    package { 'phantomjs': }


    file { 'dir_virtualenvs':
        ensure   => directory,
        path     => '/Users/indika/.virtualenvs',
        owner    => 'indika',
        group    => 'staff',
        mode     => 755,
    }



}
