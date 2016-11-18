# Class prometheus::install
#
class prometheus::install {
  package { $::prometheus::package_name: ensure => $::prometheus::package_ensure, }
}
