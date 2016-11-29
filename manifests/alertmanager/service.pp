# == Class prometheus::alertmanager::service
#
class prometheus::alertmanager::service {
  case $::prometheus::alertmanager::manage_as {
    'container' : {
      $service_ensure = 'stopped'
      $service_enable = false

      service { "docker-${::prometheus::alertmanager::service_name}":
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

  service { 'alertmanager':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
