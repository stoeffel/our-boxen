
    class projects::the-project {


	  boxen::project { 'the-project':
	    nginx         => false,
	    source        => 'stoeffel/THE_PROJECT'
	  }
	}

