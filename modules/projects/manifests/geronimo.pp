
    class projects::geronimo {

	  apache::vhost { 'geronimo.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/geronimo",
		host => 'geronimo.dev'
	  }


	  boxen::project { 'geronimo':
	    nginx         => false,
	    source        => 'stoeffel/geronimo',
	    nodejs 		  => 'v0.10'
	  }
	}

