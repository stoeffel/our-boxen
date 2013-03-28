class projects::puppet-apache {

  boxen::project { 'puppet-apache':
    nginx         => false,
    source        => 'stoeffel/puppet-apache'
  }
}
