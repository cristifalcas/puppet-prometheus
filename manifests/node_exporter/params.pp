# Class prometheus::node_exporter::params
#
class prometheus::node_exporter::params {
  $package_name = 'node_exporter'
  $package_ensure = 'installed'

  $collector_diskstats_ignored_devices = undef
  $collector_filesystem_ignored_mount_points = undef
  $collector_megacli_command = undef
  $collector_netdev_ignored_devices = undef
  $collector_ntp_protocol_version = undef
  $collector_ntp_server = undef
  $collector_procfs = undef
  $collector_supervisord_url = undef
  $collector_sysfs = undef
  $collector_systemd_private = undef
  $collector_textfile_directory = undef
  $collectors_enabled = undef
  $log_format = 'logger:stdout?json=true'
  $log_level = undef
  $web_listen_address = ':9100'
  $web_telemetry_path = undef
  $extra_options = undef
}
