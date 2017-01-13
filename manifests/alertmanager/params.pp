# Class prometheus::alertmanager::params
#
class prometheus::alertmanager::params {
  $package_name = 'alertmanaer'
  $package_ensure = 'installed'
  $service_name = 'alertmanager'
  $config_dir = '/etc/prometheus'
  $manage_config = true
  $manage_as = 'service'
  $container_image = 'docker.io/prom/alertmanager:latest'

  $config_file = 'alertmanager.yml'
  $dev = undef
  $log_format = 'logger:stdout?json=true'
  $log_level = undef
  $storage_path = undef
  $web_external_url = undef
  $web_listen_address = ':9093'
  $extra_options = undef

  $config = {
  }
}
