class people::indika::applications::firefox (

) {

  include brewcask
  package { 'firefox': provider => 'brewcask' }


  file { "/Users/indika/.vimperator":
     ensure   => link,
     target   => '/Users/indika/dev/config/firefox/vimperator',
     owner    => 'indika',
     group    => 'staff',
     force    => 'true',
     mode     => 700,
     #TODO: Figure out why this dependency is not working
     #require => Package['Firefox'],
   }

}


