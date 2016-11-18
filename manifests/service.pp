# == Class prometheus::service
#
class prometheus::service {
  service { 'prometheus':
    ensure => 'running',
    enable => true,
  }
}
