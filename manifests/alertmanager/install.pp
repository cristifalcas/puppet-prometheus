# Class prometheus::alert_manager::install
#
class prometheus::alertmanager::install {
  package { $::prometheus::alertmanager::package_name: ensure => $::prometheus::alertmanager::package_ensure, }
}
