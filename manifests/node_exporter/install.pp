# Class prometheus::node_exporter::install
#
class prometheus::node_exporter::install {
  package { $::prometheus::node_exporter::package_name:
    ensure => $::prometheus::node_exporter::package_ensure,
    notify => Service['node_exporter'],
  }
}
