# Class: prometheus
#
# This module manages prometheus
#
# Parameters:
#
#  [*package_name*]
#  Prometheus package name (default prometheus)
#
#  [*package_ensure*]
#  If package, then use this for package ensurel default 'latest'
#
#  [*service_name*]
#  Prometheus service name (default prometheus)
#
#  [*user*]
#  User under which prometheus is running (default prometheus)
#
#  [*group*]
#  Group under which prometheus is running (default prometheus)
#
#  [*config_dir*]
#  Prometheus configuration directory (default /etc/prometheus)
#
#  [*manage_config*]
#  If you manage the config from some other place (git, for ex.) set this to false (default true)
#
#  [*manage_as*]
#  How to manage the distribution service. Valid values are: service, container (default service)
#
#  [*container_image*]
#  From where to pull the image.
#  Defaults to docker.io/prom/prometheus:latest
#
# == CONFIG ==
#
#  [*config_file*]
#  Prometheus configuration directory (default /etc/prometheus)
#
# == ALERTMANAGER ==
#
#  [*alertmanager_notification_queue_capacity*]
#      The capacity of the queue for pending alert manager notifications.
#
#  [*alertmanager_timeout*]
#      Alert manager HTTP API timeout.
#
#  [*alertmanager_url*]
#      Comma-separated list of Alertmanager URLs to send notifications to.
#
# == LOG ==
#
#  [*log_format*]
#      If set use a syslog logger or JSON logging. Example:
#      logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to
#      stderr.
#
#  [*log_level*]
#      Only log messages with the given severity or above. Valid levels:
#      [debug, info, warn, error, fatal].
#
# == QUERY ==
#
#  [*query_max_concurrency*]
#      Maximum number of queries executed concurrently.
#
#  [*query_staleness_delta*]
#      Staleness delta allowance during expression evaluations.
#
#  [*query_timeout*]
#      Maximum time a query may take before being aborted.
#
# == STORAGE ==
#
#  [*storage_local_checkpoint_dirty_series_limit*]
#      If approx. that many time series are in a state that would require
#      a recovery operation after a crash, a checkpoint is triggered, even if
#      the checkpoint interval hasn't passed yet. A recovery operation requires
#      a disk seek. The default limit intends to keep the recovery time below
#      1min even on spinning disks. With SSD, recovery is much faster, so you
#      might want to increase this value in that case to avoid overly frequent
#      checkpoints.
#
#  [*storage_local_checkpoint_interval*]
#      The period at which the in-memory metrics and the chunks not yet
#      persisted to series files are checkpointed.
#
#  [*storage_local_chunk_encoding_version*]
#      Which chunk encoding version to use for newly created chunks.
#      Currently supported is 0 (delta encoding), 1 (double-delta encoding), and
#      2 (double-delta encoding with variable bit-width).
#
#  [*storage_local_dirty*]
#      If set, the local storage layer will perform crash recovery even if
#      the last shutdown appears to be clean.
#
#  [*storage_local_engine*]
#      Local storage engine. Supported values are: 'persisted' (full local
#      storage with on-disk persistence) and 'none' (no local storage).
#
#  [*storage_local_index_cache_size_fingerprint_to_metric*]
#      The size in bytes for the fingerprint to metric index cache.
#
#  [*storage_local_index_cache_size_fingerprint_to_timerange*]
#      The size in bytes for the metric time range index cache.
#
#  [*storage_local_index_cache_size_label_name_to_label_values*]
#      The size in bytes for the label name to label values index cache.
#
#  [*storage_local_index_cache_size_label_pair_to_fingerprints*]
#      The size in bytes for the label pair to fingerprints index cache.
#
#  [*storage_local_max_chunks_to_persist*]
#      How many chunks can be waiting for persistence before sample
#      ingestion will be throttled. Many chunks waiting to be persisted will
#      increase the checkpoint size.
#
#  [*storage_local_memory_chunks*]
#      How many chunks to keep in memory. While the size of a chunk is
#      1kiB, the total memory usage will be significantly higher than this value
#      * 1kiB. Furthermore, for various reasons, more chunks might have to be
#      kept in memory temporarily. Sample ingestion will be throttled if the
#      configured value is exceeded by more than 10%.
#
#  [*storage_local_num_fingerprint_mutexes*]
#      The number of mutexes used for fingerprint locking.
#
#  [*storage_local_path*]
#      Base path for metrics storage.
#
#  [*storage_local_pedantic_checks*]
#      If set, a crash recovery will perform checks on each series file.
#      This might take a very long time.
#
#  [*storage_local_retention*]
#      How long to retain samples in the local storage.
#
#  [*storage_local_series_file_shrink_ratio*]
#      A series file is only truncated (to delete samples that have
#      exceeded the retention period) if it shrinks by at least the provided
#      ratio. This saves I/O operations while causing only a limited storage
#      space overhead. If 0 or smaller, truncation will be performed even for a
#      single dropped chunk, while 1 or larger will effectively prevent any
#      truncation.
#
#  [*storage_local_series_sync_strategy*]
#      When to sync series files after modification. Possible values:
#      'never', 'always', 'adaptive'. Sync'ing slows down storage performance
#      but reduces the risk of data loss in case of an OS crash. With the
#      'adaptive' strategy, series files are sync'd for as long as the storage
#      is not too much behind on chunk persistence.
#
#  [*storage_remote_graphite_address*]
#      The host:port of the remote Graphite server to send samples to.
#      None, if empty.
#
#  [*storage_remote_graphite_prefix*]
#      The prefix to prepend to all metrics exported to Graphite. None, if
#      empty.
#
#  [*storage_remote_graphite_transport*]
#      Transport protocol to use to communicate with Graphite. 'tcp', if
#      empty.
#
#  [*storage_remote_influxdb_url*]
#      The URL of the remote InfluxDB server to send samples to. None, if
#      empty.
#
#  [*storage_remote_influxdb_database*]
#      The name of the database to use for storing samples in InfluxDB.
#
#  [*storage_remote_influxdb_retention_policy*]
#      The InfluxDB retention policy to use.
#
#  [*storage_remote_influxdb_username*]
#      The username to use when sending samples to InfluxDB. The
#      corresponding password must be provided via the INFLUXDB_PW environment
#      variable.
#
#  [*storage_remote_opentsdb_url*]
#      The URL of the remote OpenTSDB server to send samples to. None, if
#      empty.
#
# == WEB ==
#
#  [*web_console_libraries*]
#      Path to the console library directory.
#
#  [*web_console_templates*]
#      Path to the console template directory, available at /consoles.
#
#  [*web_enable_remote_shutdown*]
#      Enable remote service shutdown.
#
#  [*web_external_url*]
#      The URL under which Prometheus is externally reachable (for
#      example, if Prometheus is served via a reverse proxy). Used for
#      generating relative and absolute links back to Prometheus itself. If the
#      URL has a path portion, it will be used to prefix all HTTP endpoints
#      served by Prometheus. If omitted, relevant URL components will be derived
#      automatically.
#
#  [*web_listen_address*]
#      Address to listen on for the web interface, API, and telemetry.
#
#  [*web_route_prefix*]
#      Prefix for the internal routes of web endpoints. Defaults to path
#      of -web.external-url.
#
#  [*web_telemetry_path*]
#      Path under which to expose metrics.
#
#  [*web_user_assets*]
#      Path to static asset directory, available at /user.
#
#  [*extra_options*]
#  Extra options added to prometheus startup command
#
#  [*config*]
#  Alertmanager config
#
class prometheus (
  $package_name                                = $::prometheus::params::package_name,
  $package_ensure                              = $::prometheus::params::package_ensure,
  $service_name                                = $::prometheus::params::service_name,
  $user                                        = $::prometheus::params::user,
  $group                                       = $::prometheus::params::group,
  $config_dir                                  = $::prometheus::params::config_dir,
  $manage_config                               = $::prometheus::params::manage_config,
  $manage_as                                   = $::prometheus::params::manage_as,
  $container_image                             = $::prometheus::params::container_image,
  # Prometheus config
  $config_file                                 = $::prometheus::params::config_file,
  $alertmanager_notification_queue_capacity    = $::prometheus::params::alertmanager_notification_queue_capacity,
  $alertmanager_timeout                        = $::prometheus::params::alertmanager_timeout,
  $alertmanager_url                            = $::prometheus::params::alertmanager_url,
  $log_format                                  = $::prometheus::params::log_format,
  $log_level                                   = $::prometheus::params::log_level,
  $query_max_concurrency                       = $::prometheus::params::query_max_concurrency,
  $query_staleness_delta                       = $::prometheus::params::query_staleness_delta,
  $query_timeout                               = $::prometheus::params::query_timeout,
  $storage_local_checkpoint_dirty_series_limit = $::prometheus::params::storage_local_checkpoint_dirty_series_limit,
  $storage_local_checkpoint_interval           = $::prometheus::params::storage_local_checkpoint_interval,
  $storage_local_chunk_encoding_version        = $::prometheus::params::storage_local_chunk_encoding_version,
  $storage_local_dirty                         = $::prometheus::params::storage_local_dirty,
  $storage_local_engine                        = $::prometheus::params::storage_local_engine,
  $storage_local_max_chunks_to_persist         = $::prometheus::params::storage_local_max_chunks_to_persist,
  $storage_local_memory_chunks                 = $::prometheus::params::storage_local_memory_chunks,
  $storage_local_num_fingerprint_mutexes       = $::prometheus::params::storage_local_num_fingerprint_mutexes,
  $storage_local_path                          = $::prometheus::params::storage_local_path,
  $storage_local_pedantic_checks               = $::prometheus::params::storage_local_pedantic_checks,
  $storage_local_retention                     = $::prometheus::params::storage_local_retention,
  $storage_local_series_file_shrink_ratio      = $::prometheus::params::storage_local_series_file_shrink_ratio,
  $storage_local_series_sync_strategy          = $::prometheus::params::storage_local_series_sync_strategy,
  $storage_remote_graphite_address             = $::prometheus::params::storage_remote_graphite_address,
  $storage_remote_graphite_prefix              = $::prometheus::params::storage_remote_graphite_prefix,
  $storage_remote_graphite_transport           = $::prometheus::params::storage_remote_graphite_transport,
  $storage_remote_influxdb_url                 = $::prometheus::params::storage_remote_influxdb_url,
  $storage_remote_influxdb_database            = $::prometheus::params::storage_remote_influxdb_database,
  $storage_remote_influxdb_retention_policy    = $::prometheus::params::storage_remote_influxdb_retention_policy,
  $storage_remote_influxdb_username            = $::prometheus::params::storage_remote_influxdb_username,
  $storage_remote_opentsdb_url                 = $::prometheus::params::storage_remote_opentsdb_url,
  $web_console_libraries                       = $::prometheus::params::web_console_libraries,
  $web_console_templates                       = $::prometheus::params::web_console_templates,
  $web_enable_remote_shutdown                  = $::prometheus::params::web_enable_remote_shutdown,
  $web_external_url                            = $::prometheus::params::web_external_url,
  $web_listen_address                          = $::prometheus::params::web_listen_address,
  $web_route_prefix                            = $::prometheus::params::web_route_prefix,
  $web_telemetry_path                          = $::prometheus::params::web_telemetry_path,
  $web_user_assets                             = $::prometheus::params::web_user_assets,
  $extra_options                               = $::prometheus::params::extra_options,
  $config                                      = $::prometheus::params::config,
) inherits prometheus::params {
  validate_re($manage_as, '^(container|service)$')

  contain '::prometheus::install'
  contain '::prometheus::config'
  contain '::prometheus::service'

  Class['prometheus::install'] ->
  Class['prometheus::config'] ~>
  Class['prometheus::service']
}
