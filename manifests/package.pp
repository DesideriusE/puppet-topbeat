#
class topbeat::package (
  $ensure = $topbeat::ensure
) {

  package { 'topbeat':
    ensure => $ensure
  }
}