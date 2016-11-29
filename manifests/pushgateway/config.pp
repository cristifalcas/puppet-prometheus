# Class prometheus::pushgateway::config
#
class prometheus::pushgateway::config {
  if $::prometheus::pushgateway::manage_as == 'service' {
    file { '/etc/sysconfig/pushgateway':
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template("${module_name}/sysconfig/pushgateway"),
    }
  }

  file { $::prometheus::pushgateway::persistence_file:
    ensure => 'file',
    mode   => '0644',
    owner  => $::prometheus::pushgateway::pushgateway_user,
    group  => $::prometheus::pushgateway::pushgateway_group,
  }
}
