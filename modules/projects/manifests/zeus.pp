class projects::zeus {

  apache::vhost { 'zeus.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/zeus",
	host => 'zeus.dev'
  }


  boxen::project { 'zeus':
    nginx         => false,
    source        => 'http://reposerver/git/zeus'
  }
}
