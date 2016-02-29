# == Class topbeat::params
#
# === Parameters
#
# This class does not provide any parameters.

#
# === Examples
#
# This class is not intended to be used directly.
class topbeat::params {

    $configfile = '/etc/topbeat/topbeat.yml'

    $ensure = 'present'

    $status = 'enabled'

    $device = 'any'

    $input = {
        period => 10,
        procs  => '.*',
        stats  => {
            system => true,
            process => true,
            filesystem => true,
            cpu_per_core => false
        }

    }

    $output = {
        elasticsearch => {
            enabled => false
        },
        logstash => {
            enabled => false,
            hosts => [],
            worker => 1,
            loadbalance => false,
            port => 10200,
            index => 'topbeat',
            tls => {},
            timeout => 30,
            max_retries => 3
        },
        file => {
            enabled => false,
            path => '/tmp/topbeat',
            filename => 'topbeat',
            rotate_every_kb => 10000,
            number_of_files => 7
        }
    }

    $shipper = {
        name => $fqdn,
        tags => [],
        ignore_outgoing => false,
        refresh_topology_freq => 10,
        topology_expire => 15,
    }

    $logging = {
        to_syslog => true,
        to_files => false,
        files => {
            path => '/var/log/mybeat',
            name => 'mybeat',
            rotateeverybytes => 10485760,
            keepfiles => 7
        },
        selectors => [],
        level => 'error'
    }
}