# This is a balancermember
define profile::app::haproxy::balancer_member (
  String $service_name = $title,
  Variant[Array[Numeric],Numeric] $port = 80,
  String $options = 'check',
) {
  if ! $trusted['extensions']['pp_preshared_key'] {
    fail("ERROR: trusted.extensions.pp_preshared_key must be set to use ${title}.")
  }

  @@haproxy::balancermember { "${trusted}['extensions']['pp_preshared_key']-${facts['fqdn']}":
    listening_service => $trusted['extensions']['pp_preshared_key'],
    server_names      => $facts['fqdn'],
    ipaddresses       => $facts['ipaddress'],
    options           => $options,
    ports             => $port,
  }
}
