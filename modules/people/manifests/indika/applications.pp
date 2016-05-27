class people::indika::applications {

  include brewcask

  package { 'airdroid': provider => 'brewcask' }
  package { 'bettertouchtool': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'chicken': provider => 'brewcask' }
  package { 'dropbox': provider => 'brewcask' }
  package { 'flash': provider => 'brewcask' }
  package { 'flux': provider => 'brewcask' }
  package { 'google-chrome': provider => 'brewcask' }
  package { 'google-drive': provider => 'brewcask' }
  package { 'keepassx': provider => 'brewcask' }
  package { 'spotify': provider => 'brewcask' }
  package { 'skype': provider => 'brewcask' }
  package { 'transmission': provider => 'brewcask' }
  package { 'rcdefaultapp': provider => 'brewcask' }
  package { 'tuxguitar': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  #TODO: Find out why vlc is constantly breaking
  # package { 'vlc': provider => 'brewcask' }
  package { 'xquartz': provider => 'brewcask' }

  include iterm2::dev
  include iterm2::colors::arthur
  include iterm2::colors::piperita
  include iterm2::colors::saturn
  include iterm2::colors::solarized_dark
  include iterm2::colors::zenburn



  # include people::indika::applications::clamav
  include people::indika::applications::emacs
  # include people::indika::applications::geektool
  include people::indika::applications::limechat
  include people::indika::applications::firefox
  include people::indika::applications::nordvpn
  # include people::indika::applications::pandora
  include people::indika::applications::pycharm
  include people::indika::applications::tmux
  # include people::indika::applications::rubymine
  # include people::indika::applications::rust
  # include people::indika::applications::spotifree

  # #TODO: Perhaps this should be a project
  # include people::indika::applications::squid

  # I do not use these anymore
  # #include people::indika::applications::fuse


  # # include vagrant

  # # Functional dev
  # include people::indika::applications::emacs

  #TODO: If these are deprecated, then delete the files as well
  # Deprecated in favour of brew-cask
  # include virtualbox
  # include firefox
  # include people::indika::applications::chicken_of_the_vnc

}
