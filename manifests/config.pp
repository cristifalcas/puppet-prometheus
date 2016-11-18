# Class prometheus::config
#
class prometheus::config {
  file { '/etc/sysconfig/prometheus':
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/sysconfig/prometheus"),
  }

  file { $prometheus::config_dir:
    ensure => 'directory',
    mode   => '0755',
    purge  => $prometheus::purge_config_dir,
  } ->
  file { "${prometheus::config_dir}/${prometheus::config_file}":
    ensure  => 'file',
    mode    => '0644',
    content => template("${module_name}/prometheus.yml.erb"),
  }
}
