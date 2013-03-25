class projects::schtoeffel {
  boxen::project { 'schtoeffel':
    dotenv        => false,
    nginx         => true,
    source        => 'stoeffel/schtoeffel.ch'
  }
}
