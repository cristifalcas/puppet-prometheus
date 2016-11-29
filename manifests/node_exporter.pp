# Class: prometheus::node_exporter
#
# This module manages prometheus node node_exporter
#
# Parameters:
#
#  [*package_name*]
#  Prometheus node node_exporter package name
#
#  [*package_ensure*]
#  If package, then use this for package ensure default 'latest'
#
# == CONFIG ==
#
#  [*collectors*]
#  The set of node node_exporter collectors
#
#  [*collector_diskstats_ignored_devices*]
#     Regexp of devices to ignore for diskstats. (default "^(ram|loop|fd|(h|s|v|xv)d[a-z])\\d+$")
#
#  [*collector_filesystem_ignored_mount_points*]
#     Regexp of mount points to ignore for filesystem collector. (default "^/(sys|proc|dev)($|/)")
#
#  [*collector_megacli_command*]
#     Command to run megacli. (default "megacli")
#
#  [*collector_netdev_ignored_devices*]
#     Regexp of net devices to ignore for netdev collector. (default "^$")
#
#  [*collector_ntp_protocol_version*]
#     NTP protocol version (default 4)
#
#  [*collector_ntp_server*]
#     NTP server to use for ntp collector.
#
#  [*collector_procfs*]
#     procfs mountpoint. (default "/proc")
#
#  [*collector_supervisord_url*]
#     XML RPC endpoint (default "http://localhost:9001/RPC2")
#
#  [*collector_sysfs*]
#     sysfs mountpoint. (default "/sys")
#
#  [*collector_systemd_private*]
#     Establish a private, direct connection to systemd without dbus.
#
#  [*collector_textfile_directory*]
#     Directory to read text files with metrics from.
#
#  [*collectors_enabled*]
#     Comma-separated list of collectors to use. (default
#     "conntrack,diskstats,entropy,filefd,filesystem,loadavg,mdadm,meminfo,netdev,netstat,sockstat,stat,textfile,time,uname,vmstat")
#
#  [*log_format*]
#     If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to
#     stderr.
#
#  [*log_level*]
#     Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
#
#  [*web_listen_address*]
#     Address on which to expose metrics and web interface. (default ":9100")
#
#  [*web_telemetry_path*]
#     Path under which to expose metrics. (default "/metrics")
#
#  [*extra_options*]
#  Extra options added to node-exporter startup command
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class prometheus::node_exporter (
  $package_name                              = $::prometheus::node_exporter::params::package_name,
  $package_ensure                            = $::prometheus::node_exporter::params::package_ensure,
  $collector_diskstats_ignored_devices       = $::prometheus::node_exporter::params::collector_diskstats_ignored_devices,
  $collector_filesystem_ignored_mount_points = $::prometheus::node_exporter::params::collector_filesystem_ignored_mount_points,
  $collector_megacli_command                 = $::prometheus::node_exporter::params::collector_megacli_command,
  $collector_netdev_ignored_devices          = $::prometheus::node_exporter::params::collector_netdev_ignored_devices,
  $collector_ntp_protocol_version            = $::prometheus::node_exporter::params::collector_ntp_protocol_version,
  $collector_ntp_server                      = $::prometheus::node_exporter::params::collector_ntp_server,
  $collector_procfs                          = $::prometheus::node_exporter::params::collector_procfs,
  $collector_supervisord_url                 = $::prometheus::node_exporter::params::collector_supervisord_url,
  $collector_sysfs                           = $::prometheus::node_exporter::params::collector_sysfs,
  $collector_systemd_private                 = $::prometheus::node_exporter::params::collector_systemd_private,
  $collector_textfile_directory              = $::prometheus::node_exporter::params::collector_textfile_directory,
  $collectors_enabled                        = $::prometheus::node_exporter::params::collectors_enabled,
  $log_format                                = $::prometheus::node_exporter::params::log_format,
  $log_level                                 = $::prometheus::node_exporter::params::log_level,
  $web_listen_address                        = $::prometheus::node_exporter::params::web_listen_address,
  $web_telemetry_path                        = $::prometheus::node_exporter::params::web_telemetry_path,
  $extra_options                             = $::prometheus::node_exporter::params::extra_options,
) inherits prometheus::node_exporter::params {
  contain '::prometheus::node_exporter::install'
  contain '::prometheus::node_exporter::config'
  contain '::prometheus::node_exporter::service'

  Class['prometheus::node_exporter::install'] ->
  Class['prometheus::node_exporter::config'] ~>
  Class['prometheus::node_exporter::service']
}
