class projects::biso2 {

  apache::vhost { 'biso2.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/biso2",
	host => 'biso2.dev'
  }


  boxen::project { 'biso2':
    nginx         => false,
    source        => 'http://reposerver/git/biso2'
  }
}
