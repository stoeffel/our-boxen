class projects::schtoeffel {
  boxen::project { 'schtoeffel':
    nginx         => true,
    source        => 'stoeffel/schtoeffel.ch'
  }
}
