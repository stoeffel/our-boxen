class projects::thurgaukultur {

  apache::vhost { 'thurgaukultur.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/thurgaukultur",
	host => 'thurgaukultur.dev'
  }


  boxen::project { 'thurgaukultur':
    nginx         => false,
    source        => 'http://reposerver/git/thurgaukultur.ch'
  }
}
