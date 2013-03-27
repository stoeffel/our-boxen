class projects::kadenpartner {

  apache::vhost { 'kadenpartner.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/kadenpartner",
	host => 'kadenpartner.dev'
  }


  boxen::project { 'kadenpartner':
    nginx         => false,
    source        => 'http://reposerver/git/kadenpartner.ch'
  }
}
