class people::indika::applications::truecrypt (

  $source = 'https://dl.dropboxusercontent.com/u/8261661/resjBlDEvhYB3liuvOX/VeraCrypt_1.0f-2.dmg',
) {
  package { 'VeraCrypt':
    source   => $source,
    provider => 'pkgdmg',
    require  => Package['osxfuse'],
  }

  if ! defined(Package['osxfuse']) {
    package { 'osxfuse':
      provider => 'homebrew',
    }
  }
}
