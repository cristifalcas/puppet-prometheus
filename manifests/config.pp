# Class prometheus::config
#
class prometheus::config {
  if $::prometheus::manage_as == 'service' {
    case $::osfamily {
      'RedHat', 'Linux': {
        file { '/etc/sysconfig/prometheus':
          ensure  => 'file',
          mode    => '0644',
          owner   => $::prometheus::user,
          group   => $::prometheus::group,
          content => template("${module_name}/sysconfig/prometheus"),
        }
      }
      'FreeBSD': {
        file { '/etc/rc.conf.d/prometheus':
          ensure  => 'file',
          mode    => '0644',
          owner   => $::prometheus::user,
          group   => $::prometheus::group,
          content => template("${module_name}/freebsd/prometheus"),
        }
        file { '/usr/local/etc/rc.d/prometheus':
          ensure  => 'file',
          mode    => '0555',
          owner   => 'root',
          group   => 'wheel',
          content => template("${module_name}/freebsd/prometheus_rcconf.erb"),
        }
      }
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
