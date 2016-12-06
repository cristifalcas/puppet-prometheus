# Class prometheus::pushgateway::install
#
class prometheus::pushgateway::install {
  case $::prometheus::pushgateway::manage_as {
    'container' : {
      docker::run { $::prometheus::pushgateway::package_name:
        image           => $::prometheus::pushgateway::container_image,
        command         => inline_template("<%= scope.function_template(['prometheus/_pushgateway.erb']) %>"),
        volumes         => ["${::prometheus::pushgateway::persistence_file}/${::prometheus::pushgateway::persistence_file}"],
        net             => 'host',
        restart_service => true,
        detach          => false,
        manage_service  => false,
        docker_service  => true,
      }
    }
    default     : {
      package { $::prometheus::pushgateway::package_name: ensure => $::prometheus::pushgateway::package_ensure, }
    }
  }
}
