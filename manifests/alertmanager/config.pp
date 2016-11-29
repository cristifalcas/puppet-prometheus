# Class prometheus::alertmanager::config
#
class prometheus::alertmanager::config {
  if $::prometheus::alertmanager::manage_as == 'service' {
    file { '/etc/sysconfig/alertmanager':
      ensure  => file,
      mode    => '0644',
      content => template("${module_name}/sysconfig/alertmanager"),
    }
  }

  if $::prometheus::alertmanager::manage_config {
    $content = template("${module_name}/alertmanager.yml.erb")
  } else {
    $content = undef
  }

  file { "${prometheus::alertmanager::config_dir}/${prometheus::alertmanager::config_file}":
    ensure  => 'file',
    mode    => '0644',
    content => $content,
  }
}
