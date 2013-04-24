
    class projects::generator-extapp {

	  boxen::project { 'generator-extapp':
	    nginx         => false,
	    source        => 'http://reposerver/git/generator-extapp.git'
	  }
	}

