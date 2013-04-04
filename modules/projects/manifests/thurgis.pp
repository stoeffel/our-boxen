
    class projects::thurgis {

	  apache::vhost { 'thurgis.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/thurgis",
		host => 'thurgis.dev'
	  }


	  boxen::project { 'thurgis':
	    nginx         => false,
	    source        => 'http://reposerver/git/thurgis_touch'
	  }
	}

