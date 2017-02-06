# puppet-prometheus
[![Build Status](https://travis-ci.org/cristifalcas/puppet-prometheus.png?branch=master)](https://travis-ci.org/cristifalcas/puppet-prometheus)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Development - Guide for contributing to the module](#development)


## Overview

This module installs and configures the Prometheus monitoring tool: [Prometheus web site](https://prometheus.io/docs/introduction/overview/)

The installation can be made from packages or with docker containers.

We manage prometheus, node-exporter, alertmanager and pushgateway.

In order to print the yaml config files for prometheus and alertmanager, we are using
some lib files from [puppet-elasticsearch](https://github.com/elastic/puppet-elasticsearch) module.


## Usage

Install the prometheus server:

```puppet

  $scrape_prometheus = {
    'job_name'       => 'prometheus',
    'static_configs' => [{
        'targets' => ['localhost:9090',],
        'labels'  => {
          'alias'   => 'Prometheus',
        }
        ,
      }
      ,],
  }

  $scrape_nerve = {
    'job_name'         => 'nerve',
    'nerve_sd_configs' => [{
        'servers' => ['localhost:2181',],
        'paths'   => ['/monitoring/os',],
      }
      ,],
  }

  class { '::prometheus':
    package_ensure        => 'latest',
    alertmanager_url      => 'http://localhost:9093',
    log_format            => 'logger:syslog?appname=prometheus&local=7',
    storage_local_path    => '/var/lib/prometheus/data',
    web_console_libraries => '/usr/share/prometheus/console_libraries',
    web_console_templates => '/usr/share/prometheus/consoles',
    web_listen_address    => ':9090',
    config                => {
      global                => {
        'scrape_interval'     => '30s',
        'scrape_timeout'      => '10s',
        'evaluation_interval' => '30s',
      }
      ,
      scrape_configs        => [$scrape_prometheus, $scrape_nerve,],
    }
    ,
  }
```

or:
```puppet
include ::prometheus
```

Install node exporter:

```puppet
  $node_collectors = [
    'conntrack',
    'diskstats',
    'entropy',
    'filefd',
    'filesystem',
    'interrupts',
    'ksmd',
    'loadavg',
    'logind',
    'mdadm',
    'meminfo',
    'meminfo_numa',
    'netdev',
    'netstat',
    'sockstat',
    'stat',
    'systemd',
    'tcpstat',
    'textfile',
    'time',
    'uname',
    'vmstat',
  ]

  class { '::prometheus::node_exporter':
    package_name                 => 'node_exporter',
    collectors_enabled           => $node_collectors,
    log_format                   => 'logger:syslog?appname=node_exporter&local=7',
    web_listen_address           => ':9100',
  }
```

or:

```puppet
include ::prometheus::node_exporter
```

Install alertmanager:

```puppet
  $alertmanager_config = {
      global           => {
        'smtp_from'      => 'alertmanager@company.com',
        'smtp_smarthost' => 'localhost:25',
      }
      ,
      templates        => ['/etc/prometheus/alert.template',],
      route            => {
        'receiver'       => 'default-receiver',
        'group_wait'     => '30s',
        'group_interval' => '5m',
        'continue'       => true,
      }
      ,
      receivers        => [{
          'name'          => 'default-receiver',
          'email_configs' => [{
              'send_resolved' => true,
              'to'            => 'cloud-ops@company.com',
            }
            ,],
        }
        ,],
    }

  class { '::prometheus::alertmanager':
    package_name   => 'alertmanager',
    package_ensure => 'latest',
    storage_path   => '/var/lib/prometheus/alertmanager/data',
    config         => $alertmanager_config,
  }
```

Install from docker containers:

```puppet

  class { '::prometheus::alertmanager':
    log_format     => 'logger:stdout?json=true',
    manage_as      => 'container',
    config         => $alertmanager_config,
  }
```

## Development

* Fork the project
* Commit and push until you are happy with your contribution
* Send a pull request with a description of your changes
