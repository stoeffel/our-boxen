
    class projects::sabretooth {

	  apache::vhost { 'sabretooth.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/sabretooth",
		host => 'sabretooth.dev'
	  }


	  boxen::project { 'sabretooth':
	    nginx         => false,
	    source        => 'http://reposerver/git/sabretooth'
	  }
	}

