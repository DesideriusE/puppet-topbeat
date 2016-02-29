#
class topbeat::service (
  $ensure             = $topbeat::ensure
){
  
  service { 'topbeat':
    ensure => 'running',
    enable => true
  }
  
}