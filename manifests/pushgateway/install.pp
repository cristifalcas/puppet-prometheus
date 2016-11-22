# Class prometheus::pushgateway::install
#
class prometheus::pushgateway::install {
  package { $::prometheus::pushgateway::package_name: ensure => $::prometheus::pushgateway::package_ensure, }
}
