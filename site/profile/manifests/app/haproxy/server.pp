# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include demo_control_repo::profile::app::haproxy::server
#
# @param listen_services
#   web00:
#     ports     => '80',
#     mode      => 'http',

class profile::app::haproxy::server (
  String $calling_role,
  String $listen_service,
) {
  include ::haproxy
  $deep_listen_services =  lookup("profile::app::haproxy::server::${calling_role}::${listen_service}", {merge => 'deep'})
  assert_type(Hash, $deep_listen_services)
  $deep_listen_services.each | String $service_name, Hash $params | {
    haproxy::listen { $service_name:
      collect_exported => true,
      ipaddress        => $facts['ipaddress'],
      *                => $params,
    }
  }
}
