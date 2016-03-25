class people::indika::applications::nordvpn {
  package { 'nordvpn':
    provider => 'appdmg',
    source   => 'https://nordvpn.com/api/osxapp/latest',
  }
}
