# Class prometheus::params
# Include default parameters for prometheus class
class prometheus::params {
  $package_name = 'prometheus'
  $package_ensure = 'installed'
  $service_name = 'prometheus'
  $user = 'prometheus'
  $group = 'prometheus'
  $manage_config = true
  $manage_as = 'service'
  $container_image = 'docker.io/prom/prometheus:latest'

  $config_file = 'prometheus.yml'
  $alertmanager_notification_queue_capacity = undef
  $alertmanager_timeout = undef
  $alertmanager_url = undef
  $log_format = 'logger:stdout?json=true'
  $log_level = 'info'
  $query_max_concurrency = undef
  $query_staleness_delta = undef
  $query_timeout = undef
  $storage_local_checkpoint_dirty_series_limit = undef
  $storage_local_checkpoint_interval = undef
  $storage_local_chunk_encoding_version = undef
  $storage_local_dirty = undef
  $storage_local_engine = undef
  $storage_local_max_chunks_to_persist = undef
  $storage_local_memory_chunks = undef
  $storage_local_num_fingerprint_mutexes = undef
  $storage_local_path = undef
  $storage_local_pedantic_checks = undef
  $storage_local_retention = undef
  $storage_local_series_file_shrink_ratio = undef
  $storage_local_series_sync_strategy = undef
  $storage_remote_graphite_address = undef
  $storage_remote_graphite_prefix = undef
  $storage_remote_graphite_transport = undef
  $storage_remote_influxdb_url = undef
  $storage_remote_influxdb_database = undef
  $storage_remote_influxdb_retention_policy = undef
  $storage_remote_influxdb_username = undef
  $storage_remote_opentsdb_url = undef
  $web_console_libraries = undef
  $web_console_templates = undef
  $web_enable_remote_shutdown = undef
  $web_external_url = undef
  $web_listen_address = ':9090'
  $web_route_prefix = undef
  $web_telemetry_path = '/metrics'
  $web_user_assets = undef
  $extra_options = undef

  $config = {
  }

  case $::osfamily {
    'RedHat', 'Linux': {
      $config_dir = '/etc/prometheus'
    }
    'FreeBSD': {
      $config_dir = '/usr/local/etc'
    }
  }
}
