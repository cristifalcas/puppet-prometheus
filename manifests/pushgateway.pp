# Class: prometheus::pushgateway
#
# This module manages prometheus pushgateway
#
# Parameters:
#
#  [*package_name*]
#  pushgateway package name
#
#  [*package_ensure*]
#  If package, then use this for package ensurel default 'latest'
#
#  [*pushgateway_user*]
#  User under which pushgateway will run
#  Default prometheus
#
#  [*pushgateway_group*]
#  Group under which pushgateway will run
#  Default prometheus
#
# == CONFIG ==
#
#  [*log_format*]
#     If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to
#     stderr.
#
#  [*log_level*]
#     Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
#
#  [*persistence_file*]
#     File to persist metrics. If empty, metrics are only kept in memory.
#
#  [*persistence_interval*]
#     The minimum interval at which to write out the persistence file. (default 5m0s)
#
#  [*web_listen_address*]
#     Address to listen on for the web interface and API. (default ":9093")
#
#  [*extra_options*]
#  Extra options added to alertmanager startup command
#
class prometheus::pushgateway (
  $package_name         = $::prometheus::pushgateway::params::package_name,
  $package_ensure       = $::prometheus::pushgateway::params::package_ensure,
  $pushgateway_user     = $::prometheus::pushgateway::params::pushgateway_user,
  $pushgateway_group    = $::prometheus::pushgateway::params::pushgateway_group,
  $log_format           = $::prometheus::pushgateway::params::log_format,
  $log_level            = $::prometheus::pushgateway::params::log_level,
  $persistence_file     = $::prometheus::pushgateway::params::persistence_file,
  $persistence_interval = $::prometheus::pushgateway::params::persistence_interval,
  $web_listen_address   = $::prometheus::pushgateway::params::web_listen_address,
  $web_telemetry_path   = $::prometheus::pushgateway::params::web_telemetry_path,
  $extra_options        = $::prometheus::pushgateway::params::extra_options,
) inherits prometheus::pushgateway::params {
  contain '::prometheus::pushgateway::install'
  contain '::prometheus::pushgateway::config'
  contain '::prometheus::pushgateway::service'

  Class['prometheus::pushgateway::install'] ->
  Class['prometheus::pushgateway::config'] ~>
  Class['prometheus::pushgateway::service']
}
