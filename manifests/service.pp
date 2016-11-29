# == Class prometheus::service
#
class prometheus::service {
  case $::prometheus::manage_as {
    'container' : {
      # stop package service
      $service_ensure = 'stopped'
      $service_enable = false

      service { "docker-${::prometheus::service_name}":
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

  service { $prometheus::service_name:
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
