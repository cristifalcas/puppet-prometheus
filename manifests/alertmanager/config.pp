# Class prometheus::alertmanager::config
#
class prometheus::alertmanager::config {
  file { '/etc/sysconfig/alertmanager':
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/sysconfig/alertmanager"),
  }

  file { "${prometheus::alertmanager::config_dir}/${prometheus::alertmanager::config_file}":
    ensure  => 'file',
    mode    => '0644',
    content => template("${module_name}/alertmanager.yml.erb"),
  }
}
