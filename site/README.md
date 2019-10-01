# Puppet Example Roles and Profiles

These directories are example layout of Roles and Profiles practice.  They have been constructed to represent current best practice and to support multiple operating systems.

It SHOULD go without saying that everything should pass linting/validation, but
we're gonna go ahead and say that anyway.

## Example requirements

These examples have been constructed with the following requirements:

| Supported OS | Product Role | State |
|--------------------------|---------------------|-----|
| CentOS 7 | example\_role::fastb::web\_be | Complete |
| CentOS 7 | example\_role::fastb::database | Complete |
| CentOS 7 | example\_role::fastb::loadbalancer | Complete |
| Windows 2012R2 | example\_role::spiders::web\_be | To be done |


  - Modeling should support three operating systems
    - Windows 2012R2
    - CentOS (6,7)
    - Solaris 11.2
  - Two products should be represented
    - Fastb (WIP)
      - Linux and Solaris systems hosting the product
      - Tomcat web backend 'example_role::fastb::web_be'
      - HAProxy loadbalancer 'example_role::fastb::balancer'
      - MYSQL Database server 'example_role::fastb::database'
    - Spider (To Be Done)
      - Windows systems hosting the product
      - IIS Web service 'example_role::spiders::web_be'
      - HAProxy loadbalancer 'example_role::spiders::balancer'
      - SQL Database server 'example_role::spiders::database'
    - These products are examples and will be deploying a `hello world` java application code base
  - Support services
    - While products usually do not share services, support services are used by many products and teams.
    - Example of monitoring service 'example\_role::sup\_svc::monitoring::server'
    - Example of Puppet Master 'example\_role::sup\_svc::puppet::master'
