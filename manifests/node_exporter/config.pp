# Class prometheus::node_exporter::config
#
class prometheus::node_exporter::config {
  file { '/etc/sysconfig/node_exporter':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/sysconfig/node_exporter"),
  }
}
