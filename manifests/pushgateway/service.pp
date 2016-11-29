# == Class prometheus::pushgateway::service
#
class prometheus::pushgateway::service {
  case $::prometheus::pushgateway::manage_as {
    'container' : {
      $service_ensure = 'stopped'
      $service_enable = false

      service { "docker-${::prometheus::pushgateway::service_name}":
        ensure   => 'running',
        enable   => true,
        provider => 'systemd',
      }
    }
    default     : {
      $service_ensure = 'running'
      $service_enable = true
    }
  }

  service { 'pushgateway':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
