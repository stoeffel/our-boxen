
    class projects::generator-extapp {

	  apache::vhost { 'generator-extapp.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/generator-extapp",
		host => 'generator-extapp.dev'
	  }


	  boxen::project { 'generator-extapp':
	    nginx         => false,
	    source        => 'http://reposerver/git/generator-extapp.git'
	  }
	}

