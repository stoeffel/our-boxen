class projects::hosts_alias {

  boxen::project { 'hosts_alias':
    nginx         => false,
    source        => 'stoeffel/hosts_alias'
  }
}
