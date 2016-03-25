class people::indika::boxen_dev {

    $boxen_dev_dir = "/Users/${::boxen_user}/dev/osx-boxen"
    $puppet_modules_dir = "${boxen_dev_dir}/puppet-modules"

    # Root directory
    file { 'dir_osx-boxen':
      ensure   => directory,
      path     => $boxen_dev_dir,
      owner    => 'indika',
      group    => 'staff',
      mode     => 755, #TODO: Find out what this should be,
    }

    # Puppet module directory
    file { 'dir_puppet-modules':
      ensure   => directory,
      path     => $puppet_modules_dir,
      owner    => 'indika',
      group    => 'staff',
      mode     => 755,
      require  => File['dir_osx-boxen']
    }

    # Github's Boxen
    vcsrepo { "${boxen_dev_dir}/their-boxen":
      ensure   => present,
      provider => git,
      source   => "https://github.com/boxen/our-boxen",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_osx-boxen']
    }

    # Felho's Boxen
    vcsrepo { "${boxen_dev_dir}/felho-boxen":
      ensure   => present,
      provider => git,
      source   => "https://github.com/felho/boxen.git",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_osx-boxen']
    }

    # This is a module that I'm developing. It's kindof empty
    vcsrepo { "${puppet_modules_dir}/puppet-virtualenv":
      ensure   => present,
      provider => git,
      source   => "https://github.com/indika/puppet-virtualenv.git",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_puppet-modules']
    }

    vcsrepo { "${puppet_modules_dir}/puppet-systemd":
      ensure   => latest,
      provider => git,
      source   => "https://github.com/camptocamp/puppet-systemd",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_puppet-modules']
    }

    vcsrepo { "${puppet_modules_dir}/puppetlabs-firewall":
      ensure   => latest,
      provider => git,
      source   => "https://github.com/puppetlabs/puppetlabs-firewall",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_puppet-modules']
    }

    vcsrepo { "${puppet_modules_dir}/puppetlabs-openvpn":
      ensure   => latest,
      provider => git,
      source   => "https://github.com/annejan/puppet-openvpn",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_puppet-modules']
    }

    # This might teach me how to backup my configuration
    vcsrepo { "${boxen_dev_dir}/mackup":
      ensure   => present,
      provider => git,
      source   => "https://github.com/lra/mackup",
      depth    => 1,
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_osx-boxen']
    }

    # My kitchen
    vcsrepo { "${boxen_dev_dir}/kitchen":
      ensure   => present,
      provider => git,
      source   => "https://github.com/indika/kitchen",
      owner    => 'indika',
      group    => 'staff',
      require  => File['dir_osx-boxen']
    }

    # And a bit of ansible stuff
    # Puppet module directory
    file { 'dir_ansible-hosts':
      ensure   => directory,
      path     => "/etc/ansible",
      owner    => 'root',
      group    => 'wheel',
      mode     => 755,
    }

    file { '/etc/ansible/hosts':
      ensure   => link,
      target   => '/Users/indika/dev/config/misc/ansible.hosts.txt',
      owner    => 'root',
      group    => 'wheel',
      mode     => 644,
      require => File['dir_ansible-hosts']
    }

}
