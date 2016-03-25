class people::indika::applications::spotifree {
  package { 'spotifree':
    provider => 'appdmg',
    source   => 'http://spotifree.gordinskiy.com/files/Spotifree.dmg',
  }
}
