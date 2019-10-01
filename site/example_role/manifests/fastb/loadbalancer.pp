# This is an example of a product called
# "Fast B" 
# This is a loadbalancer for that product.
class example_role::fastb::loadbalancer {
  include profile::os::baseline
  include profile::app::fastb::balancer
}
