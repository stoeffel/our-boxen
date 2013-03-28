class projects::dev-guide {

  apache::vhost { 'dev-guide.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/dev-guide",
	host => 'dev-guide.dev'
  }


  boxen::project { 'dev-guide':
    nginx         => false,
    source        => 'http://reposerver/git/dev-guide.git'
  }
}
