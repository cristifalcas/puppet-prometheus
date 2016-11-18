# == Class prometheus::alertmanager::service
#
class prometheus::alertmanager::service {
  service { 'alertmanager':
    ensure => 'running',
    enable => true,
  }
}
