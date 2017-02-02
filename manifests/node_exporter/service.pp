# == Class prometheus::node_exporter::service
#
class prometheus::node_exporter::service {
  if $::prometheus::node_exporter::package_ensure == 'absent' {
    $service_ensure ='stopped'
    $service_enable = false 
  } else {
    $service_ensure ='running'
    $service_enable = true 
  }

  service { 'node_exporter':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
