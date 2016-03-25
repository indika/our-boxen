class people::indika::applications::pandora (
  $version = '4.5.3',
) {

    include brewcask

    package { 'adobe-air': provider => 'brewcask' }

    define remote_file($remote_location=undef, $mode='0644'){
      exec{"retrieve_${title}":
        command => "/opt/boxen/homebrew/bin/wget -q ${remote_location} -O ${title}",
        creates => $title,
      }

      file{$title:
        mode    => $mode,
        require => Exec["retrieve_${title}"],
      }
    }

    remote_file{'/Users/indika/Reconstruction/pandora.air':
      remote_location => 'http://www.pandora.com/static/desktop_app/pandora_2_0_9.air',
      mode            => '0755',
    }

}


#http://www.pandora.com/static/desktop_app/pandora_2_0_9.air
