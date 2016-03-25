# Public: Install Rust from a pkg file.
#
# Examples
#
#   include rust
class people::indika::applications::rust($version = '1.1.0')
{

  # $version = '1.0.0-alpha.2'
  # $version = 'nightly'
  # $version = '1.1.0'
  $platform = 'apple-darwin' # `uname -s` => "Darwin"
  #$_hardware_identifier = 'i686'
  $_hardware_identifier = 'x86_64' # need to get this via `uname -m`


  # ERROR: Provider pkg is not functional on this host

  package { 'Rust':
    provider => 'pkg',
    source   => "https://static.rust-lang.org/dist/rust-${version}-${_hardware_identifier}-${platform}.pkg"
  }
}
