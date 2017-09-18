package { 'puppet-lint':
  ensure   => '1.1.0',
  provider => 'gem',
}

exec {'apt-get update':
  command => '/usr/bin/apt-get update',
  }

package {'apache2':
  require => Exec['apt-get update'],
  }

file {'/var/www':
  ensure => link,
  target => '/vagrant'
  force  => true,
  }

service { 'apache2':
  ensure  => running,
  require => Package['apache2'],
  }

