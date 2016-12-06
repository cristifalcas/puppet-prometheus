# Class prometheus::alert_manager::install
#
class prometheus::alertmanager::install {
  case $::prometheus::alertmanager::manage_as {
    'container' : {
      if $::prometheus::alertmanager::storage_path {
        $vol_storage_path = "${::prometheus::alertmanager::storage_path}:${::prometheus::alertmanager::storage_path}"
      } else {
        $vol_storage_path = undef
      }
      $config_file = "${::prometheus::alertmanager::config_dir}/${::prometheus::alertmanager::config_file}"

      docker::run { $::prometheus::alertmanager::package_name:
        image           => $::prometheus::alertmanager::container_image,
        command         => inline_template("<%= scope.function_template(['prometheus/_alertmanager.erb']) %>"),
        volumes         => delete_undef_values(["${config_file}:${config_file}", $vol_storage_path,]),
        net             => 'host',
        restart_service => true,
        detach          => false,
        manage_service  => false,
        docker_service  => true,
      }
    }
    default     : {
      package { $::prometheus::alertmanager::package_name: ensure => $::prometheus::alertmanager::package_ensure, }
    }
  }
}
