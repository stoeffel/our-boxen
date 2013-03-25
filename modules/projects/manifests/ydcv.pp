class projects::ydcv {
  boxen::project { 'ydcv':
    nginx         => true,
    source        => 'stoeffel/ydcv'
  }
}
