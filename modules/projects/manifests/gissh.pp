
class projects::gissh {

    apache::vhost { 'gissh.dev': 
        port => 80,
             docroot  => "${boxen::config::srcdir}/gis_sh/touch",
             host => 'gissh.dev'
    }


    boxen::project { 'gis_sh/touch':
        nginx         => false,
                      source        => 'http://reposerver/git/gis_sh_touch'
    }
}
