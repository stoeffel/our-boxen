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
  git::config::global { 'user.email':
    value  => 'schtoeffel@gmail.com'
  }

  include hub

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

  $home     = "/Users/${::luser}"

  # .dotfiles
  $dotfiles  = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'stoeffel/.dotfiles'
  }

  # node versions
  include nodejs::v0_10
  include nodejs::v0_8_8

  # install some npm modules
  nodejs::module { 'bower':
    node_version => 'v0.10'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }
  nodejs::module { 'yo':
    node_version => 'v0.10'
  }

  nodejs::module { 'jshint':
    node_version => 'v0.10'
  }

  #nodenv global v0.10


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
  include chrome::canary
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
  sublime_text_2::package { 'Themr':
    source => 'skt84/Themr'
  }
  sublime_text_2::package { 'DocBlockr':
    source => 'spadgos/sublime-jsdocs'
  }
  sublime_text_2::package { 'JsFormat':
    source => 'jdc0589/JsFormat'
  }
  sublime_text_2::package { 'EditorConfig':
    source => 'sindresorhus/editorconfig-sublime'
  }
  sublime_text_2::package { 'Sublime-Hacker-News-Reader':
    source => 'Dimillian/Sublime-Hacker-News-Reader'
  }
  sublime_text_2::package { 'GitGutter':
    source => 'jisaacks/GitGutter'
  }
  sublime_text_2::package { 'CSS-Snippets':
    source => 'joshnh/CSS-Snippets'
  }
  sublime_text_2::package { 'VintageEx':
    source => 'SublimeText/VintageEx'
  }
  
  
  


  include eclipse::dev

  include zsh
  file { "/Users/${::boxen_user}/.zshrc":
    target  => "/Users/${::boxen_user}/.dotfiles/zshrc",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }
  file { "/Users/${::boxen_user}/.zprofile":
    target  => "/Users/${::boxen_user}/.dotfiles/zprofile",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }
    repository {
      "/Users/${::boxen_user}/z":
        source   => 'rupa/z', #short hand for github repos
        provider => 'git';
    }

  # vim

  include vim
  include macvim
  # Example of how you can manage your .vimrc
  file { "/Users/${::boxen_user}/.vimrc":
    target  => "/Users/${::boxen_user}/.dotfiles/vimrc",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }
  file { "/Users/${::boxen_user}/.gvimrc":
    target  => "/Users/${::boxen_user}/.dotfiles/gvimrc",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }
  file { "/Users/${::boxen_user}/.vim/snippets":
    target  => "/Users/${::boxen_user}/.dotfiles/vim_snippets",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }
  vim::bundle { 'hallison/vim-markdown':}
  vim::bundle { 'sjl/gundo.vim':}
  vim::bundle { 'maksimr/vim-jsbeautify':}
  vim::bundle { 'scrooloose/nerdtree':}
  vim::bundle { 'editorconfig/editorconfig-vim':} 
  vim::bundle { 'wincent/Command-T':} 
  vim::bundle { 'vim-scripts/jshint.vim':} 
  vim::bundle { 'Valloric/YouCompleteMe':} 
  vim::bundle { 'tpope/vim-surround':} 
  vim::bundle { 'terryma/vim-multiple-cursors':} 
  vim::bundle { 'mileszs/ack.vim':} 
  vim::bundle { 'Lokaltog/powerline':}
  vim::bundle { 'Lokaltog/powerline-fonts':} 
  vim::bundle { 'altercation/vim-colors-solarized':} 
  vim::bundle { 'tpope/vim-fugitive':} 
  vim::bundle { 'msanders/snipmate.vim':} 
  vim::bundle { 'scrooloose/syntastic':} 

  file { "/Users/${::boxen_user}/.jshintrc":
    target  => "/Users/${::boxen_user}/.dotfiles/jshintrc",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }

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

  apache::vhost { 'boa.dev': 
    port => 80,
    docroot  => "${boxen::config::srcdir}/boa",
    host => 'boa.dev'
  }

  # OSX - Settings

  include osx::universal_access::ctrl_mod_zoom

}
