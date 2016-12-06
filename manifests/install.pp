# Class prometheus::install
#
class prometheus::install {
  case $::prometheus::manage_as {
    'container' : {
      $config_file = "${::prometheus::config_dir}/${::prometheus::config_file}"

      docker::run { $::prometheus::package_name:
        image           => $::prometheus::container_image,
        command         => inline_template("<%= scope.function_template(['prometheus/_prometheus.erb']) %>"),
        volumes         => delete_undef_values([
            "${config_file}:${config_file}",
            "${::prometheus::storage_local_path}:${::prometheus::storage_local_path}",
        ]),
        net             => 'host',
        restart_service => true,
        detach          => false,
        manage_service  => false,
        docker_service  => true,
      }
    }
    default     : {
      package { $::prometheus::package_name: ensure => $::prometheus::package_ensure, }
    }
  }
}
