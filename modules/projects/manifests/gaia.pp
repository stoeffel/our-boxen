
    class projects::gaia {

	  apache::vhost { 'gaia.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/gaia",
		host => 'gaia.dev'
	  }


	  boxen::project { 'gaia':
	    nginx         => false,
	    source        => 'http://reposerver/git/gaia.git'
	  }
	}

