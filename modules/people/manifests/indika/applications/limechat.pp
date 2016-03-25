class people::indika::applications::limechat(
  $url_base = 'http://downloads.sourceforge.net/project/limechat/limechat',
  $version = '2.42',
){
  package { 'LimeChat':
    provider => 'compressed_app',
    source   => "${url_base}/LimeChat_${$version}.tbz",
  }

  file { '/Users/indika/Library/Preferences/net.limechat.LimeChat.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/limechat/net.limechat.LimeChat.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Package['LimeChat'], Vcsrepo['/Users/indika/dev/config'] ]
  }

}
