#
class topbeat::service (
  $ensure = $::topbeat::ensure
) {

  $_ensure = $::filebeat::ensure ? {
    present => 'running',
    absent  => 'stopped',
    default => 'running'
  }

  service { 'topbeat':
    ensure => $_ensure,
    enable => true
  }

}
