class projects::schtoeffel {

  apache::vhost { 'schtoeffel.dev': 
	port => 80,
	docroot  => "${boxen::config::srcdir}/schtoeffel",
	host => 'schtoeffel.dev'
  }


  boxen::project { 'schtoeffel':
    nginx         => false,
    source        => 'stoeffel/schtoeffel.ch'
  }
}
