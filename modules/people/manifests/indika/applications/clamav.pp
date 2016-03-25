class people::indika::applications::clamav{

   # Read: https://gist.github.com/paulspringett/8802240

   # ClamAV has a database directory
   # Perhaps it is here:
   # /opt/boxen/homebrew/Cellar/clamav/0.98.7/share/clamav

    package {
      [ 'clamav' ]:
    }

    file { '/opt/boxen/homebrew/etc/clamav/clamd.conf':
        ensure   => link,
        target   => '/Users/indika/dev/config/clamav/clamd.conf',
        owner    => $user,
        group    => 'staff',
        mode     => 600,
        require  => [ Package['clamav'] ]
    }

    file { '/opt/boxen/homebrew/etc/clamav/freshclam.conf':
        ensure   => link,
        target   => '/Users/indika/dev/config/clamav/freshclam.conf',
        owner    => $user,
        group    => 'staff',
        mode     => 600,
        require  => [ Package['clamav'] ]
    }

}

