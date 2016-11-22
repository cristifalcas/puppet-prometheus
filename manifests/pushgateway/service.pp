# == Class prometheus::pushgateway::service
#
class prometheus::pushgateway::service {
  service { 'pushgateway':
    ensure => 'running',
    enable => true,
  }
}
