require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  
  include git
  include hub
  include nvm

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  
  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # BASH-IT
  $home     = "/Users/${::luser}"
  $bash_it  = "${home}/.bash_it"

  repository { $bash_it:
    source  => 'stoeffel/bash-it'
  }

  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8
  include nodejs::0-10


  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  class { 'ruby::global':
    version => '1.9.3'
  }

  # java
  include java

  # apache
  include apache
  #include php

  # DB
  include mysql
  include postgresql
  include mysql_workbench

  # browser
  include chrome
  include firefox

  # terminal
  include iterm2::dev

  # editors
  include sublime_text_2
  sublime_text_2::package { 'JSsnippets':
    source => 'jprichardson/sublime-js-snippets'
  }
  sublime_text_2::package { 'ScssHighlighting':
    source => 'kuroir/SCSS.tmbundle'
  }
  sublime_text_2::package { 'Theme - Flatland':
    source => 'thinkpixellab/flatland'
  }
  #
  # file { "${boxen::config::srcdir}/our-boxen":
  #   ensure => link,
  #   target => $boxen::config::repodir
  # }
  #

  sublime_text_2::package { 'Themr':
    source => 'skt84/Themr'
  }
  


  include eclipse::dev
  include vim
  vim::bundle { 'hallison/vim-markdown':}
  
  # misc
  #include sencha_cmd
  include alfred2
  include googledrive
  include sourcetree
  include vlc
  include transmission
  include textexpander
  include adium
  include caffeine
  include vmware_fusion



  apache::vhost { 'test.dev': 
    port => 80,
    docroot  => "${boxen::config::srcdir}/test",
    host => 'test.dev'
  }


}
