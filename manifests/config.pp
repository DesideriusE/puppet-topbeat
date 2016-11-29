#
class topbeat::config {

    concat { $::topbeat::configfile:
      notify => Service['topbeat']
    }

    $input_conf = deep_merge($::topbeat::params::input, $::topbeat::input)

    concat::fragment { 'topbeat-input':
        target  => $::topbeat::configfile,
        order   => 10,
        content => template('topbeat/config/10_input.erb'),
    }

    $output_conf = deep_merge($::topbeat::params::output, $::topbeat::output)

    concat::fragment { 'topbeat-output':
        target  => $::topbeat::configfile,
        order   => 40,
        content => template('topbeat/config/40_output.erb'),
    }

    $shipper_conf = deep_merge($::topbeat::params::shipper, $::topbeat::shipper)

    concat::fragment { 'topbeat-shipper':
        target  => $::topbeat::configfile,
        order   => 50,
        content => template('topbeat/config/50_shipper.erb'),
    }

    $logging_conf = deep_merge($::topbeat::params::logging, $::topbeat::logging)

    concat::fragment { 'topbeat-logging':
        target  => $::topbeat::configfile,
        order   => 60,
        content => template('topbeat/config/60_logging.erb'),
    }

}
