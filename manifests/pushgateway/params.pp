# Class prometheus::pushgateway::params
#
class prometheus::pushgateway::params {
  $package_name = 'pushgateway'
  $package_ensure = 'installed'
  $pushgateway_user = 'prometheus'
  $pushgateway_group = 'prometheus'

  $log_format = 'logger:stdout?json=true'
  $log_level = undef
  $persistence_file = '/etc/prometheus/pushgateway.persistance'
  $persistence_interval = undef
  $web_listen_address = ':9091'
  $web_telemetry_path = undef

  $extra_options = undef
}
