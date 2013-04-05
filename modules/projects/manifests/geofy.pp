
    class projects::geofy {

	  apache::vhost { 'geofy.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/geofy",
		host => 'geofy.dev'
	  }


	  boxen::project { 'geofy':
	    nginx         => false,
	    source        => 'http://reposerver/git/geofy.git'
	  }
	}

