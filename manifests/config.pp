# Class prometheus::config
#
class prometheus::config {
  if $::prometheus::manage_as == 'service' {
    file { '/etc/sysconfig/prometheus':
      ensure  => 'file',
      mode    => '0644',
      owner   => $::prometheus::user,
      group   => $::prometheus::group,
      content => template("${module_name}/sysconfig/prometheus"),
    }
  }

  if $::prometheus::manage_config {
    $content = template("${module_name}/prometheus.yml.erb")
  } else {
    $content = undef
  }

  file { "${prometheus::config_dir}/${prometheus::config_file}":
    ensure  => 'file',
    mode    => '0644',
    owner   => $::prometheus::user,
    group   => $::prometheus::group,
    content => $content,
  }
}
