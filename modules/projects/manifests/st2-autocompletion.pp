
    class projects::st2-autocompletion {

	  apache::vhost { 'st2-autocompletion.dev': 
		port => 80,
		docroot  => "${boxen::config::srcdir}/st2-autocompletion",
		host => 'st2-autocompletion.dev'
	  }


	  boxen::project { 'st2-autocompletion':
	    nginx         => false,
	    source        => 'stoeffel/st2-autocompletion'
	  }
	}

