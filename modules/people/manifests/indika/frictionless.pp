class people::indika::frictionless {

  include seil
  include seil::login_item

  # change the Caps Lock to Escape
  seil::bind { 'keyboard bindings':
    mappings => { 'capslock' => 53 }
  }

  # # map left control to F19:
  # seil::map { 'control_r': value => 'escape' }


  vcsrepo { "/Users/indika/dev/frictionless":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/indika/frictionless.git',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
  }

  file { '/Users/indika/Library/Keyboard Layouts/Frictionless.bundle':
    ensure => present,
    mode => 644,
    source => '/Users/indika/dev/frictionless/bin/osx/Frictionless.bundle',
    recurse => true,
    owner => 'indika',
    group => 'staff',
    require => Vcsrepo['/Users/indika/dev/frictionless']
  }

  #TODO: Script a variable in here
  #http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Ukelele_2.2.8&filename=Ukelele_2.2.8.dmg
  package { 'Ukelele':
    provider => 'appdmg',
    source   => "http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Ukelele_2.2.8&filename=Ukelele_2.2.8.dmg",
  }

}
