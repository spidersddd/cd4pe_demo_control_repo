# This is a profile for the fastb balancer
class profile::app::fastb::balancer {
  class { 'profile::app::haproxy::server':
    calling_role   => $trusted['extensions']['pp_role'],
    listen_service => $trusted['extensions']['pp_preshared_key'],
  }
}

