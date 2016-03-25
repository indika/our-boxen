class people::indika::nix {

  #http://nixos.org/releases/nix/nix-1.9/nix-1.9.tar.xz

  vcsrepo { "/Users/indika/dev/tools/nixpkgs":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/NixOS/nixpkgs.git',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
    depth    => 1,
  }

  file { 'dir_nixpkgs':
    ensure   => directory,
    path     => '/Users/indika/.nixpkgs',
    owner    => $user,
    group    => 'staff',
    mode     => 755,
  }

  file { '/Users/indika/.nixpkgs/config.nix':
    ensure   => link,
    target   => '/Users/indika/dev/config/nix/config.nix',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    #TODO: Depend on NIX
    # require  => [  ]
  }

  file { 'dir_etc-nix':
    ensure   => directory,
    path     => '/etc/nix',
    owner    => 'root',
    group    => 'wheel',
    mode     => 755,
  }


  file { '/etc/nix/nix.conf':
    ensure   => link,
    target   => '/Users/indika/dev/config/nix/nix.conf',
    owner    => 'root',
    group    => 'wheel',
    mode     => 600,
    #TODO: Depend on NIX
    # require  => [  ]
  }

  file { '/Users/indika/.nix-defexpr/channels':
    ensure   => absent,
  }

  file { '/Users/indika/.nix-defexpr/nixpkgs':
    ensure   => link,
    target   => '/Users/indika/dev/tools/nixpkgs',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    #TODO: Depend on NIX
    # require  => [  ]
  }

#  cd ~/.nix-defexpr
# $ rm -rf channels
# $ ln -s /Users/indika/dev/tools/nixpkgs nixpkgs


# export NIX_PATH=nixpkgs=/Users/indika/dev/tools/nixpkgs

}
