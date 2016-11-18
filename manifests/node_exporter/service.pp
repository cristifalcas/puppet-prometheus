# == Class prometheus::node_exporter::service
#
class prometheus::node_exporter::service {
  service { 'node_exporter':
    ensure => 'running',
    enable => true,
  }
}
