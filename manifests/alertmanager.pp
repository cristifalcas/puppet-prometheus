# Class: prometheus::alert_manager
#
# This module manages prometheus alert_manager
#
# Parameters:
#
#  [*package_name*]
#  alertmanager package name
#
#  [*package_ensure*]
#  If package, then use this for package ensurel default 'latest'
#
#  [*service_name*]
#  alertmanager service name (default alertmanager)
#
#  [*config_dir*]
#  alert_manager configuration directory (default /etc/prometheus)
#
#  [*manage_as*]
#  How to manage the distribution service. Valid values are: service, container (default service)
#
#  [*manage_config*]
#  If you manage the config from some other place (git, for ex.) set this to false (default true)
#
#  [*container_image*]
#  From where to pull the image.
#  Defaults to docker.io/prom/prometheus:latest
#
# == CONFIG ==
#
#  [*config_file*]
#     Alertmanager configuration file name. (default "alertmanager.yml")
#
#  [*dev*]
#     serve live instead of embedded assets
#
#  [*log_format*]
#     If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to
#     stderr.
#
#  [*log_level*]
#     Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
#
#  [*storage_path*]
#     Base path for data storage. (default "data/")
#
#  [*web_external_url*]
#     The URL under which Alertmanager is externally reachable (for example,
#     if Alertmanager is served via a reverse proxy). Used for generating relative
#     and absolute links back to Alertmanager itself. If the URL has a path portion,
#     it will be used to prefix all HTTP endpoints served by Alertmanager. If omitted,
#     relevant URL components will be derived automatically.
#
#  [*web_listen_address*]
#     Address to listen on for the web interface and API. (default ":9093")
#
#  [*extra_options*]
#  Extra options added to alertmanager startup command
#
#  [*config*]
#  Alertmanager config
#
class prometheus::alertmanager (
  $package_name       = $::prometheus::alertmanager::params::package_name,
  $package_ensure     = $::prometheus::alertmanager::params::package_ensure,
  $service_name       = $::prometheus::alertmanager::params::service_name,
  $config_dir         = $::prometheus::alertmanager::params::config_dir,
  $manage_config      = $::prometheus::alertmanager::params::manage_config,
  $manage_as          = $::prometheus::alertmanager::params::manage_as,
  $container_image    = $::prometheus::alertmanager::params::container_image,
  # Alertmanager config
  $config_file        = $::prometheus::alertmanager::params::config_file,
  $dev                = $::prometheus::alertmanager::params::dev,
  $log_format         = $::prometheus::alertmanager::params::log_format,
  $log_level          = $::prometheus::alertmanager::params::log_level,
  $storage_path       = $::prometheus::alertmanager::params::storage_path,
  $web_external_url   = $::prometheus::alertmanager::params::web_external_url,
  $web_listen_address = $::prometheus::alertmanager::params::web_listen_address,
  $extra_options      = $::prometheus::alertmanager::params::extra_options,
  $config             = $::prometheus::alertmanager::params::config,
) inherits prometheus::alertmanager::params {
  validate_re($manage_as, '^(container|service)$')

  contain '::prometheus::alertmanager::install'
  contain '::prometheus::alertmanager::config'
  contain '::prometheus::alertmanager::service'

  Class['prometheus::alertmanager::install'] ->
  Class['prometheus::alertmanager::config'] ~>
  Class['prometheus::alertmanager::service']
}
