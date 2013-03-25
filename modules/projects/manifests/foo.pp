
# foo.pp
class projects::foo {
    # core modules, needed for most things
  include dnsmasq
  include nginx
  include nvm
  include wget
  include autoconf
  include libtool
  include pkgconfig
  include pcre



  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0


    # BASH-IT
  $home     = "/Users/${::luser}"
  $bash_it  = "${home}/.bash_it"

  repository { $bash_it:
    source  => 'stoeffel/bash-it'
  }



  # custom stuff
  include sublime_text_2
  include iterm2::dev
  include vmware_fusion
  include sourcetree
  include googledrive



  # PHP
  # Install php 5.4
  require php::5-4
  # Install a php version and set as the global default php
  class { 'php::global':
    version => '5.4.10'
  }

  # Run multiple PHP-FPM services
  include php::fpm::5-4-11
}