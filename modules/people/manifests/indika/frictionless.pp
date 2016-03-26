class people::indika::frictionless {

  include seil
  include seil::login_item

  include karabiner
  include karabiner::login_item

  # change the Caps Lock to Escape
  seil::bind { 'keyboard bindings':
    mappings => { 'capslock' => 53 }
  }

  # # map left control to F19:
  # seil::map { 'control_r': value => 'escape' }


  #SEE: /Applications/Karabiner.app/Contents/Resources/number.xml
  #For the reference of this data

  # TODO: This does not work for a real reason
  # karabiner::set{ 'foobar':
  #   identifier => 'repeat.wait',
  #   value => '221'
  # }
  # karabiner::set{ 'repeat.initial_wait':
  #   value => '26'
  # }


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

  package { 'Ukelele':
    provider => 'appdmg',
    source   => "http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Ukelele_3.0.2&filename=Ukelele_3.0.2.dmg",
  }

}
