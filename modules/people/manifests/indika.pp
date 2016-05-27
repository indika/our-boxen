class people::indika {

    $computer_name = "${::luser}"

    $host_name = $::hostname

    #TODO: Try to create a notice regarding this variable
    notice("Computer name is ${computer_name}")
    notice("Hostname name is ${host_name}")
    notice("User is ${user}")


    # This is a bootstrap repo

    vcsrepo { "/Users/indika/dev/config":
      ensure   => present,
      provider => git,
      source   => "https://github.com/indika/config.git",
      owner    => 'indika',
      group    => 'staff',
    }


    include people::indika::networking
    include people::indika::git_config
    include people::indika::frictionless
    include people::indika::osx_settings
    include people::indika::core_utils
    include people::indika::fonts

    include people::indika::boxen_dev
    include people::indika::applications
    include people::indika::application_settings
    include people::indika::homebrew_packages
    # include people::indika::nix
    include people::indika::zsh

    # include people::indika::functional

    # include people::indika::projects::graph
    include projects::blog
    include projects::netbox
    # include projects::course

    #This is always commented out
    ##include projects::truecrypt

}


