# This is a example profile to deploy fastb application software.
class profile::app::fastb (
  Stdlib::HTTPSUrl $download_url = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sureshatt/http-demo.war',
  String $app_dir = 'fastb',
) {
  require profile::app::tomcat::webserver

  $user          = $profile::app::tomcat::webserver::user
  $group         = $profile::app::tomcat::webserver::group
  $service       = $profile::app::tomcat::webserver::service
  $catalina_home = $profile::app::tomcat::webserver::tomcat_install_path

  tomcat::war { 'http-demo.war':
    war_source    => $download_url,
    user          => $user,
    catalina_base => $catalina_home,
    group         => $group,
  }

  tomcat::instance { "${trusted['extensions']['pp_role']}-${trusted['extensions']['pp_preshared_key']}":
    catalina_home => $catalina_home,
    catalina_base => "${catalina_home}/http-demo",
  }

  $mysql_passwd = lookup( "profile::app::fastb::fastb_db_password::${trusted['extensions']['pp_preshared_key']}", String,
    'first', 'somesillystringfortestdata')

  @@mysql::db { "fastb_db_${facts['fqdn']}":
    user     => 'fastb_db_user',
    password => $mysql_passwd,
    dbname   => 'fastb_db',
    host     => $facts['fqdn'],
    grant    => [ 'SELECT', 'UPDATE' ],
    tag      => $trusted['extensions']['pp_preshared_key'],
  }

  profile::app::haproxy::balancer_member { $trusted['extensions']['pp_role']:
    service_name => $trusted['extensions']['pp_preshared_key'],
    port         => 8080,
  }
}
