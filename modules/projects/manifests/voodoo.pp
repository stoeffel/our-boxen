
    class projects::voodoo {

	  apache::vhost { 'voodoo.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/voodoo",
		host => 'voodoo.dev'
	  }


	  boxen::project { 'voodoo':
	    nginx         => false,
	    source        => 'stoeffel/voodoo',
	    nodejs 		  => '0.10'
	  }
	}

