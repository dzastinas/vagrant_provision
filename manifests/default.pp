exec {'apt-get update':
  command => '/usr/bin/apt-get update',
  }package { 'puppet-lint':
  ensure   => '1.1.0',
  provider => 'gem',
}

package {'apache2':
  require => Exec['apt-get update'],
  }

# file {'/var/www':
  # ensure => link,
  # target => '/vagrant'
  # force  => true,
  # }
  
file { 'docroot':
  path      => '/var/www/',
  ensure    => link,
  force     => true,
  target    => '/vagrant',
}

service { 'apache2':
  ensure  => running,
  require => Package['apache2'],
  }

