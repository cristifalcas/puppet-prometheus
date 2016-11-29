# Class prometheus::pushgateway::params
#
class prometheus::pushgateway::params {
  $package_name = 'pushgateway'
  $package_ensure = 'installed'
  $service_name = 'pushgateway'
  $pushgateway_user = 'prometheus'
  $pushgateway_group = 'prometheus'
  $manage_as = 'service'
  $container_image = 'docker.io/prom/pushgateway:latest'

  $log_format = 'logger:stdout?json=true'
  $log_level = undef
  $persistence_file = '/etc/prometheus/pushgateway.persistance'
  $persistence_interval = undef
  $web_listen_address = ':9091'
  $web_telemetry_path = undef
  $extra_options = undef
}
