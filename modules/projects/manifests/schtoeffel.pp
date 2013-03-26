class projects::schtoeffel {
  
  boxen::project { 'schtoeffel':
    nginx         => false,
    source        => 'stoeffel/schtoeffel.ch'
  }
}
