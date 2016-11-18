# Class prometheus::alertmanager::params
#
class prometheus::alertmanager::params {
  $purge_config_dir = false
  $package_name = 'alertmanaer'
  $package_ensure = 'installed'
  $config_dir = '/etc/prometheus'
  $config_file = 'alertmanager.yml'
  $dev = undef
  $log_format = 'logger:stdout?json=true'
  $log_level = undef
  $storage_path = undef
  $web_external_url = undef
  $web_listen_address = ':9093'
  $extra_options = undef

  $config = {}
}
