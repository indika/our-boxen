class people::indika::applications {

  include brewcask

  notice('I need to backup bettertouchtool plist. See mackup for help.')
  package { 'bettertouchtool': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'chicken': provider => 'brewcask' }
  package { 'flux': provider => 'brewcask' }
  package { 'keepassx': provider => 'brewcask' }
  package { 'spotify': provider => 'brewcask' }
  package { 'skype': provider => 'brewcask' }
  package { 'transmission': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  package { 'xquartz': provider => 'brewcask' }

  include iterm2::dev
  include iterm2::colors::arthur
  include iterm2::colors::piperita
  include iterm2::colors::saturn
  include iterm2::colors::solarized_dark
  include iterm2::colors::zenburn



  # include chrome
  # include skype
  # # include dropbox
  # # include clipmenu
  # include transmission
  # # include java
  # include vlc
  # include spotify





  # # class { 'sublime_text':
  # #   build => '3083'
  # # }


  # include vlc
  # include xquartz
  # # include adobe_reader
  # # include alfred
  # # include people::felho::applications::clipgrab

  # include people::indika::applications::clamav
  # #include people::indika::applications::fuse
  # include people::indika::applications::geektool
  # include people::indika::applications::limechat
  include people::indika::applications::firefox
  include people::indika::applications::nordvpn
  # include people::indika::applications::pandora
  include people::indika::applications::pycharm
  include people::indika::applications::tmux
  # include people::indika::applications::rubymine
  # # include people::indika::applications::rust
  # include people::indika::applications::spotifree

  # #TODO: Perhaps this should be a project
  # include people::indika::applications::squid

  # # Handbrake is not mounting correctly
  # # include handbrake

  # # TODO: Can't get this to work
  # # include brewcask
  # # package { 'handbrakecli': provider => 'brewcask' }



  # # include vagrant

  # # Functional dev
  # include people::indika::applications::emacs

  #TODO: If these are deprecated, then delete the files as well
  # Deprecated in favour of brew-cask
  # include virtualbox
  # include firefox
  # include people::indika::applications::chicken_of_the_vnc


}
