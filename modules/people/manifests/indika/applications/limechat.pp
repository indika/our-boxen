class people::indika::applications::limechat
{

  package { 'limechat': provider => 'brewcask' }

  file { '/Users/indika/Library/Preferences/net.limechat.LimeChat.plist':
    ensure   => link,
    target   => '/Users/indika/dev/config/limechat/net.limechat.LimeChat.plist',
    owner    => $user,
    group    => 'staff',
    mode     => 600,
    require  => [ Package['limechat'], Vcsrepo['/Users/indika/dev/config'] ]
  }

}
